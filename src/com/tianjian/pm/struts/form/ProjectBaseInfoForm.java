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
public class ProjectBaseInfoForm extends ActionForm {

	/**
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	*/ 
	private static final long serialVersionUID = 1L;
	
    private String id="";
	private String[] ids;
	
	private String projectCode="" ;
	private String projectName="" ;
	private String projectClassCode="" ;
	private String projectClassName="" ;
	private String tenantId="" ;
	private String staffCode="" ;
	private String staffName="" ;
	private String startTime="" ;
	private String onlineTime="" ;
	

	private String requireTime="" ;
	private String designTime="" ;
	private String codeTime="" ;
	private String testTime="" ;
	private String endTime="" ;
	private String seqNo="" ;
	private String flag="" ;

	//操作标志 1 新增 0修改
	private String operFlag="" ;

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
	private String projectClassCodeHidden="" ;
	private String onlineStartTimeHidden="" ;
	private String onlineEndTimeHidden="" ;
	private String startStartTimeHidden="";
	private String startEndTimeHidden="";
	private String endStartTimeHidden="";
	private String endEndTimeHidden="";
	private String projectNameHidden="";

	private Map<String , String> projectClass;


	private FormFile fileToUpload;// 上传文件

	List<ProjectBaseInfoVo> pbi;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	
	public String getProjectClassCode() {
		return projectClassCode;
	}
	public void setProjectClassCode(String projectClassCode) {
		this.projectClassCode = projectClassCode;
	}
	public String getProjectClassName() {
		return projectClassName;
	}
	public void setProjectClassName(String projectClassName) {
		this.projectClassName = projectClassName;
	}
	public Map<String, String> getProjectClass() {
		return projectClass;
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
	public void setProjectClass(Map<String, String> projectClass) {
		this.projectClass = projectClass;
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
	public String getProjectClassCodeHidden() {
		return projectClassCodeHidden;
	}
	public void setProjectClassCodeHidden(String projectClassCodeHidden) {
		this.projectClassCodeHidden = projectClassCodeHidden;
	}
	public String getProjectNameHidden() {
		return projectNameHidden;
	}
	public void setProjectNameHidden(String projectNameHidden) {
		this.projectNameHidden = projectNameHidden;
	}
	public String getTenantId() {
		return tenantId;
	}
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
	public String getOnlineStartTimeHidden() {
		return onlineStartTimeHidden;
	}
	public void setOnlineStartTimeHidden(String onlineStartTimeHidden) {
		this.onlineStartTimeHidden = onlineStartTimeHidden;
	}
	public String getOnlineEndTimeHidden() {
		return onlineEndTimeHidden;
	}
	public void setOnlineEndTimeHidden(String onlineEndTimeHidden) {
		this.onlineEndTimeHidden = onlineEndTimeHidden;
	}
	public String getStartStartTimeHidden() {
		return startStartTimeHidden;
	}
	public void setStartStartTimeHidden(String startStartTimeHidden) {
		this.startStartTimeHidden = startStartTimeHidden;
	}
	public String getStartEndTimeHidden() {
		return startEndTimeHidden;
	}
	public void setStartEndTimeHidden(String startEndTimeHidden) {
		this.startEndTimeHidden = startEndTimeHidden;
	}
	public String getEndStartTimeHidden() {
		return endStartTimeHidden;
	}
	public void setEndStartTimeHidden(String endStartTimeHidden) {
		this.endStartTimeHidden = endStartTimeHidden;
	}
	public String getEndEndTimeHidden() {
		return endEndTimeHidden;
	}
	public void setEndEndTimeHidden(String endEndTimeHidden) {
		this.endEndTimeHidden = endEndTimeHidden;
	}
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getOperFlag() {
		return operFlag;
	}
	public void setOperFlag(String operFlag) {
		this.operFlag = operFlag;
	}
	public FormFile getFileToUpload() {
		return fileToUpload;
	}
	public void setFileToUpload(FormFile fileToUpload) {
		this.fileToUpload = fileToUpload;
	}
	public String getRequireTime() {
		return requireTime;
	}
	public void setRequireTime(String requireTime) {
		this.requireTime = requireTime;
	}
	public String getDesignTime() {
		return designTime;
	}
	public void setDesignTime(String designTime) {
		this.designTime = designTime;
	}
	public String getCodeTime() {
		return codeTime;
	}
	public void setCodeTime(String codeTime) {
		this.codeTime = codeTime;
	}
	public String getTestTime() {
		return testTime;
	}
	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}
}
