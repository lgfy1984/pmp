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

/**
 * TODO
 * <p>Title: ProjectStatForm.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月28日上午9:25:54
 * @version 1.0
 * 
 */
public class ProjectStatForm extends ActionForm {
	

	private String projectBaseinfoIdCase="";
	private String startTimeHidden="";
	private String endTimeHidden="";
	private String curYear="";
	private String curMonth="";
	//返回标志
	private String flag="";

	private String projectCode="";
	private String projectName="";
	private String projectClassName="";
	private String staffName="";
	private String createUserId="";
	private String createUserName="";
	private String projectTime="";
	private String tenantId="";
	private Map<String, String> map ;

	List<ProjectStatVo> psv;
	List<ProjectStatHead> head1;
	List<ProjectStatHead> head2;
	List<ProjectStatHead> head3;

	public String getProjectBaseinfoIdCase() {
		return projectBaseinfoIdCase;
	}


	public void setProjectBaseinfoIdCase(String projectBaseinfoIdCase) {
		this.projectBaseinfoIdCase = projectBaseinfoIdCase;
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


	public List<ProjectStatVo> getPsv() {
		return psv;
	}


	public void setPsv(List<ProjectStatVo> psv) {
		this.psv = psv;
	}


	public List<ProjectStatHead> getHead1() {
		return head1;
	}


	public void setHead1(List<ProjectStatHead> head1) {
		this.head1 = head1;
	}


	public List<ProjectStatHead> getHead2() {
		return head2;
	}


	public void setHead2(List<ProjectStatHead> head2) {
		this.head2 = head2;
	}


	public String getCurYear() {
		return curYear;
	}


	public void setCurYear(String curYear) {
		this.curYear = curYear;
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


	public String getStaffName() {
		return staffName;
	}


	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}


	public String getProjectTime() {
		return projectTime;
	}


	public void setProjectTime(String projectTime) {
		this.projectTime = projectTime;
	}


	public String getCreateUserName() {
		return createUserName;
	}


	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}


	public String getCreateUserId() {
		return createUserId;
	}


	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}


	public Map<String, String> getMap() {
		return map;
	}


	public void setMap(Map<String, String> map) {
		this.map = map;
	}


	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}


	public String getTenantId() {
		return tenantId;
	}


	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}


	public String getCurMonth() {
		return curMonth;
	}


	public void setCurMonth(String curMonth) {
		this.curMonth = curMonth;
	}


	public List<ProjectStatHead> getHead3() {
		return head3;
	}


	public void setHead3(List<ProjectStatHead> head3) {
		this.head3 = head3;
	}
	
}
