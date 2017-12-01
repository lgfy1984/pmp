package com.tianjian.comm.bean;

/**
 * CommConfigStaffChargeType entity. @author MyEclipse Persistence Tools
 */
public class CommConfigStaffChargeType implements java.io.Serializable {
	// Fields
	private String itemCode;

	private Long seqNo;

	private String itemName;

	private Integer itemCost;

	private String itemUnit;

	private String inputCode;

	private String comments;

	// Constructors
	/** default constructor */
	public CommConfigStaffChargeType() {}

	/** minimal constructor */
	public CommConfigStaffChargeType(String itemCode) {
		this.itemCode = itemCode;
	}

	/** full constructor */
	public CommConfigStaffChargeType(String itemCode, Long seqNo,
			String itemName, Integer itemCost, String itemUnit,
			String inputCode, String comments) {
		this.itemCode = itemCode;
		this.seqNo = seqNo;
		this.itemName = itemName;
		this.itemCost = itemCost;
		this.itemUnit = itemUnit;
		this.inputCode = inputCode;
		this.comments = comments;
	}

	// Property accessors
	public String getItemCode() {
		return this.itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public Long getSeqNo() {
		return this.seqNo;
	}

	public void setSeqNo(Long seqNo) {
		this.seqNo = seqNo;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getItemCost() {
		return this.itemCost;
	}

	public void setItemCost(Integer itemCost) {
		this.itemCost = itemCost;
	}

	public String getItemUnit() {
		return this.itemUnit;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
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
}