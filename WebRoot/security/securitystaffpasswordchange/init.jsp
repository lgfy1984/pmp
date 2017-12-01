<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="securityStaffPasswordChange" scope="request" type="com.tianjian.security.struts.form.SecurityStaffPasswordChangeForm" />
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
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
		<title><bean:message key="security.jsp.securitystaffpasswordchange.init.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
		<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
 		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>

  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">

		<script language="javascript">
function submitQueryForm() { 
	if(document.form.passwd.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.commom.warn18" bundle="security"/>');
  		return;
	 }
  if(document.form.newPasswd.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.commom.warn19" bundle="security"/>');
	  	return;
  }
  if(document.form.confirmPassword.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.commom.warn20" bundle="security"/>');
	  	return;
  }
  if(document.form.newPasswd.value != document.form.confirmPassword.value){
		$.messager.alert('提示','<bean:message key="security.jsp.commom.warn21" bundle="security"/>');
	  	return;
  }
     
    document.form.method = "POST"
    document.form.verbId.value = "update";    
    document.form.submit(); 
      
  
}
function back(){
	document.form.reset();	 
}
function showInitMessage(message){
	if(message != ""){
	 	$.messager.alert('提示',message);
	 	return ;
	}	
	
}
</script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		
	</head>
	<body onload="showInitMessage('<%=securityStaffPasswordChange.getMessage()%>');">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="security/securityStaffPasswordChange.do" autocomplete=“off”>
			<!-- Head line -->
			<input type="hidden" name="verbId" value="update">
			<input type="hidden" name="staffId" value="<%=securityStaffPasswordChange.getStaffId()%>">
			<div class='crm_edit_panel'>
			<table class='crm_panel_table' cellspacing=1 align="center">
				<tr align="center">
					<td class="crm_edit_item_name">
						<span>*</span><bean:message key="security.jsp.commom.passwd" bundle="security"/>
					</td>
					<td class="crm_edit_item_content">

						<input name="passwd" type="password" class="text" maxlength="15" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('newPasswd')" value="<%=securityStaffPasswordChange.getPasswd()%>" />

						<span class="tip"></span>
					</td>
				</tr>
				
				<tr>
					<td class="crm_edit_item_name">
						<span>*</span> <bean:message key="security.jsp.commom.newPasswd" bundle="security"/>
					</td>
					<td class="crm_edit_item_content">

						<input name="newPasswd" type="password" class="text" maxlength="15" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('confirmPassword')" value="<%=securityStaffPasswordChange.getNewPasswd()%>" />

						<span class="tip"></span>
					</td>
				</tr>
				
				<tr>
					<td class="crm_edit_item_name">
						<span>*</span> <bean:message key="security.jsp.commom.item11" bundle="security"/>
					</td>
					<td class="crm_edit_item_content">

						<input name="confirmPassword" type="password" class="text" maxlength="15" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('tijiao')" value="<%=securityStaffPasswordChange.getNewPasswd()%>" />

					    <span class="tip"></span>
					</td>
				</tr>
				</table>
				</div>
				<!-- Sheet operation button area -->
				<div class="horizontal_line_10"></div>
					<div class="crm_button_sub" id="btnSave" align="center">

					<input type="button" name="btnSaveForm"class="button_green1_s1" onmouseout="this.className='button_green1_s0'" onmousedown="this.className='button_green1_s1'"
						value="保存"
						onclick="submitQueryForm();" />
					&nbsp;&nbsp;

				</div>
				<div class="horizontal_line_10"></div>
		</form>
	</body>
</html>
