<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="data" scope="request"
	class="com.tianjian.security.struts.form.SecurityConfigParamProjectForm" />
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
				key="security.jsp.securityConfigParamClassProject.update.title"
				bundle="security" />
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
 		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script language="javascript">
			function saveForm(){
				if(!Validator.Validate(document.forms.form,3)){
     			 	return ;
   				}
				if(checkspace(document.form.projectName.value)){
					$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClassM.add.warn" bundle="security"/>');
				 	return ;
				}
				     
				    document.form.verbId.value = "update";    
				    document.form.submit(); 
				     
			}
			function checkspace(checkstr) {
					var str = '';
					for(i = 0; i < checkstr.length; i++) {
						str = str + ' ';
					}
					return (str == checkstr);
			}
			function isNUM(val) {
			    var rexPatn = /^[0-9]{0,11}?$/;
			    var res = rexPatn.exec(val); 
			    return res;
			}

			function goback(url){
				location.href = url;
			}
			function showMessage(message){
				if(message != '' && message != null){
					$.messager.alert('提示',message);
					return;
				}
			}
</script>
<style type="text/css">
		.redlable {
			color: #FF0000;
			font-size: 16px;
		}
		
		.crm_button_sub {
			margin-top: 10px;
			
		}
		
		.crm_textarea_style {
			width: 87%;
			height: 80px;
			border: 1px #E0E0E0 solid;
			overflow-y: hidden;
		}
		</style>
	</head>
	<body onload="showMessage('<%=data.getMessage()%>')">
		<form name="form" method="post" action="<%=request.getContextPath()%>/security/securityConfigParamProject.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="classCode" value="<%=data.getProjectCode()%>" />
			<input type="hidden" name="page" value="<%=data.getPageNow()%>" />
			<div class='crm_edit_panel'>
				<table class='crm_panel_table' cellspacing=1>
				<tr>
					<td class="crm_edit_item_name">
						<span class="redlable">*</span>工程代码:
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" name="projectCode" size="30"
							maxlength="32" style="width: 200px;" readonly="readonly"
							onkeypress="eventOnKeyPress('projectName')" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=data.getProjectCode()%>" />
					</td>
					<td class="crm_edit_item_name">
						<span class="redlable">*</span>
						工程名称:
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" name="projectName"
							style="width: 200px;" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="项目模块名称输入过长"
							onkeypress="eventOnKeyPress('seqNo')"
							value="<%=data.getProjectName()%>" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						序号:
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" name="seqNo" id="seqNo"
							style="width: 200px;" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="功能描述输入过长"
							onkeypress="eventOnKeyPress('comments')"
							value="<%=data.getSeqNo()%>" />
					</td>
					<td class="crm_edit_item_name">
						备注:
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text" id="comments" name="comments" maxlength="40"
							max="40" dataType="LimitB" msg="备注输入过长" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"  style="width: 200px;"
							onkeypress="eventOnKeyPress('btnSaveForm')"
							value="<%=data.getComments()%>" />
					</td>
				</tr>
			</table>
				</div>
			<!-- Sheet operation button area -->
			<div class="horizontal_line_10"></div>
			<div class="crm_button_sub" id="btnSave" align="center">
					<input type="button" name="btnSaveForm"   class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" value="修改" onClick="saveForm()" />
					<input type="button" name="btnBack"   class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" value="<bean:message key="security.jsp.commom.button2" bundle="security"/>" onClick="history.go(-1)" />
			</div>
			<div class="horizontal_line_10"></div>
		</form>

	</body>
</html>
