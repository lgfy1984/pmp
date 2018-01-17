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
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.tianjian.comm.dao.BaseDAO;
import com.tianjian.pm.bean.ProjectClassDict;
import com.tianjian.pm.bean.ProjectTaskDict;
import com.tianjian.pm.business.IProjectTaskService;
import com.tianjian.pm.struts.form.ProjectDictVo;
import com.tianjian.pm.struts.form.ProjectTaskForm;
import com.tianjian.util.Converter;

/**
 * TODO
 * <p>Title: ProjectTaskServiceImpl.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年12月11日下午5:02:12
 * @version 1.0
 * 
 */
public class ProjectTaskServiceImpl implements IProjectTaskService {
    
	private BaseDAO<?> baseDAO;
	
	public BaseDAO<?> getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO<?> baseDAO) {
		this.baseDAO = baseDAO;
	}
	

	@Override
	public void updateInit(ProjectTaskForm form) {
		initForm(form);
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectTaskDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectTaskDict pcd  = (ProjectTaskDict)baseDAO.findObjByHql(hql.toString(), map);
		setForm(form,pcd);
	}

	@Override
	public void update(ProjectTaskForm form) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectTaskDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectTaskDict pcd  = (ProjectTaskDict)baseDAO.findObjByHql(hql.toString(), map);
		setData(form,pcd);
		baseDAO.saveOrUpdate(pcd);
	}

	@Override
	public void addInit(ProjectTaskForm form) {
		// TODO Auto-generated method stub
		initForm(form);
		
	}

	@Override
	public void delete(ProjectTaskForm form) {
		
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectTaskDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		ProjectTaskDict pcd  = (ProjectTaskDict)baseDAO.findObjByHql(hql.toString(), map);
		baseDAO.delete(pcd);
	}

	@Override
	public void save(ProjectTaskForm form) {
		// TODO Auto-generated method stub
		ProjectTaskDict pcd  = new ProjectTaskDict();
		setData(form,pcd);
		baseDAO.save(pcd);
	}

	@Override
	public void detail(ProjectTaskForm form) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectTaskDict a where a.itemCode=:itemCode ");
		map.put("itemCode", form.getItemCodeHidden());
		
		ProjectTaskDict pcd  = (ProjectTaskDict)baseDAO.findObjByHql(hql.toString(), map);
		setForm(form,pcd);
	}

	@Override
	public void getSearch(ProjectTaskForm form, int curCount, int pageSize) {
		initForm(form);
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectTaskDict a where 1=1  ");
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
		hql.append("order by a.itemCode DESC");
		List<?> list  = baseDAO.findPageByHql(hql.toString(), map, curCount, pageSize);
		if(list!=null && list.size()>0){
			List<ProjectDictVo> pdvl = new ArrayList<ProjectDictVo>();
			for(int i=0 ;i<list.size();i++){
				ProjectDictVo pdv = new ProjectDictVo();
				ProjectTaskDict pcd = (ProjectTaskDict)list.get(i);
				pdv.setItemCode(Converter.toBlank(pcd.getItemCode()));
				pdv.setItemName(Converter.toBlank(pcd.getItemName()));
				pdv.setInputCode(Converter.toBlank(pcd.getInputCode()));
				pdv.setItemClassName(this.changeClassId(Converter.toBlank(pcd.getItemClass()), form));
				
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
		StringBuffer hql = new StringBuffer("from ProjectTaskDict a where 1=1 ");
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
	
	public void setForm(ProjectTaskForm form,ProjectTaskDict data){
	
	
		form.setItemCode(Converter.toBlank(data.getItemCode()));
		form.setItemName(Converter.toBlank(data.getItemName()));
		form.setInputCode(Converter.toBlank(data.getInputCode()));
		form.setComments(Converter.toBlank(data.getComments()));
		form.setItemClass(Converter.toBlank(data.getItemClass()));
		form.setProjectClassName(this.changeClassId(Converter.toBlank(data.getItemClass()), form));
		
	}
	
	public void setData(ProjectTaskForm form,ProjectTaskDict data){
		
		data.setItemCode(Converter.toBlank(form.getItemCode()));
		data.setItemName(Converter.toBlank(form.getItemName()));
		data.setInputCode(Converter.toBlank(form.getInputCode()));
		data.setComments(Converter.toBlank(form.getComments()));
		data.setItemClass(Converter.toBlank(form.getItemClass()));
			
	}

	@Override
	public void initForm(ProjectTaskForm form) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("from ProjectClassDict a where 1=1 ");
		List<?> list1 = baseDAO.findObjectByHql(hql.toString(), map);
		if (list1 != null && list1.size() > 0) {
			Map<String, String> temp = new LinkedHashMap<String, String>();

			for (int i = 0; i < list1.size(); i++) {
				ProjectClassDict pcd = (ProjectClassDict)list1.get(i);
				String tempItemCode =Converter.toBlank(pcd.getItemCode());
				String tempItemName =Converter.toBlank(pcd.getItemName());
				temp.put(tempItemCode, tempItemName);
			}
			form.setProjectClass(temp);
		}
	}
	
	private String changeClassId(String id, ProjectTaskForm form) {
		Map<String, String> temp = form.getProjectClass();
		if (temp != null) {
			Iterator<String> iter = temp.keySet().iterator();
			while (iter.hasNext()) {
				String key = iter.next();
				String value = temp.get(key);
				if (key.equals(id)) {
					return value;
				}
			}
		}
		return "";
	}
}
