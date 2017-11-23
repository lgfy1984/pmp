package com.tianjian.comm.bean;

/**
 * CommEquipUseage entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CommEquipUseage implements java.io.Serializable {

	// Fields

	private String itemCode;
	private Long seqNo;
	private String itemName;
	private String inputCode;
	private String comments;

	// Constructors

	/** default constructor */
	public CommEquipUseage() {
	}

	/** minimal constructor */
	public CommEquipUseage(String itemCode) {
		this.itemCode = itemCode;
	}

	/** full constructor */
	public CommEquipUseage(String itemCode, Long seqNo, String itemName,
			String inputCode, String comments) {
		this.itemCode = itemCode;
		this.seqNo = seqNo;
		this.itemName = itemName;
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