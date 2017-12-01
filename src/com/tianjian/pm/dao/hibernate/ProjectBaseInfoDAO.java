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

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Query;

import com.tianjian.comm.dao.hibernate.BaseDAOImpl;
import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.dao.IProjectBaseInfoDAO;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.security.bean.SecurityStaffBaseinfo;
import com.tianjian.util.Converter;
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
	
	
	public List<?> getProjectBaseinfoData(String projectClass, String projectName,
			String onlineTime, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("  from ProjectBaseinfo a");
		
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
					+ " a.projectName like ? ");
			params.add("%"+projectName.trim()+"%");
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id.trim());
		// TODO Auto-generated method stub
		ProjectBaseinfo fac = null;
		StringBuffer sql = new StringBuffer(" from ProjectBaseinfo a  where a.id=:id  order by a.startTime desc ");
		fac = (ProjectBaseinfo)findObjByHql(sql.toString(),map);
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
					+ " a.projectName like ? ");
			params.add("%"+projectName.trim()+"%");
		}
		if (onlineTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.onlineTime,'yyyy-MM-dd') >= ? ");
			params.add(onlineTime.trim());
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.startTime,'yyyy-MM-dd') >= ? ");
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
			count = Integer.valueOf(list.size()).intValue();
		}
		log.debug("getCount success!");
		return count;
	}
	
	public List<?> getProjectClassDict() {
		String hql = "select a.itemCode,a.itemName from ProjectClassDict a";
		List<?> list = findObjectByHql(hql);
		if (list == null) {
			return null;
		} else
			return list;
	}


	@Override
	public List<SecurityStaffBaseinfo> findStaffList(ProjectBaseInfoForm smForm, PageForm page) {
		List<Object> params = new ArrayList<Object>();

		StringBuilder builder = new StringBuilder(
				" from SecurityStaffBaseinfo t");

		
		if (StringUtils.isNotBlank(smForm.getStaffName())) {
			// System.out.println(smForm.getUserName());
			builder.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.name like ? ");
			params.add("%" + smForm.getStaffName() + "%");
		}
		if (StringUtils.isNotBlank(smForm.getStaffCode())) {
			builder.append(" " + HqlUtil.getWhereOrAndClause(params) + " t.staffCode = ? ");
			params.add(smForm.getStaffCode());
		}
		if (StringUtils.isNotBlank(smForm.getTenantId())) {
			builder.append(" " + HqlUtil.getWhereOrAndClause(params) + " t.tenantId = ? ");
			params.add(smForm.getTenantId());
		}

		builder.append(" order by t.createDate desc ");
		Query query = getSessionFactory().getCurrentSession().createQuery(
				builder.toString());
		if (page != null) {
			int begin = (Integer.parseInt(page.getPageIndex()) - 1)
					* Integer.parseInt(page.getPageSize());
			query.setFirstResult(begin);
			query.setMaxResults(Integer.parseInt(page.getPageSize()));
		}
		for (int i = 0; i < params.size(); i++) {
			query.setParameter(i, params.get(i));
		}
		return query.list();
	}
    
	public String findNameByCode(String code){
		String name="";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code.trim());
		String hql = "select a.itemName from CommConfigSex a where a.itemCode=:code ";
		Object pcd = findObjByHql(hql.toString(),map);
		name = Converter.toBlank(pcd);
		return name;
	}
}
