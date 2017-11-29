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

import com.tianjian.comm.dao.hibernate.BaseDAOImpl;

/**
 * TODO
 * <p>Title: IProjectStatDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月28日上午9:34:56
 * @version 1.0
 * 
 */
public interface IProjectStatDAO{
	/**
	 * 根据hql查询对象
	 * 
	 * @param hql
	 *            hql语句
	 * @return
	 */
	public List<?> findObjectByHql(String hql);

	/**
	 * 根据sql查询对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param map
	 *            参数值
	 * @return
	 */
	public List<?> findObjectBySql(String sql);
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
	
	public List<?> getTimeData(String projectBaseinfoId, String creatUserId);
	/**
	*TODO
	* @Title: getGroupData
	* @param projectBaseinfoId
	* @param creatUserId
	* @return
	* @return List<?>
	* @throws
	* @author LengJiong
	*/
	public List<?> getGroupData(String projectBaseinfoId, String creatUserId);
	/**
	*TODO财务统计
	* @Title: getGroupFrpData
	* @param projectBaseinfoId
	* @param taskCode
	* @return
	* @return List<?>
	* @throws
	* @author LengJiong
	*/
	public List<?> getGroupFrpData(String projectBaseinfoId,String taskCode);
	
}
