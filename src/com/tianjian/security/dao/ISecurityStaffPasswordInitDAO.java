package com.tianjian.security.dao;

import java.util.List;

import com.tianjian.security.bean.SecuritySystemUsers;

public interface ISecurityStaffPasswordInitDAO {

	public SecuritySystemUsers findById(String id);

	public void update(SecuritySystemUsers securitySystemUsers);

	public void save(SecuritySystemUsers securitySystemUsers);

	/***************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
	 * 根据条件获取操作员列表分页显示
	 */
	public List<?> getStaffs(String staffId, String staffName, String inputCode, String itemCode,String staffHspId,String hspConfigId, String tenantId, String orderNo,int from, int length);
	

	/***************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
	 * 获取某个机构内操作员列表
	 */
	public int getStaffsCount(String staffId, String staffName, String inputCode, String itemCode,String staffHspId,String hspConfigId, String tenantId);
	/**
	 * 从指定的表中获取ID和名称列
	 */
	public List<?> getIdNames(String table, String id, String name);

	/**
	 * 获取机构列表
	 */
	public List<?> getHospitals();

	/**
	 * 从指定的表中根据条件获取列值
	 */
	public String getNameById(String table, String id, String name, String idValue);
	/**
	 * 获取机构列表当前页显示值
	 */
	public List<?> findHspList(String flag,String inputCode,String hspType, int curCount, int pageSize);
}