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

import com.tianjian.pm.business.IProjectBaseinfoService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.PageForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoForm;
import com.tianjian.pm.struts.form.ProjectBaseInfoVo;
import com.tianjian.pm.struts.form.SecurityStaffBaseinfoVo;
import com.tianjian.security.struts.form.SessionForm;
import com.tianjian.util.Converter;
import com.tianjian.util.comm.PageBean;
import com.tianjian.util.excel.ExcelHelper;
import com.tianjian.util.excel.HssfExcelHelper;
import com.tianjian.util.excel.JxlExcelHelper;

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
			String temp = projectBaseinfoService.delete(hosform);
			
			hosform.setMessage(temp);
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

			if(hosform.getOperFlag().equals("")){
				projectBaseinfoService.save(hosform);
				hosform.setMessage("保存成功");
				hosform.setOperFlag("1");
			}else{
				if(hosform.getOperFlag().equals("0")){
					projectBaseinfoService.save(hosform);
			      hosform.setMessage("修改成功");
				}
			}
			projectBaseinfoService.addInit(hosform);
//			msg=java.net.URLEncoder.encode(msg, "GB2312");
//			StringBuffer url = request.getRequestURL();
//			url.append("?verbId=addInit&message="+msg);
//			response.sendRedirect(url.toString());//从定向
			request.setAttribute("data", hosform);
			return this.queryProjectBaseinfo(mapping, hosform, request, response);
			
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
			projectBaseinfoService.addInit(hosform);
//			String createUserId    =   staff.getStaffId(); 
//			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId("");
//			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectBaseinfoService.getProjectBaseInfoCount(hosform.getProjectClassCodeHidden(), hosform.getProjectNameHidden(),
					hosform.getOnlineStartTimeHidden(),
					hosform.getOnlineEndTimeHidden(), 
					hosform.getStartStartTimeHidden(),
					hosform.getStartEndTimeHidden(),
					hosform.getEndStartTimeHidden(),
					hosform.getEndEndTimeHidden(),
					hosform.getCreateUserId());
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
			projectBaseinfoService.initForm(hosform);
			if(hosform.getFlag().equals("1")){
				projectBaseinfoService.updateInit(hosform);
				hosform.setOperFlag("0");
			}
			projectBaseinfoService.getProjectBaseInfoSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	public ActionForward statProjectBaseinfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectBaseInfoForm hosform =(ProjectBaseInfoForm) form;
			projectBaseinfoService.addInit(hosform);
//			String createUserId    =   staff.getStaffId(); 
//			String createUserName  =   staff.getStaffName();
//			hosform.setCreateUserId(createUserId);
//			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectBaseinfoService.getProjectBaseInfoCount(hosform.getProjectClassCodeHidden(), hosform.getProjectNameHidden(),
					hosform.getOnlineStartTimeHidden(),
					hosform.getOnlineEndTimeHidden(), 
					hosform.getStartStartTimeHidden(),
					hosform.getStartEndTimeHidden(),
					hosform.getEndStartTimeHidden(),
					hosform.getEndEndTimeHidden(),
					hosform.getCreateUserId());
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
			projectBaseinfoService.initForm(hosform);
			projectBaseinfoService.getProjectBaseInfoSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("statlist");	
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
	public ActionForward checkProjectCode(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
			SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
			ProjectBaseInfoForm fform =(ProjectBaseInfoForm) form;
			fform.setCreateUserId(staff.getStaffId());
			fform.setCreateUserName(staff.getStaffName());
		    try{
		    	String message = projectBaseinfoService.checkProjectCode(fform);
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
	

	public ActionForward exportFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		ProjectBaseInfoForm hosform =(ProjectBaseInfoForm) form;
		try {

			request.setCharacterEncoding("utf-8");
			
		} catch (UnsupportedEncodingException e1) {			
			e1.printStackTrace();
		}
//		String createUserId    =   staff.getStaffId(); 
//		String createUserName  =   staff.getStaffName();
//		hosform.setCreateUserId(createUserId);
//		hosform.setCreateUserName(createUserName);
		// ////// page start ////////////////////////
		int count=0;
		int recordCount = projectBaseinfoService.getProjectBaseInfoCount(hosform.getProjectClassCodeHidden(), hosform.getProjectNameHidden(),
				hosform.getOnlineStartTimeHidden(),
				hosform.getOnlineEndTimeHidden(), 
				hosform.getStartStartTimeHidden(),
				hosform.getStartEndTimeHidden(),
				hosform.getEndStartTimeHidden(),
				hosform.getEndEndTimeHidden(),
				hosform.getCreateUserId());
		
		// ////// page end ////////////////////////
		projectBaseinfoService.getProjectBaseInfoSearch(hosform, count, recordCount);
		if("1"!=null){	
			response.setContentType("application/vnd.ms-excel");
			String fileName="";
			//iObjectiveExcelFile.getDownloadFileName();
			response.setHeader("Content-Disposition", "attachment;filename="
					+ Converter.toUtf8String(fileName));
			
			HSSFWorkbook workbook = new HSSFWorkbook();
			String[] titles = new String[]{"序号", 
					"项目代码(导入时必须指定)", 
					"项目名称", 
					"项目类别代码(导入时必须指定)",
					"项目类别名称",
					"项目经理代码",
					"项目经理名称",
					"开始日期",
					"上线日期", 
					"结束日期"};
			String[] fieldNames = new String[]{"seqNo", 
					"projectCode", 
					"projectName", 
					"projectClassCode", 
					"projectClassName",
					"staffCode",
					"staffName",
					"startTime",
					"onlineTime",
					"endTime"};
			try {
				workbook = HssfExcelHelper.getInstance().writeExcel(workbook, ProjectBaseInfoVo.class, hosform.getPbi(), fieldNames, titles);
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
		ProjectBaseInfoForm fform =(ProjectBaseInfoForm) form;
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
					"projectCode", 
					"projectName", 
					"projectClassCode", 
					"projectClassName",
					"staffCode",
					"staffName",
					"startTime",
					"onlineTime",
					"endTime"};
	    	
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
			List<ProjectBaseInfoVo> list1 = eh1.readExcel(ProjectBaseInfoVo.class, fieldNames,true);
			fform.setPbi(list1);
			projectBaseinfoService.saveExcelData(fform);
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
}
