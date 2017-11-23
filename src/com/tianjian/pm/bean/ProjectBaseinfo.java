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

	private String seqNo;

	private Timestamp createDate;

	private String createUserId;

	private String createUserName;

	// Constructors
	/** default constructor */
	public ProjectBaseinfo() {}

	/** full constructor */
	public ProjectBaseinfo(String projectCode, String projectName,
			String projectClass, String staffCode, String staffName,
			Timestamp startTime, Timestamp onlineTime, Timestamp endTime,
			String seqNo, Timestamp createDate, String createUserId,
			String createUserName) {
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

	public String getSeqNo() {
		return this.seqNo;
	}

	public void setSeqNo(String seqNo) {
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
}