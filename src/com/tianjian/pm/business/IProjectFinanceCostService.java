/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business;

import com.tianjian.pm.bean.ProjectFinanceCost;
import com.tianjian.pm.struts.form.ProjectFinanceCostForm;;

/**
 * TODO
 * <p>Title: IProjectWorkTimeRecordService.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:56:11
 * @version 1.0
 * 
 */
public interface IProjectFinanceCostService  {
	
	/**
	 * 初始化form
	*
	* @Title: initForm
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void initForm(ProjectFinanceCostForm form);
	/**
	 * 保存
	*
	* @Title: save
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void save(ProjectFinanceCostForm form);
	
	/**
	 * 保存EXCEL数据
	*
	* @Title: save
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void saveExcelData(ProjectFinanceCostForm form);
	/**
	 * 修改
	*
	* @Title: update
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void update(ProjectFinanceCostForm form);/**
	/**
	 * 根据id查找咨询信息
	*
	* @Title: findDetailById
	* @param id
	* @return
	* @return ProjectBaseInfo
	* @throws
	* @author zhoum
	 */
	public ProjectFinanceCost findDetailById(String id);
	/**
	 * 删除
	*
	* @Title: delete
	* @param form
	* @return void
	* @throws
	* @author zhoum
	 */
	public void delete(ProjectFinanceCostForm form);
	/**
	 * 条件查询咨询信息条数
	*
	* @Title: getProjectBaseInfoCount
	* @param way
	* @param classId
	* @param statues
	* @param b_time
	* @param e_time
	* @param hspId
	* @param userId
	* @param tenantId
	* @return
	* @return int
	* @throws
	* @author lengj
	 */
	public int getProjectFinanceCostCount(String projectNameCase,String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, String userId,String timeCase,String timeSelect);
	/**
	 * 修改初始化
	*
	* @Title: updateInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void updateInit(ProjectFinanceCostForm form);
	/**
	 * 新增初始化
	*
	* @Title: addInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void addInit(ProjectFinanceCostForm form);
	/**
	 * 知识库列表
	*
	* @Title: getSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getSearch(ProjectFinanceCostForm hosform, int curCount, int pageSize);
	/**
	 * 咨询信息列表
	*
	* @Title: getProjectBaseInfoSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectFinanceCostSearch(ProjectFinanceCostForm hosform, int curCount,int pageSize);
}
