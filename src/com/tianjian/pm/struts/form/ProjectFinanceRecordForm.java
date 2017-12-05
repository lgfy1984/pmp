/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;

import java.util.List;
import java.util.Map;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;


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
public class ProjectFinanceRecordForm  extends ActionForm  {
	
	
	/**
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	*/ 
	private static final long serialVersionUID = 1L;
	private String id;

	private String projectBaseinfoId="";
	private String projectCode="" ;
	private String projectName="" ;
	private String projectClassCode="" ;
	private String projectClassName="" ;
	private String startTime="" ;
	private String onlineTime="" ;
	private String endTime="" ;
	private String chargeType="" ;

	private String staffCode="";
	private String staffName="" ;
	private String workStaffCode="" ;
	private String workStaffName="" ;

	private String workDate="";

	private String taskCode="";
	private String taskName="";

	private String longTime="";

	private String costs="";

	private String seqNo="";

	private String status="";
	private String statusName="";
	
	private String createDate ="";
	private String createUserId ="";
	private String createUserName ="";
	private String verbId = "";
	private String orderNo = "";
	private String order = "";
	private String sort = "";
	private String idHidden="";
	private String message="";
	private String page_index="";
	private String page_count="";
	private String count="";
	private String page_size="";

	private String projectBaseinfoIdCase="";
	private String projectClassCodeCase="";
	private String projectCodeCase="";
	private String projectNameCase="";
	private String projectTaskCodeCase="";
	private String timeStartCase="";
	private String timeEndCase="";
	private String startTimeHidden="";
	private String endTimeHidden="";

	private FormFile fileToUpload;// 上传文件
	private Map<String , String> taskClass;
	private Map<String , String> projectClass;
	
	List<ProjectFinanceVo> pfv;
	
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

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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

	public String getPage_index() {
		return page_index;
	}

	public void setPage_index(String page_index) {
		this.page_index = page_index;
	}

	public String getPage_count() {
		return page_count;
	}

	public void setPage_count(String page_count) {
		this.page_count = page_count;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getPage_size() {
		return page_size;
	}

	public void setPage_size(String page_size) {
		this.page_size = page_size;
	}

	public String getStartTimeHidden() {
		return startTimeHidden;
	}

	public void setStartTimeHidden(String startTimeHidden) {
		this.startTimeHidden = startTimeHidden;
	}

	public String getEndTimeHidden() {
		return endTimeHidden;
	}

	public void setEndTimeHidden(String endTimeHidden) {
		this.endTimeHidden = endTimeHidden;
	}

	public Map<String, String> getTaskClass() {
		return taskClass;
	}

	public void setTaskClass(Map<String, String> taskClass) {
		this.taskClass = taskClass;
	}

	public List<ProjectFinanceVo> getPfv() {
		return pfv;
	}

	public void setPfv(List<ProjectFinanceVo> pfv) {
		this.pfv = pfv;
	}

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

	public String getLongTime() {
		return longTime;
	}

	public void setLongTime(String longTime) {
		this.longTime = longTime;
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

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
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

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getProjectClassName() {
		return projectClassName;
	}

	public void setProjectClassName(String projectClassName) {
		this.projectClassName = projectClassName;
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

	public String getProjectClassCode() {
		return projectClassCode;
	}

	public void setProjectClassCode(String projectClassCode) {
		this.projectClassCode = projectClassCode;
	}

	public Map<String, String> getProjectClass() {
		return projectClass;
	}

	public void setProjectClass(Map<String, String> projectClass) {
		this.projectClass = projectClass;
	}

	public String getProjectClassCodeCase() {
		return projectClassCodeCase;
	}

	public void setProjectClassCodeCase(String projectClassCodeCase) {
		this.projectClassCodeCase = projectClassCodeCase;
	}

	public String getProjectCodeCase() {
		return projectCodeCase;
	}

	public void setProjectCodeCase(String projectCodeCase) {
		this.projectCodeCase = projectCodeCase;
	}

	public String getProjectNameCase() {
		return projectNameCase;
	}

	public void setProjectNameCase(String projectNameCase) {
		this.projectNameCase = projectNameCase;
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

	public String getProjectBaseinfoIdCase() {
		return projectBaseinfoIdCase;
	}

	public void setProjectBaseinfoIdCase(String projectBaseinfoIdCase) {
		this.projectBaseinfoIdCase = projectBaseinfoIdCase;
	}

	public String getProjectTaskCodeCase() {
		return projectTaskCodeCase;
	}

	public void setProjectTaskCodeCase(String projectTaskCodeCase) {
		this.projectTaskCodeCase = projectTaskCodeCase;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getChargeType() {
		return chargeType;
	}

	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}

	public String getWorkStaffName() {
		return workStaffName;
	}

	public void setWorkStaffName(String workStaffName) {
		this.workStaffName = workStaffName;
	}

	public String getWorkStaffCode() {
		return workStaffCode;
	}

	public void setWorkStaffCode(String workStaffCode) {
		this.workStaffCode = workStaffCode;
	}

	public FormFile getFileToUpload() {
		return fileToUpload;
	}

	public void setFileToUpload(FormFile fileToUpload) {
		this.fileToUpload = fileToUpload;
	}

	
	 
	
}
