/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.bean.ProjectClassDict;
import com.tianjian.pm.bean.ProjectFinanceRecord;
import com.tianjian.pm.bean.ProjectLongtimeDict;
import com.tianjian.pm.business.IProjectFinanceRecordService;
import com.tianjian.pm.dao.IProjectFinanceRecordDAO;
import com.tianjian.pm.dao.IProjectWorkTimeRecordDAO;
import com.tianjian.pm.struts.form.ProjectFinanceRecordForm;
import com.tianjian.pm.struts.form.ProjectFinanceVo;
import com.tianjian.util.Converter;

/**
 * TODO
 * <p>Title: ProjectWorkTimeRecordImpl.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:54:25
 * @version 1.0
 * 
 */
public class ProjectFinanceRecordServiceImpl implements IProjectFinanceRecordService{


	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private final SimpleDateFormat sdss = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
	
	private IProjectWorkTimeRecordDAO projectWorkTimeRecordDAO;

	private IProjectFinanceRecordDAO projectFinanceRecordDAO;


	public IProjectFinanceRecordDAO getProjectFinanceRecordDAO() {
		return projectFinanceRecordDAO;
	}

	public void setProjectFinanceRecordDAO(
			IProjectFinanceRecordDAO projectFinanceRecordDAO) {
		this.projectFinanceRecordDAO = projectFinanceRecordDAO;
	}
	
	public IProjectWorkTimeRecordDAO getProjectWorkTimeRecordDAO() {
		return projectWorkTimeRecordDAO;
	}

	public void setProjectWorkTimeRecordDAO(
			IProjectWorkTimeRecordDAO projectWorkTimeRecordDAO) {
		this.projectWorkTimeRecordDAO = projectWorkTimeRecordDAO;
	}

