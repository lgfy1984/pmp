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
import com.tianjian.pm.bean.ProjectWorktimeRecord;
import com.tianjian.pm.dao.IProjectWorkTimeRecordDAO;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;
import com.tianjian.util.Converter;
import com.tianjian.util.HqlUtil;
import com.tianjian.util.comm.DateUtil;

/**
 * TODO
 * <p>Title: ProjectWorktimeRecordDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:52:03
 * @version 1.0
 * 
 */
public class ProjectWorkTimeRecordDAO extends BaseDAOImpl<ProjectWorktimeRecord> implements IProjectWorkTimeRecordDAO{

	private static final Logger log = LogManager
			.getLogger(ProjectWorkTimeRecordDAO.class);
	

	@Override
	public int getProjectWorktimeRecordCount(String projectNameCase, String projectClassCode,
			String staffName, String startTime, String endTime, String userId, String status,String noLimit) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select a.* from PM.PROJECT_WORKTIME_RECORD a "
			+"left join pm.project_baseinfo t "
			+" on  a.project_baseinfo_id = t.id "
			+"  left join  SECURITY.SECURITY_STAFF_BASEINFO s "
			+" on a.create_user_id = s.id ");
		if(noLimit.equals("")){
		  if (userId.trim().length() > 0) {
				sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " ( a.create_user_id = ? ");
				params.add(userId.trim());
				sql.append("  or t.staff_code = ? )");
				params.add(userId.trim());
			}
		}
		if (projectNameCase.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.PROJECT_NAME like ? ");
			params.add("%"+projectNameCase.trim()+"%".trim());
		}
		if (projectClassCode.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.PROJECT_CLASS = ? ");
			params.add(projectClassCode.trim());
		}
		if (staffName.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " s.name like  ? ");
			params.add("%"+staffName.trim()+"%");
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') >= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}
		if (status.equals("0")){
			sql.append(" and a.status is null ");
		}

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql.toString());
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

	public List<?> getProjectWorktimeRecordData(String projectNameCase, String projectClassCode,
			String staffName, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order,String status,String noLimit) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select "
				+ "a.id," //0
				+ "a.PROJECT_BASEINFO_ID," //1
				+ "a.LONG_TIME,"//2
				+ "a.STATUS,"//3
				+ "a.CREATE_USER_ID,"//4
				+ "a.CREATE_USER_NAME,"//5
				+ "a.CREATE_DATE,"//6
				+ "a.SEQ_NO,"//7
				+ "a.TASK_CODE,"//8
				+ "a.WORK_DATE,"//9
				+ "a.LOCK_STATUS "//10
				+ " from PM.PROJECT_WORKTIME_RECORD a "
			+"left join pm.project_baseinfo t "
			+" on  a.project_baseinfo_id = t.id "
			+"  left join  SECURITY.SECURITY_STAFF_BASEINFO s "
			+" on a.create_user_id = s.id ");
		if(noLimit.equals("")){
			  if (userId.trim().length() > 0) {
					sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " ( a.create_user_id = ? ");
					params.add(userId.trim());
					sql.append("  or t.staff_code = ? )");
					params.add(userId.trim());
				}
		}
		if (projectNameCase.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.PROJECT_NAME like ? ");
			params.add("%"+projectNameCase.trim()+"%".trim());
		}
		if (projectClassCode.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.PROJECT_CLASS = ? ");
			params.add(projectClassCode.trim());
		}
		if (staffName.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " s.name like  ? ");
			params.add("%"+staffName.trim()+"%");
		}
		if (startTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') >= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}
		if (status.equals("0")){
			sql.append(" and a.status is null ");
		}
		//sql.append(" order by " + order);
		sql.append(" order by a.status DESC,a.SEQ_NO DESC");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql.toString());
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
	public int getProjectWorkTimeUnlockCount(String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, String userId, String status) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select "
				+ "count(*) "
				+ " from PM.PROJECT_WORKTIME_RECORD a "
			+"left join pm.project_baseinfo t "
			+" on  a.project_baseinfo_id = t.id "
			+"  left join  SECURITY.SECURITY_STAFF_BASEINFO s "
			+" on a.create_user_id = s.id where a.status='1'  ");
		if (userId.trim().length() > 0) {
			sql.append("  and  a.create_user_id = ? ");
			params.add(userId.trim());
		}
		if (projectBaseinfoId.trim().length() > 0) {
			sql.append(" and a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		}
		if (projectClassCode.trim().length() > 0) {
			sql.append(" and t.PROJECT_CLASS = ? ");
			params.add(projectClassCode.trim());
		}
		if (staffName.trim().length() > 0) {
			sql.append(" and s.name like  ? ");
			params.add("%"+staffName.trim()+"%");
		}
		if (startTime.trim().length() > 0) {
			sql.append(" and to_char(a.WORK_DATE,'yyyy-MM-dd') >= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" and to_char(a.WORK_DATE,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}
		
			sql.append(" group by a.project_baseinfo_id,a.create_user_id,a.create_user_name ");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql.toString());
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

	public List<?> getProjectWorktimeUnlockData(String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String order,String status) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select  "
				+ "a.project_baseinfo_id,a.create_user_id,a.create_user_name "
				+ " from PM.PROJECT_WORKTIME_RECORD a "
			+"left join pm.project_baseinfo t "
			+" on  a.project_baseinfo_id = t.id "
			+"  left join  SECURITY.SECURITY_STAFF_BASEINFO s "
			+" on a.create_user_id = s.id  where a.status='1'  ");
		if (userId.trim().length() > 0) {
			sql.append("  and  a.create_user_id = ? ");
			params.add(userId.trim());
		}
		if (projectBaseinfoId.trim().length() > 0) {
			sql.append(" and a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		}
		if (projectClassCode.trim().length() > 0) {
			sql.append(" and t.PROJECT_CLASS = ? ");
			params.add(projectClassCode.trim());
		}
		if (staffName.trim().length() > 0) {
			sql.append(" and s.name like  ? ");
			params.add("%"+staffName.trim()+"%");
		}
		if (startTime.trim().length() > 0) {
			sql.append(" and to_char(a.WORK_DATE,'yyyy-MM-dd') >= ? ");
			params.add(startTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sql.append(" and to_char(a.WORK_DATE,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}
			sql.append(" group by a.project_baseinfo_id,a.create_user_id,a.create_user_name ");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql.toString());
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
	public List<ProjectBaseinfo> findProjectList(ProjectWorkTimeRecordForm smForm, PageForm page) {
		List<Object> params = new ArrayList<Object>();

		StringBuilder builder = new StringBuilder(
				" from ProjectBaseinfo t");

		
		// createUserId
		if (StringUtils.isNotBlank(smForm.getCreateUserId())) {
			builder.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.createUserId = ? ");
			params.add(smForm.getCreateUserId());
		}
		if (StringUtils.isNotBlank(smForm.getProjectNameCase())) {
			// System.out.println(smForm.getUserName());
			builder.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.projectName like ? ");
			params.add("%" + smForm.getProjectNameCase() + "%");
		}
		if (StringUtils.isNotBlank(smForm.getProjectCodeCase())) {
			builder.append(" " + HqlUtil.getWhereOrAndClause(params) + " t.projectCode = ? ");
			params.add(smForm.getProjectCodeCase());
		}
		if (StringUtils.isNotBlank(smForm.getTimeStartCase())) {
			builder.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.createDate >= ? ");
			params.add(DateUtil.stringToDate(smForm.getTimeStartCase(),
					"yyyy-MM-dd"));
		}
		if (StringUtils.isNotBlank(smForm.getTimeEndCase())) {
			builder.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " t.createDate <= ? ");
			params.add(DateUtil.stringToDate(smForm.getTimeEndCase(),
					"yyyy-MM-dd"));
		}

		builder.append(" order by t.seqNo desc ");
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

	@Override
	public void save(ProjectWorktimeRecord data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().save(data);
		}
	}


	@Override
	public void update(ProjectWorktimeRecord data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().update(data);
		}
		
	}


	@Override
	public void delete(ProjectWorktimeRecord data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().delete(data);
		}
			
	}


	@Override
	public ProjectWorktimeRecord findById(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id.trim());
		// TODO Auto-generated method stub
		ProjectWorktimeRecord fac = null;
		StringBuffer sql = new StringBuffer(" from ProjectWorktimeRecord a  where a.id=:id  order by a.seqNo desc ");
		fac = (ProjectWorktimeRecord)findObjByHql(sql.toString(),map);
		log.debug("findById success!");
		return fac;
	}


	
	public String findNameByCode(String code){
		String name="";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code.trim());
		String hql = "select a.itemName from ProjectClassDict a where a.itemCode=:code ";
		Object pcd = findObjByHql(hql.toString(),map);
		name = Converter.toBlank(pcd);
		return name;
	}
	public ProjectBaseinfo findObjectById(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id.trim());
		String hql = " from ProjectBaseinfo a where a.id=:id ";
		ProjectBaseinfo pbi = (ProjectBaseinfo)findObjByHql(hql.toString(),map);
		return pbi;
	}
	@Override
	public List<?> getTaskClassDict(String projectClassCode) {
		StringBuffer sql = new StringBuffer("select a.ITEM_CODE,a.ITEM_NAME from PM.PROJECT_TASK_DICT a ");
		List<Object> params = new ArrayList<Object>();
		if (projectClassCode.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.ITEM_CLASS = ? ");
			params.add(projectClassCode.trim());
		}
		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		
		List<?> list = q.list();
		if (list == null) {
			return null;
		} else
			return list;
	}
	@Override
	public List<?> getProjectClassDict() {
		String hql = "select a.itemCode,a.itemName from ProjectClassDict a";
		List<?> list = findObjectByHql(hql);
		if (list == null) {
			return null;
		} else
			return list;
	}
}
