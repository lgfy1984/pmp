/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.business.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.tianjian.comm.dao.BaseDAO;
import com.tianjian.pm.bean.ProjectClassDict;
import com.tianjian.pm.business.IProjectClassService;
import com.tianjian.pm.struts.form.ProjectClassForm;
import com.tianjian.pm.struts.form.ProjectDictVo;
import com.tianjian.util.Converter;
import com.tianjian.util.HqlUtil;

/**
 * TODO
 * <p>Title: ProjectClassServiceImpl.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年12月11日下午5:01:35
 * @version 1.0
 * 
 */
public class ProjectClassServiceImpl implements IProjectClassService {

	
	private BaseDAO<?> baseDAO;
	
	public BaseDAO<?> getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO<?> baseDAO) {
		this.baseDAO = baseDAO;
	}
	public ProjectClassDict checkData(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where a.itemCode=:itemCode ");
		map.put("itemCode", id);
		ProjectClassDict pcd  = (ProjectClassDict)baseDAO.findObjByHql(hql.toString(), map);
		return pcd;
	}
	@Override
	public void updateInit(ProjectClassForm form) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectClassDict pcd  = (ProjectClassDict)baseDAO.findObjByHql(hql.toString(), map);
		setForm(form,pcd);
	}

	@Override
	public void update(ProjectClassForm form) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectClassDict pcd  = (ProjectClassDict)baseDAO.findObjByHql(hql.toString(), map);
		setData(form,pcd);
		baseDAO.saveOrUpdate(pcd);
	}

	@Override
	public void addInit(ProjectClassForm form) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ProjectClassForm form) {
		
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectClassDict pcd  = (ProjectClassDict)baseDAO.findObjByHql(hql.toString(), map);
		baseDAO.delete(pcd);
	}

	@Override
	public void save(ProjectClassForm form) {
		// TODO Auto-generated method stub
		ProjectClassDict pcd  = new ProjectClassDict();
		setData(form,pcd);
		baseDAO.save(pcd);
	}

	@Override
	public void detail(ProjectClassForm form) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectClassDict pcd  = (ProjectClassDict)baseDAO.findObjByHql(hql.toString(), map);
		setForm(form,pcd);
	}

	@Override
	public void getSearch(ProjectClassForm form, int curCount, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where 1=1 ");
		if (StringUtils.isNotBlank(form.getItemCodeCase())) {
			hql.append(" and a.itemCode=:itemCode  ");
			map.put("itemCode", form.getItemCodeCase());
		}
		if (StringUtils.isNotBlank(form.getItemNameCase())) {
			hql.append(" and a.itemName=:itemName  ");
			map.put("itemName", form.getItemNameCase());
		}
		if (StringUtils.isNotBlank(form.getInputCodeCase())) {
			hql.append(" and a.inputCode=:inputCode  ");
			map.put("inputCode", form.getInputCodeCase());
		}
		List<?> list  = baseDAO.findPageByHql(hql.toString(), map, curCount, pageSize);
		if(list!=null && list.size()>0){
			List<ProjectDictVo> pdvl = new ArrayList<ProjectDictVo>();
			for(int i=0 ;i<list.size();i++){
				ProjectDictVo pdv = new ProjectDictVo();
				ProjectClassDict pcd = (ProjectClassDict)list.get(i);
				pdv.setItemCode(Converter.toBlank(pcd.getItemCode()));
				pdv.setItemName(Converter.toBlank(pcd.getItemName()));
				pdv.setInputCode(Converter.toBlank(pcd.getInputCode()));
				
				
				pdvl.add(pdv);
			}
			form.setPdvl(pdvl);
		}
	}

	@Override
	public int getDataCount(String itemCode, String itemName,
			String inputCode) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where 1=1");
		if (StringUtils.isNotBlank(itemCode)) {
			hql.append(" and a.itemCode=:itemCode  ");
			map.put("itemCode", itemCode);
		}
		if (StringUtils.isNotBlank(itemName)) {
			hql.append(" and a.itemName=:itemName  ");
			map.put("itemName", itemName);
		}
		if (StringUtils.isNotBlank(inputCode)) {
			hql.append(" and a.inputCode=:inputCode  ");
			map.put("inputCode", inputCode);
		}
		int  count  = baseDAO.getCountByHql(hql.toString(), map);
		return count;
	}
	
	public void setForm(ProjectClassForm form,ProjectClassDict data){
	
	
		form.setItemCode(Converter.toBlank(data.getItemCode()));
		form.setItemName(Converter.toBlank(data.getItemName()));
		form.setInputCode(Converter.toBlank(data.getInputCode()));
		form.setComments(Converter.toBlank(data.getComments()));
		
	}
	
	public void setData(ProjectClassForm form,ProjectClassDict data){
		
		data.setItemCode(Converter.toBlank(form.getItemCode()));
		data.setItemName(Converter.toBlank(form.getItemName()));
		data.setInputCode(Converter.toBlank(form.getInputCode()));
		data.setComments(Converter.toBlank(form.getComments()));
			
	}

	@Override
	public void initForm(ProjectClassForm form) {
		// TODO Auto-generated method stub
		
	}
	
}
