package com.tianjian.hsp.bean;

/**
 * CurrentPriceListId entity. @author MyEclipse Persistence Tools
 */

public class CurrentPriceListId implements java.io.Serializable {

	// Fields

	private String id;
	private String authorityId;

	// Constructors

	/** default constructor */
	public CurrentPriceListId() {
	}

	/** full constructor */
	public CurrentPriceListId(String id, String authorityId) {
		this.id = id;
		this.authorityId = authorityId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuthorityId() {
		return this.authorityId;
	}

	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CurrentPriceListId))
			return false;
		CurrentPriceListId castOther = (CurrentPriceListId) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getAuthorityId().equals(castOther.getAuthorityId()))|| (this
						.getAuthorityId() != null
						&& castOther.getAuthorityId() != null && this
						.getAuthorityId().equals(castOther.getAuthorityId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37
				* result
				+ (getAuthorityId() == null ? 0 : this.getAuthorityId()
						.hashCode());
		return result;
	}

}