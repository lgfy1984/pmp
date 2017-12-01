<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commDictPublicChar" scope="request" class="com.tianjian.comm.struts.form.CommDictPublicCharForm" />
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
		<title><bean:message key="Comm.jsp.commom.modifyGeneralDictInfo" bundle="conf.comm.CommMessage"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript">
		function saveForm(){
			if(document.form.seqNo.value == ""){
				$.messager.alert('提示',"序号不能为空！");
				return ;
			}
		    if(document.form.classCode.value == ""){
			 	alertMessage("0-000001");
			 	return ;
			}
			if(document.form.dictCode.value == ""){
	 	$.messager.alert('提示',"<bean:message bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
			 	return ;
			}
			if(document.form.dictValue.value == ""){
	 	$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.jsp.itemNameText'/>");
			 	return ;
			}
		
			 
			document.form.verbId.value = "update";
			document.form.submit();
			
		}
		</script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	
	  	<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${path}/js/default.js"></script>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<style type="text/css">
		.redlable{
			color:#FF0000;
			font-size:16px;
		}
		.crm_button_sub{
			margin-top: 10px;
			margin-left: 40%;
		}
		.crm_textarea_style{
			width:87%;
			height:80px;
			border:1px #E0E0E0 solid;
			overflow-y:hidden;
		}
		</style>
	</head>
	<body onload="showMessage('','<%=commDictPublicChar.getMessage()%>','')">
		<form name="form" method="post" action="comm/commDictPublicCharSingle.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="id" value="<%=commDictPublicChar.getId()%>" />
			<input type="hidden" name="idHidden" value=<%=commDictPublicChar.getIdHidden()%> />
			<input type="hidden" name="classCode" value="<%=commDictPublicChar.getClassCode()%>">
			<input type="hidden" name="className" value="<%=commDictPublicChar.getClassName()%>">
			<!-- <table  align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
				<tr>
					<td class="tblTitle" colspan="4"><span>※</span> <bean:message key="Comm.jsp.commom.modifyGeneralDict" bundle="conf.comm.CommMessage"/><span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span> <bean:message key="jsp.dictCode" bundle="conf.Init"/>：
					</td>
					<td>
						<input type="text" name="dictCode" size="20" maxlength="9" onkeypress="eventOnKeyPress('dictValue')" value="<%=commDictPublicChar.getDictCode()%>" />
					</td>
					<td class="tblLable">
						<span>*</span> <bean:message key="jsp.dictValue" bundle="conf.Init"/>：
					</td>
					<td>
						<input type="text" name="dictValue" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqNo')" value="<%=commDictPublicChar.getDictValue()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="jsp.seqNo" bundle="conf.Init"/>：
					</td>
					<td>
						<input type="text"  name="seqNo" id="seqNo" size="20" maxlength="6" onkeypress="eventOnKeyPress('comments')" value="<%=commDictPublicChar.getSeqNo()%>" />
					</td>
					<td class="tblLable">
						<bean:message key="jsp.comments" bundle="conf.Init"/>：
					</td>
					<td>
						<input type="text" name="comments" id="comments" size="50" onkeypress="eventOnKeyPress('btnSaveForm')" maxlength="100" value="<%=commDictPublicChar.getComments()%>" />
					</td>
				</tr>
			</table> -->
			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>项目代码</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="dictCode" id="dictCode" size="20"
							maxlength="10" onkeypress="eventOnKeyPress('itemName')" max="40"
							dataType="LimitB" msg="代码输入过长"
							value="<%=commDictPublicChar.getDictCode()%>" />
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>项目名称</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="dictValue" size="20" maxlength="9"
							onkeypress="eventOnKeyPress('seqNo')" max="40" dataType="LimitB"
							msg="名称输入过长" value="<%=commDictPublicChar.getDictValue()%>" /></td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="seqNo" id="seqNo" size="20"
							maxlength="9" onkeypress="eventOnKeyPress('comments')" max="11"
							dataType="LimitB" msg="序号输入过长"
							value="<%=commDictPublicChar.getSeqNo()%>" /></td>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content' colspan="3"><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" type="text" class="kuandu" name="comments"
							id="comments" size="20" maxlength="20"
							value="<%=commDictPublicChar.getComments()%>" max="40"
							dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('btnSaveForm')" />
						</td>
					</tr>
	
				</table>
			</div>
			<!-- Sheet operation button area -->
			<div class='crm_button_sub'>
				<input type="button" name="btnSaveForm" value="修改" 	class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();" /> 
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
					onclick="history.go(-1);" />
			</div>
		</form>
	</body>
</html>
