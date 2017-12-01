<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="securityConfigMenus" scope="request" class="com.tianjian.security.struts.form.SecurityConfigMenusForm" />
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
		<title><bean:message key="security.jsp.securityconfigmenus.detail.title" bundle="conf.security.security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
		<script language="javascript">
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
						<label style="float: left;font-size:14;color:#498ED3"><bean:message key="security.jsp.securityconfigmenus.detail.title" bundle="conf.security.security"/></label>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label>模块</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
					<input type="text" class="text" value="${dataForm.data.securityConfigPublicObject.reason}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label>ID</label>
					</td>
					<td class="crm_edit_item_content" >
						<input type="text" class="text" value="${dataForm.data.id}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<!--名称  -->
						<label><bean:message key="jsp.name" bundle="conf.Init"/></label>
					</td>
					<td class="crm_edit_item_content" >
						<input type="text" class="text" value="${dataForm.data.menuDetail}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--序号  -->
						<label><bean:message key="jsp.serialNo" bundle="conf.Init"/></label>
					</td>
					<td class="crm_edit_item_content" >
						<input type="text" class="text" value="${dataForm.data.serialNo}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<!--输入码  -->
						<label><bean:message key="jsp.inputCode" bundle="conf.Init"/></label>
					</td>
					<td class="crm_edit_item_content" >
						<input type="text" class="text" value="${dataForm.data.inputCode}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--链接地址  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuUrl" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.menuUrl}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单说明  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuNotice" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.menuNotice}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<!--末节点标志  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.endLevelFlag" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.endLevelFlag}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单级别  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuLevel" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.menuLevel}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<!--菜单序号  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuSeq" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.menuSeq}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单数据  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuData" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.menuData}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
					<td class="crm_edit_item_name">
						<!--菜单方法  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuMethod" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" value="${dataForm.data.menuMethod}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--图标  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuIcon" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.menuIcon}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单目标  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.menuTarget" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.menuTarget}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--父类菜单  -->
						<label><bean:message key="security.jsp.securityconfigmenus.common.parentId" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content"  colspan="3">
						<input type="text" class="text" value="${dataForm.data.securityConfigMenusObject.menuDetail}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.securityconfigmenus.common.displayType" bundle="conf.security.security"/></label>
					</td>
					<td class="crm_edit_item_content"  colspan="3">
						<logic:equal name="dataForm" property="data.displayType" value="0">
							<input type="text" class="text"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<bean:message key="security.jsp.securityconfigmenus.common.displayTypeOption1" bundle="conf.security.security"/>" 
							readonly="readonly" style="width:92%"/>
						</logic:equal>
						<logic:equal name="dataForm" property="data.displayType" value="1">
							<input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<bean:message key="security.jsp.securityconfigmenus.common.displayTypeOption2" bundle="conf.security.security"/>" 
							readonly="readonly" style="width:92%"/>
						</logic:equal>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--备注  -->
						<label><bean:message key="jsp.comments" bundle="conf.Init"/></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" value="${dataForm.data.comments}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly" style="width:92%"/>
					</td>
				</tr>
			</table>
			</div>
			<!-- Sheet operation button area -->
			<div style="margin-left:37%;margin-top:10px;">
				<input type="button"  class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" name="btnBack" value='关闭' onClick="closeIframe();" />
			</div>
		</form>
	</body>
</html>
