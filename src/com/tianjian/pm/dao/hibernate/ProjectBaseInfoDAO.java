/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.dao.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Query;

import com.tianjian.comm.dao.hibernate.BaseDAOImpl;
import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.dao.IProjectBaseInfoDAO;
import com.tianjian.util.HqlUtil;

/**
 * TODO
 * <p>Title: ProjectBaseInfoDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:52:03
 * @version 1.0
 * 
 */
public class ProjectBaseInfoDAO extends BaseDAOImpl<ProjectBaseinfo> implements IProjectBaseInfoDAO{

	private static final Logger log = LogManager
			.getLogger(ProjectBaseInfoDAO.class);
	
	
	public List<?> getProjectBaseinfoData(String projectClass, String classId,
			String onlineTime, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer(
				" select a.id,a.projectCode,a.projectName,a.projectClass,a.seqNo ");
		sql.append(" from ProjectBaseinfo a");
		
		if (userId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.createUserId = ? ");
			params.add(userId.trim());
		}
		if (projectClass.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.projectClass = ? ");
			params.add(projectClass.trim());
		}
		
		if (onlineTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.onlineTime,'yyyy-MM-dd') >= ? ");
			params.add(onlineTime.trim());
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.startTime,'yyyy-MM-dd') <= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.endTime,'yyyy-MM-dd') <= ? ");
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
	

	public List<?> getDataByPatientId(String pid, String tenantId) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer(
				" select a.id,a.projectCode,a.projectName,a.projectClass,a.seqNo ");
		sql
				.append(" from CrmConsultationRecord a  where a.userId=?  order by a.starTime desc ");
		params.add(pid.trim());
		Query q = getSessionFactory().getCurrentSession().createQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		q.setFirstResult(0);
		q.setMaxResults(10);
		List<?> l = q.list();
		return l;
	}


	@Override
	public void save(ProjectBaseinfo data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().save(data);
		}
	}


	@Override
	public void update(ProjectBaseinfo data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().update(data);
		}
		
	}


	@Override
	public void delete(ProjectBaseinfo data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().delete(data);
		}
			
	}


	@Override
	public ProjectBaseinfo findById(String id) {
		List<Object> params = new ArrayList<Object>();
		// TODO Auto-generated method stub
		ProjectBaseinfo fac = null;
		StringBuffer sql = new StringBuffer(" select a.id,a.projectCode,a.projectName,a.projectClass,a.seqNo ");

		sql.append(" from ProjectBaseinfo a  where a.id=?  order by a.starTime desc ");

		params.add(id.trim());
		Query q = getSessionFactory().getCurrentSession().createQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		q.setFirstResult(0);
		q.setMaxResults(10);
		List<?> ls = q.list();
		if (ls != null && ls.size() > 0) {
			fac = (ProjectBaseinfo) ls.get(0);
		}
		log.debug("findById success!");
		return fac;
	}


	@Override
	public int getProjectBaseinfoCount(String projectClass, String projectName,
			String onlineTime, String startTime, String endTime, String userId) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("from ProjectBaseinfo a ");
		
		if (userId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.createUserId = ? ");
			params.add(userId.trim());
		}
		if (projectClass.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.projectClass = ? ");
			params.add(projectClass.trim());
		}

		if (projectName.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.projectName = ? ");
			params.add(projectClass.trim());
		}
		if (onlineTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.onlineTime,'yyyy-MM-dd') >= ? ");
			params.add(onlineTime.trim());
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.startTime,'yyyy-MM-dd') <= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.endTime,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}

		Query q = getSessionFactory().getCurrentSession().createQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		
		int count = 0;
		List<?> list = q.list();
		if (list != null && list.size() > 0) {
			count = Integer.valueOf(String.valueOf(list.get(0))).intValue();
		}
		log.debug("getCount success!");
		return count;
	}


	@Override
	public List<?> getData(String keyWord, int curCount, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public String getPatientIdByPhoneNo(String phoneNo, String tenantId) {
		// TODO Auto-generated method stub
		return null;
	}
}