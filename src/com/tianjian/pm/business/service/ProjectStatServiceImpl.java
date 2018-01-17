/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tianjian.comm.bean.CommConfigStaffChargeType;
import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.bean.ProjectTaskDict;
import com.tianjian.pm.business.IProjectStatService;
import com.tianjian.pm.dao.IProjectStatDAO;
import com.tianjian.pm.struts.form.ProjectStatForm;
import com.tianjian.pm.struts.form.ProjectStatHead;
import com.tianjian.pm.struts.form.ProjectStatVo;
import com.tianjian.security.bean.SecurityStaffBaseinfo;
import com.tianjian.util.Converter;

/**
 * TODO
 * <p>Title: ProjectStatServiceImpl.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月28日上午9:41:02
 * @version 1.0
 * 
 */
public class ProjectStatServiceImpl implements IProjectStatService{



	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private final SimpleDateFormat sdm = new SimpleDateFormat("MM-dd");
	private final DecimalFormat df = new DecimalFormat("0.00");
	
	private IProjectStatDAO projectStatDAO;

	
	public IProjectStatDAO getProjectStatDAO() {
		return projectStatDAO;
	}


	public void setProjectStatDAO(IProjectStatDAO projectStatDAO) {
		this.projectStatDAO = projectStatDAO;
	}

