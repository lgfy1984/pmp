package com.tianjian.pm.bean;

import java.sql.Timestamp;

/**
 * ProjectFinanceRecord entity. @author MyEclipse Persistence Tools
 */
public class ProjectFinanceRecord implements java.io.Serializable {
	// Fields
	private String id;

	private String projectBaseinfoId;

	private String staffCode;

	private Timestamp workDate;

	private String taskId;

	private String longTime;

	private Double costs;

	private Byte seqNo;

	private Boolean status;

	private Timestamp createDate;

	private String createUserId;

	private String createUserName;

	// Constructors
	/** default constructor */
	public ProjectFinanceRecord() {}

	/** full constructor */
	public ProjectFinanceRecord(String projectBaseinfoId, String staffCode,
			Timestamp workDate, String taskId, String longTime, Double costs,
			Byte seqNo, Boolean status, Timestamp createDate,
			String createUserId, String createUserName) {
		this.projectBaseinfoId = projectBaseinfoId;
		this.staffCode = staffCode;
		this.workDate = workDate;
		this.taskId = taskId;
		this.longTime = longTime;
		this.costs = costs;
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

	public String getTaskId() {
		return this.taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getLongTime() {
		return this.longTime;
	}

	public void setLongTime(String longTime) {
		this.longTime = longTime;
	}

	public Double getCosts() {
		return this.costs;
	}

	public void setCosts(Double costs) {
		this.costs = costs;
	}

	public Byte getSeqNo() {
		return this.seqNo;
	}

	public void setSeqNo(Byte seqNo) {
		this.seqNo = seqNo;
	}

	public Boolean getStatus() {
		return this.status;
	}

	public void setStatus(Boolean status) {
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