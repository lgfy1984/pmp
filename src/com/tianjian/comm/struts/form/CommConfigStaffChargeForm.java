package com.tianjian.comm.struts.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;

import com.tianjian.comm.bean.CommConfigStaffChargeType;


public class CommConfigStaffChargeForm  extends ActionForm implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2268952803976923208L;
	// Fields
	
		/**代码*/
	private String itemCode;
	/**名称*/
	private String itemName;
	/**输入码*/
	private String inputCode;
	/**备注*/
	private String comments;
	/**序号*/


	private String itemCost ="";

	private String itemUnit ="";
	private String seqNo;
	
    private String itemCodeHidden;
    private String itemNameHidden;
    
    private String verbId;
    
    private String message;
	/**排序*/
	private String orderNo;
     /**升序*/
	private String asc;
	
	private String[] itemCodeList;
	private String[] itemNameList;
	private String[] inputCodeList;
	private String[] commentsList;
	private String[] seqNoList;
	
	private List<CommConfigStaffChargeType> ccsList = new ArrayList<CommConfigStaffChargeType>();

	public CommConfigStaffChargeForm(String itemCode, String itemName, String inputCode, String comments, String seqNo) {
		super();
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.inputCode = inputCode;
		this.comments = comments;
		this.seqNo = seqNo;
	}

	public CommConfigStaffChargeForm() {
		super();
		this.itemNameHidden = "";
		this.itemCode ="";
		this.itemName = "";
		this.inputCode = "";
		this.comments = "";
		this.seqNo = "";
		this.orderNo = "";
		this.itemCodeHidden="";
		this.asc="";
		this.message="";
		// TODO Auto-generated constructor stub
	}

	
	public String getItemCode() {
		return itemCode;
	}

	
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	
	public String getItemName() {
		return itemName;
	}

	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	
	public String getInputCode() {
		return inputCode;
	}

	
	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}

	
	public String getComments() {
		return comments;
	}

	
	public void setComments(String comments) {
		this.comments = comments;
	}

	
	public String getSeqNo() {
		return seqNo;
	}

	
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	
	public String getItemCodeHidden() {
		return itemCodeHidden;
	}

	
	public void setItemCodeHidden(String itemCodeHidden) {
		this.itemCodeHidden = itemCodeHidden;
	}

	
	public String getVerbId() {
		return verbId;
	}

	
	public void setVerbId(String verbId) {
		this.verbId = verbId;
	}

	
	public String getMessage() {
		return message;
	}

	
	public void setMessage(String message) {
		this.message = message;
	}

	
	public String getOrderNo() {
		return orderNo;
	}

	
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	
	public String getAsc() {
		return asc;
	}

	
	public void setAsc(String asc) {
		this.asc = asc;
	}

	
	public String[] getItemCodeList() {
		return itemCodeList;
	}

	
	public void setItemCodeList(String[] itemCodeList) {
		this.itemCodeList = itemCodeList;
	}

	
	public String[] getItemNameList() {
		return itemNameList;
	}

	
	public void setItemNameList(String[] itemNameList) {
		this.itemNameList = itemNameList;
	}

	
	public String[] getInputCodeList() {
		return inputCodeList;
	}

	
	public void setInputCodeList(String[] inputCodeList) {
		this.inputCodeList = inputCodeList;
	}

	
	public String[] getCommentsList() {
		return commentsList;
	}

	
	public void setCommentsList(String[] commentsList) {
		this.commentsList = commentsList;
	}

	
	public String[] getSeqNoList() {
		return seqNoList;
	}

	
	public void setSeqNoList(String[] seqNoList) {
		this.seqNoList = seqNoList;
	}

	public String getItemNameHidden() {
		return itemNameHidden;
	}

	public void setItemNameHidden(String itemNameHidden) {
		this.itemNameHidden = itemNameHidden;
	}

	public List<CommConfigStaffChargeType> getCcsList() {
		return ccsList;
	}

	public void setCcsList(List<CommConfigStaffChargeType> ccsList) {
		this.ccsList = ccsList;
	}

	public String getItemCost() {
		return itemCost;
	}

	public void setItemCost(String itemCost) {
		this.itemCost = itemCost;
	}

	public String getItemUnit() {
		return itemUnit;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}

	

	
}