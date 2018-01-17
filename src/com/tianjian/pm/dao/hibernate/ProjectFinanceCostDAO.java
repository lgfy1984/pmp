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
import com.tianjian.pm.bean.ProjectFinanceCost;
import com.tianjian.pm.bean.ProjectFinanceCost;
import com.tianjian.pm.dao.IProjectFinanceCostDAO;
import com.tianjian.util.HqlUtil;

/**
 * TODO
 * <p>Title: ProjectFinanceCostDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:52:03
 * @version 1.0
 * 
 */
public class ProjectFinanceCostDAO extends BaseDAOImpl<ProjectFinanceCost> implements IProjectFinanceCostDAO{

	private static final Logger log = LogManager
			.getLogger(ProjectFinanceCostDAO.class);
	
	
	public List<?> getProjectFinanceCostData(String projectNameCase,String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, int curCount,
			int pageSize,  String userId,String timeCase,String timeSelect,String order) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select "
				+ "a.id," //0
				+ "a.PROJECT_BASEINFO_ID," //1
				+ "a.STATUS,"//2
				+ "a.CREATE_USER_ID,"//3
				+ "a.CREATE_USER_NAME,"//4
				+ "a.CREATE_DATE,"//5
				+ "a.SEQ_NO,"//6
				+ "a.TASK_CODE,"//7
				+ "a.WORK_DATE, "//8
				+ "a.COSTS ,"//9
				+ "s.name,"//10
				+ "a.staff_code "//11
				+ " from PM.PROJECT_FINANCE_COST a "
			+"left join pm.project_baseinfo t "
			+" on  a.project_baseinfo_id = t.id "
			+"  left join  SECURITY.SECURITY_STAFF_BASEINFO s "
			+" on a.staff_code = s.id ");
	
		if (projectBaseinfoId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
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
		if (timeSelect.equals("0") && timeCase.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') = ? ");
			params.add(timeCase.trim());
		}
		sql.append(" order by a.WORK_DATE DESC ");

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
	public void save(ProjectFinanceCost data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().save(data);
		}
	}


	@Override
	public void update(ProjectFinanceCost data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().update(data);
		}
		
	}


	@Override
	public void delete(ProjectFinanceCost data) {
		// TODO Auto-generated method stub
		if (data != null) {
			getSessionFactory().getCurrentSession().delete(data);
		}
			
	}


	@Override
	public ProjectFinanceCost findById(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id.trim());
		// TODO Auto-generated method stub
		ProjectFinanceCost fac = null;
		StringBuffer sql = new StringBuffer(" from ProjectFinanceCost a  where a.id=:id  order by a.seqNo desc ");
		fac = (ProjectFinanceCost)findObjByHql(sql.toString(),map);
		log.debug("findById success!");
		return fac;
	}


	@Override
	public int getProjectFinanceCostCount(String projectNameCase,String projectBaseinfoId, String projectClassCode,
			String staffName, String startTime, String endTime, String userId,String timeCase,String timeSelect) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select a.* from PM.PROJECT_FINANCE_COST a "
			+"left join pm.project_baseinfo t "
			+" on  a.project_baseinfo_id = t.id "
			+"  left join  SECURITY.SECURITY_STAFF_BASEINFO s "
			+" on a.staff_code = s.id ");
		
		if (projectBaseinfoId.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
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
		if (timeSelect.equals("0") && timeCase.trim().length() > 0) {
			sql.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') = ? ");
			params.add(timeCase.trim());
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

}
