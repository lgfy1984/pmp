//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl
package com.tianjian.comm.struts.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.tianjian.comm.bean.CommConfigRh;
import com.tianjian.comm.business.ICommConfigInputDictService;
import com.tianjian.comm.business.ICommConfigRhService;
import com.tianjian.comm.struts.form.CommConfigRhForm;
import com.tianjian.security.struts.action.BaseAction;
import com.tianjian.util.ResourcesUtil;
import com.tianjian.util.comm.PageBean;

public class CommConfigRhAction extends BaseAction {

	private ICommConfigRhService commConfigRhService;
	private ICommConfigInputDictService commConfigInputDictService;

	public ICommConfigInputDictService getCommConfigInputDictService() {
		return commConfigInputDictService;
	}

	public void setCommConfigInputDictService(ICommConfigInputDictService commConfigInputDictService) {
		this.commConfigInputDictService = commConfigInputDictService;
	}
	public ICommConfigRhService getCommConfigRhService() {
		return commConfigRhService;
	}

	public void setCommConfigRhService(ICommConfigRhService commConfigRhService) {
		this.commConfigRhService = commConfigRhService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		if (checkUser(request, response) == null) {
			return mapping.findForward("noLogin");
		}
		String verbId = request.getParameter("verbId");
		if (verbId.equals("add")) {
			return this.add(mapping, form, request, response);
		} else if (verbId.equals("addInit")) {
			return this.addInit(mapping, form, request, response);
		} else if (verbId.equals("query")) {
			return this.query(mapping, form, request, response);
		}else if(verbId.equals("queryDetail")){
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
			CommConfigRhForm hosform = (CommConfigRhForm) form;
			CommConfigRh checkData = commConfigRhService.checkData(hosform.getItemCode());
			if (checkData != null) {
				//String message = BaseCommMessage.getMsg("1-000001");
				ServletContext application = request.getSession().getServletContext();
				String message = (String)application.getAttribute("comm.0-000001");
				hosform.setMessage(message);
				commConfigRhService.addInit(hosform);
				request.setAttribute("commConfigRh", hosform);
				return mapping.findForward("add");
			}
			hosform.setInputCode(commConfigInputDictService.getInputCode(hosform.getItemName()));
			commConfigRhService.save(hosform);
			CommConfigRhForm hosformNew = new CommConfigRhForm();
			String message = ResourcesUtil.getValue("conf.comm.CommLocale", "comm.java.commom.dataSaveSuccess", request) + "!";
			hosformNew.setMessage(message);
			return this.query(mapping, hosformNew, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			String verbId = request.getParameter("verbId");
			CommConfigRhForm ssform = (CommConfigRhForm) form;
			request.setAttribute("commConfigRh", ssform);
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
	
	public ActionForward query(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			String verbId = request.getParameter("verbId");
			CommConfigRhForm hosform = (CommConfigRhForm) form;
			// ////// page start ////////////////////////
			PageBean pb = new PageBean();
			int count;
			int page = 0;
			int recordCount = commConfigRhService.getCount(hosform.getItemCode(), hosform.getItemName(), hosform.getInputCode(), hosform.getSeqNo());
			pb.setCount(recordCount);
			String pageString = request.getParameter("page");
			//int pageSize = BaseCommInit.getPageSize("PAGE_SIZE");
			int pageSize = 5;
			if(request.getSession().getAttribute("page_2828810b39763b0f0139763b0f760000")!=null){
				pageSize = Integer.parseInt((String)request.getSession().getAttribute("page_2828810b39763b0f0139763b0f760000"));
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
			commConfigRhService.getSearch(hosform, count, pageSize);
			commConfigRhService.serchInit(hosform);
			request.setAttribute("commConfigRh", hosform);
			if(verbId.equals("queryDetail")||verbId.equals("initDetail")){
				return mapping.findForward("queryDetail");
			}else{
				return mapping.findForward("query");			
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	public ActionForward updateInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigRhForm hosform = (CommConfigRhForm) form;
			commConfigRhService.updateInit(hosform);
			request.setAttribute("commConfigRh", hosform);
			return mapping.findForward("update");
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward addInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigRhForm hosform = new CommConfigRhForm();
			commConfigRhService.addInit(hosform);
			request.setAttribute("commConfigRh", hosform);
			return mapping.findForward("add");
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward detail(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigRhForm hosform = (CommConfigRhForm) form;
			commConfigRhService.showInit(hosform);
			request.setAttribute("commConfigRh", hosform);
			return mapping.findForward("detail");
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigRhForm hosform = (CommConfigRhForm) form;
			hosform.setInputCode(commConfigInputDictService.getInputCode(hosform.getItemName()));
			commConfigRhService.update(hosform);
			CommConfigRhForm hosformNew = new CommConfigRhForm();
			return this.query(mapping, hosformNew, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try {
			CommConfigRhForm hosform = (CommConfigRhForm) form;
			commConfigRhService.delete(hosform);
			return this.query(mapping, hosform, request, response);
		}
		catch (Exception e) {
			return mapping.findForward("fail");
		}
	}
}
