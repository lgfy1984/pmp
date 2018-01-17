package com.tianjian.pm.bean;

import java.sql.Timestamp;

/**
 * ProjectBaseinfo entity. @author MyEclipse Persistence Tools
 */
public class ProjectBaseinfo implements java.io.Serializable {
	// Fields
	private String id;

	private String projectCode;

	private String projectName;

	private String projectClass;

	private String staffCode;

	private String staffName;

	private Timestamp startTime;

	private Timestamp onlineTime;

	private Timestamp endTime;

	private Integer seqNo;

	private Timestamp createDate;

	private String createUserId;

	private String createUserName;

	private Timestamp requireTime;

	private Timestamp designTime;

	private Timestamp codeTime;

	private Timestamp testTime;

	// Constructors
	/** default constructor */
	public ProjectBaseinfo() {}

	/** full constructor */
	public ProjectBaseinfo(String projectCode, String projectName,
			String projectClass, String staffCode, String staffName,
			Timestamp startTime, Timestamp onlineTime, Timestamp endTime,
			Integer seqNo, Timestamp createDate, String createUserId,
			String createUserName, Timestamp requireTime, Timestamp designTime,
			Timestamp codeTime, Timestamp testTime) {
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.projectClass = projectClass;
		this.staffCode = staffCode;
		this.staffName = staffName;
		this.startTime = startTime;
		this.onlineTime = onlineTime;
		this.endTime = endTime;
		this.seqNo = seqNo;
		this.createDate = createDate;
		this.createUserId = createUserId;
		this.createUserName = createUserName;
		this.requireTime = requireTime;
		this.designTime = designTime;
		this.codeTime = codeTime;
		this.testTime = testTime;
	}

	// Property accessors
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProjectCode() {
		return this.projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectClass() {
		return this.projectClass;
	}

	public void setProjectClass(String projectClass) {
		this.projectClass = projectClass;
	}

	public String getStaffCode() {
		return this.staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getStaffName() {
		return this.staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getOnlineTime() {
		return this.onlineTime;
	}

	public void setOnlineTime(Timestamp onlineTime) {
		this.onlineTime = onlineTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Integer getSeqNo() {
		return this.seqNo;
	}

	public void setSeqNo(Integer seqNo) {
		this.seqNo = seqNo;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public String getCreateUserName() {
		return this.createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public Timestamp getRequireTime() {
		return this.requireTime;
	}

	public void setRequireTime(Timestamp requireTime) {
		this.requireTime = requireTime;
	}

	public Timestamp getDesignTime() {
		return this.designTime;
	}

	public void setDesignTime(Timestamp designTime) {
		this.designTime = designTime;
	}

	public Timestamp getCodeTime() {
		return this.codeTime;
	}

	public void setCodeTime(Timestamp codeTime) {
		this.codeTime = codeTime;
	}

	public Timestamp getTestTime() {
		return this.testTime;
	}

	public void setTestTime(Timestamp testTime) {
		this.testTime = testTime;
	}
}