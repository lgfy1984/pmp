/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.tianjian.pm.business.IProjectBaseinfoService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.pm.struts.form.SecurityStaffBaseinfoVo;
import com.tianjian.security.struts.form.SessionForm;
import com.tianjian.util.comm.PageBean;

import net.sf.json.JSONArray;

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
		try {
			
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			hosform.setCreateUserName(staff.getStaffName());
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
		try {
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			String message ="修改成功!";
			hosform.setMessage(message);
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
		try {
			ProjectBaseInfoForm hosform = (ProjectBaseInfoForm) form;
			projectBaseinfoService.delete(hosform);
			String message ="删除成功!";
			
			hosform.setMessage(message);
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
			//
			
			projectBaseinfoService.save(hosform);
			String msg="保存成功！";
//			msg=java.net.URLEncoder.encode(msg, "GB2312");
//			StringBuffer url = request.getRequestURL();
//			url.append("?verbId=addInit&message="+msg);
//			response.sendRedirect(url.toString());//从定向
			projectBaseinfoService.addInit(hosform);
			hosform.setMessage(msg);
			request.setAttribute("data", hosform);
			return mapping.findForward("add");	
			
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
		try {
			ProjectBaseInfoForm hosform =(ProjectBaseInfoForm) form;
			String statues =request.getParameter("executedFlag");
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectBaseinfoService.getProjectBaseInfoCount(hosform.getProjectClassCodeHidden(), hosform.getProjectNameHidden(),
					hosform.getOnlineTimeHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId());
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
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward findStaffList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
			String staffCode = request.getParameter("staffCode");
			String staffName = request.getParameter("staffName");
			// 转码

			String pageIndex = request.getParameter("pageIndex");
			staffCode = java.net.URLDecoder.decode(staffCode, "UTF-8");
			staffName = java.net.URLDecoder.decode(staffName, "UTF-8");
			ProjectBaseInfoForm smForm = (ProjectBaseInfoForm) form;
			smForm.setStaffName(staffName);
			smForm.setStaffCode(staffCode);
			smForm.setTenantId(staff.getTenantId());
			
			PageForm page = new PageForm();
			page.setPageIndex(pageIndex);
			List<SecurityStaffBaseinfoVo> groups = projectBaseinfoService.findStaffList(smForm, page);
			// System.out.println(json);
			JSONArray jsonArray = null;
			response.setCharacterEncoding("utf-8");
			jsonArray = JSONArray.fromObject(groups);
//			System.out.println(jsonArray.toString());
			response.getWriter().print(jsonArray);// JSON返回数据
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/***
	 * 获取短信用户分页信息
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward findStaffPage(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		try {

			SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
			String pageIndex = request.getParameter("pageIndex");
			ProjectBaseInfoForm smForm = (ProjectBaseInfoForm) form;

			smForm.setTenantId(staff.getTenantId());
			PageForm page = new PageForm();
			int count = projectBaseinfoService.findStaffCount(smForm, null);
			Integer pageCount = 0;
			Integer r = Integer.valueOf(count)
					% (Integer.parseInt(page.getPageSize()));
			if (r == 0) {
				pageCount = Integer.valueOf(count)
						/ (Integer.parseInt(page.getPageSize()));
			} else {
				pageCount = Integer.valueOf(count)
						/ (Integer.parseInt(page.getPageSize())) + 1;
			}
			page.setCount(String.valueOf(count));
			page.setPageIndex(pageIndex);
			page.setPageCount(pageCount.toString());
			String json = "{\"count\":" + "\"" + page.getCount() + "\","
					+ "\"pageIndex\":" + "\"" + page.getPageIndex() + "\","
					+ "\"pageCount\":" + "\"" + page.getPageCount() + "\","
					+ "\"pageSize\":" + "\"" + page.getPageSize() + "\"}";
//		System.out.println(json.toString());
			response.reset();
			response.setContentType("text/plain;charset=utf-8");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragrma", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json);
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
