/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.dao;

import java.util.List;
import java.util.Map;

import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.bean.ProjectWorktimeRecord;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;

/**
 * TODO
 * <p>Title: IProjectWorktimeRecordDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:50:57
 * @version 1.0
 * 
 */
public interface IProjectWorkTimeRecordDAO  {

	/**
	    *TODO
	    * @Title: saveOrUpdate
	    * @param obj
	    * @return
	    * @return Object
	    * @throws
	    * @author LengJiong
	    */
	    public Object saveOrUpdate(Object obj);
	/**
	*TODO 保存ProjectWorktimeRecord
	* @Title: save
	* @param data
	* @return void
	* @throws
	* @author LengJiong
	*/
	public void save(ProjectWorktimeRecord data);
	//保存咨询常见记录
	//public void saveKnowledge(CrmConsultationReposi data);
	
    /**
    *TODO修改 ProjectWorktimeRecord
    * @Title: update
    * @param data
    * @return void
    * @throws
    * @author LengJiong
    */
    public void update(ProjectWorktimeRecord data);
   
    /**
    *TODO 删除ProjectWorktimeRecord
    * @Title: delete
    * @param data
    * @return void
    * @throws
    * @author LengJiong
    */
    public void delete(ProjectWorktimeRecord data);
   
    /**
    *TODO根据ID查找记录
    * @Title: findById
    * @param id
    * @return
    * @return ProjectWorktimeRecord
    * @throws
    * @author LengJiong
    */
    public ProjectWorktimeRecord findById(String id);
   
    
    
    /**
    *TODO
    * @Title: getProjectWorktimeRecordCount
    * @param projectClass
    * @param classId
    * @param onlineTime
    * @param startTime
    * @param endTime
    * @param userId
    * @return
    * @return int
    * @throws
    * @author LengJiong
    */
    public int getProjectWorktimeRecordCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId, String status,String noLimit);
  
    
    
    /**
    *TODO
    * @Title: getProjectWorktimeRecordData
    * @param projectClass
    * @param classId
    * @param onlineTime
    * @param startTime
    * @param endTime
    * @param curCount
    * @param pageSize
    * @param userId
    * @param order
    * @return
    * @return List<?>
    * @throws
    * @author LengJiong
    */
    public List<?> getProjectWorktimeRecordData(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order,String status,String noLimit);
    
    
    /**
     *TODO
     * @Title: getProjectWorktimeRecordCount
     * @param projectClass
     * @param classId
     * @param onlineTime
     * @param startTime
     * @param endTime
     * @param userId
     * @return
     * @return int
     * @throws
     * @author LengJiong
     */
     public int getProjectWorkTimeUnlockCount(String projectClass, String classId,
 			String onlineTime, String startTime, String endTime, String userId, String status);
   
     
     
     /**
     *TODO
     * @Title: getProjectWorktimeRecordData
     * @param projectClass
     * @param classId
     * @param onlineTime
     * @param startTime
     * @param endTime
     * @param curCount
     * @param pageSize
     * @param userId
     * @param order
     * @return
     * @return List<?>
     * @throws
     * @author LengJiong
     */
     public List<?> getProjectWorktimeUnlockData(String projectClass, String classId,
 			String onlineTime, String startTime, String endTime, int curCount,
 			int pageSize,  String userId,String order,String status);
   
    /**
    *TODO
    * @Title: getClassDict
    * @return
    * @return List<?>
    * @throws
    * @author LengJiong
    */
    public List<?> getTaskClassDict(String projectClassCode) ;
    public List<?> getProjectClassDict() ;
    
    
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
    public List<ProjectBaseinfo> findProjectList(ProjectWorkTimeRecordForm smForm, PageForm page);
    
    
    /**
    *TODO
    * @Title: findNameByCode
    * @param code
    * @return
    * @return String
    * @throws
    * @author LengJiong
    */
    public String findNameByCode(String code);
    
    /**
    *TODO
    * @Title: findObjectById
    * @param id
    * @return
    * @return List<?>
    * @throws
    * @author LengJiong
    */
    public ProjectBaseinfo  findObjectById(String id);
    
    /**
	 * 
	 * 通过表名和表字段获取正确序号
	 * 
	 * @Title: getSequenceNo
	 * @param tableName
	 * @param filedName
	 * @return String
	 * @throws
	 * @author huy
	 */
	public String getSequenceNo(String tableName, String filedName);
	

	/**
	 * 保存一个对象
	 */
	public Object save(Object t);
	
	/**
	 * 根据hql查询一个对象
	 * 
	 * @param hql
	 *            hql语句
	 * @param map
	 * 
	 * @return 返回一个对象
	 */
	public Object findObjByHql(String hql, Map<String, Object> map);
	
	/**
	 * 根据hql查询对象
	 * 
	 * @param hql
	 *            hql语句
	 * @param map
	 *            参数值 无则传null或者""
	 * @return
	 */
	public List<?> findObjectByHql(String hql, Map<String, Object> map);
	/**
	 * 根据sql查询一个对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param map
	 * 
	 * @return 返回一个对象
	 */
	public Object findObjBySql(String sql, Map<String, Object> map);
}
