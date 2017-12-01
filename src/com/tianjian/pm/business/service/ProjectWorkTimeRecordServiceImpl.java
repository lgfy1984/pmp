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
import com.tianjian.pm.bean.ProjectFinanceRecord;
import com.tianjian.pm.bean.ProjectWorktimeRecord;
import com.tianjian.pm.business.IProjectWorkTimeRecordService;
import com.tianjian.pm.dao.IProjectWorkTimeRecordDAO;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;
import com.tianjian.pm.struts.form.ProjectWorkVo;
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
public class ProjectWorkTimeRecordServiceImpl implements IProjectWorkTimeRecordService{


	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	private IProjectWorkTimeRecordDAO projectWorkTimeRecordDAO;
	

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
	public void initForm(ProjectWorkTimeRecordForm form){

		List<?> list1 = projectWorkTimeRecordDAO.getTaskClassDict(form.getProjectClassCode());
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
	public void save(ProjectWorkTimeRecordForm form){
		ProjectWorktimeRecord data = new ProjectWorktimeRecord();

		data.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_WORKTIME_RECORD", "SEQ_NO")));
		ProjectFinanceRecord  pfr  = new ProjectFinanceRecord();
		setData(form,data,pfr);
		projectWorkTimeRecordDAO.save(data);
		projectWorkTimeRecordDAO.save(pfr);
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
		data.setSeqNo(Converter.toInteger(form.getSeqNo()));
		this.setData(form, data,null);
		projectWorkTimeRecordDAO.update(data);
	}
	public void check(ProjectWorkTimeRecordForm form){
		
		ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(form.getIdHidden());
		data.setStatus(form.getStatus());
		projectWorkTimeRecordDAO.update(data);
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
		  
		ProjectWorktimeRecord data = projectWorkTimeRecordDAO.findById(form.getIdHidden());
		projectWorkTimeRecordDAO.delete(data);// 删除数据库记录

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
	public int getProjectWorkTimeRecordCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId,String status){
		return projectWorkTimeRecordDAO.getProjectWorktimeRecordCount(projectClass, classId, onlineTime, startTime, endTime, userId,status);
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
	public void getSearch(ProjectWorkTimeRecordForm hosform, int curCount, int pageSize){
		
	}
	/**
	 * 咨询信息列表
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
			
			List<?> list = projectWorkTimeRecordDAO
					.getProjectWorktimeRecordData(hosform.getProjectBaseinfoIdCase(), hosform.getProjectTaskCodeCase(), hosform.getWorkDate(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(), curCount, pageSize, hosform.getCreateUserId(), hosform.getOrder(),hosform.getStatusCase());
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
					ProjectWorktimeRecord obs = (ProjectWorktimeRecord) list.get(i);
					temp.setId(Converter.toBlank(obs.getId()));
					temp.setLongTime(Converter.toBlank(obs.getLongTime()));
					temp.setProjectBaseinfoId(Converter.toBlank(obs.getProjectBaseinfoId()));
					ProjectBaseinfo  pbi =  projectWorkTimeRecordDAO.findObjectById(Converter.toBlank(obs.getProjectBaseinfoId()));
					if(pbi!=null){
						temp.setProjectCode(pbi.getProjectCode());
						temp.setProjectName(pbi.getProjectName());
					}
					String temp2 = "";
					if(obs.getStatus()!=null){
						if(obs.getStatus().equals("")){
							temp2="未审核";
						}else if(obs.getStatus().equals("0")){
							temp2="审核未通过";
						}else{
							temp2="审核通过";
						}
					}else{
						temp2="未审核";
					}
					temp.setStatus(temp2);
					temp.setTaskCode(this.changeClassId(obs.getTaskCode(), hosform));
					temp.setSeqNo(Converter.toBlank(obs.getSeqNo()));
					temp.setWorkDate(sdf.format(obs.getWorkDate()));
					temp.setCreateUserId(Converter.toBlank(obs.getCreateUserId()));
					temp.setCreateUserName(Converter.toBlank(obs.getCreateUserName()));
					crd.add(temp);
				}
				hosform.setPwv(crd);
			}

		
	}
	
	
	/** 构造data */
	private void setData(ProjectWorkTimeRecordForm form,
			ProjectWorktimeRecord data,ProjectFinanceRecord pfr) {

		data.setProjectBaseinfoId(Converter.toBlank(form.getProjectBaseinfoId()));
		data.setLongTime(Converter.toInteger(form.getLongTime()));
		data.setTaskCode(Converter.toBlank(form.getTaskCode()));
		
			String newDate = sdf.format( new Date());
			data.setWorkDate(new Timestamp(Converter.toDate(form.getWorkDate()).getTime()));
			data.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
			
        if(pfr!=null){
			pfr.setProjectBaseinfoId(Converter.toBlank(form.getProjectBaseinfoId()));
			pfr.setLongTime(Converter.toInteger(form.getLongTime()));
			pfr.setTaskCode(Converter.toBlank(form.getTaskCode()));
			pfr.setSeqNo(Converter.toInteger(projectWorkTimeRecordDAO.getSequenceNo("PM.PROJECT_FINANCE_RECORD", "SEQ_NO")));
			pfr.setWorkDate(new Timestamp(Converter.toDate(form.getWorkDate()).getTime()));
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
		    form.setSeqNo(Converter.toBlank(data.getSeqNo()));
		    form.setLongTime(Converter.toBlank(data.getLongTime()));
		    form.setTaskCode(Converter.toBlank(data.getTaskCode()));
			form.setTaskName(this.changeClassId(Converter.toBlank(data.getTaskCode()), form));
		    form.setWorkDate(sdf.format(data.getWorkDate()));
			form.setCreateUserName(Converter.toBlank(data.getCreateUserName()));
		
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
			vo.setStartTime(sdf.format(pbi.getStartTime()));
			vo.setOnlineTime(sdf.format(pbi.getOnlineTime()));
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
}