	public void statInit(ProjectStatForm form) {
		
	}

	
	@Override
	public void stat(ProjectStatForm form) {
		// TODO Auto-generated method stub
   
	    String projectBaseinfoId = form.getProjectBaseinfoIdCase();
	    String creatUserId = form.getCreateUserId();

	    if(form.getFlag().equals("1")){
	    	ProjectBaseinfo pbi = (ProjectBaseinfo)getObjectByCode("from ProjectBaseinfo a where a.id=:id",Converter.toBlank(projectBaseinfoId),"id");
	        if(pbi!=null){
	        	form.setProjectCode(pbi.getProjectCode());
		        form.setProjectName(pbi.getProjectName());
		        form.setProjectClassName(getItemNameByCode("select a.itemName from ProjectTaskDict a where a.itemCode=:itemCode",Converter.toBlank(pbi.getProjectClass()),"itemCode"));
		        form.setStaffName(Converter.toBlank(pbi.getStaffName()));
		        StringBuffer sb = new StringBuffer();
		        if(pbi.getEndTime()!=null && !pbi.getEndTime().equals("")){
		        	sb.append(sdf.format(pbi.getStartTime())+" 至 "+sdf.format(pbi.getEndTime()));
		        }else{
		        	sb.append(sdf.format(pbi.getStartTime())+" 至 "+" ");
		        }
		        form.setProjectTime(sb.toString());
	        }
	    }
		
		
		List<?> listtime =projectStatDAO.getTimeData(projectBaseinfoId,creatUserId);
		Date date = new Date();
        Calendar mint = Calendar.getInstance();
        Calendar maxt = Calendar.getInstance();
        Calendar nowc = Calendar.getInstance();
        nowc.setTime(date);
        form.setCurYear(Converter.toBlank(nowc.get(Calendar.YEAR)));
        form.setCurMonth(Converter.toBlank(nowc.get(Calendar.MONTH)+1));
        int tempyear = 0;
        //int tempmonth = 0;
		if(listtime!=null && listtime.size()>0){
			Object[] obst = (Object[])listtime.get(0);
			

			if(!Converter.toBlank(obst[0]).equals("") && !Converter.toBlank(obst[0]).equals("")){
				try {
					mint.setTime(sdf.parse(Converter.toBlank(obst[0])));
			        maxt.setTime(sdf.parse(Converter.toBlank(obst[1])));
			        
			          tempyear = maxt.get(Calendar.YEAR)-mint.get(Calendar.YEAR);
			          //tempmonth= maxt.get(Calendar.MONTH)-mint.get(Calendar.MONTH);
				}catch(ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				List<?> listdata =projectStatDAO.getGroupData(projectBaseinfoId,creatUserId);  
				List<?> listm =projectStatDAO.getMonthData("",projectBaseinfoId,creatUserId); 
				List<ProjectStatVo>  list = new ArrayList<ProjectStatVo>();
				List<ProjectStatHead>  listh1 = new ArrayList<ProjectStatHead>();
				List<ProjectStatHead>  listh2 = new ArrayList<ProjectStatHead>();
				List<ProjectStatHead>  listh3 = new ArrayList<ProjectStatHead>();
				if(tempyear!=0){
					for(int i=0;i<=tempyear;i++){
					  if(Converter.toBlank(mint.get(Calendar.YEAR)+i).equals(form.getCurYear())){
						  for(int j=1 ;j<=12;j++){
								ProjectStatHead psh = new ProjectStatHead();
								psh.setMonth(Converter.toBlank(j));
								listh2.add(psh);
								if(form.getCurMonth().equals(Converter.toBlank(j))){
									for(int k=0;k<listm.size();k++){
										ProjectStatHead psh3 = new ProjectStatHead();
										   Object[] obj = (Object[])listm.get(k);
										   psh3.setDay(Converter.toBlank(sdm.format(obj[0])));
										   listh3.add(psh3);
									}
									
								}
							  }
					  }
					  ProjectStatHead psh = new ProjectStatHead();
						psh.setYear(Converter.toBlank(mint.get(Calendar.YEAR)+i));
						listh1.add(psh);
					}
					
				}else{
					ProjectStatHead psh = new ProjectStatHead();
					psh.setYear(Converter.toBlank(mint.get(Calendar.YEAR)));
					listh1.add(psh);
					if(Converter.toBlank(mint.get(Calendar.YEAR)).equals(form.getCurYear())){
					    for(int j=1 ;j<=12;j++){
							ProjectStatHead psh2 = new ProjectStatHead();
							psh2.setMonth(Converter.toBlank(j));
							listh2.add(psh2);
							if(form.getCurMonth().equals(Converter.toBlank(j))){
								for(int k=0;k<listm.size();k++){
								ProjectStatHead psh3 = new ProjectStatHead();
								   Object[] obj = (Object[])listm.get(k);
								   psh3.setDay(Converter.toBlank(sdm.format(obj[0])));
								   listh3.add(psh3);
								}
								
							}
					    }
					}
				}
				form.setHead1(listh1);
				form.setHead2(listh2);
				form.setHead3(listh3);
				if(listdata!=null && listdata.size()>0){
					for(int i=0;i<listdata.size();i++){
						ProjectStatVo psv = new ProjectStatVo();
						Object[] obs = (Object[])listdata.get(i);
						psv.setSeqNo(Converter.toBlank(i+1));
						SecurityStaffBaseinfo ssb = new SecurityStaffBaseinfo();
						ProjectBaseinfo pbi = new ProjectBaseinfo();
						CommConfigStaffChargeType ccst = new CommConfigStaffChargeType();
						if(!Converter.toBlank(obs[0]).equals("")){
							
							 ssb = (SecurityStaffBaseinfo)getObjectByCode("from SecurityStaffBaseinfo a where a.tenantId='"+form.getTenantId()+"' and a.id=:staffCode",Converter.toBlank(obs[0]),"staffCode");
							 pbi = (ProjectBaseinfo)getObjectByCode("from ProjectBaseinfo a where  a.id=:id",Converter.toBlank(obs[2]),"id");
							 if(ssb!=null){
							 ccst = (CommConfigStaffChargeType)getObjectByCode("from CommConfigStaffChargeType a where a.itemCode=:itemCode",ssb.getCommConfigStaffChargetypeId(),"itemCode");
						     psv.setCreateUserName(ssb.getName());
							 }
							 if(ccst!=null){
								String tempName="";
								tempName=ccst.getItemName()+"("+ccst.getItemCost()+ccst.getItemUnit()+")";//人工成本
								psv.setChargeTypeName(tempName);
							}
						}
						psv.setProjectName(pbi.getProjectName());
						psv.setProjectClassName(getItemNameByCode("select a.itemName from ProjectClassDict a where a.itemCode=:itemCode",pbi.getProjectClass(),"itemCode"));
						//psv.setCreateUserName(getItemNameByCode("select a.name from SecurityStaffBaseinfo a where a.tenantId='"+form.getTenantId()+"' and a.id=:staffCode",Converter.toBlank(obs[0]),"staffCode"));
						psv.setProjectTaskName(getItemNameByCode("select a.itemName from ProjectTaskDict a where a.itemCode=:itemCode",Converter.toBlank(obs[1]),"itemCode"));

						Map<String, String> mapresult = new HashMap<String, String>();
						
						double sumCurMonth=0;//除最后一行外横向月合计
						for(int j=0 ;j<listh1.size();j++){
							String tempy = ((ProjectStatHead)listh1.get(j)).getYear();
							if(tempy.equals(form.getCurYear())){
								Object[] object = getResult(tempy,Converter.toBlank(obs[1]),Converter.toBlank(obs[2]),Converter.toBlank(obs[0]));
								for(int k=0;k<object.length;k++){
									mapresult.put(Converter.toBlank(k+1), Converter.toBlank(object[k]).equals("")?"0":Converter.toBlank(object[k]));
									if(Converter.toBlank(k+1).equals(form.getCurMonth())){
										List<?> listms =projectStatDAO.getMonthData(Converter.toBlank(obs[1]),Converter.toBlank(obs[2]),Converter.toBlank(obs[0])); 
										for(int m=0;m<listms.size();m++){
											Object[] obj = (Object[])listms.get(m);
											mapresult.put(Converter.toBlank(sdm.format(obj[0])), Converter.toBlank(obj[1]));
											sumCurMonth+= Converter.toDouble(obj[1]);
										}
									}
								}
							}else{

								Object[] object = getResult(tempy,Converter.toBlank(obs[1]),Converter.toBlank(obs[2]),Converter.toBlank(obs[0]));
								Double sumt  = (double)0L;
								for(int k=0;k<object.length;k++){
									sumt+=Converter.toDouble(object[k]);
								}
								mapresult.put(tempy, Converter.toBlank(sumt));
							}
							
						}
						psv.setMap(mapresult);
                        psv.setSumCurMonth(Converter.toBlank(sumCurMonth));
						Map<String, String> mapresulty = new HashMap<String, String>();
						for(int j=0;j<listh1.size();j++){
							ProjectStatHead psh = listh1.get(j);
							List<?> listy=projectStatDAO.getYearData(Converter.toBlank(obs[1]),Converter.toBlank(obs[2]),Converter.toBlank(obs[0]));
							for(int k=0;k<listy.size();k++){
								Object[] obj = (Object[])listy.get(k);
								if(Converter.toBlank(obj[0]).equals(psh.getYear())){
									mapresulty.put(psh.getYear(), Converter.toBlank(obj[1]));
									break;
								}
							}
							if(!mapresulty.containsKey(psh.getYear())){
								mapresulty.put(psh.getYear(),"0");
							}
						}
						psv.setTotalmap(mapresulty);
						double totalCount = 0;
						double totalProjectValue = 0;
						Iterator<String> iter = mapresult.keySet().iterator();
					    while (iter.hasNext()) {
							String key = iter.next();
							String temp = Converter.toBlank(key);
							//System.out.println("---------------------"+temp.equals(form.getCurMonth()));
							String value = mapresult.get(key);
							if(!temp.equals(form.getCurMonth())){
								if(!temp.equals(form.getCurYear())){
							       totalCount+=Converter.toDouble(value);
								}
							}
						}
					     iter = mapresulty.keySet().iterator();
					    while (iter.hasNext()) {
							String key = iter.next();
							String value = mapresulty.get(key);
							if(ccst!=null && ccst.getItemCost()!=null){
							      totalProjectValue+=Converter.toDouble(value)*ccst.getItemCost();
							}else{
								totalProjectValue+=Converter.toDouble(value);
							}
						}
                        psv.setTotalCount(Converter.toBlank(totalCount));
                        psv.setTotalProjectValue(Converter.toBlank(totalProjectValue));
						list.add(psv);
					}

					//纵向合计
					ProjectStatVo psv = new ProjectStatVo();
					psv.setSeqNo(Converter.toBlank("合计"));
					psv.setCreateUserName(Converter.toBlank("全部"));
					psv.setProjectTaskName(Converter.toBlank("全部"));
					psv.setChargeTypeName(Converter.toBlank("全部"));
                    
					Map<String, String> mapresult2 = new HashMap<String, String>() ;//纵向数据合
					Map<String, String> mapresulty = new HashMap<String, String>() ;//纵向年数据合


					double[] sumtd  = new double[listm.size()];
					double[] sumtm  = new double[12];
					double[]  sumty  = new double[listh1.size()];

					double totalAllCount = 0;
					double totalProjectValue = 0;
					for(int i=0;i<listdata.size();i++){
						ProjectStatVo psv2 = list.get(i);
						totalAllCount+=Converter.toDouble(psv2.getTotalCount());
						totalProjectValue+=Converter.toDouble(psv2.getTotalProjectValue());
						Map<String, String>  mapresult = list.get(i).getMap();
						//循环年
						for(int j=0 ;j<listh1.size();j++){
							String tempy = ((ProjectStatHead)listh1.get(j)).getYear();
							if(tempy.equals(form.getCurYear())){
								//循环月
								for(int k=0;k<12;k++){
									//纵向求月合计
									sumtm[k]+=Converter.toDouble(mapresult.get( Converter.toBlank(k+1)));
									if(form.getCurMonth().equals(Converter.toBlank(k+1))){
										for(int m=0;m<listm.size();m++){
											Object[] obj = (Object[])listm.get(m);
											//纵向求天合计
											sumtd[m]+=Converter.toDouble(mapresult.get(sdm.format(obj[0])));
										}
										
									}
								}
							}else{
								//纵向求年合计
								sumty[j]+=Converter.toDouble(mapresult.get(tempy));
							}
							
						}
					}
   
					//统计纵向每条数据和
					double sumcurm = 0;
					for(int j=0;j<sumtd.length;j++){
						sumcurm+=sumtd[j];
					}
					for(int j=0 ;j<listh1.size();j++){
						String tempy = ((ProjectStatHead)listh1.get(j)).getYear();
						if(tempy.equals(form.getCurYear())){
							//循环月
							for(int k=0;k<12;k++){
								mapresult2.put(Converter.toBlank(k+1), Converter.toBlank(sumtm[k]));
								if(form.getCurMonth().equals(Converter.toBlank(k+1))){
									for(int m=0;m<listm.size();m++){
										Object[] obj = (Object[])listm.get(m);
										mapresult2.put(Converter.toBlank(sdm.format(obj[0])), Converter.toBlank(sumtd[m]));
									}
									
								}
							}
						}else{
							mapresult2.put(tempy, Converter.toBlank(sumty[j]));
						}
						
					}
					//统计纵向每年总和
					for(int j=0;j<listh1.size();j++){
						ProjectStatHead psh = listh1.get(j);
						List<?> listy=projectStatDAO.getYearData("",projectBaseinfoId,creatUserId);
						for(int k=0;k<listy.size();k++){
							Object[] obj = (Object[])listy.get(k);
							if(Converter.toBlank(obj[0]).equals(psh.getYear())){
								mapresulty.put(psh.getYear(), Converter.toBlank(obj[1]));
								break;
							}
						}
					}
					
				    psv.setSumCurMonth(Converter.toBlank(sumcurm));
                    psv.setTotalCount(Converter.toBlank(totalAllCount));
                    psv.setTotalProjectValue(Converter.toBlank(totalProjectValue));
					psv.setMap(mapresult2);
					psv.setTotalmap(mapresulty);
					list.add(psv);
					form.setPsv(list);
				}
				
			}
	        
		}
		

		
		
	}
	private Object[] getResult(String tyear,String taskcode,String projectBaseinfoId,String creatUserId){
		StringBuffer sql = new StringBuffer("SELECT SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 1, a.long_time, 0)) AS A,"   
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 2, a.long_time, 0)) AS B, "  
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 3, a.long_time, 0)) AS C,"    
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 4, a.long_time, 0)) AS D,"    
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 5, a.long_time, 0)) AS E,"    
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 6, a.long_time, 0)) AS F,"  
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 7, a.long_time, 0)) AS G,"   
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 8, a.long_time, 0)) AS H,"   
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 9, a.long_time, 0)) AS I,"   
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 10, a.long_time, 0)) AS J,"   
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 11, a.long_time, 0)) AS K,"   
			       +"SUM(DECODE(EXTRACT(MONTH FROM a.WORK_DATE), 12, a.long_time, 0)) AS L "  
			       +" FROM  pm.project_worktime_record  a, pm.project_baseinfo b " 
			       +" WHERE  a.project_baseinfo_id = b.id  "
			       +" and EXTRACT(YEAR FROM a.WORK_DATE) =:tyear"
			       +" and a.task_code=:taskCode ");
		if(!projectBaseinfoId.equals("")){
			sql.append(" and a.PROJECT_BASEINFO_ID=:projectBaseinfoId ");
		}

		if(!creatUserId.equals("")){
			sql.append(" and  a.CREATE_USER_ID =:creatUserId");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tyear", tyear);
		map.put("taskCode", taskcode);
		if(!projectBaseinfoId.equals("")){
			map.put("projectBaseinfoId", projectBaseinfoId);
		}
		if(!creatUserId.equals("")){
			map.put("creatUserId", creatUserId);
		}
		Object[] object = (Object[])projectStatDAO.findObjBySql(sql.toString(), map);
		
		return object;
	}
	private Object getCosts(String taskcode,String projectBaseinfoId,String creatUserId){
		StringBuffer sql = new StringBuffer("SELECT SUM(a.COSTS) "   
			       +" FROM  PM.PROJECT_FINANCE_COST  a " 
			       +" WHERE 1=1" );

		Map<String, Object> map = new HashMap<String, Object>();
		if(!taskcode.equals("")){
			sql.append(" and a.task_code=:taskCode  ");
			map.put("taskCode", taskcode);
		}
		if(!projectBaseinfoId.equals("")){
			sql.append(" and a.PROJECT_BASEINFO_ID=:projectBaseinfoId ");
			map.put("projectBaseinfoId", projectBaseinfoId);
		}
		if(!creatUserId.equals("")){
			sql.append(" and  a.staff_code =:creatUserId");
			map.put("creatUserId", creatUserId);
		}
		
		Object object = (Object)projectStatDAO.findObjBySql(sql.toString(), map);
		
		return object;
	}
	private String getItemNameByCode(String sql,String temp,String valueName){

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(valueName, temp);
		
		Object  obj = projectStatDAO.findObjByHql(sql, map);
		return  Converter.toBlank(obj);
	}
	private Object getObjectByCode(String sql,String temp,String valueName){

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(valueName, temp);
		
		Object  obj = projectStatDAO.findObjByHql(sql, map);
		return obj;
	}

	@Override
	public void statfrp(ProjectStatForm form) {
		// TODO Auto-generated method stub
		String hql = "from  ProjectTaskDict ";
		
		List<ProjectStatVo> lpsv = new ArrayList<ProjectStatVo>();
		List<?> list = projectStatDAO.findObjectByHql(hql);
		Map<String, String> map = new HashMap<String, String>();
		String totalflag = "";
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				ProjectTaskDict ptd = (ProjectTaskDict)list.get(i);
				String itemCode = ptd.getItemCode();
				String itemName = ptd.getItemName();
				ProjectStatVo psv= new ProjectStatVo();
				psv.setProjectTaskName(itemName);
				totalflag = "1";
				psv.setTotalCount(totalflag);
				List<?>  listfrp = projectStatDAO.getGroupFrpData(form.getProjectBaseinfoIdCase(), itemCode,form.getStartTimeHidden(),form.getEndTimeHidden());
				map.put(itemCode, Converter.toBlank(listfrp.size()));
				form.setMap(map);
				if(listfrp!=null && listfrp.size()>0){
					lpsv.add(psv);
					String projectName = "";
					String projectCode = "";
					Double sumactlongtime = (double)0L;
					Double sumactCosts = (double)0L;
					Double sumProjectCosts = (double)0L;//实施成本
					Double sumProjectValue = (double)0L;//实施费用
					for(int j=0;j<listfrp.size();j++){
						ProjectStatVo psv1= new ProjectStatVo();
						Object[]  objs = (Object[] )listfrp.get(j);
						ProjectBaseinfo pbi = (ProjectBaseinfo)getObjectByCode("from ProjectBaseinfo a where a.id=:id",Converter.toBlank(objs[0]),"id");
						projectCode = pbi.getProjectCode();
						projectName = pbi.getProjectName();
						psv1.setSeqNo(Converter.toBlank(j+1));
						psv1.setProjectCode(pbi.getProjectCode());
						psv1.setProjectName(pbi.getProjectName());

						Double tempActCost = (double)0L;
						SecurityStaffBaseinfo ssb = null;
						CommConfigStaffChargeType ccst = null;
						if(!Converter.toBlank(objs[1]).equals("")){
							 ssb = (SecurityStaffBaseinfo)getObjectByCode("from SecurityStaffBaseinfo a where a.id=:staffCode",Converter.toBlank(objs[1]),"staffCode");
							ccst = (CommConfigStaffChargeType)getObjectByCode("from CommConfigStaffChargeType a where a.itemCode=:itemCode",ssb.getCommConfigStaffChargetypeId(),"itemCode");
							if(ccst!=null){
								tempActCost=Converter.toDouble(objs[4])*Converter.toDouble(ccst.getItemCost());//人工成本
							}
							psv1.setCreateUserName(ssb.getName());
						}
						
						psv1.setProjectTaskName(itemName);
						psv1.setChargeTypeName(Converter.toBlank(objs[2]));
						psv1.setActLongTime(Converter.toBlank(objs[4]));
						sumactlongtime+=Converter.toDouble(objs[4]);
						psv1.setActCosts(Converter.toBlank(df.format(tempActCost)));
						sumactCosts+=Converter.toDouble(tempActCost);
						Object  object = getCosts(itemCode, Converter.toBlank(objs[0]), Converter.toBlank(objs[1]));
						Double tempProjectValue = tempActCost+Converter.toDouble(object);
						psv1.setProjectCosts(Converter.toBlank(df.format(tempProjectValue)));//实施费用 
						sumProjectCosts+=Converter.toDouble(object);
						psv1.setProjectValue(Converter.toBlank(df.format(Converter.toDouble(object))));
						sumProjectValue+=Converter.toDouble(tempProjectValue);
						lpsv.add(psv1);
					}
					ProjectStatVo psv2 = new ProjectStatVo();
					psv2.setSeqNo("合计");
					psv2.setProjectCode(projectCode);
					psv2.setProjectName(projectName);
					psv2.setProjectTaskName(itemName);
					psv2.setChargeTypeName("全部");
					psv2.setTotalLongTime(Converter.toBlank(sumactlongtime));
					psv2.setTotalcosts(Converter.toBlank(df.format(sumactCosts)));
					psv2.setTotalProjectCosts(Converter.toBlank(df.format(sumProjectValue)));
					psv2.setTotalProjectValue(Converter.toBlank(df.format(sumProjectCosts)));
					psv2.setCreateUserName("全部");
					totalflag = "2";
					psv2.setTotalFlag(totalflag);
					lpsv.add(psv2);
				}
			}
		}
		form.setPsv(lpsv);
	}
	
	public static double round(double value, int scale, int roundingMode) {  
		
        BigDecimal bd = new BigDecimal(value);  
        bd = bd.setScale(scale, roundingMode);  
        double d = bd.doubleValue();  
        bd = null;  
        return d;  
    }
	
}
