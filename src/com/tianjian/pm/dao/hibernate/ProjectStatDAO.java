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

import org.hibernate.Query;

import com.tianjian.comm.dao.hibernate.BaseDAOImpl;
import com.tianjian.pm.bean.ProjectBaseinfo;
import com.tianjian.pm.dao.IProjectStatDAO;
import com.tianjian.util.HqlUtil;

/**
 * TODO
 * <p>Title: ProjectStatDAO.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月28日上午9:34:19
 * @version 1.0
 * 
 */
public class ProjectStatDAO extends BaseDAOImpl<ProjectBaseinfo>  implements IProjectStatDAO {
	
	
	public List<?> getTimeData(String projectBaseinfoId, String creatUserId) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select min(a.work_date) as mintime,max(a.work_date) maxtime from pm.project_worktime_record a ");
		
		if(!projectBaseinfoId.equals("")){
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		}
		if(!creatUserId.equals("")){
			sql.append(" " + HqlUtil.getWhereOrAndClause(params) + " a.CREATE_USER_ID = ? ");
			params.add(creatUserId.trim());
		}


		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		List<?> l = q.list();
		return l;
	}
	
	public List<?> getGroupData(String projectBaseinfoId, String creatUserId) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sqldata = new StringBuffer("select a.create_user_id as userid ,a.task_code as taskcode, a.PROJECT_BASEINFO_ID as projectId "
                +" FROM pm.project_worktime_record a"
                +" where 1=1 ");

		if(!projectBaseinfoId.equals("")){
			sqldata.append("and  a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		} 
		if(!creatUserId.equals("")){
			sqldata.append("and  a.CREATE_USER_ID = ? ");
			params.add(creatUserId.trim());
		}
		
		
        sqldata.append(" group by a.create_user_id, a.PROJECT_BASEINFO_ID,a.task_code");
        sqldata.append(" order by a.project_baseinfo_id,a.task_code ");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sqldata.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		List<?> l = q.list();
		return l;
	}
	public List<?> getYearData(String taskCode,String projectBaseinfoId, String creatUserId) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sqldata = new StringBuffer("select to_char(b.work_date,'yyyy'),sum(b.long_time)"
						+" from PM.PROJECT_WORKTIME_RECORD B where 1=1 ");

		if(!projectBaseinfoId.equals("")){
			sqldata.append("and  B.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		} 
		if(!creatUserId.equals("")){
			sqldata.append("and  B.CREATE_USER_ID = ? ");
			params.add(creatUserId.trim());
		}
		if(!taskCode.equals("")){
			sqldata.append("and  B.TASK_CODE = ? ");
			params.add(taskCode.trim());
		}

		sqldata.append(" group by to_char(B.work_date,'yyyy') ");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sqldata.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		List<?> l = q.list();
		return l;
	}
	
	public List<?> getMonthData(String taskCode,String projectBaseinfoId, String creatUserId) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sqldata = new StringBuffer(""
				+ " SELECT A.FDATE, NVL(C.FNUM, 0)  FROM (SELECT FDATE "
				+ " FROM (SELECT TRUNC(SYSDATE, 'MONTH') + LEVEL - 1AS FDATE "
                + " FROM DUAL"
                + " CONNECT BY LEVEL <= 31)"
		        + " WHERE TO_CHAR(FDATE, 'MM') = TO_CHAR(SYSDATE, 'MM')) A "
		        + " LEFT JOIN (SELECT B.WORK_DATE AS FDATE, sum(B.Long_Time) AS FNUM "
                + " FROM PM.PROJECT_WORKTIME_RECORD B"
                + " WHERE TO_CHAR(B.WORK_DATE, 'YYYYMM') = TO_CHAR(SYSDATE, 'YYYYMM')");

		if(!projectBaseinfoId.equals("")){
			sqldata.append("and  B.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		} 
		if(!creatUserId.equals("")){
			sqldata.append("and  B.CREATE_USER_ID = ? ");
			params.add(creatUserId.trim());
		}
		if(!taskCode.equals("")){
			sqldata.append("and  B.TASK_CODE = ? ");
			params.add(taskCode.trim());
		}

		sqldata.append(" GROUP BY B.WORK_DATE) C ON A.FDATE = C.FDATE");
        sqldata.append(" ORDER BY A.FDATE asc ");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sqldata.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		List<?> l = q.list();
		return l;
	}
	
	public List<?> getGroupFrpData(String projectBaseinfoId,String taskCode,String statTime,String endTime) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sqldata = new StringBuffer("select a.project_baseinfo_id,a.staff_code,c.item_name,a.task_code,sum(a.long_time),sum(a.costs) "
                +"from pm.project_finance_record a left join security.security_staff_baseinfo b "
                +"on a.staff_code = b.id  left join comm.comm_config_staff_charge_type c on b.comm_config_staff_charge_id=c.item_code "
                +" where 1=1 ");

		if(!projectBaseinfoId.equals("")){
			sqldata.append("and  a.PROJECT_BASEINFO_ID = ? ");
			params.add(projectBaseinfoId.trim());
		} 
		if(!taskCode.equals("")){
			sqldata.append("and  a.task_code= ? ");
			params.add(taskCode.trim());
		}
		if (statTime.trim().length() > 0) {
			sqldata.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') >= ? ");
			params.add(statTime.trim());
		}
		if (endTime.trim().length() > 0) {
			sqldata.append(" " + HqlUtil.getWhereOrAndClause(params)
					+ " to_char(a.WORK_DATE,'yyyy-MM-dd') <= ? ");
			params.add(endTime.trim());
		}

        sqldata.append(" group by a.project_baseinfo_id,a.staff_code,c.item_name, a.task_code");

		Query q = getSessionFactory().getCurrentSession().createSQLQuery(sqldata.toString());
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		List<?> l = q.list();
		return l;
	}
	
	
}
