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

import com.tianjian.pm.business.IProjectBaseinfoService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.security.struts.form.SessionForm;
import com.tianjian.tenant.util.TenantIdHolder;
import com.tianjian.util.comm.PageBean;

/**
 * TODO
 * <p>Title: ProjectBaseInfoAction.java</p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: Tianjian</p>
 * <p>team: TianjianTeam</p>
 * @author: LengJiong
 * @date 2017年11月22日上午10:59:39
 * @version 1.0
 * 
 */
public class ProjectBaseInfoAction extends BaseDispatchAction{
	

	private IProjectBaseinfoService projectBaseinfoService;
	
	
	
	public IProjectBaseinfoService getProjectBaseinfoService() {
		return projectBaseinfoService;
	}
	public void setProjectBaseinfoService(
			IProjectBaseinfoService projectBaseinfoService) {
		this.projectBaseinfoService = projectBaseinfoService;
	}
	/**
	 * 添加初始化页面
	*
	* @Title: addInit
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author lengj
	 */
	public ActionForward addInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff=(SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="添加咨询初始化界面";
		try {
			
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			String incomingTelegramNo = request.getParameter("incomingTelegramNo");//获得来电号码
			String message=request.getParameter("msg");
			
			projectBaseinfoService.addInit(hosform);
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
		SessionForm staff=(SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="修改患者咨询信息初始化界面";
		try {
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			projectBaseinfoService.updateInit(hosform);
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
		String comments="修改患者咨询信息";
		try {
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			String hspId =staff.getStaffHospitalId();
			String tenantId =  TenantIdHolder.get();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			projectBaseinfoService.update(hosform);
			return this.queryProjectBaseinfo(mapping, hosform, request, response);
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
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="删除患者咨询信息";
		try {
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			projectBaseinfoService.delete(hosform);
			String message ="删除成功!";
			
			//hosform.setMessage(message);
			return this.queryProjectBaseinfo(mapping, hosform, request, response);
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
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="查看咨询详细信息";
		try {
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			String type=request.getParameter("type");
			if("1".equals(type)){
				hosform.setIdHidden(request.getParameter("id"));
			}
			projectBaseinfoService.updateInit(hosform);
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
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			String flog = request.getParameter("toFlog");
			//
			
			projectBaseinfoService.save(hosform);
			if("toadd".equals(flog)){
				String msg="保存成功！";
				msg=java.net.URLEncoder.encode(msg, "UTF-8");
				StringBuffer url = request.getRequestURL();
				url.append("?verbId=addInit&msg="+msg);
				response.sendRedirect(url.toString());//从定向
				return null;
			}else{
				projectBaseinfoService.addInit(hosform);
				//hosform.setMessage("咨询已保存,录入常见咨询信息！");
				request.setAttribute("data", hosform);
				return mapping.findForward("tooffen");
			}
			
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
	public ActionForward queryProjectBaseinfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="查看咨询列表信息";
		try {
			ProjectBaseInfoForm hosform =(ProjectBaseInfoForm) form;
			String statues =request.getParameter("executedFlag");
			String flog = request.getParameter("toFlog");
			String orderNo = request.getParameter("orderNo");
			String sort = request.getParameter("sort");
			if(statues!=null&&statues.equals("1")){
				//hosform.setExecutedFlagIdHidden("1");
			}
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectBaseinfoService.getProjectBaseInfoCount(hosform.getProjectClass(), hosform.getProjectName(),
					hosform.getOnlineTime(), hosform.getStartTime(), hosform.getEndTime(),hosform.getCreateUserId());
			pb.setCount(recordCount);
			String pageString = request.getParameter("cur_page");
			int pageSize = 10;
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
			projectBaseinfoService.initForm(hosform);
			projectBaseinfoService.getProjectBaseInfoSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
//			if(statues!=null&&statues.equals("1")&&"tooffen".equals(flog)){
//				return mapping.findForward("tooffen");
//			}else if(statues!=null&&statues.equals("1")){
//				return mapping.findForward("undolist");	
//			}else{
//				return mapping.findForward("query");			
//			}
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
}
