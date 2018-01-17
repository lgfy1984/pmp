package com.tianjian.comm.struts.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.tianjian.comm.bean.CommConfigLocation;
import com.tianjian.comm.bean.CommConfigLocationGroup;
import com.tianjian.comm.business.ICommConfigInputDictService;
import com.tianjian.comm.business.ICommConfigLocationGroupService;
import com.tianjian.comm.struts.form.CommConfigLocationGroupForm;
import com.tianjian.comm.struts.servlet.CommConfigLocationTownInit;
import com.tianjian.util.ResourcesUtil;
import com.tianjian.util.comm.PageBean;
/**
 * COMM_CONFIG_LOCATION_GROUP居民组字典用Action
 * @author Dzenall
 * @since 2008-9-18
 */
public class CommConfigLocationGroupAction extends Action{

	private String flag = CommConfigLocationTownInit.getProperty("PRINT_FLAG");
	private ICommConfigLocationGroupService service;
	private ICommConfigInputDictService commConfigInputDictService;
	public ICommConfigLocationGroupService getService() {
		return service;
	}
	public void setService(ICommConfigLocationGroupService service) {
		this.service = service;
	}
	public ICommConfigInputDictService getCommConfigInputDictService() {
		return commConfigInputDictService;
	}
	public void setCommConfigInputDictService(
			ICommConfigInputDictService commConfigInputDictService) {
		this.commConfigInputDictService = commConfigInputDictService;
	}
	private void print(Object obj){	
		if(flag.equalsIgnoreCase("true")){
			System.out.println(obj);
		}
	}

	//---------------------------------------------------------------------
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		try{
			String verbId = request.getParameter("verbId");
			this.print("CommConfigLocationGroupAction.verbId="+verbId);

			if(verbId.equals("addInit")){//
				return this.addInit(mapping, form, request, response);
			}else if(verbId.equals("add")){//
				return this.add(mapping, form, request, response);
			}else if(verbId.equals("query")){
				return this.query(mapping, form, request, response);
			}else if(verbId.equals("delete")){
				return this.delete(mapping, form, request, response);
			}else if(verbId.equals("detail")){
				return this.detail(mapping, form, request, response);
			}else if(verbId.equals("updateInit")){
				return this.updateInit(mapping, form, request, response);
			}else if(verbId.equals("update")){
				return this.update(mapping, form, request, response);
			}else if(verbId.equals("setCity")){
				return this.setCity(mapping, form, request, response);
			}else if(verbId.equals("setCounty")){
				return this.setCounty(mapping, form, request, response);
			}else if(verbId.equals("setTown")){
				return this.setTown(mapping, form, request, response);
			}else if(verbId.equals("setVillage")){
				return this.setVillage(mapping, form, request, response);
			}else if(verbId.equals("setItemCode")){
				return this.setItemCode(mapping, form, request, response);
			}else{
				return mapping.findForward("fail");
			}
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}	
	//---------------------------------------------------------------------
	private ActionForward addInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		CommConfigLocationGroup data =null ;
		if(hosform != null){
		 data = this.getService().checkData(hosform.getItemCode().trim());
		}
		if(hosform == null || data == null){
			hosform = new CommConfigLocationGroupForm();		
			this.getService().addInit(hosform);
		}else{			
			this.getService().setForm(hosform, data);
		}

