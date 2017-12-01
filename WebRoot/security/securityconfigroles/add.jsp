<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%
			if (request.getServerPort() == 80) {
		%>
		<base
			href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
		<%
			} else {
		%>
		<base
			href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
		<%
			}
		%>
		<title><bean:message
				key="security.jsp.securityConfigroles.add.title" bundle="security" />
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script language="javascript"
			src="<bean:message key="include.js.TJMessage.path" bundle="security" />"></script>
		<script language="javascript"
			src="<bean:message key="includes.js.validator.path" bundle="security" />"
			defer="defer"></script>
		<script language="javascript"
			src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
			<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css"/>
		<script language="javascript">
function saveForm(){
	if(!Validator.Validate(document.forms.form,3)){
      return ;
   	}
	if(document.form.roleCode.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn" bundle="security"/>');
	 	return ;
	}
	if(isNaN(document.form.roleCode.value)){
			$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
			return ; 
	}
	if(document.form.roleDetail.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn1" bundle="security"/>');
	 	return ;
	}
	if(isNaN(document.form.serialNo.value)){
		$.messager.alert('提示','<bean:message key="security.jsp.securityConfigpublic.update.warn" bundle="security"/>');
		return true;
	}
	    
	    document.form.verbId.value = "add";    
	    document.form.submit(); 
	     
}
function showMessage(message){
				if(message != ''&& message != null){
					$.messager.alert('提示',message);
					return;
				}
			}

</script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
	</head>
	<body onload="showMessage('${dataForm.message}')">
		<form name="form" method="post"
			action="security/securityConfigRoles.do">
			<input type="hidden" name="verbId" value="add" />
			<div class="crm_edit_panel">
			<table class="crm_panel_table">
				<tr>
					<td class="crm_edit_item_name">
						<span style="color:red">*</span>
						<bean:message key="security.jsp.commmom.classCode"
							bundle="security" />
						
					</td>
					<td style="width:30%" class="crm_edit_item_content">
						<input type="text" name="data.roleDetail" class="text"
							id=roleDetail  maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="名称输入过长"
							onkeypress="eventOnKeyPress('serialNo')"
							value="${dataForm.data.roleDetail}" />
					</td>
					<td class="crm_edit_item_name">
						<span style="color:red">*</span>
						<bean:message key="security.jsp.commom.menuCode" bundle="security" />
						
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.roleCode" id=roleCode class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							size="20" maxlength="20" max="20" dataType="LimitB" msg="代码输入过长"
							onkeypress="eventOnKeyPress('roleDetail')"
							value="${dataForm.data.roleCode}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<bean:message key="security.jsp.commom.serialNo" bundle="security" />
						
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.serialNo" class="text"
							id="serialNo" size="30" maxlength="11" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('comments')"
							value="${dataForm.data.serialNo}" readonly />
					</td>

					<td class="crm_edit_item_name">
						<bean:message key="security.jsp.commmom.comments"
							bundle="security" />
						
					</td>
					<td class="crm_edit_item_content">
						<!--  <input type="text" class="kuandu" name="data.comments" id="comments" size="30" maxlength="20" value="${dataForm.data.comments}" onkeypress="eventOnKeyPress('saveinput')" />-->
						<input type="text" name="data.comments" class="text"
							id="comments"  maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="备注输入过长"
							value="${dataForm.data.comments}"
							onkeypress="if(event.keyCode==13){document.getElementById('saveinput').focus()}" />
					</td>
				</tr>
			</table>
			</div>
			<!-- Sheet operation button area -->
			<div class="horizontal_line_10"></div>
			<div align="center">
				<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" id="saveinput" name="btnSaveForm" value="<bean:message key="security.jsp.commom.button1" bundle="security"/>" onClick="saveForm()" />
				<input type="button" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" name="btnBack" value="<bean:message key="security.jsp.commom.button2" bundle="security"/>" onClick="history.go(-1);" />
			</div>
		</form>
	</body>
</html>
