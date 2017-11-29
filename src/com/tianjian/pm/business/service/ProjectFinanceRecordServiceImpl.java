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
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.bean.ProjectFinanceRecord;
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

		List<?> list1 = projectFinanceRecordDAO.getTaskClassDict();
		if (list1 != null && list1.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();

			for (int i = 0; i < list1.size(); i++) {
				temp.put(String.valueOf(Converter.toBlank(((Object[]) list1
						.get(i))[0])), String.valueOf(Converter
						.toBlank(((Object[]) list1.get(i))[1])));
			}
			form.setTaskClass(temp);
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
		ProjectFinanceRecord data = new ProjectFinanceRecord();
		data.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_FINANCE_RECORD", "SEQ_NO")));
		setData(form, data);
		projectFinanceRecordDAO.save(data);
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
		  
		ProjectFinanceRecord data = projectFinanceRecordDAO.findById(form.getIdHidden());
		projectFinanceRecordDAO.delete(data);// 删除数据库记录

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
	public int getProjectFinanceRecordCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId){
		return projectFinanceRecordDAO.getProjectFinanceRecordCount(projectClass, classId, onlineTime, startTime, endTime, userId);
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
		form.setWorkDate(sdf.format(new Date()));
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

//			if(hosform.getOrderNo() !=null && !hosform.getOrderNo().trim().equals("")){
//				if (hosform.getOrderNo().equals("0")) {
//					order += " a.consultationTime";
//				} else if (hosform.getOrderNo().equals("1")) {
//					order += " a.name";
//				} else if (hosform.getOrderNo().equals("2")) {
//					order += " a.consultationComments";
//				}
//				else if (hosform.getOrderNo().equals("3")) {
//					order += "  a.consultationById";
//				} 
//				else if (hosform.getOrderNo().equals("4")) {
//					order += "  a.consultationClassId";
//				} 
//				else if (hosform.getOrderNo().equals("5")) {
//					order += "  a.executedFlagId";
//				} 
//			} else {
//				order += "  a.consultationTime";
//			}
			
			if(hosform.getSort() == null || hosform.getSort().trim().equals("0")){
				  order +=" ASC";
			}
			if(hosform.getSort() != null && hosform.getSort().trim().equals("1")){
				  order +=" DESC";
			}
			hosform.setOrder(order);
			
			List<?> list = projectFinanceRecordDAO
					.getProjectFinanceRecordData(hosform.getProjectBaseinfoIdCase(), hosform.getProjectTaskCodeCase(), hosform.getWorkDate(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), curCount, pageSize, hosform.getCreateUserId(), hosform.getOrder());
		    if (list != null && list.size() > 0) {
				List<ProjectFinanceVo> crd = new ArrayList<ProjectFinanceVo>(list.size());

				for (int i = 0; i < list.size(); i++) {
					ProjectFinanceVo temp = new ProjectFinanceVo();
					ProjectFinanceRecord obs = (ProjectFinanceRecord) list.get(i);
					temp.setId(Converter.toBlank(obs.getId()));
					temp.setLongTime(Converter.toBlank(obs.getLongTime()));
					temp.setProjectBaseinfoId(Converter.toBlank(obs.getProjectBaseinfoId()));
					ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs.getProjectBaseinfoId()));
					if(pbi!=null){
						temp.setProjectCode(pbi.getProjectCode());
						temp.setProjectName(pbi.getProjectName());
					}
					temp.setTaskCode(this.changeClassId(obs.getTaskCode(), hosform));
					temp.setSeqNo(Converter.toBlank(obs.getSeqNo()));
					temp.setCosts(Converter.toBlank(obs.getCosts()));
					temp.setWorkDate(sdf.format(obs.getWorkDate()));
					temp.setCreateUserId(Converter.toBlank(obs.getCreateUserId()));
					temp.setCreateUserName(Converter.toBlank(obs.getCreateUserName()));
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
	
	
	/** 构造data */
	private void setData(ProjectFinanceRecordForm form,
			ProjectFinanceRecord data) {

		data.setProjectBaseinfoId(Converter.toBlank(form.getProjectBaseinfoId()));
		data.setLongTime(Converter.toInteger(form.getLongTime()));
		data.setTaskCode(Converter.toBlank(form.getTaskCode()));
		data.setCosts(Converter.toDouble(form.getCosts()));
			String newDate = sdf.format( new Date());
			data.setWorkDate(new Timestamp(Converter.toDate(form.getWorkDate()).getTime()));
			data.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
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
			}
		    form.setSeqNo(Converter.toBlank(data.getSeqNo()));
		    form.setLongTime(Converter.toBlank(data.getLongTime()));
		    form.setTaskCode(Converter.toBlank(data.getTaskCode()));
			form.setTaskName(this.changeClassId(Converter.toBlank(data.getTaskCode()), form));
		    form.setWorkDate(sdf.format(data.getWorkDate()));
		    form.setCosts(Converter.toBlank(data.getCosts()));
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
}
