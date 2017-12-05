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
import java.io.InputStream;
import java.io.OutputStream;
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

import com.tianjian.pm.business.IProjectFinanceRecordService;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.pm.struts.form.ProjectFinanceRecordForm;
import com.tianjian.pm.struts.form.ProjectFinanceVo;
import com.tianjian.security.struts.form.SessionForm;
import com.tianjian.util.Converter;
import com.tianjian.util.comm.PageBean;
import com.tianjian.util.excel.ExcelHelper;
import com.tianjian.util.excel.HssfExcelHelper;
import com.tianjian.util.excel.JxlExcelHelper;

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
public class ProjectFinanceWorkAction extends BaseDispatchAction{
	
	private IProjectFinanceRecordService  projectFinanceRecordService;

	public IProjectFinanceRecordService getProjectFinanceRecordService() {
		return projectFinanceRecordService;
	}

	public void setProjectFinanceRecordService(
			IProjectFinanceRecordService projectFinanceRecordService) {
		this.projectFinanceRecordService = projectFinanceRecordService;
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
			
			ProjectFinanceRecordForm hosform = (ProjectFinanceRecordForm) form;
			hosform.setCreateUserName(staff.getStaffName());
			projectFinanceRecordService.addInit(hosform);
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
			ProjectFinanceRecordForm hosform = (ProjectFinanceRecordForm) form;
			projectFinanceRecordService.updateInit(hosform);
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
			ProjectFinanceRecordForm hosform = (ProjectFinanceRecordForm) form;
			
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			String message ="修改成功!";
			hosform.setMessage(message);
			projectFinanceRecordService.update(hosform);
			return this.queryFinanceRecordinfo(mapping, hosform, request, response);
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
			ProjectFinanceRecordForm hosform = (ProjectFinanceRecordForm) form;
			projectFinanceRecordService.delete(hosform);
			String message ="删除成功!";
			
			hosform.setMessage(message);
			return this.queryFinanceRecordinfo(mapping, hosform, request, response);
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
			ProjectFinanceRecordForm hosform = (ProjectFinanceRecordForm) form;
			String type=request.getParameter("type");
			if("1".equals(type)){
				hosform.setIdHidden(request.getParameter("id"));
			}
			projectFinanceRecordService.updateInit(hosform);
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
			ProjectFinanceRecordForm hosform = (ProjectFinanceRecordForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			//
			
			
			projectFinanceRecordService.save(hosform);
			String msg="保存成功！";
			projectFinanceRecordService.addInit(hosform);
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
	public ActionForward queryFinanceRecordinfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		try {
			ProjectFinanceRecordForm hosform =(ProjectFinanceRecordForm) form;
			String createUserId    =   staff.getStaffId(); 
			String createUserName  =   staff.getStaffName();
			hosform.setCreateUserId(createUserId);
			hosform.setCreateUserName(createUserName);
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count=0;
			int page = 0;
			int recordCount = projectFinanceRecordService.getProjectFinanceRecordCount(hosform.getProjectBaseinfoIdCase(),  hosform.getProjectClassCodeCase(),
					hosform.getStaffName(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId());
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
			projectFinanceRecordService.initForm(hosform);
			projectFinanceRecordService.getProjectFinanceRecordSearch(hosform, count, pageSize);
			request.setAttribute("data", hosform);
			return mapping.findForward("query");	
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	

	public ActionForward exportFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		SessionForm staff      =  (SessionForm) request.getSession().getAttribute("sessionForm");
		ProjectFinanceRecordForm hosform =(ProjectFinanceRecordForm) form;
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
		PageBean pb = new PageBean();
		int count=0;
		int page = 0;
		int recordCount = projectFinanceRecordService.getProjectFinanceRecordCount(hosform.getProjectBaseinfoIdCase(),  hosform.getProjectClassCodeCase(),
				hosform.getStaffName(), hosform.getStartTimeHidden(), hosform.getEndTimeHidden(),hosform.getCreateUserId());
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
		projectFinanceRecordService.getProjectFinanceRecordSearch(hosform, count, pageSize);
		if("1"!=null){	
			response.setContentType("application/vnd.ms-excel");
			String fileName="";
			//iObjectiveExcelFile.getDownloadFileName();
			response.setHeader("Content-Disposition", "attachment;filename="
					+ Converter.toUtf8String(fileName));
			
			HSSFWorkbook workbook = new HSSFWorkbook();
			String[] titles = new String[]{"序号", "项目编号", "项目名称", "员工姓名", "工时", "实施费用"};
			String[] fieldNames = new String[]{"seqNo", "projectCode", "projectName", "workStaffName","longTime", "costs"};
			try {
				workbook = HssfExcelHelper.getInstance().writeExcel(workbook, ProjectFinanceVo.class, hosform.getPfv(), fieldNames, titles);
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
		ProjectFinanceRecordForm fform = (ProjectFinanceRecordForm) form;	
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

			String[] fieldNames = new String[]{"seqNo", "projectCode", "projectName", "workStaffName","longTime", "costs"};
	    	
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
			List<ProjectFinanceVo> list1 = eh1.readExcel(ProjectFinanceVo.class, fieldNames,true);
//			for (ProjectFinanceVo user : list1) {
//				System.out.println(user);
//			}
			fform.setPfv(list1);
			projectFinanceRecordService.saveExcelData(fform);
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