	/**
	 * 初始化form
	*
	* @Title: initForm
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void initForm(ProjectFinanceRecordForm form){

		List<?> list1 = projectFinanceRecordDAO.getTaskClassDict(form.getProjectClassCode());
		if (list1 != null && list1.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();
            temp.put("", "");
			for (int i = 0; i < list1.size(); i++) {
				temp.put(String.valueOf(Converter.toBlank(((Object[]) list1
						.get(i))[0])), String.valueOf(Converter
						.toBlank(((Object[]) list1.get(i))[1])));
			}
			form.setTaskClass(temp);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectLongtimeDict a where 1=1 ");
		List<?> list2 = projectWorkTimeRecordDAO.findObjectByHql(hql.toString(), map);
		if (list2 != null && list2.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();
			for (int i = 0; i < list2.size(); i++) {
				ProjectLongtimeDict pcd = (ProjectLongtimeDict)list2.get(i);
				String tempItemCode =Converter.toBlank(pcd.getItemCode());
				String tempItemName =Converter.toBlank(pcd.getItemName());
				temp.put(tempItemCode, tempItemName);
			}
			form.setLongTimeDict(temp);
		}
		StringBuffer hql2 = new StringBuffer("from ProjectClassDict a where 1=1 ");
		List<?> list3 = projectWorkTimeRecordDAO.findObjectByHql(hql2.toString(), map);
		if (list3 != null && list3.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();

			for (int i = 0; i < list3.size(); i++) {
				ProjectClassDict pcd = (ProjectClassDict)list3.get(i);
				String tempItemCode =Converter.toBlank(pcd.getItemCode());
				String tempItemName =Converter.toBlank(pcd.getItemName());
				temp.put(tempItemCode, tempItemName);
			}
			form.setProjectClass(temp);
		}
	}
	/**
	 * 保存
	*
	* @Title: save
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void save(ProjectFinanceRecordForm form){
		ProjectFinanceRecord data = projectFinanceRecordDAO.findById(form.getIdHidden());
		if(data!=null){
			data.setSeqNo(Converter.toInteger(form.getSeqNo()));
			this.setData(form, data);
			projectFinanceRecordDAO.update(data);
		}else{
		
			data = new ProjectFinanceRecord();
			String sql = "select a.item_name,a.item_cost,a.item_unit from"
						+" security.security_staff_baseinfo t "
						+" left join  comm.comm_config_staff_charge_type a"
						+" on t.comm_config_staff_charge_id = a.item_code"
						+" where t.id=:id ";
			Object[] obs = (Object[]) getObjectBySqlCode(sql,form.getCreateUserId(),"id");
			form.setChargeType(Converter.toBlank(obs[1]));
			data.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_FINANCE_RECORD", "SEQ_NO")));
			setData(form, data);
			projectFinanceRecordDAO.save(data);
			form.setIdHidden(data.getId());
		}
	}
	/**
	 * 保存
	*
	* @Title: save
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void saveExcelData(ProjectFinanceRecordForm form){
		for (ProjectFinanceVo pfv : form.getPfv()) {
			ProjectFinanceRecord data = new ProjectFinanceRecord();
			setData(pfv, data,form);
			projectFinanceRecordDAO.save(data);
		}
	}
	/**
	 * 修改
	*
	* @Title: update
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void update(ProjectFinanceRecordForm form){
		
		ProjectFinanceRecord data = projectFinanceRecordDAO.findById(form.getIdHidden());
		data.setSeqNo(Converter.toInteger(form.getSeqNo()));
		this.setData(form, data);
		projectFinanceRecordDAO.update(data);
	}
	/**
	 * 保存知识库
	*
	* @Title: saveKnowledge
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void saveKnowledge(ProjectFinanceRecordForm form){
		
	}
	/**
	 * 根据id查找咨询信息
	*
	* @Title: findDetailById
	* @param id
	* @return
	* @return ProjectFinanceRecord
	* @throws
	* @author lengj
	 */
	public ProjectFinanceRecord findDetailById(String id){

		return projectFinanceRecordDAO.findById(id);
	}
	/**
	 * 删除
	*
	* @Title: delete
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void delete(ProjectFinanceRecordForm form){
		String[] objs = form.getIds();
		if(objs!=null && objs.length>0){
			for(int i=0;i<objs.length;i++){
				ProjectFinanceRecord data = projectFinanceRecordDAO.findById(objs[i]);
				projectFinanceRecordDAO.delete(data);
			}
		}

	}
    public void updateall(ProjectFinanceRecordForm form){
    	String[] objs = form.getIds();
    	String[] longTimes = form.getLongTimesHidden().split(",");
		if(objs!=null && objs.length>0){
			for(int i=0;i<objs.length;i++){
				ProjectFinanceRecord data = projectFinanceRecordDAO.findById(objs[i]);
				data.setLongTime(Converter.toDouble(longTimes[i]));
				projectFinanceRecordDAO.update(data);
			}
		}
	}
	/**
	 * 条件查询咨询信息条数
	*
	* @Title: getProjectFinanceRecordCount
	* @param way
	* @param classId
	* @param statues
	* @param b_time
	* @param e_time
	* @param hspId
	* @param userId
	* @param tenantId
	* @return
	* @return int
	* @throws
	* @author lengj
	 */
	public int getProjectFinanceRecordCount(String projectNameCase,String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, String userId,String timeCase,String timeSelect){
		return projectFinanceRecordDAO.getProjectFinanceRecordCount(projectNameCase,projectBaseinfoId, projectClassCode, staffName, startTime, endTime, userId,timeCase,timeSelect);
	}
	
	public int getQsCount(String projectNameCase,String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, String userId,String timeCase,String timeSelect){
		return projectFinanceRecordDAO.getQsCount(projectNameCase,projectBaseinfoId, projectClassCode, staffName, startTime, endTime, userId,timeCase,timeSelect);
	}
	
