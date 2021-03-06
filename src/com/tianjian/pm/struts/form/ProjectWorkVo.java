/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;

/**
 * TODO
 * <p>Title: ProjectWorkVo.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月25日上午10:12:46
 * @version 1.0
 * 
 */
public class ProjectWorkVo {
	
	private String id;

	private String projectBaseinfoId;
	private String projectCode="" ;
	private String projectName="" ;
	private String projectClassName="" ;
	private String projectStaffName="" ;

	private String staffCode;

	private String workDate;

	private String taskCode;
	private String taskName;

	private String longTimeCode="";
	private String longTimeName="";

	private String seqNo;

	private String status;
	private String statusName;
	private String lockStatus="";
	private String days7Flag="";
	private String lockStatusName="";

	private String createDate;

	private String createUserId;

	private String createUserName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProjectBaseinfoId() {
		return projectBaseinfoId;
	}

	public void setProjectBaseinfoId(String projectBaseinfoId) {
		this.projectBaseinfoId = projectBaseinfoId;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getWorkDate() {
		return workDate;
	}

	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}

	public String getTaskCode() {
		return taskCode;
	}

	public void setTaskCode(String taskCode) {
		this.taskCode = taskCode;
	}

	public String getLongTimeCode() {
		return longTimeCode;
	}

	public void setLongTimeCode(String longTimeCode) {
		this.longTimeCode = longTimeCode;
	}

	public String getLongTimeName() {
		return longTimeName;
	}

	public void setLongTimeName(String longTimeName) {
		this.longTimeName = longTimeName;
	}

	public String getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getProjectClassName() {
		return projectClassName;
	}

	public void setProjectClassName(String projectClassName) {
		this.projectClassName = projectClassName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getLockStatus() {
		return lockStatus;
	}

	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}

	public String getLockStatusName() {
		return lockStatusName;
	}

	public void setLockStatusName(String lockStatusName) {
		this.lockStatusName = lockStatusName;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getDays7Flag() {
		return days7Flag;
	}

	public void setDays7Flag(String days7Flag) {
		this.days7Flag = days7Flag;
	}

	public String getProjectStaffName() {
		return projectStaffName;
	}

	public void setProjectStaffName(String projectStaffName) {
		this.projectStaffName = projectStaffName;
	}
	
}
