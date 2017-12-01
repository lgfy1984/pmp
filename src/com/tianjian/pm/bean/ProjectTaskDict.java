package com.tianjian.pm.bean;

import java.sql.Timestamp;

/**
 * ProjectTaskDict entity. @author MyEclipse Persistence Tools
 */
public class ProjectTaskDict implements java.io.Serializable {
	// Fields
	private String itemCode;

	private String itemName;

	private String inputCode;

	private String comments;

	private Timestamp createDate;

	private String createUserId;

	private String createUserName;

	private String itemClass;

	// Constructors
	/** default constructor */
	public ProjectTaskDict() {}

	/** minimal constructor */
	public ProjectTaskDict(String itemCode) {
		this.itemCode = itemCode;
	}

	/** full constructor */
	public ProjectTaskDict(String itemCode, String itemName, String inputCode,
			String comments, Timestamp createDate, String createUserId,
			String createUserName, String itemClass) {
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.inputCode = inputCode;
		this.comments = comments;
		this.createDate = createDate;
		this.createUserId = createUserId;
		this.createUserName = createUserName;
		this.itemClass = itemClass;
	}

	// Property accessors
	public String getItemCode() {
		return this.itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getInputCode() {
		return this.inputCode;
	}

	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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

	public String getItemClass() {
		return this.itemClass;
	}

	public void setItemClass(String itemClass) {
		this.itemClass = itemClass;
	}
}