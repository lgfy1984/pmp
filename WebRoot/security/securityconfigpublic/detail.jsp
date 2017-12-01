<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
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
		<title></title>
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
	  		function closeIframe(){
				parent.document.getElementById("mask").style.visibility='hidden'
				parent.document.getElementById("iframe1").style.display = "none";
			}
		</script>
	</head>
	<body>
		<form name="form" method="post">
			<input type="hidden" name="verbId" value="detail">
			<div class="crm_edit_panel">
			<table class="crm_panel_table">
				<tr>
					<td class="crm_edit_item_name" colspan="4">
						<label style="float: left;font-size:14;color:#498ED3"><bean:message key="security.jsp.securityConfigpublic.commom.item" bundle="security"/></label>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commmom.classCode" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.reason}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px;"/>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.menuCode" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.modCode}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.serialNo" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
					<input type="text" class="text" value="${dataForm.data.serialNo}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.inputcode" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
					<input type="text" class="text" value="${dataForm.data.inputCode}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commmom.comments" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
					<input type="text" class="text" value="${dataForm.data.comments}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.scpcId" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
					<input type="text" class="text" value="${dataForm.data.securityConfigPublicClassObject.className}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.SecurityConfigPublic" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
					<input type="text" class="text" value="${dataForm.data.reasonValue}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.picPath" bundle="security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.picPath}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label>模块链接</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.publicUrl}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label>模块目标</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.publicTarget}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
			</table>
			</div>
			<!-- Sheet operation button area -->
			<div style="width: 100px;height:2px;color: white;"></div>
			<div id="btnSave" style="margin-left:37%;">
				<input class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" type="button" style="font-size:12px;font-family:Arial;" name="btnBack" value='返回' onClick="javascript:history.go(-1);void(0);" />
			</div>
		</form>
		
	</body>
</html>
