/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.tianjian.pm.business.IProjectStatService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.ProjectFinanceRecordForm;
import com.tianjian.pm.struts.form.ProjectStatForm;
import com.tianjian.security.struts.form.SessionForm;

/**
 * TODO
 * <p>Title: ProjectStatAction.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月28日上午9:24:44
 * @version 1.0
 * 
 */
public class ProjectStatAction extends BaseDispatchAction {

	
	private IProjectStatService  projectStatService;
	
	

	public IProjectStatService getProjectStatService() {
		return projectStatService;
	}

	public void setProjectStatService(IProjectStatService projectStatService) {
		this.projectStatService = projectStatService;
	}

	public ActionForward statprInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			
			ProjectStatForm hosform = (ProjectStatForm) form;
			projectStatService.statInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("statpr");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	/**
	*TODO
	* @Title: 统计项目情况
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author LengJiong
	*/
	public ActionForward stat(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			
			ProjectStatForm hosform = (ProjectStatForm) form;
			projectStatService.stat(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("statpr");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward statepInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			
			ProjectStatForm hosform = (ProjectStatForm) form;
			projectStatService.statInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("statep");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	*TODO
	* @Title: 按员工统计
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author LengJiong
	*/
	public ActionForward statep(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			SessionForm staff=(SessionForm) request.getSession().getAttribute("sessionForm");
			
			ProjectStatForm hosform = (ProjectStatForm) form;
			hosform.setCreateUserId(staff.getStaffCode());
			projectStatService.stat(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("statep");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	/**
	*TODO财务报表统计初始化
	* @Title: statfrpInit
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author LengJiong
	*/
	public ActionForward statfrpInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			
			ProjectStatForm hosform = (ProjectStatForm) form;
			projectStatService.statInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("statfrp");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	*TODO
	* @Title: 财务统计
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author LengJiong
	*/
	public ActionForward statfrp(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			SessionForm staff=(SessionForm) request.getSession().getAttribute("sessionForm");
			
			ProjectStatForm hosform = (ProjectStatForm) form;
			hosform.setCreateUserId(staff.getStaffCode());
			projectStatService.statfrp(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("statfrp");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
}
