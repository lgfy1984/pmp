/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.bean.ProjectClassDict;
import com.tianjian.pm.bean.ProjectFinanceCost;
import com.tianjian.pm.bean.ProjectFinanceRecord;
import com.tianjian.pm.bean.ProjectLongtimeDict;
import com.tianjian.pm.bean.ProjectWorktimeRecord;
import com.tianjian.pm.business.IProjectWorkTimeRecordService;
import com.tianjian.pm.dao.IProjectWorkTimeRecordDAO;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;
import com.tianjian.pm.struts.form.ProjectWorkVo;
import com.tianjian.security.bean.SecurityStaffBaseinfo;
import com.tianjian.util.Converter;
import com.tianjian.util.comm.DateUtil;

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
public class ProjectWorkTimeRecordServiceImpl implements IProjectWorkTimeRecordService{


	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private final SimpleDateFormat sdss = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
	
	private IProjectWorkTimeRecordDAO projectWorkTimeRecordDAO;
	

	public IProjectWorkTimeRecordDAO getProjectWorkTimeRecordDAO() {
		return projectWorkTimeRecordDAO;
	}

	public void setProjectWorkTimeRecordDAO(
			IProjectWorkTimeRecordDAO projectWorkTimeRecordDAO) {
		this.projectWorkTimeRecordDAO = projectWorkTimeRecordDAO;
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
	public void saveExcelData(ProjectWorkTimeRecordForm form){
		for (ProjectWorkVo pwv : form.getPwv()) {
			ProjectWorktimeRecord data = new ProjectWorktimeRecord();
			setData(pwv, data,form);
			projectWorkTimeRecordDAO.save(data);
		}
	}
	
	
	/** 构造exceldata */
	private void setData(ProjectWorkVo pfv,ProjectWorktimeRecord data,ProjectWorkTimeRecordForm form) {
		

//		String sql = "select a.item_name,a.item_cost,a.item_unit from"
//					+" security.security_staff_baseinfo t "
//					+" left join  comm.comm_config_staff_charge_type a"
//					+" on t.comm_config_staff_charge_id = a.item_code"
//					+" where t.id=:id ";
//		Object[] obs = (Object[]) getObjectBySqlCode(sql,form.getCreateUserId(),"id");
//		data.setChargeType(Converter.toBlank(obs[1]));

		data.setProjectBaseinfoId(Converter.toBlank(pfv.getProjectBaseinfoId()));
		//data.setStaffCode(Converter.toBlank(pfv.getWorkStaffCode()));
		data.setWorkDate(new Timestamp(Converter.toDate(pfv.getWorkDate()).getTime()));
		data.setLongTime(Converter.toDouble(pfv.getLongTimeCode()));
		data.setTaskCode(Converter.toBlank(pfv.getTaskCode()));
		//data.setCosts(Converter.toDouble(pfv.getCosts()));
		data.setSeqNo(Converter.toInteger(pfv.getSeqNo()));
			String newDatess = sdss.format( new Date());
			data.setCreateDate(new Timestamp(Converter.toDate(newDatess).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
		
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
	public void initForm(ProjectWorkTimeRecordForm form){

		List<?> list1 = projectWorkTimeRecordDAO.getTaskClassDict(form.getProjectClassCode());
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
		//form.setWorkDate(sdf.format(new Date()));
		
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
	public void save(ProjectWorkTimeRecordForm form){
		
		ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(form.getIdHidden());
		if(data!=null){
			this.setData(form, data,null);
			projectWorkTimeRecordDAO.update(data);
		}else{
			data = new ProjectWorktimeRecord();
			String sql = "select a.item_name,a.item_cost,a.item_unit from"
						+" security.security_staff_baseinfo t "
						+" left join  comm.comm_config_staff_charge_type a"
						+" on t.comm_config_staff_charge_id = a.item_code"
						+" where t.id=:id ";
			Object[] obs = (Object[]) getObjectBySqlCode(sql,form.getCreateUserId(),"id");
			form.setChargeType(Converter.toBlank(obs[1]));
			form.setSeqNo(Converter.toBlank(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_WORKTIME_RECORD", "SEQ_NO")));
			setData(form,data,null);
			projectWorkTimeRecordDAO.save(data);
			form.setIdHidden(data.getId());
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
	public void update(ProjectWorkTimeRecordForm form){
		
		ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(form.getIdHidden());
		
		this.setData(form, data,null);
		projectWorkTimeRecordDAO.update(data);
	}
	public void check(ProjectWorkTimeRecordForm form){
		String[] objs = form.getIds();
		if(objs!=null && objs.length>0){
			for(int i=0;i<objs.length;i++){
				ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(objs[i]);
				data.setStatus(form.getStatus());
				ProjectFinanceRecord  pfr  = new ProjectFinanceRecord();
				ProjectFinanceCost  pfc  = new ProjectFinanceCost();
				this.setPfrData(data,pfr);
				this.setPfcData(data,pfc);
				projectWorkTimeRecordDAO.save(pfr);
				projectWorkTimeRecordDAO.save(pfc);
				projectWorkTimeRecordDAO.update(data);
			}
		}
		if(!form.getIdHidden().equals("")){
			ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(form.getIdHidden());
			data.setStatus(form.getStatus());
			projectWorkTimeRecordDAO.update(data);
		}
	}
	
	public void lock(ProjectWorkTimeRecordForm form){
		if(!form.getCreateUserIdHidden().equals("") && !form.getProjectBaseinfoIdHidden().equals("")){

			 Map<String, Object> map = new HashMap<String, Object>();
			 String sql ="";
			 if(form.getLockStatus().equals("1")){
			     sql = " from ProjectWorktimeRecord a where "
		        		+ " a.createUserId=:createUserId"
		        		+ " and a.projectBaseinfoId=:projectBaseinfoId "
		        		+ " and a.lockStatus is null ";
			 }else{
				 sql = " from ProjectWorktimeRecord a where "
			        		+ " a.createUserId=:createUserId"
			        		+ " and a.projectBaseinfoId=:projectBaseinfoId "
			        		+ " and a.lockStatus = '1' ";
			 }
				map.put("createUserId",form.getCreateUserIdHidden());
				map.put("projectBaseinfoId", form.getProjectBaseinfoIdHidden());
				List<?> list2 = projectWorkTimeRecordDAO.findObjectByHql(sql, map);
				if(list2!=null&&list2.size()>0){
					for(int i=0;i<list2.size();i++){
						ProjectWorktimeRecord data = (ProjectWorktimeRecord)list2.get(i);
						data.setLockStatus(form.getLockStatus());
						projectWorkTimeRecordDAO.update(data);
						
					}
				}
		}
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
	public void saveKnowledge(ProjectWorkTimeRecordForm form){
		
	}
	/**
	 * 根据id查找咨询信息
	*
	* @Title: findDetailById
	* @param id
	* @return
	* @return ProjectWorktimeRecord
	* @throws
	* @author lengj
	 */
	public ProjectWorktimeRecord findDetailById(String id){

		return projectWorkTimeRecordDAO.findById(id);
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
	public void delete(ProjectWorkTimeRecordForm form){
		String[] objs = form.getIds();
		if(objs!=null && objs.length>0){
			for(int i=0;i<objs.length;i++){
				ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(objs[i]);
				projectWorkTimeRecordDAO.delete(data);
			}
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
	public void updateInit(ProjectWorkTimeRecordForm form){

		ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(form.getIdHidden());
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
	public void addInit(ProjectWorkTimeRecordForm form){
		
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
	public void getSearch(ProjectWorkTimeRecordForm hosform, int curCount, int pageSize){
		
	}
	
	/**
	 * 条件查询咨询信息条数
	*
	* @Title: getProjectWorktimeRecordCount
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
	public int getProjectWorkTimeRecordCount(String projectNameCase, String classId,
			String onlineTime, String startTime, String endTime, String userId,String status,String noLimit){
		return projectWorkTimeRecordDAO.getProjectWorktimeRecordCount(projectNameCase, classId, onlineTime, startTime, endTime, userId,status,noLimit);
	}
	/**
	 * 信息列表
	*
	* @Title: getProjectWorktimeRecordSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectWorkTimeRecordSearch(ProjectWorkTimeRecordForm hosform, int curCount,int pageSize){
		
			String order ="";

			if(hosform.getOrderNo() !=null && !hosform.getOrderNo().trim().equals("")){
				if (hosform.getOrderNo().equals("0")) {
					order += " a.seq_no";
				} else if (hosform.getOrderNo().equals("1")) {
					order += " t.project_class";
				} 
				
			} else {
				order += "  a.work_date ";
			}
			
			if(hosform.getSort() == null || hosform.getSort().trim().equals("0")){
				  order +=" ASC";
			}
			if(hosform.getSort() != null && hosform.getSort().trim().equals("1")){
				  order +=" DESC";
			}
			hosform.setOrder(order);
			
			List<?> list = projectWorkTimeRecordDAO
					.getProjectWorktimeRecordData(hosform.getProjectNameCase(), hosform.getProjectClassCodeCase(), hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), curCount, pageSize, hosform.getCreateUserId(), hosform.getOrder(),hosform.getStatusCase(),hosform.getNoLimit());
			initForm(hosform);
			if (list != null && list.size() > 0) {
				List<ProjectWorkVo> crd = new ArrayList<ProjectWorkVo>(list.size());

				for (int i = 0; i < list.size(); i++) {
					ProjectWorkVo temp = new ProjectWorkVo();
					Object[] obs = (Object[]) list.get(i);
					temp.setId(Converter.toBlank(obs[0]));
					temp.setLongTimeCode(Converter.toBlank(obs[2]));
					temp.setProjectBaseinfoId(Converter.toBlank(obs[1]));
					ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs[1]));
					if(pbi!=null){
						temp.setProjectCode(pbi.getProjectCode());
						temp.setProjectName(pbi.getProjectName());
						temp.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
						temp.setProjectStaffName(getItemNameByCode("select a.name from SecurityStaffBaseinfo a where a.id=:staffCode",pbi.getStaffCode(),"staffCode"));
					}
					
					String temp2 = "";
					String tstatu =Converter.toBlank(obs[3]);
					if(tstatu!=null){
						if(tstatu.equals("")){
							temp2="未审核";
						}else if(tstatu.equals("0")){
							temp2="审核未通过";
						}else{
							temp2="审核通过";
						}
					}else{
						temp2="未审核";
					}
					temp.setStatus(Converter.toBlank(obs[3]));
					temp.setStatusName(temp2);
					
					
					String lockstatus =Converter.toBlank(obs[10]);
					temp.setLockStatus(lockstatus);
					if(lockstatus.equals("")){
						temp.setLockStatusName("已锁定");
					}else{
						temp.setLockStatusName("未锁定");
					}
					temp.setTaskCode(Converter.toBlank(obs[8]));
					temp.setTaskName(this.changeClassId(Converter.toBlank(obs[8]), hosform));
					temp.setSeqNo(Converter.toBlank(obs[7]));
					try {
						temp.setWorkDate(sdf.format(sdf.parse(String.valueOf(obs[9]))));
						Calendar currentDate = DateUtil.starCalOfWeek(new GregorianCalendar());
						Date  date = (Date)currentDate.getTime().clone();
						//int days7 = DateUtil.getOffsetDays(sdf.parse(String.valueOf(obs[9])),new Date());
						if(date.after(sdf.parse(String.valueOf(obs[9])))){
							temp.setDays7Flag("1");
						}
					}catch(ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					temp.setCreateUserId(Converter.toBlank(obs[4]));
					temp.setCreateUserName(Converter.toBlank(obs[5]));
					crd.add(temp);
				}
				hosform.setPwv(crd);
			}

		
	}
	

	/**
	 * 条件查询咨询信息条数
	*
	* @Title: getProjectWorktimeRecordCount
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
	public int getProjectWorkTimeUnlockCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId,String status){
		return projectWorkTimeRecordDAO.getProjectWorkTimeUnlockCount(projectClass, classId, onlineTime, startTime, endTime, userId,status);
	}
	/**
	 * 信息列表
	*
	* @Title: getProjectWorktimeRecordSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectWorkTimeUnlockSearch(ProjectWorkTimeRecordForm hosform, int curCount,int pageSize){
		
			
			
			List<?> list = projectWorkTimeRecordDAO
					.getProjectWorktimeUnlockData(hosform.getProjectBaseinfoIdCase(), hosform.getProjectClassCodeCase(), hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), curCount, pageSize, hosform.getCreateUserId(), hosform.getOrder(),hosform.getStatusCase());
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
			if (list != null && list.size() > 0) {
				List<ProjectWorkVo> crd = new ArrayList<ProjectWorkVo>(list.size());

				for (int i = 0; i < list.size(); i++) {
					ProjectWorkVo temp = new ProjectWorkVo();
					Object[] obs = (Object[]) list.get(i);
					temp.setProjectBaseinfoId(Converter.toBlank(obs[0]));
					temp.setCreateUserId(Converter.toBlank(obs[1]));
					temp.setCreateUserName(Converter.toBlank(obs[2]));
					Map<String, Object> map = new HashMap<String, Object>();
					ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs[0]));
					if(pbi!=null){
						temp.setProjectCode(pbi.getProjectCode());
						temp.setProjectName(pbi.getProjectName());
						//temp.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
					}
					
			        String sql = " from ProjectWorktimeRecord a where "
			        		+ " a.createUserId=:createUserId"
			        		+ " and a.projectBaseinfoId=:projectBaseinfoId "
			        		+ " and a.lockStatus='1' ";

					map.put("createUserId", Converter.toBlank(obs[1]));
					map.put("projectBaseinfoId", Converter.toBlank(obs[0]));
					List<?> list2 = projectWorkTimeRecordDAO.findObjectByHql(sql, map);
					if(list2!=null&&list2.size()>0){
						temp.setLockStatusName("已解锁");
						temp.setLockStatus("1");
					}else{
						temp.setLockStatusName("已锁定");
						temp.setLockStatus("");
					}
					crd.add(temp);
				}
				hosform.setPwv(crd);
			}

		
	}
	//更新财务数据
	private void setPfcData(ProjectWorktimeRecord data,ProjectFinanceCost pfc) {

		pfc.setProjectBaseinfoId(Converter.toBlank(data.getProjectBaseinfoId()));
		pfc.setTaskCode(Converter.toBlank(data.getTaskCode()));
		pfc.setStaffCode(Converter.toBlank(data.getCreateUserId()));
		pfc.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_FINANCE_RECORD", "SEQ_NO")));
		pfc.setWorkDate(data.getWorkDate());
		pfc.setChargeType(Converter.toBlank(data.getChargeType()));
		pfc.setCreateDate(new Timestamp(new Date().getTime()));
		pfc.setCreateUserName(Converter.toBlank(data.getCreateUserName()));
		pfc.setCreateUserId(Converter.toBlank(data.getCreateUserId()));
	        
			
	}
	//更新财务数据
	private void setPfrData(ProjectWorktimeRecord data,ProjectFinanceRecord pfr) {
		
			pfr.setProjectBaseinfoId(Converter.toBlank(data.getProjectBaseinfoId()));
			pfr.setLongTime(Converter.toDouble(data.getLongTime()));
			pfr.setTaskCode(Converter.toBlank(data.getTaskCode()));
			pfr.setStaffCode(Converter.toBlank(data.getCreateUserId()));
			pfr.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_FINANCE_RECORD", "SEQ_NO")));
			pfr.setWorkDate(data.getWorkDate());
			pfr.setChargeType(Converter.toBlank(data.getChargeType()));
			pfr.setCreateDate(new Timestamp(new Date().getTime()));
			pfr.setCreateUserName(Converter.toBlank(data.getCreateUserName()));
			pfr.setCreateUserId(Converter.toBlank(data.getCreateUserId()));
        
		
	}
	/** 构造data */
	private void setData(ProjectWorkTimeRecordForm form,
			ProjectWorktimeRecord data,ProjectFinanceRecord pfr) {

		data.setProjectBaseinfoId(Converter.toBlank(form.getProjectBaseinfoId()));
		data.setLongTime(Converter.toDouble(form.getLongTimeCode()));
		data.setTaskCode(Converter.toBlank(form.getTaskCode()));
		data.setStaffCode(Converter.toBlank(form.getCreateUserId()));
		data.setSeqNo(Converter.toInteger(form.getSeqNo()));
			String newDate = sdf.format( new Date());
			if(!form.getWorkDate().equals(""))
			data.setWorkDate(new Timestamp(Converter.toDate(form.getWorkDate()).getTime()));
			data.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
			if(!form.getWorkStaffCode().equals("")){
				data.setCreateUserId(Converter.toBlank(form.getWorkStaffCode()));
				data.setCreateUserName(Converter.toBlank(form.getWorkStaffName()));
			}else{
				data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
				data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			}
			data.setChargeType(Converter.toBlank(form.getChargeType()));
			
        if(pfr!=null){
			pfr.setProjectBaseinfoId(Converter.toBlank(form.getProjectBaseinfoId()));
			pfr.setLongTime(Converter.toDouble(form.getLongTimeCode()));
			pfr.setTaskCode(Converter.toBlank(form.getTaskCode()));
			pfr.setStaffCode(Converter.toBlank(form.getCreateUserId()));
			pfr.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_FINANCE_RECORD", "SEQ_NO")));
			pfr.setWorkDate(new Timestamp(Converter.toDate(form.getWorkDate()).getTime()));
			pfr.setChargeType(Converter.toBlank(form.getChargeType()));
			pfr.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
			pfr.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			pfr.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
        }
		
	}
	/** 构造data */
	private void setForm(ProjectWorkTimeRecordForm form,
			ProjectWorktimeRecord data) {
			form.setId(Converter.toBlank(data.getId()));
			form.setProjectBaseinfoId(Converter.toBlank(data.getProjectBaseinfoId()));
		    ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(data.getProjectBaseinfoId()));
			if(pbi!=null){
				form.setProjectCode(pbi.getProjectCode());
				form.setProjectName(pbi.getProjectName());
				form.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
				form.setStaffName(pbi.getStaffName());
			}
			String temp2 = "";
			if(data.getStatus()!=null){
				if(data.getStatus().equals("")){
					temp2="未审核";
				}else if(data.getStatus().equals("0")){
					temp2="审核未通过";
				}else{
					temp2="审核通过";
				}
			}else{
				temp2="未审核";
			}
			form.setStatusName(temp2);
		    form.setLockStatus(Converter.toBlank(data.getLockStatus()));
		    form.setSeqNo(Converter.toBlank(data.getSeqNo()));
		    if(data.getLongTime()!=null){
			    form.setLongTimeCode(Converter.toBlank(killling(data.getLongTime())));
		    }
		    form.setTaskCode(Converter.toBlank(data.getTaskCode()));
		    form.setChargeType(data.getChargeType());
			form.setTaskName(this.changeClassId(Converter.toBlank(data.getTaskCode()), form));
		    form.setWorkDate(sdf.format(data.getWorkDate()));
		    form.setWorkStaffName(Converter.toBlank(data.getCreateUserName()));
			form.setCreateUserName(Converter.toBlank(data.getCreateUserName()));
		
	}
	
	 public String killling(double value) {  
	        int b = (int) value;  
	        if (value == b) {  
	            return String.valueOf(b);  
	        } else {  
	            return String.valueOf(value);  
	        }  
	  
	    }  

	private String changeClassId(String id, ProjectWorkTimeRecordForm form) {
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
	private String changeProjectClassId(String id, ProjectWorkTimeRecordForm form) {
		Map<String, String> temp = form.getProjectClass();
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

	@Override
	public List<ProjectBaseInfoVo> findProjectList(ProjectWorkTimeRecordForm form, PageForm page) {
		List<ProjectBaseinfo> list = projectWorkTimeRecordDAO.findProjectList(form, page);
		List<ProjectBaseInfoVo> list2 = new ArrayList<ProjectBaseInfoVo>(list.size());
		for (ProjectBaseinfo pbi : list) {
			ProjectBaseInfoVo vo = new ProjectBaseInfoVo();
			vo.setId(Converter.toBlank(pbi.getId()));
			vo.setProjectName(Converter.toBlank(pbi.getProjectName()));
			vo.setProjectCode(Converter.toBlank(pbi.getProjectCode()));
			vo.setProjectClassCode(Converter.toBlank(pbi.getProjectClass()));
			vo.setProjectClassName(projectWorkTimeRecordDAO.findNameByCode(pbi.getProjectClass()));
			vo.setStaffName(Converter.toBlank(pbi.getStaffName()));
			vo.setSeqNo(Converter.toBlank(pbi.getSeqNo()));
			if(pbi.getStartTime()!=null)
			vo.setStartTime(sdf.format(pbi.getStartTime()));
			if(pbi.getOnlineTime()!=null)
			vo.setOnlineTime(sdf.format(pbi.getOnlineTime()));
			if(pbi.getEndTime()!=null)
			vo.setEndTime(sdf.format(pbi.getEndTime()));
			vo.setCreateUserId(Converter.toBlank(pbi.getCreateUserId()));
			vo.setCreateUserName(Converter.toBlank(pbi.getCreateUserName()));
			list2.add(vo);
		}
		return list2;
	}

	@Override
	public int findProjectCount(ProjectWorkTimeRecordForm form, PageForm page) {
		List<ProjectBaseinfo> list = projectWorkTimeRecordDAO.findProjectList(form, page);
		return list.size();

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

	@Override
	public String checkTime(ProjectWorkTimeRecordForm form) {
		// TODO Auto-generated method stub
		String message ="";
		Map<String, Object> map = new HashMap<String, Object>();
        StringBuffer sql = new StringBuffer("select sum(a.LONG_TIME) from PM.PROJECT_WORKTIME_RECORD a where "
        		+ " a.create_user_id=:createUserId"
        		+ " and to_char(a.WORK_DATE,'yyyy-MM-dd')=:workDate ");
        		if(!form.getIdHidden().equals("")){
        			sql.append(" and a.id<>:id ");
        		}
        
		map.put("createUserId", form.getCreateUserId());
		map.put("workDate", form.getWorkDate());
		if(!form.getIdHidden().equals("")){
		   map.put("id", form.getIdHidden());
		}
		Object obj = projectWorkTimeRecordDAO.findObjBySql(sql.toString(), map);
		if(obj!=null){
			double longtime = Converter.toDouble(form.getLongTimeCode());
			double temp = Converter.toDouble(obj)+longtime;
			if(temp>24){
				message = "1";
			}
		}
		return message;
	}
	
	@Override
	public String checkLock(ProjectWorkTimeRecordForm form) {
		// TODO Auto-generated method stub
		String message ="";//代表锁定
		Map<String, Object> map = new HashMap<String, Object>();
        String sql = "select a.* from PM.PROJECT_WORKTIME_RECORD a where "
        		+ " a.create_user_id=:createUserId "
        		+ "and  a.PROJECT_BASEINFO_ID=:projectBaseinfoId and a.LOCK_STATUS='1' ";
        
		map.put("createUserId", form.getCreateUserId());
		map.put("projectBaseinfoId", form.getProjectBaseinfoId());
		Object obj = projectWorkTimeRecordDAO.findObjBySql(sql, map);
		if(obj!=null){
				message = "1";//代表解锁
		}
		return message;
	}
	
	
}
