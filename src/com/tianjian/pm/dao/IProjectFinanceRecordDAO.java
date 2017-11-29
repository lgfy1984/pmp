/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.dao;

import java.util.List;

import com.tianjian.pm.bean.ProjectFinanceRecord;

/**
 * TODO
 * <p>Title: IProjectFinanceRecordDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:50:57
 * @version 1.0
 * 
 */
public interface IProjectFinanceRecordDAO {

	/**
	*TODO 保存ProjectFinanceRecord
	* @Title: save
	* @param data
	* @return void
	* @throws
	* @author LengJiong
	*/
	public void save(ProjectFinanceRecord data);
	//保存咨询常见记录
	//public void saveKnowledge(CrmConsultationReposi data);
	
    /**
    *TODO修改 ProjectFinanceRecord
    * @Title: update
    * @param data
    * @return void
    * @throws
    * @author LengJiong
    */
    public void update(ProjectFinanceRecord data);
   
    /**
    *TODO 删除ProjectFinanceRecord
    * @Title: delete
    * @param data
    * @return void
    * @throws
    * @author LengJiong
    */
    public void delete(ProjectFinanceRecord data);
   
    /**
    *TODO根据ID查找记录
    * @Title: findById
    * @param id
    * @return
    * @return ProjectFinanceRecord
    * @throws
    * @author LengJiong
    */
    public ProjectFinanceRecord findById(String id);
   
    
    
    /**
    *TODO
    * @Title: getProjectFinanceRecordCount
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
    public int getProjectFinanceRecordCount(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, String userId);
  
    
    
    /**
    *TODO
    * @Title: getProjectFinanceRecordData
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
    public List<?> getProjectFinanceRecordData(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order);
   
    /**
    *TODO
    * @Title: getTaskClassDict
    * @return
    * @return List<?>
    * @throws
    * @author LengJiong
    */
    public List<?> getTaskClassDict() ;
}
