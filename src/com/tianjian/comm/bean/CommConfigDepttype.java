package com.tianjian.comm.bean;

/**
 * CommConfigDepttype generated by MyEclipse Persistence Tools
 */
public class CommConfigDepttype implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4977801284511934230L;
	// Fields
	private String itemCode;
	private Long seqNo;
	private String itemName;
	private String inputCode;
	private String comments;

	// Constructors
	/** default constructor */
	public CommConfigDepttype() {}

	/** minimal constructor */
	public CommConfigDepttype(String itemCode) {
		this.itemCode = itemCode;
	}

	/** full constructor */
	public CommConfigDepttype(String itemCode, Long seqNo, String itemName, String inputCode, String comments) {
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