package com.tianjian.security.bean;

import java.util.Date;

/**
 * SecurityStaffAliveAccess generated by MyEclipse Persistence Tools
 */
public class SecurityStaffAliveAccess implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private String id;
	private String securityStaffBaseinfoId;
	private String sessionId;
	private Long clientFlag;
	private Date startTime;
	private Date endTime;
	private String loginIp;
	private String comments;

	// Constructors
	/** default constructor */
	public SecurityStaffAliveAccess() {}

	/** full constructor */
	public SecurityStaffAliveAccess(String securityStaffBaseinfoId,String sessionId ,Long clientFlag, Date startTime, Date endTime, String loginIp, String comments) {
		this.securityStaffBaseinfoId = securityStaffBaseinfoId;
		this.sessionId = sessionId ;
		this.clientFlag = clientFlag;
		this.startTime = startTime;
		this.endTime = endTime;
		this.loginIp = loginIp;
		this.comments = comments;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	// Property accessors
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSecurityStaffBaseinfoId() {
		return this.securityStaffBaseinfoId;
	}

	public void setSecurityStaffBaseinfoId(String securityStaffBaseinfoId) {
		this.securityStaffBaseinfoId = securityStaffBaseinfoId;
	}

	public Long getClientFlag() {
		return this.clientFlag;
	}

	public void setClientFlag(Long clientFlag) {
		this.clientFlag = clientFlag;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}