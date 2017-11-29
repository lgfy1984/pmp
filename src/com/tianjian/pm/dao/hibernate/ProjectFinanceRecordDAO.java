/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.dao.hibernate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Query;

import com.tianjian.comm.dao.hibernate.BaseDAOImpl;
import com.tianjian.pm.bean.ProjectFinanceRecord;
import com.tianjian.pm.dao.IProjectFinanceRecordDAO;
import com.tianjian.util.HqlUtil;

/**
 * TODO
 * <p>Title: ProjectFinanceRecordDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:52:03
 * @version 1.0
 * 
 */
public class ProjectFinanceRecordDAO extends BaseDAOImpl<ProjectFinanceRecord> implements IProjectFinanceRecordDAO{

	private static final Logger log = LogManager
			.getLogger(ProjectFinanceRecordDAO.class);
	
	
	public List<?> getProjectFinanceRecordData(String projectId, String taskCode,
			String onlineTime, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("  from ProjectFinanceRecord a");
		
		if (userId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.createUserId = ? ");
			params.add(userId.trim());
		}
		if (projectId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.projectBaseinfoId = ? ");
			params.add(projectId.trim());
		}
		if (projectId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.taskCode = ? ");
			params.add(projectId.trim());
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.workDate,'yyyy-MM-dd') >= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.workDate,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}
		sql.append(" order by " + order);

		Query q = getSessionFactory().getCurrentSession().createQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		if (pageSize != 0 && curCount != -1) {
			q.setFirstResult(curCount);
			q.setMaxResults(pageSize);
		}
		List<?> l = q.list();
		log.debug("getData success!");
		return l;
	}
	


	@Override
	public void save(ProjectFinanceRecord data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().save(data);
		}
	}


	@Override
	public void update(ProjectFinanceRecord data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().update(data);
		}
		
	}


	@Override
	public void delete(ProjectFinanceRecord data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().delete(data);
		}
			
	}


	@Override
	public ProjectFinanceRecord findById(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id.trim());
		// TODO Auto-generated method stub
		ProjectFinanceRecord fac = null;
		StringBuffer sql = new StringBuffer(" from ProjectFinanceRecord a  where a.id=:id  order by a.seqNo desc ");
		fac = (ProjectFinanceRecord)findObjByHql(sql.toString(),map);
		log.debug("findById success!");
		return fac;
	}


	@Override
	public int getProjectFinanceRecordCount(String projectId, String taskCode,
			String onlineTime, String startTime, String endTime, String userId) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("from ProjectFinanceRecord a ");
		if (userId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.createUserId = ? ");
			params.add(userId.trim());
		}
		if (projectId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.projectBaseinfoId = ? ");
			params.add(projectId.trim());
		}
		if (projectId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.taskCode = ? ");
			params.add(projectId.trim());
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.workDate,'yyyy-MM-dd') >= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.workDate,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}

		Query q = getSessionFactory().getCurrentSession().createQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		
		int count = 0;
		List<?> list = q.list();
		if (list != null && list.size() > 0) {
			count = Integer.valueOf(list.size()).intValue();
		}
		log.debug("getCount success!");
		return count;
	}


	@Override
	public List<?> getTaskClassDict() {
		String hql = "select a.itemCode,a.itemName from ProjectTaskDict a";
		List<?> list = findObjectByHql(hql);
		if (list == null) {
			return null;
		} else
			return list;
	}

}
