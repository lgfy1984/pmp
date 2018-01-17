/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business;

import java.util.List;

import com.tianjian.pm.bean.ProjectWorktimeRecord;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;

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
public interface IProjectWorkTimeRecordService  {
	
	
	/**
	*TODO
	* @Title: checkTime
	* @param form
	* @return void
	* @throws
	* @author LengJiong
	*/
	public String checkTime(ProjectWorkTimeRecordForm form);
	

	public String checkLock(ProjectWorkTimeRecordForm form);
	
	/**
	*TODO
	* @Title: saveExcelData
	* @param form
	* @return void
	* @throws
	* @author LengJiong
	*/
	public void saveExcelData(ProjectWorkTimeRecordForm form);
	/**
	 * 初始化form
	*
	* @Title: initForm
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void initForm(ProjectWorkTimeRecordForm form);
	/**
	 * 保存
	*
	* @Title: save
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void save(ProjectWorkTimeRecordForm form);
	/**
	 * 修改
	*
	* @Title: update
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void update(ProjectWorkTimeRecordForm form);
	/**
	 * 锁定
	*
	* @Title: update
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void lock(ProjectWorkTimeRecordForm form);
	/**
	 * 审核
	*
	* @Title: update
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void check(ProjectWorkTimeRecordForm form);
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
	public ProjectWorktimeRecord findDetailById(String id);
	/**
	 * 删除
	*
	* @Title: delete
	* @param form
	* @return void
	* @throws
	* @author zhoum
	 */
	public void delete(ProjectWorkTimeRecordForm form);
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
	public int getProjectWorkTimeRecordCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId,String statusCase,String noLimit);
	/**
	 * 信息列表
	*
	* @Title: getProjectBaseInfoSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectWorkTimeRecordSearch(ProjectWorkTimeRecordForm hosform, int curCount,int pageSize);
	
	
	public int getProjectWorkTimeUnlockCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId,String statusCase);
	/**
	 * 信息列表
	*
	* @Title: getProjectBaseInfoSearch
	* @param hosform
	* @param curCount
	* @param pageSize
	* @return void
	* @throws
	* @author lengj
	 */
	public void getProjectWorkTimeUnlockSearch(ProjectWorkTimeRecordForm hosform, int curCount,int pageSize);
	/**
	 * 修改初始化
	*
	* @Title: updateInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void updateInit(ProjectWorkTimeRecordForm form);
	/**
	 * 新增初始化
	*
	* @Title: addInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void addInit(ProjectWorkTimeRecordForm form);
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
	public void getSearch(ProjectWorkTimeRecordForm hosform, int curCount, int pageSize);
	
	
	public List<ProjectBaseInfoVo> findProjectList(ProjectWorkTimeRecordForm smForm, PageForm page);

	public int findProjectCount(ProjectWorkTimeRecordForm smForm, PageForm page);
}
