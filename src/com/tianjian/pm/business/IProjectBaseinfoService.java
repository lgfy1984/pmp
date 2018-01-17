/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business;

import java.util.List;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;
import com.tianjian.pm.struts.form.SecurityStaffBaseinfoVo;

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
public interface IProjectBaseinfoService  {
	
	
	/**
	*TODO
	* @Title: checkProjectCode
	* @param form
	* @return
	* @return String
	* @throws
	* @author LengJiong
	*/
	public String checkProjectCode(ProjectBaseInfoForm form);
	/**
	 * 初始化form
	*
	* @Title: initForm
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void initForm(ProjectBaseInfoForm form);
	/**
	 * 保存
	*
	* @Title: save
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void save(ProjectBaseInfoForm form);
	/**
	 * 修改
	*
	* @Title: update
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void update(ProjectBaseInfoForm form);
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
	public ProjectBaseinfo findDetailById(String id);
	/**
	 * 删除
	*
	* @Title: delete
	* @param form
	* @return void
	* @throws
	* @author zhoum
	 */
	public String delete(ProjectBaseInfoForm form);
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
	public int getProjectBaseInfoCount(String projectClass, String classId,
			String onlineStartTime, String onlineEndTime, 
			String startStartTime, String startEndTime, 
			String endStartTime, String endEndTime, 
			String userId);
	/**
	 * 修改初始化
	*
	* @Title: updateInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void updateInit(ProjectBaseInfoForm form);
	/**
	 * 新增初始化
	*
	* @Title: addInit
	* @param form
	* @return void
	* @throws
	* @author lengj
	 */
	public void addInit(ProjectBaseInfoForm form);
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
	public void getSearch(ProjectBaseInfoForm hosform, int curCount, int pageSize);
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
	public void getProjectBaseInfoSearch(ProjectBaseInfoForm hosform, int curCount,int pageSize);
	  /**
	    *TODO
	    * @Title: findProjectList
	    * @param smForm
	    * @param page
	    * @return
	    * @return List<ProjectBaseinfo>
	    * @throws
	    * @author LengJiong
	    */
	    public List<SecurityStaffBaseinfoVo> findStaffList(ProjectBaseInfoForm smForm, PageForm page);
		public int findStaffCount(ProjectBaseInfoForm form, PageForm page);
		public void saveExcelData(ProjectBaseInfoForm form);
}