	public void getQsSearch(ProjectFinanceRecordForm hosform, int curCount,int pageSize){
		
		String order ="";

		if(hosform.getOrderNo() !=null && !hosform.getOrderNo().trim().equals("")){
			if (hosform.getOrderNo().equals("0")) {
				order += " a.seq_no";
			} else if (hosform.getOrderNo().equals("1")) {
				order += " t.project_class";
			} 
			
		} else {
			order += "  a.work_date DESC ";
		}
		
		if(hosform.getSort() == null || hosform.getSort().trim().equals("0")){
			  order +=" ASC";
		}
		if(hosform.getSort() != null && hosform.getSort().trim().equals("1")){
			  order +=" DESC";
		}
		
		hosform.setOrder(order);
		List<?> list = projectFinanceRecordDAO
				.getQsData(hosform.getProjectNameCase(), hosform.getProjectBaseinfoIdCase(),  hosform.getProjectClassCodeCase(),
						hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), curCount, pageSize, hosform.getCreateUserId(),hosform.getTimeCase(),hosform.getTimeSelect(),hosform.getOrder());
	    if (list != null && list.size() > 0) {
			List<ProjectFinanceVo> crd = new ArrayList<ProjectFinanceVo>(list.size());

			for (int i = 0; i < list.size(); i++) {
				ProjectFinanceVo temp = new ProjectFinanceVo();
				Object[] obs = (Object[]) list.get(i);
				temp.setId(Converter.toBlank(obs[0]));
				temp.setLongTimeCode(Converter.toBlank(obs[2]));
				temp.setProjectBaseinfoId(Converter.toBlank(obs[1]));
				ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs[1]));
				if(pbi!=null){
					temp.setProjectCode(pbi.getProjectCode());
					temp.setProjectName(pbi.getProjectName());
					temp.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
				}
				temp.setTaskCode(Converter.toBlank(obs[8]));
				temp.setTaskName(this.changeClassId(Converter.toBlank(obs[8]), hosform));
				temp.setSeqNo(Converter.toBlank(obs[7]));
				temp.setCosts(Converter.toBlank(obs[10]));
				if(obs[9]!=null && !obs[9].equals("")){
					temp.setWorkDate(sdf.format(obs[9]));
				}
				temp.setStaffCode(Converter.toBlank(obs[12]));
				temp.setWorkStaffName(Converter.toBlank(obs[11]));
				temp.setCreateUserId(Converter.toBlank(obs[4]));
				temp.setCreateUserName(Converter.toBlank(Converter.toBlank(obs[5])));
				crd.add(temp);
			}
			hosform.setPfv(crd);
		}
	    List<?> list1 = projectWorkTimeRecordDAO.getProjectClassDict();
		if (list1 != null && list1.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();

			for (int i = 0; i < list1.size(); i++) {
				temp.put(String.valueOf(Converter.toBlank(((Object[]) list1
						.get(i))[0])), String.valueOf(Converter
						.toBlank(((Object[]) list1.get(i))[1])));
			}
			hosform.setProjectClass(temp);
		}

	
}
	/**
	 * 修改初始化
	*
	* @Title: updateInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void updateInit(ProjectFinanceRecordForm form){

		ProjectFinanceRecord data = projectFinanceRecordDAO.findById(form.getIdHidden());

		form.setProjectClassCode(getItemNameByCode("select a.projectClass from ProjectBaseinfo a where a.id=:id",Converter.toBlank(data.getProjectBaseinfoId()),"id"));
		this.initForm(form);
		this.setForm(form, data);
	}
	/**
	 * 新增初始化
	*
	* @Title: addInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void addInit(ProjectFinanceRecordForm form){
		
		initForm(form);
		//form.setWorkDate(sdf.format(new Date()));
	}
	/**
	 * 知识库列表
	*
	* @Title: getSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getSearch(ProjectFinanceRecordForm hosform, int curCount, int pageSize){
		
	}
	/**
	 * 咨询信息列表
	*
	* @Title: getProjectFinanceRecordSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectFinanceRecordSearch(ProjectFinanceRecordForm hosform, int curCount,int pageSize){
		
			String order ="";

			if(hosform.getOrderNo() !=null && !hosform.getOrderNo().trim().equals("")){
				if (hosform.getOrderNo().equals("0")) {
					order += " a.seq_no";
				} else if (hosform.getOrderNo().equals("1")) {
					order += " t.project_class";
				} 
				
			} else {
				order += "  a.work_date DESC ";
			}
			
			if(hosform.getSort() == null || hosform.getSort().trim().equals("0")){
				  order +=" ASC";
			}
			if(hosform.getSort() != null && hosform.getSort().trim().equals("1")){
				  order +=" DESC";
			}
			
			hosform.setOrder(order);
			initForm(hosform);
			List<?> list = projectFinanceRecordDAO
					.getProjectFinanceRecordData(hosform.getProjectNameCase(), hosform.getProjectBaseinfoIdCase(),  hosform.getProjectClassCodeCase(),
							hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), curCount, pageSize, hosform.getCreateUserId(),hosform.getTimeCase(),hosform.getTimeSelect(),hosform.getOrder());
		    if (list != null && list.size() > 0) {
				List<ProjectFinanceVo> crd = new ArrayList<ProjectFinanceVo>(list.size());

				for (int i = 0; i < list.size(); i++) {
					ProjectFinanceVo temp = new ProjectFinanceVo();
					Object[] obs = (Object[]) list.get(i);
					temp.setId(Converter.toBlank(obs[0]));
					temp.setLongTimeCode(Converter.toBlank(obs[2]));
					temp.setProjectBaseinfoId(Converter.toBlank(obs[1]));
					ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs[1]));
					if(pbi!=null){
						temp.setProjectCode(pbi.getProjectCode());
						temp.setProjectName(pbi.getProjectName());
						temp.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
					}
					temp.setTaskCode(Converter.toBlank(obs[8]));
					temp.setTaskName(this.changeClassId(Converter.toBlank(obs[8]), hosform));
					temp.setSeqNo(Converter.toBlank(obs[7]));
					temp.setCosts(Converter.toBlank(obs[10]));
					if(obs[9]!=null && !obs[9].equals("")){
						temp.setWorkDate(sdf.format(obs[9]));
					}
					temp.setStaffCode(Converter.toBlank(obs[12]));
					temp.setWorkStaffName(Converter.toBlank(obs[11]));
					temp.setCreateUserId(Converter.toBlank(obs[4]));
					temp.setCreateUserName(Converter.toBlank(Converter.toBlank(obs[5])));
					crd.add(temp);
				}
				hosform.setPfv(crd);
			}
		         String timeSelect = hosform.getTimeSelect();
		    	//筛选不重复的员工
		        
		    	List<?> listselect = projectFinanceRecordDAO
						.getProjectFwSelectData(hosform.getProjectBaseinfoId(),  hosform.getProjectClassCodeCase(),
								hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), hosform.getCreateUserId(),hosform.getTimeCase(),hosform.getTimeSelect(), hosform.getOrder());

			    if(listselect!=null && listselect.size()>0){
	    			 List<ProjectFinanceVo> crd = new ArrayList<ProjectFinanceVo>(listselect.size());
			    		for(Object obj:listselect){
			    		    String tempStaffCode = Converter.toBlank(((Object[])obj)[0]);
			    		    String tempStaffName = Converter.toBlank(((Object[])obj)[1]);
			    			 ProjectFinanceVo pfv = new ProjectFinanceVo();
			    			 pfv.setTimeCase(hosform.getTimeCase());
			    			 pfv.setTimeStartCase(hosform.getStartTimeHidden());
			    			 pfv.setTimeEndCase(hosform.getEndTimeHidden());
			    			 pfv.setWorkStaffName(tempStaffName);
			    			 crd.add(pfv);
						    if(timeSelect.equals("1")){	
				    			  if(!tempStaffCode.equals("")){
				    				  //查找一周工时大于40的员工
				    				  List<?> listWeek =  projectFinanceRecordDAO.getProjectFwWeekData(tempStaffCode, hosform.getStartTimeHidden(), hosform.getEndTimeHidden());	
				    				  if(listWeek!=null && listWeek.size()>0){
				    					  List<?> listData =  projectFinanceRecordDAO.getProjectFwData(hosform.getProjectBaseinfoId(),  hosform.getProjectClassCodeCase(),
				  								hosform.getStaffNameHidden(),tempStaffCode, hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), hosform.getCreateUserId(), hosform.getOrder());

				    					  pfv.setPfv3(setPfvToForm(listData,hosform));
				    					  hosform.setResultFlag("1");
				    				  }
				    			  }
						    }else{
						    	if(!tempStaffCode.equals("")){
				    				  //查找一周工时大于8的员工
				    				  List<?> listday =  projectFinanceRecordDAO.getProjectFwDayData(hosform.getTimeCase(),hosform.getTimeSelect(),tempStaffCode);	
				    				  if(listday!=null && listday.size()>0){
				    					  pfv.setPfv3(setPfvToForm(listday,hosform));
				    					  hosform.setResultFlag("2");
				    				  }
				    			  }
						    }
			    		}
			    		hosform.setPfv2(crd);
		    	}

		    	
		   
		    
		    List<?> list1 = projectWorkTimeRecordDAO.getProjectClassDict();
			if (list1 != null && list1.size() > 0) {
				Map<String, String> temp = new LinkedHashMap<String, String>();

				for (int i = 0; i < list1.size(); i++) {
					temp.put(String.valueOf(Converter.toBlank(((Object[]) list1
							.get(i))[0])), String.valueOf(Converter
							.toBlank(((Object[]) list1.get(i))[1])));
				}
				hosform.setProjectClass(temp);
			}

		
	}
	private List<ProjectFinanceVo> setPfvToForm(List<?> listday,ProjectFinanceRecordForm hosform){
	 List<ProjectFinanceVo> crd = new ArrayList<ProjectFinanceVo>(listday.size());
		for (int i = 0; i < listday.size(); i++) {
			ProjectFinanceVo temp = new ProjectFinanceVo();
			Object[] obs = (Object[]) listday.get(i);
			temp.setId(Converter.toBlank(obs[0]));
			temp.setLongTimeCode(Converter.toBlank(obs[2]));
			temp.setProjectBaseinfoId(Converter.toBlank(obs[1]));
			ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs[1]));
			if(pbi!=null){
				temp.setProjectCode(pbi.getProjectCode());
				temp.setProjectName(pbi.getProjectName());
				temp.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
			}
			temp.setTaskCode(this.changeClassId(Converter.toBlank(obs[8]), hosform));
			temp.setSeqNo(Converter.toBlank(obs[7]));
			temp.setCosts(Converter.toBlank(obs[10]));
			if(obs[9]!=null && !obs[9].equals("")){
				temp.setWorkDate(sdf.format(obs[9]));
			}
			temp.setStaffCode(Converter.toBlank(obs[12]));
			temp.setWorkStaffName(Converter.toBlank(obs[11]));
			temp.setCreateUserId(Converter.toBlank(obs[4]));
			temp.setCreateUserName(Converter.toBlank(Converter.toBlank(obs[5])));
			crd.add(temp);
		}
		return crd;
	}
	/** 构造exceldata */
	private void setData(ProjectFinanceVo pfv,ProjectFinanceRecord data,ProjectFinanceRecordForm form) {
		

//		String sql = "select a.item_name,a.item_cost,a.item_unit from"
//					+" security.security_staff_baseinfo t "
//					+" left join  comm.comm_config_staff_charge_type a"
//					+" on t.comm_config_staff_charge_id = a.item_code"
//					+" where t.id=:id ";
//		Object[] obs = (Object[]) getObjectBySqlCode(sql,form.getCreateUserId(),"id");
//		data.setChargeType(Converter.toBlank(obs[1]));

		data.setProjectBaseinfoId(Converter.toBlank(pfv.getProjectBaseinfoId()));
		data.setStaffCode(Converter.toBlank(pfv.getStaffCode()));
		data.setTaskCode(Converter.toBlank(pfv.getTaskCode()));
		data.setLongTime(Converter.toDouble(pfv.getLongTimeCode()));
		data.setCosts(Converter.toDouble(pfv.getCosts()));
		data.setSeqNo(Converter.toInteger(pfv.getSeqNo()));
		data.setWorkDate(new Timestamp(Converter.toDate(pfv.getWorkDate()).getTime()));
			String newDatess = sdss.format( new Date());
			data.setCreateDate(new Timestamp(Converter.toDate(newDatess).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
		
	}
	
	/** 构造data */
	private void setData(ProjectFinanceRecordForm form,
			ProjectFinanceRecord data) {

		data.setProjectBaseinfoId(Converter.toBlank(form.getProjectBaseinfoId()));
		data.setStaffCode(Converter.toBlank(form.getWorkStaffCode()));
		data.setLongTime(Converter.toDouble(form.getLongTimeCode()));
		data.setTaskCode(Converter.toBlank(form.getTaskCode()));
		data.setCosts(Converter.toDouble(form.getCosts()));
		data.setChargeType(Converter.toBlank(form.getChargeType()));
		          String newDatess = sdss.format( new Date());
		          if(!form.getWorkDate().equals("")){
			          data.setWorkDate(new Timestamp(Converter.toDate(form.getWorkDate()).getTime()));
		          }else{
		        	  data.setWorkDate(null);
		          }
			data.setCreateDate(new Timestamp(Converter.toDate(newDatess).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
		
	}
	/** 构造data */
	private void setForm(ProjectFinanceRecordForm form,
			ProjectFinanceRecord data) {
			form.setId(Converter.toBlank(data.getId()));
			form.setProjectBaseinfoId(Converter.toBlank(data.getProjectBaseinfoId()));
			ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(data.getProjectBaseinfoId()));
			if(pbi!=null){
				form.setProjectCode(pbi.getProjectCode());
				form.setProjectName(pbi.getProjectName());
				form.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
				form.setStaffName(pbi.getStaffName());//项目经理姓名 
			}
			form.setChargeType(data.getChargeType());
		    form.setSeqNo(Converter.toBlank(data.getSeqNo()));
		    form.setLongTimeCode(Converter.toBlank(data.getLongTime()));
		    form.setTaskCode(Converter.toBlank(data.getTaskCode()));
			form.setTaskName(this.changeClassId(Converter.toBlank(data.getTaskCode()), form));
			if(data.getWorkDate()!=null){
		      form.setWorkDate(sdf.format(data.getWorkDate()));
			}else{
				form.setWorkDate("");
			}
		    form.setCosts(Converter.toBlank(data.getCosts()));
		    //取得人员姓名，并不是财务创建人员
		    
		    String tempName  = "";
		    if(data.getStaffCode()!=null){
			    tempName = getItemNameByCode("select a.name from SecurityStaffBaseinfo a where a.id=:id ",data.getStaffCode(),"id");
		    }
		    form.setWorkStaffCode(data.getStaffCode());
			form.setWorkStaffName(tempName);//添加工时人员姓名
		    form.setCreateUserName(Converter.toBlank(data.getCreateUserName()));
		
	}
	
	private String changeClassId(String id, ProjectFinanceRecordForm form) {
		Map<String, String> temp = form.getTaskClass();
		if (temp != null) {
			Iterator<String> iter = temp.keySet().iterator();
			while (iter.hasNext()) {
				String key = iter.next();
				String value = temp.get(key);
				if (key.equals(id)) {
					return value;
				}
			}
		}
		return "";
	}
	private String getItemNameByCode(String sql,String temp,String valueName){

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(valueName, temp);
		
		Object  obj = projectWorkTimeRecordDAO.findObjByHql(sql, map);
		return  Converter.toBlank(obj);
	}
	private Object[] getObjectBySqlCode(String sql,String temp,String valueName){

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(valueName, temp);
		
		Object[]  obj = (Object[]) projectWorkTimeRecordDAO.findObjBySql(sql, map);
		return  obj;
	}
}
