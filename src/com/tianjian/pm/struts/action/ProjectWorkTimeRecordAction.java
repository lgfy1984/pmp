/**
 * Copyright (c) 2013 Tianjian, Inc. All rights reserved.
 * This software is the confidential and proprietary information of 
 * Tianjian, Inc. You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the 
 * license agreement you entered into with Tianjian.
 */
package com.tianjian.pm.struts.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.tianjian.pm.business.IProjectWorkTimeRecordService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.ProjectWorkTimeRecordForm;
import com.tianjian.pm.struts.form.ProjectWorkVo;
import com.tianjian.security.struts.form.SessionForm;
import com.tianjian.util.Converter;
import com.tianjian.util.comm.PageBean;
import com.tianjian.util.excel.ExcelHelper;
import com.tianjian.util.excel.HssfExcelHelper;
import com.tianjian.util.excel.JxlExcelHelper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
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
			hosform.setTaskClass(null);
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
			hosform.setOperFlag("0");
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
	
	
	public ActionForward deleteNoCheck(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		String comments="删除患者咨询信息";
		try {
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			projectWorkTimeRecordService.delete(hosform);
			String message ="删除成功!";
			
			hosform.setMessage(message);
			return this.querynocheck(mapping, hosform, request, response);
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
			String message ="";
			if(hosform.getStatus().equals("1")){
				 message ="审核通过!";
			}
			
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
	 * 
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
			
			if(hosform.getOperFlag().equals("")){
				projectWorkTimeRecordService.save(hosform);
				hosform.setMessage("保存成功");
				hosform.setOperFlag("1");
			}else{
				if(hosform.getOperFlag().equals("0")){
				  projectWorkTimeRecordService.save(hosform);
			      hosform.setMessage("修改成功");
				}
			}
			projectWorkTimeRecordService.addInit(hosform);
			request.setAttribute("data", hosform);
			return this.queryProjectWorkTimeinfo(mapping, hosform, request, response);	
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	/**
	 * 
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
	public ActionForward addNoCheck(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		//String comments="保存患者咨询主记录信息";
		try {
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			//
			if(hosform.getOperFlag().equals("")){
				projectWorkTimeRecordService.save(hosform);
				hosform.setMessage("保存成功");
				hosform.setOperFlag("1");
			}else{
				if(hosform.getOperFlag().equals("0")){
				  projectWorkTimeRecordService.save(hosform);
			      hosform.setMessage("修改成功");
				}
			}
			projectWorkTimeRecordService.addInit(hosform);
			request.setAttribute("data", hosform);
			return this.querynocheck(mapping, hosform, request, response);	
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	 * 列表
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
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			if(hosform.getStartTimeHidden().equals("") && hosform.getEndTimeHidden().equals("") ){
				Calendar currentDate = new GregorianCalendar();
				//currentDate.set(Calendar.DATE, currentDate.get(Calendar.DATE) - 1);
				hosform.setEndTimeHidden(sdf.format((Date)currentDate.getTime().clone()));
				
				
				currentDate.set(Calendar.DATE, currentDate.get(Calendar.DATE) - 14);  
				hosform.setStartTimeHidden(sdf.format((Date)currentDate.getTime().clone()));
			}
			
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectWorkTimeRecordService.getProjectWorkTimeRecordCount(hosform.getProjectNameCase(), hosform.getProjectClassCodeCase(),
					hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase(),hosform.getNoLimit());
			pb.setCount(recordCount);
			String pageString ="";
			if(!hosform.getOperFlag().equals("1")){
                pageString = request.getParameter("cur_page");
			}
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
			projectWorkTimeRecordService.initForm(hosform);
			if(hosform.getFlag().equals("1")){
				projectWorkTimeRecordService.updateInit(hosform);
				hosform.setOperFlag("0");
			}
			projectWorkTimeRecordService.getProjectWorkTimeRecordSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	/**
	 * 列表
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
	public ActionForward querynocheck(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectWorkTimeRecordForm hosform =(ProjectWorkTimeRecordForm) form;
			//String createUserId    =   staff.getStaffId(); 
			//String createUserName  =   staff.getStaffName();
			//hosform.setCreateUserId(createUserId);
			//hosform.setCreateUserName(createUserName);
//			if(hosform.getStartTimeHidden().equals("") && hosform.getEndTimeHidden().equals("") ){
//				Calendar currentDate = new GregorianCalendar();
//				//currentDate.set(Calendar.DATE, currentDate.get(Calendar.DATE) - 1);
//				hosform.setEndTimeHidden(sdf.format((Date)currentDate.getTime().clone()));
//				
//				
//				currentDate.set(Calendar.DATE, currentDate.get(Calendar.DATE) - 14);  
//				hosform.setStartTimeHidden(sdf.format((Date)currentDate.getTime().clone()));
//			}
			
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			
			hosform.setNoLimit("1");//设置查询记录不受限制
			int recordCount = projectWorkTimeRecordService.getProjectWorkTimeRecordCount(hosform.getProjectNameCase(), hosform.getProjectClassCodeCase(),
					hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase(),hosform.getNoLimit());
			pb.setCount(recordCount);

			String pageString ="";
			if(!hosform.getOperFlag().equals("1")){
                pageString = request.getParameter("cur_page");
			}
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
			projectWorkTimeRecordService.initForm(hosform);
			if(hosform.getFlag().equals("1")){
				hosform.setOperFlag("0");
				projectWorkTimeRecordService.updateInit(hosform);
			}
			projectWorkTimeRecordService.getProjectWorkTimeRecordSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("listnocheck");	
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
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();

			if(hosform.getStartTimeHidden().equals("") && hosform.getEndTimeHidden().equals("") ){
				Calendar currentDate = new GregorianCalendar();
				//currentDate.add(Calendar.DATE, -1);
				hosform.setEndTimeHidden(sdf.format((Date)currentDate.getTime().clone()));
				
	
				currentDate.add(Calendar.DATE, -7);
				currentDate.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY); 
				hosform.setStartTimeHidden(sdf.format((Date)currentDate.getTime().clone()));
			}
		
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectWorkTimeRecordService.getProjectWorkTimeRecordCount(hosform.getProjectNameCase(), hosform.getProjectClassCodeCase(),
					hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase(),hosform.getNoLimit());
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
			String projectNameCase = request.getParameter("projectNameCase2");
			//String timeCase = request.getParameter("timeCase");
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
	
	
	public ActionForward findProjectTask(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String projectClassCode = request.getParameter("projectClassCode");
			// 转码

			projectClassCode = java.net.URLDecoder.decode(projectClassCode, "UTF-8");
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			hosform.setProjectClassCode(projectClassCode);
			projectWorkTimeRecordService.addInit(hosform);
			

			JSONObject  jsonobje = null;
			response.setCharacterEncoding("utf-8");
			jsonobje = jsonobje.fromObject(hosform.getTaskClass());
//			System.out.println(jsonArray.toString());
			response.getWriter().print(jsonobje);// JSON返回数据
			response.flushBuffer();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ActionForward exportFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		ProjectWorkTimeRecordForm hosform =(ProjectWorkTimeRecordForm) form;
		try {

			request.setCharacterEncoding("utf-8");
			
		} catch (UnsupportedEncodingException e1) {			
			e1.printStackTrace();
		}
		String createUserId    =   staff.getStaffId(); 
		String createUserName  =   staff.getStaffName();
		hosform.setCreateUserId(createUserId);
		hosform.setCreateUserName(createUserName);
		// ////// page start ////////////////////////
		int count=0;
		int recordCount = projectWorkTimeRecordService.getProjectWorkTimeRecordCount(hosform.getProjectBaseinfoIdCase(), hosform.getProjectClassCodeCase(),
				hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase(),hosform.getNoLimit());
		
		// ////// page end ////////////////////////
		projectWorkTimeRecordService.getProjectWorkTimeRecordSearch(hosform, count, recordCount);
		if("1"!=null){	
			response.setContentType("application/vnd.ms-excel");
			String fileName="";
			//iObjectiveExcelFile.getDownloadFileName();
			response.setHeader("Content-Disposition", "attachment;filename="
					+ Converter.toUtf8String(fileName));
			
			HSSFWorkbook workbook = new HSSFWorkbook();
			String[] titles = new String[]{"序号", 
					"员工ID(导入时必须指定)", 
					"员工姓名", 
					"项目ID(导入时必须指定)", 
					"项目编号", 
					"项目名称", 
					"工作任务代码(导入时必须指定)",
					"工作任务",
					"工作日期", 
					"工时(必须是工时字典对应的代码)"};
			String[] fieldNames = new String[]{"seqNo", 
					"createUserId", 
					"createUserName", 
					"projectBaseinfoId", 
					"projectCode", 
					"projectName",
					"taskCode",
					"taskName",
					"workDate",
					"longTimeCode"};
			try {
				workbook = HssfExcelHelper.getInstance().writeExcel(workbook, ProjectWorkVo.class, hosform.getPwv(), fieldNames, titles);
			}catch(Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if (workbook == null) {
				return mapping.findForward("error");
			} else {
				// 新建一输出文件流
				ServletOutputStream fOut;
				try {
					// 把相应的Excel 工作簿存盘
					fOut = response.getOutputStream();
					workbook.write(fOut);
					fOut.flush();
					fOut.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return mapping.findForward(null);
	}
	public ActionForward importfile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		ProjectWorkTimeRecordForm fform =(ProjectWorkTimeRecordForm) form;
		fform.setCreateUserId(staff.getStaffId());
		fform.setCreateUserName(staff.getStaffName());
	    FormFile uploadFile = fform.getFileToUpload();
	    response.setCharacterEncoding("utf-8");
	    //判断是否是excel文件
	    if(uploadFile==null || !uploadFile.getFileName().toLowerCase().endsWith("xls")){  
			try {
				response.getWriter().write("{\"result\":\""+"error"+"\"}");
			} catch (IOException e) {			
				e.printStackTrace();
			}
	    	return mapping.findForward(null);
	    }   
	    try {  

			String[] fieldNames = new String[]{"seqNo", 
					"createUserId", 
					"createUserName", 
					"projectBaseinfoId", 
					"projectCode", 
					"projectName",
					"taskCode",
					"taskName",
					"workDate",
					"longTimeCode"};
	    	
    	    System.out.println(uploadFile.getFileName().toString());
    	    //设置保存路径
    	    String path="/pm/excel";
    	    String realPath=request.getSession().getServletContext().getRealPath(path);
    	    File dir=new File(realPath);
    	    if(!dir.exists()) dir.mkdir();//判断该目录是否存在，不存在则创建
    	    
    	    //设置要进行保存的文件名称，防止出现重复文件名称，通过uuid确定其文件名的唯一性
    	    String fileName=UUID.randomUUID().toString()+"."+getFileExt(uploadFile);//uuid+源文件后缀
    	    File saveFile=new File(dir,fileName);//创建文件对象，在dir目录下的fileName这个文件
    	    FileOutputStream fos=new FileOutputStream(saveFile);//创建一个到saveFile中的输出流
    	    fos.write(uploadFile.getFileData());
    	    fos.close();
	    	ExcelHelper eh1 = JxlExcelHelper.getInstance(saveFile);
			List<ProjectWorkVo> list1 = eh1.readExcel(ProjectWorkVo.class, fieldNames,true);
//			for (ProjectFinanceVo user : list1) {
//				System.out.println(user);
//			}
			fform.setPwv(list1);
			projectWorkTimeRecordService.saveExcelData(fform);
	        uploadFile.destroy(); 
	        response.getWriter().write("{\"result\":\""+"success"+"\"}");
	    } catch (Exception e) { 
	    	try {
				response.getWriter().write("{\"result\":\""+"exception"+"\"}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        e.printStackTrace();  
	    }  
        return mapping.findForward(null);
	}
	
	 public static String getFileExt(FormFile file)
	 {
	  String fileName=file.getFileName();
	  return fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase();
	 }
	 
	 
	 /**
	*TODO   检查当天工时信息
	* @Title: checkTime
	* @param mapping
	* @param form
	* @param request
	* @param response
	* @return
	* @return ActionForward
	* @throws
	* @author LengJiong
	*/
	public ActionForward checkTime(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
			SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
			ProjectWorkTimeRecordForm fform =(ProjectWorkTimeRecordForm) form;
			fform.setCreateUserId(staff.getStaffId());
			fform.setCreateUserName(staff.getStaffName());
		    try{
		    	String message = projectWorkTimeRecordService.checkTime(fform);
		        response.getWriter().write("{\"result\":\""+message+"\"}");
		    } catch (Exception e) { 
		    	try {
					response.getWriter().write("{\"result\":\""+"exception"+"\"}");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		        e.printStackTrace();  
		    }  
	        return mapping.findForward(null);
		}
	public ActionForward checkLock(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		ProjectWorkTimeRecordForm fform =(ProjectWorkTimeRecordForm) form;
		fform.setCreateUserId(staff.getStaffId());
		fform.setCreateUserName(staff.getStaffName());
	    try{
	    	String message = projectWorkTimeRecordService.checkLock(fform);
	        response.getWriter().write("{\"result\":\""+message+"\"}");
	    } catch (Exception e) { 
	    	try {
				response.getWriter().write("{\"result\":\""+"exception"+"\"}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        e.printStackTrace();  
	    }  
        return mapping.findForward(null);
	}
	public ActionForward queryLock(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectWorkTimeRecordForm hosform =(ProjectWorkTimeRecordForm) form;
//			String createUserId    =   staff.getStaffId(); 
//			String createUserName  =   staff.getStaffName();
//			
//			
//		
//			hosform.setCreateUserId(createUserId);
//			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectWorkTimeRecordService.getProjectWorkTimeUnlockCount(hosform.getProjectBaseinfoIdCase(), hosform.getProjectClassCodeCase(),
					hosform.getStaffNameHidden(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId(),hosform.getStatusCase());
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
			projectWorkTimeRecordService.initForm(hosform);
			if(hosform.getFlag().equals("1")){
				projectWorkTimeRecordService.updateInit(hosform);
			}
			projectWorkTimeRecordService.getProjectWorkTimeUnlockSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("lock");	
		}
		catch (Exception e) {
			e.printStackTrace();
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
	public ActionForward lock(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectWorkTimeRecordForm hosform = (ProjectWorkTimeRecordForm) form;
			String message ="";
			if(hosform.getLockStatus().equals("")){
				//解锁
				hosform.setLockStatus("1");
			}else{
				//锁定
				hosform.setLockStatus("");
			}
			projectWorkTimeRecordService.lock(hosform);
			if(hosform.getLockStatus().equals("")){
				 message ="已锁定!";
			}else{
				 message ="已解锁!";
			}
			
			hosform.setMessage(message);
			return this.queryLock(mapping, hosform, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
}
