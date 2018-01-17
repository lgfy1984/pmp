/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;

import java.util.List;

/**
 * TODO
 * <p>Title: ProjectFinanceVo.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月25日上午10:12:16
 * @version 1.0
 * 
 */
public class ProjectFinanceVo {
	
	private String id;

	private String projectBaseinfoId;
	private String projectCode="" ;
	private String projectName="" ;
	private String projectClassName="" ;

	private String staffCode;

	private String workStaffCode;
	private String workStaffName;
	private String workDate;

	private String taskCode;
	private String taskName;


	private String longTimeCode="";
	private String longTimeName="";

	private String costs;

	private String seqNo;

	private String status;

	private String createDate;

	private String createUserId;

	private String createUserName;
	

	private String timeCase ="";
	private String timeStartCase="";
	private String timeEndCase="";
	
	List<ProjectFinanceVo> pfv3;


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

	public String getCosts() {
		return costs;
	}

	public void setCosts(String costs) {
		this.costs = costs;
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

	public String getWorkStaffCode() {
		return workStaffCode;
	}

	public void setWorkStaffCode(String workStaffCode) {
		this.workStaffCode = workStaffCode;
	}

	public String getWorkStaffName() {
		return workStaffName;
	}

	public void setWorkStaffName(String workStaffName) {
		this.workStaffName = workStaffName;
	}

	public String getTimeCase() {
		return timeCase;
	}

	public void setTimeCase(String timeCase) {
		this.timeCase = timeCase;
	}

	public String getTimeStartCase() {
		return timeStartCase;
	}

	public void setTimeStartCase(String timeStartCase) {
		this.timeStartCase = timeStartCase;
	}

	public String getTimeEndCase() {
		return timeEndCase;
	}

	public void setTimeEndCase(String timeEndCase) {
		this.timeEndCase = timeEndCase;
	}

	public List<ProjectFinanceVo> getPfv3() {
		return pfv3;
	}

	public void setPfv3(List<ProjectFinanceVo> pfv3) {
		this.pfv3 = pfv3;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
}
