/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business;

import com.tianjian.pm.struts.form.ProjectStatForm;

/**
 * TODO
 * <p>Title: IProjectStatService.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月28日上午9:41:32
 * @version 1.0
 * 
 */
public interface IProjectStatService {
	
	
	public void statInit(ProjectStatForm form);
	
	/**统计
	*TODO
	* @Title: statpr
	* @param form
	* @return void
	* @throws
	* @author LengJiong
	*/
	public void stat(ProjectStatForm form);
	

	/**
	*TODO财务统计
	* @Title: statfrp
	* @param form
	* @return void
	* @throws
	* @author LengJiong
	*/
	public void statfrp(ProjectStatForm form);
	
	
}
