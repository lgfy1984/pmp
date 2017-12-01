package com.tianjian.pm.bean;

import java.sql.Timestamp;

/**
 * ProjectWorktimeRecord entity. @author MyEclipse Persistence Tools
 */
public class ProjectWorktimeRecord implements java.io.Serializable {
	// Fields
	private String id;

	private String projectBaseinfoId;

	private String staffCode;

	private Timestamp workDate;

	private String taskCode;

	private Integer longTime;

	private Integer seqNo;

	private String status;

	private Timestamp createDate;

	private String createUserId;

	private String createUserName;

	// Constructors
	/** default constructor */
	public ProjectWorktimeRecord() {}

	/** full constructor */
	public ProjectWorktimeRecord(String projectBaseinfoId, String staffCode,
			Timestamp workDate, String taskCode, Integer longTime,
			Integer seqNo, String status, Timestamp createDate,
			String createUserId, String createUserName) {
		this.projectBaseinfoId = projectBaseinfoId;
		this.staffCode = staffCode;
		this.workDate = workDate;
		this.taskCode = taskCode;
		this.longTime = longTime;
		this.seqNo = seqNo;
		this.status = status;
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

	public String getProjectBaseinfoId() {
		return this.projectBaseinfoId;
	}

	public void setProjectBaseinfoId(String projectBaseinfoId) {
		this.projectBaseinfoId = projectBaseinfoId;
	}

	public String getStaffCode() {
		return this.staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public Timestamp getWorkDate() {
		return this.workDate;
	}

	public void setWorkDate(Timestamp workDate) {
		this.workDate = workDate;
	}

	public String getTaskCode() {
		return this.taskCode;
	}

	public void setTaskCode(String taskCode) {
		this.taskCode = taskCode;
	}

	public Integer getLongTime() {
		return this.longTime;
	}

	public void setLongTime(Integer longTime) {
		this.longTime = longTime;
	}

	public Integer getSeqNo() {
		return this.seqNo;
	}

	public void setSeqNo(Integer seqNo) {
		this.seqNo = seqNo;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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