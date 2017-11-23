/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business.service;

import com.tianjian.pm.business.IProjectFinanceRecordService;
import com.tianjian.pm.dao.IProjectFinanceRecordDAO;

/**
 * TODO
 * <p>Title: ProjectWorkTimeRecordImpl.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:54:25
 * @version 1.0
 * 
 */
public class ProjectFinanceRecordServiceImpl implements IProjectFinanceRecordService{

	
	private IProjectFinanceRecordDAO projectFinanceRecordDAO;

	public IProjectFinanceRecordDAO getProjectFinanceRecordDAO() {
		return projectFinanceRecordDAO;
	}

	public void setProjectFinanceRecordDAO(
			IProjectFinanceRecordDAO projectFinanceRecordDAO) {
		this.projectFinanceRecordDAO = projectFinanceRecordDAO;
	}
	
}
