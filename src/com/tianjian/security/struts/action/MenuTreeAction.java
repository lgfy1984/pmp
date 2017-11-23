/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.tianjian.security.struts.action;

import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.tianjian.security.bean.MenuTreeNode;
import com.tianjian.security.business.IMenuTreeService;
import com.tianjian.security.struts.form.MenuTreeForm;
import com.tianjian.util.Converter;

/** 
 * MyEclipse Struts
 * Creation date: 04-01-2014
 * 
 * XDoclet definition:
 * @struts.action path="/security/menuTree" name="menuTreeForm" scope="request"
 */
public class MenuTreeAction extends Action {
	private IMenuTreeService menuTreeService;
	
	public IMenuTreeService getMenuTreeService() {
		return menuTreeService;
	}

	public void setMenuTreeService(IMenuTreeService menuTreeService) {
		this.menuTreeService = menuTreeService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String verbId = request.getParameter("verbId");
		try{
			if("getChildNodes".equals(verbId)){
				return this.getChildNodes(mapping, form, request, response);
			}else if("query".equals(verbId)){
				return this.query(mapping, form, request, response);
			}
		}catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("fail");
	}
	
	public ActionForward getChildNodes(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		MenuTreeForm mtForm = (MenuTreeForm)form;
		String type = mtForm.getType();
		List<MenuTreeNode> nodeList = null;
		if(MenuTreeNode.NODE_TYPE_ROOT.equals(type)){
			nodeList = this.menuTreeService.getRootNodes();
		}else if(MenuTreeNode.NODE_TYPE_PUBLIC_CLASS_1.equals(type)){
			nodeList = this.menuTreeService.getPublicClass1ChildNodes(mtForm.getPublicClassId(), mtForm.getPid());
		}else if(MenuTreeNode.NODE_TYPE_PUBLIC_CLASS_2.equals(type)){
			nodeList = this.menuTreeService.getPublicClass2ChildNodes(mtForm.getPublicClassId(), mtForm.getPid());
		}else if(MenuTreeNode.NODE_TYPE_PUBLIC.equals(type)){
			nodeList = this.menuTreeService.getPublicChildNodes(mtForm.getPublicId(), mtForm.getPid());
		}else if(MenuTreeNode.NODE_TYPE_MENU.equals(type)){
			nodeList = this.menuTreeService.getMenuChildNodes(mtForm.getMenuId(), mtForm.getPid());
		}
		String json = this.node2Json(nodeList);
		this.write2Response(response, json);
		return null;
	}
	public ActionForward query(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String json = this.menuTreeService.getQueryData(request);
		if(json != null && json.trim().length() > 0){
			this.write2Response(response, json);
		}
		return null;
	}
	
	private void write2Response(HttpServletResponse response, String str){
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	private String node2Json(List<MenuTreeNode> nodeList) throws IllegalArgumentException, IllegalAccessException {
		StringBuilder json = new StringBuilder("[");
		if(nodeList != null){
			for(MenuTreeNode node : nodeList){
				json.append("{");
				Field[] fields = MenuTreeNode.class.getDeclaredFields();
				for(Field f : fields){
					if(f.getModifiers() == Modifier.PUBLIC + Modifier.STATIC + Modifier.FINAL){
						continue;
					}
					f.setAccessible(true);
					Object value = f.get(node);
					String temp = Converter.toBlank(value);
					if(value != null && temp.length() > 0){
						if(value instanceof Boolean || value instanceof Number){
							json.append(f.getName()).append(":").append(temp).append(",");
						}else{
							json.append(f.getName()).append(":'").append(temp).append("',");
						}
					}
				}
				if(json.charAt(json.length() - 1) == ','){
					json.deleteCharAt(json.length() - 1);
				}
				json.append("},");
			}
			if(json.charAt(json.length() - 1) == ','){
				json.deleteCharAt(json.length() - 1);
			}
		}
		json.append("]");
		return json.toString();
	}
}