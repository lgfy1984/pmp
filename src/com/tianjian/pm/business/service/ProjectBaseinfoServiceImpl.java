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
import com.tianjian.pm.business.IProjectBaseinfoService;
import com.tianjian.pm.dao.IProjectBaseInfoDAO;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.SecurityStaffBaseinfoVo;
import com.tianjian.security.bean.SecurityStaffBaseinfo;
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
public class ProjectBaseinfoServiceImpl implements IProjectBaseinfoService{

	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	private IProjectBaseInfoDAO projectBaseInfoDAO;
	
	public IProjectBaseInfoDAO getProjectBaseInfoDAO() {
		return projectBaseInfoDAO;
	}
	public void setProjectBaseInfoDAO(IProjectBaseInfoDAO projectBaseInfoDAO) {
		this.projectBaseInfoDAO = projectBaseInfoDAO;
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
	public void initForm(ProjectBaseInfoForm form){

		List<?> list1 = projectBaseInfoDAO.getProjectClassDict();
		if (list1 != null && list1.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();

			for (int i = 0; i < list1.size(); i++) {
				temp.put(String.valueOf(Converter.toBlank(((Object[]) list1
						.get(i))[0])), String.valueOf(Converter
						.toBlank(((Object[]) list1.get(i))[1])));
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
	public void save(ProjectBaseInfoForm form){

		ProjectBaseinfo data = projectBaseInfoDAO.findById(form.getIdHidden());
		if(data==null){
			data = new ProjectBaseinfo();
			data.setSeqNo(Converter.toInteger(projectBaseInfoDAO.getSequenceNo("PM.PROJECT_BASEINFO", "SEQ_NO")));
			setData(form, data);
			projectBaseInfoDAO.save(data);
		}else{
			setData(form, data);
			projectBaseInfoDAO.update(data);
		}
	}
	
	public void saveExcelData(ProjectBaseInfoForm form){
		for (ProjectBaseInfoVo pbi : form.getPbi()) {
			ProjectBaseinfo data = new ProjectBaseinfo();
			setData(pbi,data,form);
			projectBaseInfoDAO.save(data);
		}
	}
	public String checkProjectCode(ProjectBaseInfoForm form){

		String message ="";
		Map<String, Object> map = new HashMap<String, Object>();
        String sql = " from ProjectBaseinfo a where "
        		+ " a.projectCode=:projectCode";
        
		map.put("projectCode", form.getProjectCode());
		Object obj = projectBaseInfoDAO.findObjByHql(sql, map);
		if(obj!=null){
				message = "1";
		}
		return message;
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
	public void update(ProjectBaseInfoForm form){
		
		ProjectBaseinfo data = projectBaseInfoDAO.findById(form.getIdHidden());

		data.setSeqNo(Converter.toInteger(form.getSeqNo()));
		this.setData(form, data);
		projectBaseInfoDAO.update(data);
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
	public void saveKnowledge(ProjectBaseInfoForm form){
		
	}
	/**
	 * 根据id查找咨询信息
	*
	* @Title: findDetailById
	* @param id
	* @return
	* @return ProjectBaseInfo
	* @throws
	* @author lengj
	 */
	public ProjectBaseinfo findDetailById(String id){

		return projectBaseInfoDAO.findById(id);
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
	public String delete(ProjectBaseInfoForm form){
		String temp="";
		String[] objs = form.getIds();
		Map<String, String> mapr = new HashMap<String, String>();
		if(objs!=null && objs.length>0){
			for(int i=0;i<objs.length;i++){
				ProjectBaseinfo data = projectBaseInfoDAO.findById((objs[i]));
				Map<String, Object> map = new HashMap<String, Object>();
		        String sql = " from ProjectWorktimeRecord a where "
		        		+ " a.projectBaseinfoId=:projectBaseinfoId";
		        
				map.put("projectBaseinfoId", objs[i]);
				Object obj = projectBaseInfoDAO.findObjByHql(sql, map);
				if(obj==null){
					projectBaseInfoDAO.delete(data);
					mapr.put(data.getId(), "项目"+data.getProjectName()+"删除成功");
				}else{
					mapr.put(data.getId(), "项目"+data.getProjectName()+"已有关联数据删除不成功");
				}
				// 删除数据库记录
			}
		}
		Iterator<String> iter = mapr.keySet().iterator();
	    while (iter.hasNext()) {
			String key = iter.next();
			String value = mapr.get(key);
			temp+=value+"</br>";
		}
        return temp;

	}
	/**
	 * 条件查询咨询信息条数
	*
	* @Title: getProjectBaseInfoCount
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
	public int getProjectBaseInfoCount(String projectClass, String projectNameHidden,
			String onlineStartTime, String onlineEndTime, 
			String startStartTime, String startEndTime, 
			String endStartTime, String endEndTime, 
			String userId){
		return projectBaseInfoDAO.getProjectBaseinfoCount(projectClass, projectNameHidden, 
				onlineStartTime, onlineEndTime, 
				startStartTime, startEndTime, 
				endStartTime, endEndTime, 
				userId);
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
	public void updateInit(ProjectBaseInfoForm form){

		ProjectBaseinfo data = projectBaseInfoDAO.findById(form.getIdHidden());
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
	public void addInit(ProjectBaseInfoForm form){
		
		initForm(form);
//		form.setOnlineTime(sdf.format(new Date()));
//		form.setStartTime(sdf.format(new Date()));
//		form.setEndTime(sdf.format(new Date()));
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
	public void getSearch(ProjectBaseInfoForm hosform, int curCount, int pageSize){
		
	}
	/**
	 * 咨询信息列表
	*
	* @Title: getProjectBaseInfoSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectBaseInfoSearch(ProjectBaseInfoForm hosform, int curCount,int pageSize){
		
			String order ="";

			if(hosform.getOrderNo() !=null && !hosform.getOrderNo().trim().equals("")){
				if (hosform.getOrderNo().equals("0")) {
					order += " a.seqNo";
				} else if (hosform.getOrderNo().equals("1")) {
					order += " a.projectName";
				} else if (hosform.getOrderNo().equals("2")) {
					order += " a.projectClass";
				}
				else if (hosform.getOrderNo().equals("3")) {
					order += "  a.startTime";
				} 
				else if (hosform.getOrderNo().equals("4")) {
					order += "  a.onlineTime";
				} 
				else if (hosform.getOrderNo().equals("5")) {
					order += "  a.endTime";
				} 
			} else {
				order += "  a.startTime";
			}
			
			if(hosform.getSort() == null || hosform.getSort().trim().equals("0")){
				  order +=" ASC";
			}
			if(hosform.getSort() != null && hosform.getSort().trim().equals("1")){
				  order +=" DESC";
			}
			hosform.setOrder(order);
			
			List<?> list = projectBaseInfoDAO
					.getProjectBaseinfoData(hosform.getProjectClassCodeHidden(), hosform.getProjectNameHidden(),
							hosform.getOnlineStartTimeHidden(),
							hosform.getOnlineEndTimeHidden(), 
							hosform.getStartStartTimeHidden(),
							hosform.getStartEndTimeHidden(),
							hosform.getEndStartTimeHidden(),
							hosform.getEndEndTimeHidden(),curCount, pageSize, hosform.getCreateUserId(), hosform.getOrder());
			if (list != null && list.size() > 0) {
				List<ProjectBaseInfoVo> crd = new ArrayList<ProjectBaseInfoVo>(list.size());

				for (int i = 0; i < list.size(); i++) {
					ProjectBaseInfoVo temp = new ProjectBaseInfoVo();
					ProjectBaseinfo obs = (ProjectBaseinfo) list.get(i);
					temp.setId(Converter.toBlank(obs.getId()));
					temp.setProjectName(Converter.toBlank(obs.getProjectName()));
					temp.setProjectCode(Converter.toBlank(obs.getProjectCode()));
					temp.setProjectClassName(this.changeClassId(obs.getProjectClass(), hosform));
					temp.setStaffCode(Converter.toBlank(obs.getStaffCode()));
					temp.setStaffName(getItemNameByCode("select a.name from SecurityStaffBaseinfo a where a.id=:staffCode",Converter.toBlank(obs.getStaffCode()),"staffCode"));
					temp.setSeqNo(Converter.toBlank(obs.getSeqNo()));
					if(obs.getStartTime()!=null)
					temp.setStartTime(sdf.format(obs.getStartTime()));
					if(obs.getOnlineTime()!=null)
					temp.setOnlineTime(sdf.format(obs.getOnlineTime()));
					if(obs.getEndTime()!=null)
					temp.setEndTime(sdf.format(obs.getEndTime()));
					temp.setCreateUserId(Converter.toBlank(obs.getCreateUserId()));
					temp.setCreateUserName(Converter.toBlank(obs.getCreateUserName()));
					crd.add(temp);
				}
				hosform.setPbi(crd);
			}

		
	}
	private void setData(ProjectBaseInfoVo vo,ProjectBaseinfo data,ProjectBaseInfoForm form) {
		data.setProjectCode(Converter.toBlank(vo.getProjectCode()));
		data.setProjectName(Converter.toBlank(vo.getProjectName()));
		data.setProjectClass(Converter.toBlank(vo.getProjectClassCode()));

	    data.setStaffCode(Converter.toBlank(vo.getStaffCode()));
	    data.setStaffName(Converter.toBlank(vo.getStaffName()));
			String newDate = sdf.format( new Date());
			if(!vo.getStartTime().equals("")){
			 data.setStartTime(new Timestamp(Converter.toDate(vo.getStartTime()).getTime()));
			}else{
			  data.setStartTime(null);
			}
			if(!vo.getOnlineTime().equals("")){
			 data.setOnlineTime(new Timestamp(Converter.toDate(vo.getOnlineTime()).getTime()));
			}else{
				  data.setOnlineTime(null);
			}
			if(!vo.getEndTime().equals("")){
			 data.setEndTime(new Timestamp(Converter.toDate(vo.getEndTime()).getTime()));
			}else{
				  data.setEndTime(null);
			}
			data.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
		
	}
	
	/** 构造data */
	private void setData(ProjectBaseInfoForm form,
			ProjectBaseinfo data) {
		data.setProjectCode(Converter.toBlank(form.getProjectCode()));
		data.setProjectName(Converter.toBlank(form.getProjectName()));
		data.setProjectClass(Converter.toBlank(form.getProjectClassCode()));

	    data.setStaffCode(Converter.toBlank(form.getStaffCode()));
	    data.setStaffName(Converter.toBlank(form.getStaffName()));
			String newDate = sdf.format( new Date());
			if(!form.getStartTime().equals("")){
			 data.setStartTime(new Timestamp(Converter.toDate(form.getStartTime()).getTime()));
			}else{
			  data.setStartTime(null);
			}
			if(!form.getOnlineTime().equals("")){
			 data.setOnlineTime(new Timestamp(Converter.toDate(form.getOnlineTime()).getTime()));
			}else{
				  data.setOnlineTime(null);
			}
			if(!form.getEndTime().equals("")){
			 data.setEndTime(new Timestamp(Converter.toDate(form.getEndTime()).getTime()));
			}else{
				  data.setEndTime(null);
			}
			//-----------研发时间-----------------
			    if(!form.getRequireTime().equals("")){
				 data.setRequireTime(new Timestamp(Converter.toDate(form.getRequireTime()).getTime()));
				}else{
				  data.setRequireTime(null);
				}
				if(!form.getDesignTime().equals("")){
				 data.setDesignTime(new Timestamp(Converter.toDate(form.getDesignTime()).getTime()));
				}else{
					  data.setDesignTime(null);
				}
				if(!form.getCodeTime().equals("")){
				 data.setCodeTime(new Timestamp(Converter.toDate(form.getCodeTime()).getTime()));
				}else{
					  data.setCodeTime(null);
				}
				if(!form.getTestTime().equals("")){
					 data.setTestTime(new Timestamp(Converter.toDate(form.getTestTime()).getTime()));
					}else{
						  data.setTestTime(null);
				}
			data.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
		
	}
	/** 构造data */
	private void setForm(ProjectBaseInfoForm form,
			ProjectBaseinfo data) {
			//form.setId(Converter.toBlank(data.getId()));
		    form.setProjectCode(Converter.toBlank(data.getProjectCode()));
		    form.setProjectName(Converter.toBlank(data.getProjectName()));
		    form.setProjectClassCode(Converter.toBlank(data.getProjectClass()));
		    form.setStaffCode(Converter.toBlank(data.getStaffCode()));
		    form.setStaffName(Converter.toBlank(data.getStaffName()));
		    form.setSeqNo(Converter.toBlank(data.getSeqNo()));
			form.setProjectClassName(this.changeClassId(Converter.toBlank(data.getProjectClass()), form));
			if(data.getStartTime()!=null){
		      form.setStartTime(sdf.format(data.getStartTime()));
			}else{
		      form.setStartTime("");
			}
			if(data.getOnlineTime()!=null){
		    form.setOnlineTime(sdf.format(data.getOnlineTime()));
			}else{
			      form.setOnlineTime("");
				}
			if(data.getEndTime()!=null){
		    form.setEndTime(sdf.format(data.getEndTime()));
			}else{
			    form.setEndTime("");
				}
			form.setCreateUserName(Converter.toBlank(data.getCreateUserName()));
		
	}
	
	private String changeClassId(String id, ProjectBaseInfoForm form) {
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

	private String getItemNameByCode(String sql,String temp,String valueName){

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(valueName, temp);
		
		Object  obj = projectBaseInfoDAO.findObjByHql(sql, map);
		return  Converter.toBlank(obj);
	}
	
	@Override
	public List<SecurityStaffBaseinfoVo> findStaffList(ProjectBaseInfoForm form, PageForm page) {
		List<SecurityStaffBaseinfo> list = projectBaseInfoDAO.findStaffList(form, page);
		List<SecurityStaffBaseinfoVo> list2 = new ArrayList<SecurityStaffBaseinfoVo>(list.size());
		for (SecurityStaffBaseinfo pbi : list) {
			SecurityStaffBaseinfoVo vo = new SecurityStaffBaseinfoVo();
			vo.setId(Converter.toBlank(pbi.getId()));
			vo.setStaffCode(Converter.toBlank(pbi.getStaffCode()));
			vo.setStaffName(Converter.toBlank(pbi.getName()));
			if(pbi.getCommConfigSexId()!=null && !pbi.getCommConfigSexId().equals("")){
				vo.setSexName(projectBaseInfoDAO.findNameByCode(pbi.getCommConfigSexId()));
			}
			vo.setStaffClass("");
			vo.setCreateUserId(Converter.toBlank(pbi.getCreateUserId()));
			vo.setCreateUserName(Converter.toBlank(pbi.getCreateUserName()));
			list2.add(vo);
		}
		return list2;
	}

	@Override
	public int findStaffCount(ProjectBaseInfoForm form, PageForm page) {
		List<SecurityStaffBaseinfo> list = projectBaseInfoDAO.findStaffList(form, page);
		return list.size();

	}
}
