package com.tianjian.hsp.bean;

/**
 * CurrentPriceList entity. @author MyEclipse Persistence Tools
 */

public class CurrentPriceList implements java.io.Serializable {

	// Fields

	private CurrentPriceListId id;
	private String itemNo;
	private String itemCode;
	private String itemName;
	private String specification;
	private String unit;
	private Double price;
	private String outpatientReceiptCode;
	private String outpatientReceiptName;
	private String hospitalizationReceiptCode;
	private String hospitalizationReceiptName;
	private String executionDeptName;
	private String stopFlag;
	private String tenantId;
	private String className;

	// Constructors

	public String getClassName() {
		return className;
	}

	public CurrentPriceList(CurrentPriceListId id, String itemNo,
			String itemCode, String itemName, String specification,
			String unit, Double price, String outpatientReceiptCode,
			String outpatientReceiptName, String hospitalizationReceiptCode,
			String hospitalizationReceiptName, String executionDeptName,
			String stopFlag, String tenantId, String className) {
		super();
		this.id = id;
		this.itemNo = itemNo;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.specification = specification;
		this.unit = unit;
		this.price = price;
		this.outpatientReceiptCode = outpatientReceiptCode;
		this.outpatientReceiptName = outpatientReceiptName;
		this.hospitalizationReceiptCode = hospitalizationReceiptCode;
		this.hospitalizationReceiptName = hospitalizationReceiptName;
		this.executionDeptName = executionDeptName;
		this.stopFlag = stopFlag;
		this.tenantId = tenantId;
		this.className = className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	/** default constructor */
	public CurrentPriceList() {
	}

	/** minimal constructor */
	public CurrentPriceList(CurrentPriceListId id, String itemName,
			Double price, String tenantId) {
		this.id = id;
		this.itemName = itemName;
		this.price = price;
		this.tenantId = tenantId;
	}

	/** full constructor */
	public CurrentPriceList(CurrentPriceListId id, String itemNo,
			String itemCode, String itemName, String specification,
			String unit, Double price, String outpatientReceiptCode,
			String outpatientReceiptName, String hospitalizationReceiptCode,
			String hospitalizationReceiptName, String executionDeptName,
			String stopFlag, String tenantId) {
		this.id = id;
		this.itemNo = itemNo;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.specification = specification;
		this.unit = unit;
		this.price = price;
		this.outpatientReceiptCode = outpatientReceiptCode;
		this.outpatientReceiptName = outpatientReceiptName;
		this.hospitalizationReceiptCode = hospitalizationReceiptCode;
		this.hospitalizationReceiptName = hospitalizationReceiptName;
		this.executionDeptName = executionDeptName;
		this.stopFlag = stopFlag;
		this.tenantId = tenantId;
	}

	// Property accessors

	public CurrentPriceListId getId() {
		return this.id;
	}

	public void setId(CurrentPriceListId id) {
		this.id = id;
	}

	public String getItemNo() {
		return this.itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

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

	public String getSpecification() {
		return this.specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getOutpatientReceiptCode() {
		return this.outpatientReceiptCode;
	}

	public void setOutpatientReceiptCode(String outpatientReceiptCode) {
		this.outpatientReceiptCode = outpatientReceiptCode;
	}

	public String getOutpatientReceiptName() {
		return this.outpatientReceiptName;
	}

	public void setOutpatientReceiptName(String outpatientReceiptName) {
		this.outpatientReceiptName = outpatientReceiptName;
	}

	public String getHospitalizationReceiptCode() {
		return this.hospitalizationReceiptCode;
	}

	public void setHospitalizationReceiptCode(String hospitalizationReceiptCode) {
		this.hospitalizationReceiptCode = hospitalizationReceiptCode;
	}

	public String getHospitalizationReceiptName() {
		return this.hospitalizationReceiptName;
	}

	public void setHospitalizationReceiptName(String hospitalizationReceiptName) {
		this.hospitalizationReceiptName = hospitalizationReceiptName;
	}

	public String getExecutionDeptName() {
		return this.executionDeptName;
	}

	public void setExecutionDeptName(String executionDeptName) {
		this.executionDeptName = executionDeptName;
	}

	public String getStopFlag() {
		return this.stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}

	public String getTenantId() {
		return this.tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}