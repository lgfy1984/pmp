/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;

import java.util.List;
import java.util.Map;

import org.apache.struts.action.ActionForm;

/**
 * TODO
 * <p>Title: ProjectClassForm.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年12月11日下午5:05:23
 * @version 1.0
 * 
 */
public class ProjectClassForm extends ActionForm{
	
	private String itemCode ="";

	private String itemName ="";

	private String inputCode ="";

	private String comments ="";

	private String seqNo ="";
	
	private String createDate ="";
	private String createUserId ="";
	private String createUserName ="";
	private String verbId = "";
	private String orderNo = "";
	private String order = "";
	private String sort = "";
	private String idHidden="";
	private String message="";
	private String page_index="";  
	private String page_count="";
	private String count="";
	private String page_size="";
	private String itemCodeHidden="" ;
	private String itemNameHidden="";
	//-----查询条件字段-----
	private String itemCodeCase="" ;
	private String itemNameCase="";
	private String inputCodeCase="";

	private Map<String , String> projectClass;
	

	List<ProjectDictVo> pdvl;


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


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getCreateUserId() {
		return createUserId;
	}


	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}


	public String getCreateUserName() {
		return createUserName;
	}


	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}


	public String getVerbId() {
		return verbId;
	}


	public void setVerbId(String verbId) {
		this.verbId = verbId;
	}


	public String getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}


	public String getOrder() {
		return order;
	}


	public void setOrder(String order) {
		this.order = order;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getIdHidden() {
		return idHidden;
	}


	public void setIdHidden(String idHidden) {
		this.idHidden = idHidden;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getPage_index() {
		return page_index;
	}


	public void setPage_index(String page_index) {
		this.page_index = page_index;
	}


	public String getPage_count() {
		return page_count;
	}


	public void setPage_count(String page_count) {
		this.page_count = page_count;
	}


	public String getCount() {
		return count;
	}


	public void setCount(String count) {
		this.count = count;
	}


	public String getPage_size() {
		return page_size;
	}


	public void setPage_size(String page_size) {
		this.page_size = page_size;
	}


	public String getItemCodeHidden() {
		return itemCodeHidden;
	}


	public void setItemCodeHidden(String itemCodeHidden) {
		this.itemCodeHidden = itemCodeHidden;
	}


	public String getItemNameHidden() {
		return itemNameHidden;
	}


	public void setItemNameHidden(String itemNameHidden) {
		this.itemNameHidden = itemNameHidden;
	}


	public Map<String, String> getProjectClass() {
		return projectClass;
	}


	public void setProjectClass(Map<String, String> projectClass) {
		this.projectClass = projectClass;
	}


	public List<ProjectDictVo> getPdvl() {
		return pdvl;
	}


	public void setPdvl(List<ProjectDictVo> pdvl) {
		this.pdvl = pdvl;
	}


	public String getSeqNo() {
		return seqNo;
	}


	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}


	public String getItemCodeCase() {
		return itemCodeCase;
	}


	public void setItemCodeCase(String itemCodeCase) {
		this.itemCodeCase = itemCodeCase;
	}


	public String getItemNameCase() {
		return itemNameCase;
	}


	public void setItemNameCase(String itemNameCase) {
		this.itemNameCase = itemNameCase;
	}


	public String getInputCodeCase() {
		return inputCodeCase;
	}


	public void setInputCodeCase(String inputCodeCase) {
		this.inputCodeCase = inputCodeCase;
	}
	
	
}
