package com.tianjian.comm.dao;

import java.util.List;
import java.util.Map;

public interface BaseDAO<T> {
	/**
	 * 保存一个对象
	 */
	public Object save(Object t);

	/**
	 * 更新对象
	 */
	public void update(Object t);

	/**
	 * 删除对象
	 */
	public void delete(Object t);

	/**
	 * get一个对象
	 */
	public T get(Class<T> clazz, String id);

	/**
	 * get一个对象
	 */
	public T get(Class<Object> clazz, Integer id);

	/**
	 * load一个对象
	 */
	public T load(Class<T> clazz, String id);

	/**
	 * load一个对象
	 */
	public T load(Class<T> clazz, Integer id);

	/**
	 * 根据hql查询对象
	 * 
	 * @param hql
	 *            hql语句
	 * @param map
	 *            参数值 无则传null或者""
	 * @return
	 */
	public List<?> findObjectByHql(String hql, Map<String, Object> map);

	/**
	 * 根据sql查询对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param map
	 *            参数值无则传null或者""
	 * @return
	 */
	public List<?> findObjectBySql(String sql, Map<String, Object> map);

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
	 * 根据hql查询总数
	 * 
	 * @param hql
	 * @param map
	 * @return
	 */
	public Integer getCountByHql(String hql, Map<String, Object> map);

	/**
	 * 根据sql查询总数
	 * 
	 * @param sql
	 * @param map
	 * @return
	 */
	public Integer getCountBySql(String sql, Map<String, Object> map);

	/**
	 * 根据HQL进行分页查询
	 * 
	 * @param hql
	 * @param map
	 * @param first
	 * @param max
	 * @return
	 */
	public List<?> findPageByHql(String hql, Map<String, Object> map, int first, int max);

	/**
	 * 根据SQL进行分页查询
	 * 
	 * @param sql
	 *            sql语句
	 * @param map
	 *            参数列表
	 * @param first
	 * @param max
	 * @return
	 */
	public List<?> findPageBySql(String sql, Map<String, Object> map, int first, int max);

	/**
	 * 更新可以用
	 */
	public void merge(T t);

	/**
	 * 清除session
	 */
	public void clear();

	/**
	 * 传入sql添加或者删除
	 * 
	 * @param sql
	 */
	public void insertOrDelete(String sql);

	/**
	 * 更新或者保存对象
	 * 
	 * @param obj
	 * @return
	 */
	public Object saveOrUpdate(Object obj);

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
	 * 
	 * 通过表名和表字段获取正确序号
	 * 
	 * @Title: getSequenceNo
	 * @param tableName
	 * @param filedName
	 * @return String
	 * @throws
	 * @author huy
	 */
	public String getSequenceNo(String tableName, String filedName);

	/**
	 * 
	 * 通过表名、表字段、条件数组、条件值数组获取正确序号
	 * 
	 * @Title: getSequenceNo
	 * @param tableName
	 * @param filedName
	 * @param fieldCondition
	 * @param fieldConditionValue
	 * @return String
	 * @throws
	 * @author huy
	 */
	public String getSequenceNo(String tableName, String filedName, String[] fieldCondition, String[] fieldConditionValue);

	/**
	 * 强转类型不行时用这个方法可以解决Object无法转换问题。
	 * 
	 * @Title: 查询实体collection公用方法
	 * 
	 * @param sql
	 * @param map
	 * @param entityType
	 * @return
	 * @return List<?>
	 * @throws
	 * @author Dul
	 */
	public List<?> findListBySql(String sql, Map<String, Object> map, Class<?> entityType);

	/**
	 * 
	 * @Title: flush
	 * @return void
	 * @throws
	 * @author Dul
	 */
	public void flush();

	/**
	 * @Title: 查询单一实体公用方法
	 * @param sql
	 * @param map
	 * @param entityType
	 * @return
	 * @return Object
	 * @throws
	 * @author Dul
	 */
	public Object findEntityBySql(String sql, Map<String, Object> map, Class<?> entityType);

	public List<?> findPageBySql(String sql, Map<String, Object> map, int first, int max, Class<?> klass);
	
	/**
	 * 
	 * 获取权限条件(获取操作人员所在医疗机构和下级所有医疗机构中全部的人员，并构建成('','')的样式的条件)
	 * 
	 * @Title: getPowerCondition
	 * @param securityUserBaseinfoId(操作人员ID)
	 * @param tenantId(租户ID)
	 * @return String
	 * @throws
	 * @author huy
	 */
	public String getPowerCondition(String securityStaffBaseinfoId,String tenantId);
}
