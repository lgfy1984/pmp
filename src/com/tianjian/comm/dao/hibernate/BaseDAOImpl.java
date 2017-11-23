package com.tianjian.comm.dao.hibernate;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.tianjian.comm.dao.BaseDAO;
import com.tianjian.util.Converter;

public class BaseDAOImpl<T> implements BaseDAO<T> {
	private SessionFactory sessionFactory;

	public Object save(Object t) {
		sessionFactory.getCurrentSession().save(t);
		return t;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void update(Object t) {
		sessionFactory.getCurrentSession().update(t);

	}

	@Override
	public void delete(Object t) {
		sessionFactory.getCurrentSession().delete(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(Class<T> clazz, String id) {
		T obj = (T) sessionFactory.getCurrentSession().get(clazz, id);
		return obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(Class<Object> clazz, Integer id) {
		T obj = (T) sessionFactory.getCurrentSession().get(clazz, id);
		return obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T load(Class<T> clazz, String id) {
		T obj = (T) sessionFactory.getCurrentSession().load(clazz, id);
		return obj;
	}

	@Override
	public void flush() {
		sessionFactory.getCurrentSession().flush();
	}

	@SuppressWarnings("unchecked")
	@Override
	public T load(Class<T> clazz, Integer id) {
		T obj = (T) sessionFactory.getCurrentSession().load(clazz, id);
		return obj;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<?> findObjectByHql(String hql, Map<String, Object> map) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<?> findObjectBySql(String sql, Map<String, Object> map) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		return list;
	}

	@Override
	public List<?> findListBySql(String sql, Map<String, Object> map, Class<?> entityType) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(entityType);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<?> list = query.list();
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public Integer getCountByHql(String hql, Map<String, Object> map) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		// Long count=(Long)list.get(0);
		try {
			return ((Long) list.get(0)).intValue();
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public Integer getCountBySql(String sql, Map<String, Object> map) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		try {
			Integer oo = Integer.valueOf(list.get(0).toString());
			return oo.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<?> findPageByHql(String hql, Map<String, Object> map, int first, int max) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<T> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<?> findPageBySql(String sql, Map<String, Object> map, int first, int max) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<T> list = query.list();
		return list;
	}

	@Override
	public List<?> findPageBySql(String sql, Map<String, Object> map, int first, int max, Class<?> klass) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(klass);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		query.setFirstResult(first);
		query.setMaxResults(max);
		List<?> list = query.list();
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<?> findObjectByHql(String hql) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<T> list = query.list();
		return list;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<?> findObjectBySql(String sql) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<T> list = query.list();
		return list;
	}

	@Override
	public void merge(T t) {
		sessionFactory.getCurrentSession().merge(t);

	}

	@Override
	public void clear() {
		sessionFactory.getCurrentSession().clear();

	}

	@Override
	public void insertOrDelete(String sql) {
		Query q = sessionFactory.getCurrentSession().createSQLQuery(sql);
		q.executeUpdate();
	}

	@Override
	public Object saveOrUpdate(Object obj) {
		sessionFactory.getCurrentSession().saveOrUpdate(obj);
		return obj;
	}

	@Override
	public Object findObjByHql(String hql, Map<String, Object> map) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		Object obj = null;
		if (list != null && list.size() > 0) {
			obj = list.get(0);
		}

		return obj;
	}

	@Override
	public Object findObjBySql(String sql, Map<String, Object> map) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		Object obj = null;
		if (list != null && list.size() > 0) {
			obj = list.get(0);
		}

		return obj;
	}

	/**
	 * @Title: 查询单一实体
	 * @param sql
	 * @param map
	 * @param entityType
	 * @return
	 * @return
	 * @return Object
	 * @throws
	 * @author Dul
	 */
	public T findEntityBySql(String sql, Map<String, Object> map, Class<?> entityType) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(entityType);
		if (map != null && map.size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				query.setParameter(entry.getKey(), entry.getValue());
			}
		}
		List<T> list = query.list();
		T obj = null;
		if (list != null && list.size() > 0) {
			obj = list.get(0);
		}

		return obj;
	}

	public String getSequenceNo(String tableName, String filedName) {
		try {
			String sql = "select a." + filedName + " ";
			sql += " from " + tableName + " a ";
			sql += " order by a." + filedName + " ";
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			List<?> ls = query.list();
			// System.out.println("Get data from database success! And the HQL="
			// + sql);

			if (ls.size() == 0)
				return "1";
			else {
				Iterator<?> itr = null;
				if (ls.get(0) != null) {
					String targetType = ls.get(0).getClass().getSimpleName();
					if (targetType.equalsIgnoreCase("Integer")) {
						Integer i_target = 0;
						Integer i_targetTemp;
						for (itr = ls.iterator(); itr.hasNext();) {
							Object temp = itr.next();
							if (temp != null) {
								i_targetTemp = (Integer) temp;
								if (i_targetTemp >= i_target)
									i_target = i_targetTemp;
							}
						}
						i_target = i_target + 1;
						return i_target.toString();
					}
					if (targetType.equalsIgnoreCase("Long")) {
						Long l_target = 0L;
						Long l_targetTemp;
						for (itr = ls.iterator(); itr.hasNext();) {
							Object temp = itr.next();
							if (temp != null) {
								l_targetTemp = (Long) temp;
								if (l_targetTemp >= l_target)
									l_target = l_targetTemp;
							}
						}
						l_target = l_target + 1;
						return l_target.toString();
					}
					if (targetType.equalsIgnoreCase("BigDecimal")) {
						Long l_target = 0L;
						Long l_targetTemp;
						for (itr = ls.iterator(); itr.hasNext();) {
							Object temp = itr.next();
							if (temp != null) {
								l_targetTemp = Converter.toLong(temp);
								if (l_targetTemp >= l_target)
									l_target = l_targetTemp;
							}
						}
						l_target = l_target + 1;
						return l_target.toString();
					}
					if (targetType.equalsIgnoreCase("String")) {
						Long s_target = 0L;
						Long s_targetTemp;
						for (itr = ls.iterator(); itr.hasNext();) {
							Object temp = itr.next();
							if (temp != null) {
								s_targetTemp = Long.valueOf((String) temp);
								if (s_targetTemp >= s_target)
									s_target = s_targetTemp;
							}
						}
						s_target = s_target + 1;
						return s_target.toString();
					}
				} else {
					return "1";
				}
				// log.debug("Wrong filed type excepted, getSequenceNo fail!");
				return null;
			}

		} catch (Exception re) {
			// log.error("getSequenceNo fail! ["+re.getMessage()+"]");
			return "";
		}
	}

	public String getSequenceNo(String tableName, String filedName, String[] fieldCondition, String[] fieldConditionValue) {
		try {
			String sql = "select " + filedName + " ";
			sql += " from " + tableName ;
			if (fieldCondition != null && fieldCondition.length > 0) {
				for (int i = 0; i < fieldCondition.length; i++) {
					if (i == 0) {
						sql += " where " + fieldCondition[i] + " = '" + fieldConditionValue[i] + "' ";
					} else {
						
						sql += " and " + fieldCondition[i] + " = '" + fieldConditionValue[i] + "' ";
					}
				}
			}
			sql += " order by " + filedName + " ";

			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			List<?> ls = query.list();
			// log.debug("Get data from database success! And the HQL=" + sql);

			if (ls.size() == 0)
				return "1";
			else {
				Iterator<?> itr = null;
				String targetType = ls.get(0).getClass().getSimpleName();
				if (targetType.equalsIgnoreCase("Integer")) {
					Integer i_target = 0;
					Integer i_targetTemp;
					for (itr = ls.iterator(); itr.hasNext();) {
						i_targetTemp = (Integer) itr.next();
						if (i_targetTemp >= i_target)
							i_target = i_targetTemp;
					}
					i_target = i_target + 1;
					return i_target.toString();
				}
				if (targetType.equalsIgnoreCase("Long")) {
					Long l_target = 0L;
					Long l_targetTemp;
					for (itr = ls.iterator(); itr.hasNext();) {
						l_targetTemp = (Long) itr.next();
						if (l_targetTemp >= l_target)
							l_target = l_targetTemp;
					}
					l_target = l_target + 1;
					return l_target.toString();
				}
				if (targetType.equalsIgnoreCase("BigDecimal")) {
					Long l_target = 0L;
					Long l_targetTemp;
					for (itr = ls.iterator(); itr.hasNext();) {
						Object temp = itr.next();
						if (temp != null) {
							l_targetTemp = Converter.toLong(temp);
							if (l_targetTemp >= l_target)
								l_target = l_targetTemp;
						}
					}
					l_target = l_target + 1;
					return l_target.toString();
				}
				if (targetType.equalsIgnoreCase("String")) {
					Long s_target = 0L;
					Long s_targetTemp;
					for (itr = ls.iterator(); itr.hasNext();) {
						s_targetTemp = Long.valueOf((String) itr.next());
						if (s_targetTemp >= s_target)
							s_target = s_targetTemp;
					}
					s_target = s_target + 1;
					return s_target.toString();
				}
				// log.debug("Wrong filed type excepted, getSequenceNo fail!");
				return null;
			}
		} catch (Exception re) {
			// log.error("getSequenceNo fail! ["+re.getMessage()+"]");
			return "";
		}
	}

	@Override
	public String getPowerCondition(String securityStaffBaseinfoId, String tenantId) {
		String condition = "";
		List<String> list = new ArrayList<String>();
		String hspId = "";
		String sql = "select s.hsp_config_baseinfo_id from security.security_staff_baseinfo s where s.id = '" + securityStaffBaseinfoId + "' and s.tenant_id  = '" + tenantId + "'";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<?> listSql = query.list();
		if (listSql != null && listSql.size() > 0)
			hspId = Converter.toBlank(listSql.get(0));
		if (!Converter.toBlank(hspId).equals(""))
			this.getHsps(list, hspId, tenantId);
		if (list != null && list.size() > 0) {
			String hspIds = "(";
			for (int i = 0; i < list.size(); i++) {
				hspIds += "'" + Converter.toBlank(list.get(i)) + "',";
			}
			hspIds = hspIds.substring(0, hspIds.length() - 1) + ")";
			sql = "select s.id from security.security_staff_baseinfo s where s.hsp_config_baseinfo_id in " + hspIds + " and s.tenant_id = '" + tenantId + "'";
			Query queryCondition = sessionFactory.getCurrentSession().createSQLQuery(sql);
			List<?> listCondition = queryCondition.list();
			if (listCondition != null && listCondition.size() > 0) {
				condition += "(";
				for (int j = 0; j < listCondition.size(); j++) {
					condition += "'" + Converter.toBlank(listCondition.get(j)) + "',";
				}
				condition = condition.substring(0, condition.length() - 1) + ")";
			}
		}
		return condition;
	}

	/**
	 * 
	 * 通过机构ID和租户ID获取机构和机构的所有下级机构的ID
	 * 
	 * @Title: getHsps
	 * @param list
	 * @param hspId
	 *            (机构ID)
	 * @param tenantId
	 *            (租户ID)
	 * @throws
	 * @author huy
	 */
	private void getHsps(List<String> list, String hspId, String tenantId) {
		list.add(hspId);
		String sql = "select d.id from hsp.hsp_config_baseinfo d where d.parent_item_code = '" + hspId + "' and d.tenant_id = '" + tenantId + "'";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<?> listSql = query.list();
		if (listSql != null && listSql.size() > 0) {
			for (int i = 0; i < listSql.size(); i++) {
				if (!hspId.equals(Converter.toBlank(listSql.get(i)))) {
					sql = "select count(d.id) from hsp.hsp_config_baseinfo d where d.parent_item_code = '" + Converter.toBlank(listSql.get(i)) + "' and d.tenant_id = '" + tenantId + "'";
					query = sessionFactory.getCurrentSession().createSQLQuery(sql);
					List<?> listCount = query.list();
					int temp = 0;
					if (listCount != null && listCount.size() > 0)
						temp = Converter.toInteger(listCount.get(0));
					if (temp == 0) {
						list.add(Converter.toBlank(listSql.get(i)));
						continue;
					} else {
						this.getHsps(list, Converter.toBlank(listSql.get(i)), tenantId);
					}
				}
			}
		}
	}
}
