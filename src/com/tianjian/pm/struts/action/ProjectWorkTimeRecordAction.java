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

import com.tianjian.pm.business.IProjectWorkTimeRecordService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;
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
public class ProjectWorkTimeRecordAction extends BaseDispatchAction{

	
	private IProjectWorkTimeRecordService  projectWorkTimeRecordService;

	public IProjectWorkTimeRecordService getProjectWorkTimeRecordService() {
		return projectWorkTimeRecordService;
	}

	public void setProjectWorkTimeRecordService(
			IProjectWorkTimeRecordService projectWorkTimeRecordService) {
		this.projectWorkTimeRecordService = projectWorkTimeRecordService;
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
			
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			hosform.setCreateUserName(staff.getStaffName());
			projectWorkTimeRecordService.addInit(hosform);
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
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			projectWorkTimeRecordService.updateInit(hosform);
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
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			String message ="修改成功!";
			hosform.setMessage(message);
			projectWorkTimeRecordService.update(hosform);
			return this.queryProjectWorkTimeinfo(mapping, hosform, request, response);
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
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			projectWorkTimeRecordService.delete(hosform);
			String message ="删除成功!";
			
			hosform.setMessage(message);
			return this.queryProjectWorkTimeinfo(mapping, hosform, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
	
	/**
	*TODO
	* @Title: check
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author LengJiong
	*/
	public ActionForward check(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="删除患者咨询信息";
		try {
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			projectWorkTimeRecordService.check(hosform);
			String message ="审核通过!";
			
			hosform.setMessage(message);
			return this.checkList(mapping, hosform, request, response);
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
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			String type=request.getParameter("type");
			if("1".equals(type)){
				hosform.setIdHidden(request.getParameter("id"));
			}
			projectWorkTimeRecordService.updateInit(hosform);
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
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			//
			
			projectWorkTimeRecordService.save(hosform);
			String msg="保存成功！";
			projectWorkTimeRecordService.addInit(hosform);
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
	public ActionForward queryProjectWorkTimeinfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectWorkTimeRecordForm hosform =(ProjectWorkTimeRecordForm) form;
			String statues =request.getParameter("executedFlag");
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
			int recordCount = projectWorkTimeRecordService.getProjectWorkTimeRecordCount(hosform.getProjectBaseinfoIdCase(), hosform.getProjectTaskCodeCase(),
					hosform.getWorkDate(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase());
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
			projectWorkTimeRecordService.initForm(hosform);
			projectWorkTimeRecordService.getProjectWorkTimeRecordSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward checkList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectWorkTimeRecordForm hosform =(ProjectWorkTimeRecordForm) form;
			String statues =request.getParameter("executedFlag");
			if(statues!=null&&statues.equals("1")){
				//hosform.setExecutedFlagIdHidden("1");
			}
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			hosform.setStatusCase("0");
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectWorkTimeRecordService.getProjectWorkTimeRecordCount(hosform.getProjectBaseinfoIdCase(), hosform.getProjectTaskCodeCase(),
					hosform.getWorkDate(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase());
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
			projectWorkTimeRecordService.initForm(hosform);
			projectWorkTimeRecordService.getProjectWorkTimeRecordSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("check");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward findProjectList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String projectCodeCase = request.getParameter("projectCodeCase");
			String projectNameCase = request.getParameter("projectNameCase");
			String timeCase = request.getParameter("timeCase");
			// 转码

			String pageIndex = request.getParameter("pageIndex");
			projectNameCase = java.net.URLDecoder.decode(projectNameCase, "UTF-8");
			projectCodeCase = java.net.URLDecoder.decode(projectCodeCase, "UTF-8");
			ProjectWorkTimeRecordForm smForm = (ProjectWorkTimeRecordForm) form;
			smForm.setProjectNameCase(projectNameCase);
			smForm.setProjectCodeCase(projectCodeCase);
			PageForm page = new PageForm();
			page.setPageIndex(pageIndex);
			List<ProjectBaseInfoVo> groups = projectWorkTimeRecordService.findProjectList(smForm, page);
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
	public ActionForward findProjectPage(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String pageIndex = request.getParameter("pageIndex");
			ProjectWorkTimeRecordForm smForm = (ProjectWorkTimeRecordForm) form;
			PageForm page = new PageForm();
			int count = projectWorkTimeRecordService.findProjectCount(smForm, null);
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
