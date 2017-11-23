/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;

import java.util.List;

import org.apache.struts.action.ActionForm;

import com.tianjian.pm.bean.ProjectBaseinfo;

/**
 * TODO
 * <p>Title: ProjectBaseInfoForm.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:59:53
 * @version 1.0
 * 
 */
public class ProjectBaseInfoForm extends ActionForm {

	/**
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	*/ 
	private static final long serialVersionUID = 1L;
	
    private String id="";
	private String projectCode="" ;
	private String projectName="" ;
	private String projectClass="" ;
	private String staffCode="" ;
	private String staffName="" ;
	private String startTime="" ;
	private String onlineTime="" ;
	private String endTime="" ;
	private String seqNo="" ;

	private String createDate ="";
	private String createUserId ="";
	private String createUserName ="";
	private String verbId = "";
	private String orderNo = "";
	private String order = "";
	private String sort = "";
	private String idHidden="";
	private String message="";
	
	private String[] idList;
	private String[] projectCodeList ;
	private String[] projectNameList ;
	private String[] projectClassList ;
	private String[] staffCodeList ;
	private String[] staffNameList ;
	private String[] onlineTimeList ;
	private String[] endTimeList ;

	List<ProjectBaseInfoVo> pbi;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String[] getIdList() {
		return idList;
	}
	public void setIdList(String[] idList) {
		this.idList = idList;
	}
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectClass() {
		return projectClass;
	}
	public void setProjectClass(String projectClass) {
		this.projectClass = projectClass;
	}
	public String getStaffCode() {
		return staffCode;
	}
	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getOnlineTime() {
		return onlineTime;
	}
	public void setOnlineTime(String onlineTime) {
		this.onlineTime = onlineTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}
	public String[] getProjectCodeList() {
		return projectCodeList;
	}
	public void setProjectCodeList(String[] projectCodeList) {
		this.projectCodeList = projectCodeList;
	}
	public String[] getProjectNameList() {
		return projectNameList;
	}
	public void setProjectNameList(String[] projectNameList) {
		this.projectNameList = projectNameList;
	}
	public String[] getProjectClassList() {
		return projectClassList;
	}
	public void setProjectClassList(String[] projectClassList) {
		this.projectClassList = projectClassList;
	}
	public String[] getStaffCodeList() {
		return staffCodeList;
	}
	public void setStaffCodeList(String[] staffCodeList) {
		this.staffCodeList = staffCodeList;
	}
	public String[] getStaffNameList() {
		return staffNameList;
	}
	public void setStaffNameList(String[] staffNameList) {
		this.staffNameList = staffNameList;
	}
	public String[] getOnlineTimeList() {
		return onlineTimeList;
	}
	public void setOnlineTimeList(String[] onlineTimeList) {
		this.onlineTimeList = onlineTimeList;
	}
	public String[] getEndTimeList() {
		return endTimeList;
	}
	public void setEndTimeList(String[] endTimeList) {
		this.endTimeList = endTimeList;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getVerbId() {
		return verbId;
	}
	public void setVerbId(String verbId) {
		this.verbId = verbId;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	public List<ProjectBaseInfoVo> getPbi() {
		return pbi;
	}
	public void setPbi(List<ProjectBaseInfoVo> pbi) {
		this.pbi = pbi;
	}
	public String getIdHidden() {
		return idHidden;
	}
	public void setIdHidden(String idHidden) {
		this.idHidden = idHidden;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
