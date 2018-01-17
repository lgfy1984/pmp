/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business;

import com.tianjian.pm.bean.ProjectClassDict;
import com.tianjian.pm.struts.form.ProjectClassForm;

/**
 * TODO
 * <p>Title: IProjectDictService.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年12月11日下午5:03:40
 * @version 1.0
 * 
 */
public interface IProjectClassService {
	
	public void initForm(ProjectClassForm form);
	public void updateInit(ProjectClassForm form);
	public void update(ProjectClassForm form);
	public void addInit(ProjectClassForm form);
	public void delete(ProjectClassForm form);
	public void save(ProjectClassForm form);
	public void detail(ProjectClassForm form);
	public void getSearch(ProjectClassForm form, int curCount, int pageSize);
	public int getDataCount(String itemCode, String itemName, String inputCode);

	/** checkData*/
	public ProjectClassDict checkData(String id);
	
}
