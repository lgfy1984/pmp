/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.action;

import com.tianjian.pm.business.IProjectFinanceRecordService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;

/**
 * TODO
 * <p>Title: ProjectBaseInfoAction.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:59:39
 * @version 1.0
 * 
 */
public class ProjectFinanceRecordAction extends BaseDispatchAction{
	
	private IProjectFinanceRecordService  projectFinanceRecordService;

	public IProjectFinanceRecordService getProjectFinanceRecordService() {
		return projectFinanceRecordService;
	}

	public void setProjectFinanceRecordService(
			IProjectFinanceRecordService projectFinanceRecordService) {
		this.projectFinanceRecordService = projectFinanceRecordService;
	}
	
}
