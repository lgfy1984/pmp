/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.form;
/**
 * TODO
 * <p>Title: PageForm.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月25日下午5:27:11
 * @version 1.0
 * 
 */
public class PageForm {
	
	private String count;//总数
	private String pageIndex;//当前第几页
	private String pageCount;//总页数
	private String pageSize="10";//每页显示
	
	public PageForm() {
		super();
	}

	public PageForm(String count, String pageIndex, String pageCount,
			String pageSize) {
		super();
		this.count = count;
		this.pageIndex = pageIndex;
		this.pageCount = pageCount;
		this.pageSize = pageSize;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(String pageIndex) {
		this.pageIndex = pageIndex;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
}
