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

import com.tianjian.comm.business.ICommConfigInputDictService;
import com.tianjian.pm.business.IProjectTaskService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.ProjectTaskForm;
import com.tianjian.security.struts.form.SessionForm;
import com.tianjian.util.comm.PageBean;

/**
 * TODO
 * <p>Title: ProjectTaskAction.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年12月11日下午2:08:30
 * @version 1.0
 * 
 */
public class ProjectTaskAction  extends BaseDispatchAction {
	
	private IProjectTaskService projectTaskService;

	private ICommConfigInputDictService commConfigInputDictService;

	public IProjectTaskService getProjectTaskService() {
		return projectTaskService;
	}

	public void setProjectTaskService(IProjectTaskService projectTaskService) {
		this.projectTaskService = projectTaskService;
	}
	
	public ICommConfigInputDictService getCommConfigInputDictService() {
		return commConfigInputDictService;
	}

	public void setCommConfigInputDictService(
			ICommConfigInputDictService commConfigInputDictService) {
		this.commConfigInputDictService = commConfigInputDictService;
	}

	public ActionForward addInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff=(SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			
			ProjectTaskForm hosform = (ProjectTaskForm) form;
			hosform.setCreateUserName(staff.getStaffName());
			projectTaskService.addInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("add");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	 * 修改初始化页面
	*
	* @Title: updateInit
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author lengj
	 */
	public ActionForward updateInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			ProjectTaskForm hosform = (ProjectTaskForm) form;
			projectTaskService.updateInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("update");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	 * 修改
	*
	* @Title: update
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author lengj
	 */
	public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectTaskForm hosform = (ProjectTaskForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			hosform.setInputCode(commConfigInputDictService.getInputCode(hosform.getItemName()));
			String message ="修改成功!";
			hosform.setMessage(message);
			projectTaskService.update(hosform);
			return this.query(mapping, hosform, request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	 * 删除
	*
	* @Title: delete
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author lengj
	 */
	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			ProjectTaskForm hosform = (ProjectTaskForm) form;
			projectTaskService.delete(hosform);
			String message ="删除成功!";
			
			hosform.setMessage(message);
			return this.query(mapping, hosform, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
	/**
	 * 查看咨询详细
	*
	* @Title: detail
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author lengj
	 */
	public ActionForward detail(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			ProjectTaskForm hosform = (ProjectTaskForm) form;
			String type=request.getParameter("type");
			if("1".equals(type)){
				hosform.setIdHidden(request.getParameter("id"));
			}
			projectTaskService.updateInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("detail");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	/**
	 * 保存咨询主记录信息
	*
	* @Title: add
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author Allenluo
	 */
	public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		//String comments="保存患者咨询主记录信息";
		try {
			ProjectTaskForm hosform = (ProjectTaskForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			//

			hosform.setInputCode(commConfigInputDictService.getInputCode(hosform.getItemName()));
			projectTaskService.save(hosform);
			String msg="保存成功！";
//			msg=java.net.URLEncoder.encode(msg, "GB2312");
//			StringBuffer url = request.getRequestURL();
//			url.append("?verbId=addInit&message="+msg);
//			response.sendRedirect(url.toString());//从定向
			projectTaskService.addInit(hosform);
			hosform.setMessage(msg);
			request.setAttribute("data", hosform);
			return this.query(mapping, hosform, request, response);
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	/**
	 * 咨询列表
	*
	* @Title: queryConsultation
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author lengj
	 */
	public ActionForward query(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectTaskForm hosform =(ProjectTaskForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectTaskService.getDataCount(hosform.getItemCodeCase(), hosform.getItemNameCase(),
					hosform.getInputCodeCase());
			pb.setCount(recordCount);
			String pageString = request.getParameter("cur_page");
			int pageSize = 5;
			pb.setPageSize(pageSize);
			if (pageString == null || pageString.equals("") || pageString.equals("0")) {
				page = 1;
				pb.setPage(1);
				count = (page - 1) * pageSize;
			} else {
				page = Integer.parseInt(pageString);
				pb.setPage(page);
				count = (page - 1) * pageSize;
			}
			request.setAttribute("pb", pb);
			// ////// page end ////////////////////////
			projectTaskService.initForm(hosform);
			projectTaskService.getSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	
}
