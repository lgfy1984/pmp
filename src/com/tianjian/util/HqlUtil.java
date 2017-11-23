/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.util;

import java.util.List;
import java.util.Map;

/**
 * hql 查询条件判断
 * <p>
 * Title: HqlUtil.java
 * </p>
 * <p>
 * Copyright: Copyright (c) 2013
 * </p>
 * <p>
 * Company: Tianjian
 * </p>
 * <p>
 * team: TianjianTeam
 * </p>
 * <p>
 * 
 * @author: Dongling
 *          </p>
 * @date 2014年5月6日上午11:26:22
 * @version 1.0
 * 
 */
public class HqlUtil {

	/**
	 * 根据参数来判断是否使用where或者是and链接HQL
	* @Title: getWhereOrAndClause
	* @param params 参数对象
	* @return String 返回where或者是and
	* @throws
	* @author Puzhijun
	 */
	public static String getWhereOrAndClause(List<Object> params) {
		return params == null || params.size() == 0 ? " where " : " and ";
	}

	/**
	 * 根据参数来判断是否使用where或者是and链接HQL
	 * @Title: getWhereOrAndClause
	 * @param params 参数对象
	 * @return String 返回where或者是and
	 * @throws
	 * @author Puzhijun
	 */
	public static String getWhereOrAndClause(Map<String, Object> paramMap) {
		return paramMap == null || paramMap.size() == 0 ? " where " : " and ";
	}

	/**
	 * @Title: 根据StringBuffer判断where关键字 尽量少用 <br/>
	 *         推荐使用 getWhereOrAndClause 和 getClauseStr(Map<String, Object>
	 *         params)
	 * @param sb
	 * @return
	 * @return String
	 * @throws
	 * @author Dul
	 */
	public static String getClauseStr(StringBuffer sb) {
		return sb == null || !(sb.toString().indexOf("where") >= 0) ? " where "
				: " and ";
	}

	/**
	 * @Title: 根据Map判断where关键字
	 * @param params
	 * @return
	 * @return String
	 * @throws
	 * @author Dul
	 */
	public static String getClauseStr(Map<String, Object> params) {
		return params.isEmpty() ? " where " : " and ";
	}
	
	/**
	 * @Title: 根据Map判断where关键字,用or拼接
	 * @param params
	 * @return
	 * @return String
	 * @throws
	 * @author Dul
	 */
	public static String getClauseStrByOr(Map<String, Object> params) {
		return params.isEmpty() ? " where (" : " or ";
	}
}