		request.setAttribute("data", hosform);
		return mapping.findForward("add");
	}
	private ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;

		CommConfigLocationGroup data = this.getService().checkData(hosform.getItemCode().trim());
		if(data == null){
			hosform.setInputCode(this.getCommConfigInputDictService().getInputCode(hosform.getItemName()));
			this.getService().add(hosform);
			CommConfigLocationGroupForm hosformNew = new CommConfigLocationGroupForm();	
			String message = ResourcesUtil.getValue("conf.comm.CommLocale", "comm.java.commom.newAddSuccess", request) + "!";
			//hosformNew.setMessage(message);
			return this.query(mapping, hosformNew, request, response);
		}else{
			String message = ResourcesUtil.getValue("conf.comm.CommLocale", "comm.java.CommConfigLocationGroupAction.addFail", request) + "!";
			hosform.setMessage(message);
			request.setAttribute("data", hosform);
			return this.addInit(mapping, hosform, request, response);
		}
	}
	private ActionForward query(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;

		PageBean pb = new PageBean();
		int count;
		int page = 0;
		int recordCount = this.getService().getCount(hosform.getItemCode(), hosform.getItemName(), hosform.getInputCode());
		pb.setCount(recordCount);
		String pageString = request.getParameter("page");
		//int pageSize = CommConfigLocationTownInit.getPageSize("PAGE_SIZE");
		//ServletContext application = request.getSession().getServletContext();
		//int pageSize = Integer.parseInt((String)application.getAttribute("comm.PAGE_SIZE"));
		int pageSize = 5;
		if(request.getSession().getAttribute("page_282881f53463902b013463902b221133")!=null){
			pageSize = Integer.parseInt((String)request.getSession().getAttribute("page_282881f53463902b013463902b221133"));
		}else{
			ServletContext application = request.getSession().getServletContext();
			pageSize = Integer.parseInt((String)application.getAttribute("comm.PAGE_SIZE"));
		}
		pb.setPageSize(pageSize);
		if(pageString == null || pageString.equals("") || pageString.equals("0")){
			page = 1;
			pb.setPage(1);
			count = (page - 1) * pageSize;
		}else{	        	
			page = Integer.parseInt(pageString);
			pb.setPage(page);
			count = (page - 1) * pageSize  ;
		}
		request.setAttribute("pb",pb );
		this.getService().getSearch(hosform, count, pageSize);
		request.setAttribute("data", hosform);		        

		return mapping.findForward("query");
	}
	private ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		try{	
			this.getService().delete(hosform, request);
		}catch(org.springframework.dao.DataIntegrityViolationException e){
			if(flag.equals("true")){
				e.printStackTrace();
			}
			String message = ResourcesUtil.getValue("conf.comm.CommLocale", "comm.java.commom.cannotDel", request) + "!";
			hosform.setMessage(message);
		}
		hosform.setMessage("");
		hosform.setId("");
		hosform.setIdHidden("");
		hosform.setInputCode("");
		hosform.setItemCode("");
		hosform.setItemName("");
		return this.query(mapping, form, request, response);
	}
	private ActionForward detail(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		this.getService().updateInit(hosform);
		this.getService().getDetail(hosform);
		request.setAttribute("data", hosform);		        
		return  mapping.findForward("detail");
	}
	private ActionForward updateInit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		hosform.setId(hosform.getIdHidden().trim());
		this.getService().updateInit(hosform);
		this.getService().getDetail(hosform);
		request.setAttribute("data", hosform);		        
		return  mapping.findForward("update");
	}
	private ActionForward update(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;	
		hosform.setInputCode(this.getCommConfigInputDictService().getInputCode(hosform.getItemName()));
		this.getService().update(hosform, request);
		CommConfigLocationGroupForm hosformNew = new CommConfigLocationGroupForm();
		//hosformNew.setMessage(hosform.getMessage());
		return  this.query(mapping, hosformNew, request, response);
	}
	private ActionForward setCity(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException{
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		String province = request.getParameter("province");
		hosform.setCommProvinceId(province);
		this.getService().getCitys(hosform);
		
		List<CommConfigLocation> citys = new ArrayList<CommConfigLocation>();
		if(hosform.getCommCityIds()!=null&&hosform.getCommCityIds().length>0){
			for(int i=0;i<hosform.getCommCityIds().length;i++){
				CommConfigLocation c = new CommConfigLocation();
				c.setId(hosform.getCommCityIds()[i]);
				c.setItemName(hosform.getCommCityNames()[i]);
				citys.add(c);
			}
		}
		
		JSONArray jsonArray = null;
		response.setCharacterEncoding("utf-8");
		jsonArray = JSONArray.fromObject(citys);
		//System.out.println(jsonArray.toString());
		response.getWriter().print(jsonArray);// JSON返回数据
		response.flushBuffer();
		//String xmlString = getXMLData(hosform.getCommCityIds(), hosform.getCommCityNames());
		//writeResponse(response, xmlString);		
		return null;
	}
	private ActionForward setCounty(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException{
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		String city = request.getParameter("city");
		hosform.setCommCityId(city);
		this.getService().getCounties(hosform);
		
		List<CommConfigLocation> countys = new ArrayList<CommConfigLocation>();
		if(hosform.getCommCountyIds()!=null&&hosform.getCommCountyIds().length>0){
			for(int i=0;i<hosform.getCommCountyIds().length;i++){
		
			CommConfigLocation c = new CommConfigLocation();
			c.setId(hosform.getCommCountyIds()[i]);
			c.setItemName(hosform.getCommCountyNames()[i]);
			countys.add(c);
			}
		}
		
		JSONArray jsonArray = null;
		response.setCharacterEncoding("utf-8");
		jsonArray = JSONArray.fromObject(countys);
		//System.out.println(jsonArray.toString());
		response.getWriter().print(jsonArray);// JSON返回数据
		response.flushBuffer();
		//String xmlString = getXMLData(hosform.getCommCountyIds(), hosform.getCommCountyNames());
		//writeResponse(response, xmlString);		
		return null;
	}
	private ActionForward setTown(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException{
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		String town = request.getParameter("country");
		hosform.setCommCountyId(town);
		this.getService().getTowns(hosform);
		
		List<CommConfigLocation> towns = new ArrayList<CommConfigLocation>();
		if(hosform.getCommCltIds()!=null&&hosform.getCommCltIds().length>0){
			for(int i=0;i<hosform.getCommCltIds().length;i++){
				CommConfigLocation c = new CommConfigLocation();
				c.setId(hosform.getCommCltIds()[i]);
				c.setItemName(hosform.getCommCltNames()[i]);
				towns.add(c);
			}
		}
		
		JSONArray jsonArray = null;
		response.setCharacterEncoding("utf-8");
		jsonArray = JSONArray.fromObject(towns);
		//System.out.println(jsonArray.toString());
		response.getWriter().print(jsonArray);// JSON返回数据
		response.flushBuffer();
		//String xmlString = getXMLData(hosform.getCommCltIds(), hosform.getCommCltNames());
		//writeResponse(response, xmlString);		
		return null;
	}
	private ActionForward setVillage(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException{
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		String village = request.getParameter("town");
		hosform.setCommCltId(village);
		this.getService().getVillages(hosform);
		
		List<CommConfigLocation> villages = new ArrayList<CommConfigLocation>();
		if(hosform.getCommClvIds()!=null&&hosform.getCommClvIds().length>0){
			
			for(int i=0;i<hosform.getCommClvIds().length;i++){
				CommConfigLocation c = new CommConfigLocation();
				c.setId(hosform.getCommClvIds()[i]);
				c.setItemName(hosform.getCommClvNames()[i]);
				villages.add(c);
			}
		}
		
		JSONArray jsonArray = null;
		response.setCharacterEncoding("utf-8");
		jsonArray = JSONArray.fromObject(villages);
		System.out.println(jsonArray.toString());
		response.getWriter().print(jsonArray);// JSON返回数据
		response.flushBuffer();
		//String xmlString = getXMLData(hosform.getCommClvIds(), hosform.getCommClvNames());
		//writeResponse(response, xmlString);		
		return null;
	}
	//获取行政组编号
	private ActionForward setItemCode(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  throws Exception{
		CommConfigLocationGroupForm hosform = (CommConfigLocationGroupForm)form;
		String country = request.getParameter("country");
		hosform.setCommClvId(country);
		
		String itemCode=this.getService().getItemCode(hosform);
		String villageItemCode=this.getService().getVillageItemCode(hosform);
		String newItemCode=villageItemCode+itemCode;
		
		String xmlString = getItemCodeXMLData(hosform.getCommClvId(), newItemCode);
		writeResponse(response, xmlString);		
		return null;
	}
	public String getItemCodeXMLData(String country, String itemCode) {
		String xmlString = "";

		xmlString = xmlString + "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		xmlString = xmlString + "<root>";
		xmlString = xmlString + "<country>" + country + "</country>";
		xmlString = xmlString + "<itemCode>" + itemCode + "</itemCode>";

		xmlString = xmlString + "</root>";

		return xmlString;
	}
	public String getXMLData(String[] key, String[] value) {
		String xmlString = "";

		xmlString = xmlString + "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		xmlString = xmlString + "<root>";
		if(key != null){
			xmlString = xmlString + "<index>" + key.length + "</index>";
			for (int i = 0; i < key.length; i++) {
				xmlString = xmlString + "<key>" + key[i] + "</key>";
				xmlString = xmlString + "<value>" + value[i] + "</value>";
			}
		} else {
			xmlString = xmlString + "<index>0</index>";
		}
		xmlString = xmlString + "</root>";

		return xmlString;
	}
	public void writeResponse(HttpServletResponse response, String xmlString) throws IOException {
		response.setContentType("text/xml");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(xmlString);
	}
}
