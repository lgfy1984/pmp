/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business;

import com.tianjian.pm.struts.form.ProjectTaskForm;
import com.tianjian.pm.struts.form.ProjectTaskForm;

/**
 * TODO
 * <p>Title: IProjectTaskService.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年12月11日下午5:04:14
 * @version 1.0
 * 
 */
public interface IProjectTaskService {

	
	public void updateInit(ProjectTaskForm form);
	public void update(ProjectTaskForm form);
	public void addInit(ProjectTaskForm form);
	public void delete(ProjectTaskForm form);
	public void save(ProjectTaskForm form);
	public void detail(ProjectTaskForm form);
	public void getSearch(ProjectTaskForm form, int curCount, int pageSize);
	public int getDataCount(String itemCode, String itemName, String inputCode);
	public void initForm(ProjectTaskForm form) ;
	
}
