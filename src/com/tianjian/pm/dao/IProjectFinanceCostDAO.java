/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.dao;

import java.util.List;

import com.tianjian.pm.bean.ProjectFinanceCost;

/**
 * TODO
 * <p>Title: IProjectFinanceCostDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:50:57
 * @version 1.0
 * 
 */
public interface IProjectFinanceCostDAO {

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
	*TODO 保存ProjectFinanceCost
	* @Title: save
	* @param data
	* @return void
	* @throws
	* @author LengJiong
	*/
	public void save(ProjectFinanceCost data);
	//保存咨询常见记录
	//public void saveKnowledge(CrmConsultationReposi data);
	
    /**
    *TODO修改 ProjectFinanceCost
    * @Title: update
    * @param data
    * @return void
    * @throws
    * @author LengJiong
    */
    public void update(ProjectFinanceCost data);
   
    /**
    *TODO 删除ProjectFinanceCost
    * @Title: delete
    * @param data
    * @return void
    * @throws
    * @author LengJiong
    */
    public void delete(ProjectFinanceCost data);
   
    /**
    *TODO根据ID查找记录
    * @Title: findById
    * @param id
    * @return
    * @return ProjectFinanceCost
    * @throws
    * @author LengJiong
    */
    public ProjectFinanceCost findById(String id);
   
    
    
    /**
    *TODO
    * @Title: getProjectFinanceCostCount
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
    public int getProjectFinanceCostCount(String projectNameCase,String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, String userId,String timeCase,String timeSelect);
  
    
    
    /**
    *TODO
    * @Title: getProjectFinanceCostData
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
    public List<?> getProjectFinanceCostData(String projectNameCase,String projectClass, String classId,
			String onlineTime, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String timeCase,String timeSelect,String order);
   
    /**
    *TODO
    * @Title: getTaskClassDict
    * @return
    * @return List<?>
    * @throws
    * @author LengJiong
    */
    public List<?> getTaskClassDict(String projectClassCode) ;

}
