package com.tianjian.comm.bean;

/**
 * CommConfigDrugclass generated by MyEclipse Persistence Tools
 */

public class CommConfigDrugclass implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -1874109635837273354L;
	private String itemCode;
	private String itemName;
	private String inputCode;
	private Long levelFlag;
	private String parentId;
	private String comments;
	private Long seqNo;

	// Constructors

	/** default constructor */
	public CommConfigDrugclass() {
	}

	/** minimal constructor */
	public CommConfigDrugclass(String itemCode) {
		this.itemCode = itemCode;
	}

	/** full constructor */
	public CommConfigDrugclass(String itemCode, String itemName,
			String inputCode, Long levelFlag, String parentId, String comments,
			Long seqNo) {
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.inputCode = inputCode;
		this.levelFlag = levelFlag;
		this.parentId = parentId;
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

	public Long getLevelFlag() {
		return this.levelFlag;
	}

	public void setLevelFlag(Long levelFlag) {
		this.levelFlag = levelFlag;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
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