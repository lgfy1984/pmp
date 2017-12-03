/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;

import java.util.HashMap;
import java.util.Map;

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
public class ProjectStatVo {


	private String seqNo="";

	private String createUserName="";
	private String projectCode="" ;
	private String projectName="" ;
	private String projectClassName="" ;
	private String projectTaskCode="" ;
	private String projectTaskName="" ;
	private String curYear="";
	private String actLongTime="";
	private String actCosts="";
	private String projectCosts="";
	private String projectValue="";
	private String totalCount="";

	private String totalLongTime="";
	private String totalcosts="";
	private String totalProjectCosts="";
	private String totalProjectValue="";
	private String status="";
	private String createDate="";
	private String createUserId="";
	private Map<String, String> map ;
	public String getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getProjectClassName() {
		return projectClassName;
	}
	public void setProjectClassName(String projectClassName) {
		this.projectClassName = projectClassName;
	}
	public String getProjectTaskName() {
		return projectTaskName;
	}
	public void setProjectTaskName(String projectTaskName) {
		this.projectTaskName = projectTaskName;
	}
	public String getTotalLongTime() {
		return totalLongTime;
	}
	public void setTotalLongTime(String totalLongTime) {
		this.totalLongTime = totalLongTime;
	}
	public String getTotalcosts() {
		return totalcosts;
	}
	public void setTotalcosts(String totalcosts) {
		this.totalcosts = totalcosts;
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
	public Map<String, String> getMap() {
		return map;
	}
	public void setMap(Map<String, String> map) {
		this.map = map;
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
	public String getActLongTime() {
		return actLongTime;
	}
	public void setActLongTime(String actLongTime) {
		this.actLongTime = actLongTime;
	}
	public String getActCosts() {
		return actCosts;
	}
	public void setActCosts(String actCosts) {
		this.actCosts = actCosts;
	}
	public String getProjectCosts() {
		return projectCosts;
	}
	public void setProjectCosts(String projectCosts) {
		this.projectCosts = projectCosts;
	}
	public String getProjectValue() {
		return projectValue;
	}
	public void setProjectValue(String projectValue) {
		this.projectValue = projectValue;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getProjectTaskCode() {
		return projectTaskCode;
	}
	public void setProjectTaskCode(String projectTaskCode) {
		this.projectTaskCode = projectTaskCode;
	}
	public String getTotalProjectCosts() {
		return totalProjectCosts;
	}
	public void setTotalProjectCosts(String totalProjectCosts) {
		this.totalProjectCosts = totalProjectCosts;
	}
	public String getTotalProjectValue() {
		return totalProjectValue;
	}
	public void setTotalProjectValue(String totalProjectValue) {
		this.totalProjectValue = totalProjectValue;
	}
	
}
