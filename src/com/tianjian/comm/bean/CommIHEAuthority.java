package com.tianjian.comm.bean;

import java.util.Date;

/**
 * CommConfigAbo generated by MyEclipse Persistence Tools
 */
public class CommIHEAuthority implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8953774197771169403L;
	/**
	 * 
	 */

	// Fields
	
	private String id;
	private long seqNo;
	private String universalId;
	private String universalIdType;
	private String namespaceId;
	private Date dateCreated;
	private String creatorId;
	private String domainType;
	private String hspConfigBaseinfoId;
	
	public String getDomainType() {
		return domainType;
	}

	public void setDomainType(String domainType) {
		this.domainType = domainType;
	}

	public String getHspConfigBaseinfoId() {
		return hspConfigBaseinfoId;
	}

	public void setHspConfigBaseinfoId(String hspConfigBaseinfoId) {
		this.hspConfigBaseinfoId = hspConfigBaseinfoId;
	}

	// Constructors
	/** default constructor */
	public CommIHEAuthority() {}

	/** full constructor */
	public CommIHEAuthority(String id,String universalId, Long seqNo, String universalIdType, String namespaceId, String creatorId,Date dateCreated,String domainType,String hspConfigBaseinfoId) {
		this.id = id;
		this.seqNo = seqNo;
		this.universalId = universalId;
		this.universalIdType = universalIdType;
		this.namespaceId = namespaceId;
		this.dateCreated = dateCreated;
		this.creatorId = creatorId;
		this.domainType = domainType;
		this.hspConfigBaseinfoId=hspConfigBaseinfoId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(long seqNo) {
		this.seqNo = seqNo;
	}

	public String getUniversalId() {
		return universalId;
	}

	public void setUniversalId(String universalId) {
		this.universalId = universalId;
	}

	public String getUniversalIdType() {
		return universalIdType;
	}

	public void setUniversalIdType(String universalIdType) {
		this.universalIdType = universalIdType;
	}

	public String getNamespaceId() {
		return namespaceId;
	}

	public void setNamespaceId(String namespaceId) {
		this.namespaceId = namespaceId;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	// Property accessors
	
}