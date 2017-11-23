package com.tianjian.comm.bean;

/**
 * CommConfigStafftype generated by MyEclipse Persistence Tools
 */
public class CommConfigStafftype implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5793353338042785205L;
	// Fields
	private String itemCode;
	private Long seqNo;
	private String itemName;
	private String inputCode;
	private String comments;

	// Constructors
	/** default constructor */
	public CommConfigStafftype() {}

	/** minimal constructor */
	public CommConfigStafftype(String itemCode) {
		this.itemCode = itemCode;
	}

	/** full constructor */
	public CommConfigStafftype(String itemCode, Long seqNo, String itemName, String inputCode, String comments) {
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