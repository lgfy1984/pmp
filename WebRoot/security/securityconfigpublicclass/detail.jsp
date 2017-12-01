<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="dataForm" scope="request" class="com.tianjian.security.struts.form.SecurityConfigPublicClassForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%
		if (request.getServerPort() == 80) {
		%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
		<%
		} else {
		%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
		<%
		}
		%>
		<title><bean:message key="security.jsp.securityconfigpublicclass.detail.title" bundle="conf.security.security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
		<script language="javascript">
		    function QWPrint(){
			     if(document.all.PrintActiveX == undefined || document.all.PrintActiveX ==null){
					document.body.innerHTML="<object id=\"PrintActiveX\" style=\"display: none\" classid=\"clsid:3ede745c-4adb-42a6-ab25-5621edbdfd6b\" codebase=\"<%=request.getContextPath()%>/include/QWPrint.cab#version=1,3,8,2\" ></object>" + document.body.innerHTML;
				}
		        PrintActiveX.pageName = "A4"; //设置纸张类型
	            //设置页眉页脚
	            
				printed = true;
			    document.getElementById("btnSave").style.display="none";
			    PrintActiveX.PrintView();
			    document.getElementById("btnSave").style.display="block";
	   
	  		}
		</script>
	</head>
	<body>
		<form name="form" method="post">
			<input type="hidden" name="verbId" value="detail">
			<div class="crm_edit_panel ">
			<table class="crm_panel_table" >
				<tr>
					<td class="crm_edit_item_name" colspan="4">
						<label style="float: left;font-size:14;color:#498ED3"><bean:message key="security.jsp.securityconfigpublicclass.detail.topic" bundle="conf.security.security"/></label>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.className" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.className}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.classCode" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content" >
						<input type="text" class="text" value="${dataForm.data.classCode}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.serialNo" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.serialNo}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.inputCode" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.inputCode}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.comments" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.comments}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.parentId" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.securityConfigPublicClassObject.className}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.levelFlag" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<%if(dataForm.getData().getLevelFlag()!=null && String.valueOf(dataForm.getData().getLevelFlag()).equals("1")){ %>
							<input type="text" class="text" value="1级" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
						<%}else if(dataForm.getData().getLevelFlag()!=null && String.valueOf(dataForm.getData().getLevelFlag()).equals("2")){ %>
							<input type="text" class="text" value="2级" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
						<%}else{ %>
						<%} %>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.picPath" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.picPath}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.sysFlag" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<%if(dataForm.getData().getSysFlag()!= null && String.valueOf(dataForm.getData().getSysFlag()).equals("1")){ %>
							<input type="text" class="text" value="系统内" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
						<%}else if(dataForm.getData().getSysFlag()!=null && String.valueOf(dataForm.getData().getSysFlag()).equals("0")){ %>
							<input type="text" class="text" value="系统外" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
						<%}else{ %>
						<%} %>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigpublicclass.common.redirectUrl" bundle="conf.security.security"/><label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.redirectUrl}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<label>所属系统分类<label>
					</td>
					<td class="crm_edit_item_content">
						<%if(dataForm.getData().getAppSysFlag()!= null && String.valueOf(dataForm.getData().getAppSysFlag()).equals("1")){ %>
							<input type="text" class="text" value="应用系统" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
						<%}else if(dataForm.getData().getAppSysFlag()!= null && String.valueOf(dataForm.getData().getAppSysFlag()).equals("0")){ %>
							<input type="text" class="text" value="支撑系统" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
						<%}else{ %>
						<%} %>
					</td>
				</tr>
			</table>
			</div>
			<!-- Sheet operation button area -->
			<div align="center" id="btnSave" style="margin-top:10px;">
			 <div  class=" download_button_s1 left" onclick="QWPrint();" id="downprintarea" style="margin-left: 130px;">
					<img alt="" src="${path }/style/img/print.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="position: fixed;color: #fff;">打印</span>
					</div>
				<input type="button"  name="btnBack" value='<bean:message key="security.jsp.commom.button2" bundle="security"/>' onClick="history.go(-1);" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"/>
				 
			</div>
		</form>
	</body>
</html>
