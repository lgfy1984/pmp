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
import java.util.List;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.business.IProjectBaseinfoService;
import com.tianjian.pm.dao.IProjectBaseInfoDAO;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
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

	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
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
	public void delete(ProjectBaseInfoForm form){
		

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
	public int getProjectBaseInfoCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId){
		return projectBaseInfoDAO.getProjectBaseinfoCount(projectClass, classId, onlineTime, startTime, endTime, userId);
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
			
			List<?> list = projectBaseInfoDAO
					.getProjectBaseinfoData(hosform.getProjectClass(), hosform.getProjectClass(), hosform.getOnlineTime(), hosform.getStartTime(), hosform.getEndTime(), curCount, pageSize, hosform.getCreateUserId(), hosform.getOrder());
			if (list != null && list.size() > 0) {
				List<ProjectBaseInfoVo> crd = new ArrayList<ProjectBaseInfoVo>(
						list.size());

				for (int i = 0; i < list.size(); i++) {
					ProjectBaseInfoVo temp = new ProjectBaseInfoVo();
					Object[] obs = (Object[]) list.get(i);
					temp.setId(Converter.toBlank(obs[0]));
					temp.setProjectName(Converter.toBlank(obs[1]));
					temp.setProjectClass(Converter.toBlank(obs[2]));
					temp.setSeqNo(Converter.toBlank(obs[3]));
					crd.add(temp);
				}
				hosform.setPbi(crd);
			}

		
	}
	/**根据患者id查询最近的10条咨询记录*/
	public void getRecentTenProjectBaseInfo(ProjectBaseInfoForm hosform,String pid, String tenantId){
		
	}
	/**根据电话号码查询最近的10条咨询记录*/
	public void getRecentByTel(ProjectBaseInfoForm hosform,String tel, String tenantId){
		
	}
	/** 根据电话查询 域id pid*/
	public void qurayPidByTel(ProjectBaseInfoForm form, String telphone, String tenantId){
		
	}
	
	
	/** 构造data */
	private void setData(ProjectBaseInfoForm form,
			ProjectBaseinfo data) {
		data.setProjectName(Converter.toBlank(form.getProjectName()));
		
		
		if ("add".equals(form.getVerbId())) {
			Date date = new Date();
		} else if ("update".equals(form.getVerbId())) {
			Date date = new Date();
			String newDate = sdf.format(date);
			data.setCreateDate(new Timestamp(Converter.toDate(newDate).getTime()));
			data.setCreateUserName(Converter.toBlank(form.getCreateUserName()));
			data.setCreateUserId(Converter.toBlank(form.getCreateUserId()));
		}
	}
}
