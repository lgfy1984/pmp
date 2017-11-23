package com.tianjian.comm.bean;

/**
 * CommConfigPopulationNature entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CommConfigPopulationNature implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 7436857391037677977L;
	private String itemCode;
	private String itemName;
	private String inputCode;
	private String comments;
	private Long seqNo;

	// Constructors

	/** default constructor */
	public CommConfigPopulationNature() {
	}

	/** minimal constructor */
	public CommConfigPopulationNature(String itemCode, String itemName,
			String inputCode) {
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.inputCode = inputCode;
	}

	/** full constructor */
	public CommConfigPopulationNature(String itemCode, String itemName,
			String inputCode, String comments, Long seqNo) {
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.inputCode = inputCode;
		this.comments = comments;
		this.seqNo = seqNo;
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

	public Long getSeqNo() {
		return this.seqNo;
	}

	public void setSeqNo(Long seqNo) {
		this.seqNo = seqNo;
	}

}