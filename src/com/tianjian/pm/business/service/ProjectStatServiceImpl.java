/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.bean.ProjectTaskDict;
import com.tianjian.pm.business.IProjectStatService;
import com.tianjian.pm.dao.IProjectStatDAO;
import com.tianjian.pm.struts.form.ProjectStatForm;
import com.tianjian.pm.struts.form.ProjectStatHead;
import com.tianjian.pm.struts.form.ProjectStatVo;
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
       
		List<?> listtime =projectStatDAO.getTimeData(projectBaseinfoId,creatUserId);
		Date date = new Date();
        Calendar mint = Calendar.getInstance();
        Calendar maxt = Calendar.getInstance();
        Calendar nowc = Calendar.getInstance();
        nowc.setTime(date);
        form.setCurYear(Converter.toBlank(nowc.get(Calendar.YEAR)));
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
				List<ProjectStatVo>  list = new ArrayList<ProjectStatVo>();
				List<ProjectStatHead>  listh1 = new ArrayList<ProjectStatHead>();
				List<ProjectStatHead>  listh2 = new ArrayList<ProjectStatHead>();
				if(tempyear!=0){
					for(int i=0;i<=tempyear;i++){
					  if(Converter.toBlank(mint.get(Calendar.YEAR)+i).equals(form.getCurYear())){
						  for(int j=1 ;j<=12;j++){
								ProjectStatHead psh = new ProjectStatHead();
								psh.setMonth(Converter.toBlank(j));
								listh2.add(psh);
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
					    }
					}
				}
				form.setHead1(listh1);
				form.setHead2(listh2);
				if(listdata!=null && listdata.size()>0){
					for(int i=0;i<listdata.size();i++){
						ProjectStatVo psv = new ProjectStatVo();
						Object[] obs = (Object[])listdata.get(i);
						psv.setSeqNo(Converter.toBlank(i));
						psv.setCreateUserName(getItemNameByCode("select a.name from SecurityStaffBaseinfo a where a.staffCode=:staffCode",Converter.toBlank(obs[0]),"staffCode"));
						psv.setProjectTaskName(getItemNameByCode("select a.itemName from ProjectTaskDict a where a.itemCode=:itemCode",Converter.toBlank(obs[1]),"itemCode"));

						Map<String, String> mapresult = new HashMap<String, String>();
						
						for(int j=0 ;j<listh1.size();j++){
							String tempy = ((ProjectStatHead)listh1.get(j)).getYear();
							if(tempy.equals(form.getCurYear())){
								Object[] object = getResult(Converter.toBlank(obs[0]),tempy,Converter.toBlank(obs[1]),projectBaseinfoId,creatUserId);
								for(int k=0;k<object.length;k++){
									mapresult.put(Converter.toBlank(k+1), Converter.toBlank(object[k]).equals("")?"0":Converter.toBlank(object[k]));
								}
							}else{

								Object[] object = getResult(Converter.toBlank(obs[0]),tempy,Converter.toBlank(obs[1]),projectBaseinfoId,creatUserId);
								Double sumt  = (double)0L;
								for(int k=0;k<object.length;k++){
									sumt+=Converter.toDouble(object[k]);
								}
								mapresult.put(tempy, Converter.toBlank(sumt));
							}
							
						}
						psv.setMap(mapresult);
						list.add(psv);
					}
					form.setPsv(list);
				}
				
			}
	        
		}
		

		
		
	}
	private Object[] getResult(String userid,String tyear,String taskcode,String projectBaseinfoId,String creatUserId){
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
			       +" and a.create_user_id =:userid  "
			       +" and EXTRACT(YEAR FROM a.WORK_DATE) =:tyear"
			       +" and a.task_code=:taskCode ");
		if(!projectBaseinfoId.equals("")){
			sql.append(" and a.PROJECT_BASEINFO_ID=:projectBaseinfoId ");
		}

		if(!creatUserId.equals("")){
			sql.append(" and  a.CREATE_USER_ID =:creatUserId");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid",userid);
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
				List<?>  listfrp = projectStatDAO.getGroupFrpData(form.getProjectBaseinfoIdCase(), itemCode);
				map.put(itemCode, Converter.toBlank(listfrp.size()));
				form.setMap(map);
				if(listfrp!=null && listfrp.size()>0){
					lpsv.add(psv);
					String projectName = "";
					String projectCode = "";
					Double sumactlongtime = (double)0L;
					Double sumactCosts = (double)0L;
					for(int j=0;j<listfrp.size();j++){
						ProjectStatVo psv1= new ProjectStatVo();
						Object[]  objs = (Object[] )listfrp.get(j);
						ProjectBaseinfo pbi = (ProjectBaseinfo)getObjectByCode("from ProjectBaseinfo a where a.id=:id",Converter.toBlank(objs[0]),"id");
						projectCode = pbi.getProjectCode();
						projectName = pbi.getProjectName();
						psv1.setSeqNo(Converter.toBlank(j+1));
						psv1.setProjectCode(pbi.getProjectCode());
						psv1.setProjectName(pbi.getProjectName());
						psv1.setCreateUserName(getItemNameByCode("select a.name from SecurityStaffBaseinfo a where a.staffCode=:staffCode",Converter.toBlank(objs[1]),"staffCode"));
						psv1.setProjectTaskName(itemName);
						psv1.setActLongTime(Converter.toBlank(objs[3]));
						sumactlongtime+=Converter.toDouble(objs[3]);
						psv1.setActCosts(Converter.toBlank(objs[4]));
						sumactCosts+=Converter.toDouble(objs[4]);
						lpsv.add(psv1);
					}
					ProjectStatVo psv2 = new ProjectStatVo();
					psv2.setSeqNo("合计");
					psv2.setProjectCode(projectCode);
					psv2.setProjectName(projectName);
					psv2.setProjectTaskName(itemName);
					psv2.setTotalLongTime(Converter.toBlank(sumactlongtime));
					psv2.setTotalcosts(Converter.toBlank(sumactCosts));
					psv2.setCreateUserName("全部");
					totalflag = "2";
					psv2.setTotalCount(totalflag);
					lpsv.add(psv2);
				}
			}
		}
		form.setPsv(lpsv);
	}
	
}
