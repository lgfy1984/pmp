//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl
package com.tianjian.comm.struts.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.tianjian.comm.bean.CommConfigStaffChargeType;
import com.tianjian.comm.business.ICommConfigInputDictService;
import com.tianjian.comm.business.ICommConfigStaffChargeService;
import com.tianjian.comm.struts.form.CommConfigStaffChargeForm;
import com.tianjian.pm.struts.comm.BaseDispatchAction;
import com.tianjian.util.ResourcesUtil;
import com.tianjian.util.comm.PageBean;

public class CommConfigStaffChargeAction extends BaseDispatchAction {

	private ICommConfigStaffChargeService commConfigStaffChargeService;
	private ICommConfigInputDictService commConfigInputDictService;

	public ICommConfigInputDictService getCommConfigInputDictService() {
		return commConfigInputDictService;
	}

	public void setCommConfigInputDictService(ICommConfigInputDictService commConfigInputDictService) {
		this.commConfigInputDictService = commConfigInputDictService;
	}
	

	public ICommConfigStaffChargeService getCommConfigStaffChargeService() {
		return commConfigStaffChargeService;
	}

	public void setCommConfigStaffChargeService(
			ICommConfigStaffChargeService commConfigStaffChargeService) {
		this.commConfigStaffChargeService = commConfigStaffChargeService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		String verbId = request.getParameter("verbId");
		path(request);
		if (verbId.equals("add")) {
			return this.add(mapping, form, request, response);
		} else if (verbId.equals("addInit")) {
			return this.addInit(mapping, form, request, response);
		} else if (verbId.equals("query")) {
			return this.query(mapping, form, request, response);
		} else if (verbId.equals("update")) {
			return this.update(mapping, form, request, response);
		} else if (verbId.equals("updateInit")) {
			return this.updateInit(mapping, form, request, response);
		} else if (verbId.equals("detail")) {
			return this.detail(mapping, form, request, response);
		} else if (verbId.equals("delete")) {
			return this.delete(mapping, form, request, response);
		}else if(verbId.equals("init")){
			return this.query(mapping, form, request, response);
		}else if(verbId.equals("initDetail")){
			return this.query(mapping, form, request, response);		
		} else {
			return mapping.findForward("fail");
		}
	}

	public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = (CommConfigStaffChargeForm) form;
			CommConfigStaffChargeType checkData = commConfigStaffChargeService.checkData(hosform.getItemCode());
			CommConfigStaffChargeType checkData1 = commConfigStaffChargeService.checkDataByName(hosform.getItemName());
			if (checkData != null || checkData1 != null) {
				//String message = BaseCommMessage.getMsg("1-000001");
				ServletContext application = request.getSession().getServletContext();
				String message = (String)application.getAttribute("comm.0-000001");
				hosform.setMessage(message);
				commConfigStaffChargeService.addInit(hosform);
				request.setAttribute("data", hosform);
				return mapping.findForward("add");
			}
			
			hosform.setInputCode(commConfigInputDictService.getInputCode(hosform.getItemName()));
			commConfigStaffChargeService.save(hosform);
			CommConfigStaffChargeForm hosformNew = new CommConfigStaffChargeForm();
			String message = ResourcesUtil.getValue("conf.comm.CommLocale", "comm.java.commom.dataSaveSuccess", request) + "!";
			hosformNew.setMessage(message);
			return this.query(mapping, hosformNew, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward query(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = (CommConfigStaffChargeForm) form;
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count;
			int page = 0;
			int recordCount = commConfigStaffChargeService.getCount(hosform.getItemCode(), hosform.getItemName(), hosform.getInputCode(), hosform.getSeqNo());
			pb.setCount(recordCount);
			String pageString = request.getParameter("cur_page");
			int pageSize = 5;
			//int pageSize = BaseCommInit.getPageSize("PAGE_SIZE");
//			ServletContext application = request.getSession().getServletContext();
//			int pageSize = Integer.parseInt((String)application.getAttribute("comm.PAGE_SIZE"));
			
			if(request.getSession().getAttribute("page_402880e541a2fbe80141a2fbe8dc0000")!=null){
				pageSize = Integer.parseInt((String)request.getSession().getAttribute("page_402880e541a2fbe80141a2fbe8dc0000"));
			}else{
				ServletContext application = request.getSession().getServletContext();
				pageSize = Integer.parseInt((String)application.getAttribute("comm.PAGE_SIZE"));
			}
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
			commConfigStaffChargeService.getSearch(hosform, count, pageSize);
			commConfigStaffChargeService.serchInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("query");
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			String verbId = request.getParameter("verbId");
			CommConfigStaffChargeForm ssform = (CommConfigStaffChargeForm) form;
			request.setAttribute("data", ssform);
			PageBean pb = new PageBean();
			pb.setPage(0);
			pb.setCount(0);
			pb.setPageSize(10);
			request.setAttribute("pb", pb);
			if(verbId.equals("initDetail")){
				return mapping.findForward("queryDetail");
			}else{
				return mapping.findForward("query");
			}
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward updateInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = (CommConfigStaffChargeForm) form;
			commConfigStaffChargeService.updateInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("update");
		}catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward addInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = new CommConfigStaffChargeForm();
			commConfigStaffChargeService.addInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("add");
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward detail(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = (CommConfigStaffChargeForm) form;
			commConfigStaffChargeService.showInit(hosform);
			request.setAttribute("data", hosform);
			return mapping.findForward("detail");
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = (CommConfigStaffChargeForm) form;
			CommConfigStaffChargeType checkData = null;
			if(!hosform.getItemName().equals(hosform.getItemName())){
				checkData = commConfigStaffChargeService.checkData(hosform.getItemCode());
			}
			if(checkData!=null){
				hosform.setMessage("您所修改的名称已经存在，请重新填写！");
				commConfigStaffChargeService.updateInit(hosform);
				request.setAttribute("data", hosform);
				return mapping.findForward("update");
			}
			hosform.setInputCode(commConfigInputDictService.getInputCode(hosform.getItemName()));
			commConfigStaffChargeService.update(hosform);
			CommConfigStaffChargeForm hosformNew = new CommConfigStaffChargeForm();
			return this.query(mapping, hosformNew, request, response);
		}catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigStaffChargeForm hosform = (CommConfigStaffChargeForm) form;
			commConfigStaffChargeService.delete(hosform);
			return this.query(mapping, hosform, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
}
