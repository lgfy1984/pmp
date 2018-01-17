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
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.security.bean.SecurityStaffBaseinfo;

/**
 * TODO
 * <p>Title: IProjectBaseInfoDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:50:57
 * @version 1.0
 * 
 */
/**
 * TODO
 * <p>Title: IProjectBaseInfoDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日下午4:04:34
 * @version 1.0 
 */
public interface IProjectBaseInfoDAO {
	    
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
		*TODO 保存ProjectBaseinfo
		* @Title: save
		* @param data
		* @return void
		* @throws
		* @author LengJiong
		*/
		public void save(ProjectBaseinfo data);
		//保存咨询常见记录
		//public void saveKnowledge(CrmConsultationReposi data);
		
	    /**
	    *TODO修改 ProjectBaseinfo
	    * @Title: update
	    * @param data
	    * @return void
	    * @throws
	    * @author LengJiong
	    */
	    public void update(ProjectBaseinfo data);
	   
	    /**
	    *TODO 删除ProjectBaseinfo
	    * @Title: delete
	    * @param data
	    * @return void
	    * @throws
	    * @author LengJiong
	    */
	    public void delete(ProjectBaseinfo data);
	   
	    /**
	    *TODO根据ID查找记录
	    * @Title: findById
	    * @param id
	    * @return
	    * @return ProjectBaseinfo
	    * @throws
	    * @author LengJiong
	    */
	    public ProjectBaseinfo findById(String id);
	   
	    
	    
	    /**
	    *TODO
	    * @Title: getProjectBaseinfoCount
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
	    public int getProjectBaseinfoCount(String projectClass, String classId,
				String onlineStartTime, String onlineEndTime, 
				String startStartTime, String startEndTime, 
				String endStartTime, String endEndTime, 
				String userId);
	  
	    
	    
	    /**
	    *TODO
	    * @Title: getProjectBaseinfoData
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
	    public List<?> getProjectBaseinfoData(String projectClass, String classId,
				String onlineStartTime, String onlineEndTime, 
				String startStartTime, String startEndTime, 
				String endStartTime, String endEndTime, 
				int curCount,
				int pageSize,  String userId,String order);
	   
	    /**
	    *TODO
	    * @Title: getProjectClassDict
	    * @return
	    * @return List<?>
	    * @throws
	    * @author LengJiong
	    */
	    public List<?> getProjectClassDict() ;
	    

	   
		/**
		*TODO
		* @Title: getSequenceNo
		* @param tableName
		* @param filedName
		* @return
		* @return String
		* @throws
		* @author LengJiong
		*/
		public String getSequenceNo(String tableName, String filedName);
		
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
		
		public List<SecurityStaffBaseinfo> findStaffList(ProjectBaseInfoForm smForm, PageForm page);
		
		/**
		*TODO
		* @Title: findObjByHql
		* @param sql
		* @param map
		* @return
		* @return Object
		* @throws
		* @author LengJiong
		*/
		public Object findObjByHql(String sql, Map<String, Object> map);

}
