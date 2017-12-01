<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommConfigFtManageForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/"/>
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"/>
		<%}%>
		<title><bean:message key="comm.jsp.different.text33" bundle="conf.comm.comm"/>ADD.JSP</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.CommMessage.path" bundle="conf.comm.comm"/>"></script>
		<script type="text/javascript" src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript">
			function saveForm(){
				if(!Validator.Validate(document.forms.form,3)){
	             return ;
	            }
				if(isNaN(document.form.seqNo.value)){
					$.messager.alert('提示',"<bean:message key="comm.jsp.common.text49" bundle="conf.comm.comm"/>"); 
					return true;
				}
				if(document.form.itemCode.value == ""){
	 	$.messager.alert('提示',"<bean:message bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
				 	return ;
				}
				if(document.form.itemName.value == ""){
	 	$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.jsp.itemNameText'/>");
				 	return ;
				}
			
				document.form.verbId.value = "add";
				document.form.submit();
			}
			function goBack(){
				document.form.verbId.value="query";
				document.form.submit();
			}
		</script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/icon.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
			<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
		<style type="text/css">
		.redlable {
			color: #FF0000;
			font-size: 16px;
		}
		
		.crm_button_sub {
			margin-top: 10px;
			margin-left: 40%;
		}
		
		.crm_textarea_style {
			width: 87%;
			height: 80px;
			border: 1px #E0E0E0 solid;
			overflow-y: hidden;
		}
		</style>
	</head>

	<body onload="showCommMessage('','<%=data.getMessage() %>','1')">
		<form name="form" method="post" action="comm/commConfigFtManage.do">

			<input type="hidden" name="verbId" value="add" />
			<!-- <table align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
				<tr>
					<td class="tblTitle" colspan="4"><span>※</span> <bean:message key="comm.jsp.different.text32" bundle="conf.comm.comm"/><span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span> <bean:message key="comm.jsp.common.text10" bundle="conf.comm.comm"/>：
					</td>
					<td>
						<input type="text" name="itemCode" size="20" maxlength="9" onkeypress="eventOnKeyPress('itemName')"  max="32" dataType="LimitB" msg="代码输入过长" value="<%=data.getItemCode() %>" />
					</td>
					<td class="tblLable">
						<span>*</span> <bean:message key="comm.jsp.common.text29" bundle="conf.comm.comm"/>：
					</td>
					<td>
						<input type="text" name="itemName" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqNo')"  max="32" dataType="LimitB" msg="名称输入过长" value="<%=data.getItemName() %>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="comm.jsp.common.text48" bundle="conf.comm.comm"/>：
					</td>
					<td>
						<input type="text" name="seqNo" id="seqNo" size="30" maxlength="20" onkeypress="eventOnKeyPress('comments')"   max="11" dataType="LimitB" msg="序号输入过长"  value="<%=data.getSeqNo() %>" />
					</td>
					<td class="tblLable">
						<bean:message key="comm.jsp.common.text4" bundle="conf.comm.comm"/>：
					</td>
					<td>
						<input type="text" name="comments" id="comments" size="30" maxlength="50" onkeypress="eventOnKeyPress('btnSaveForm')"   max="40" dataType="LimitB" msg="备注输入过长"  value="<%=data.getComments() %>" />
					</td>
				</tr>
			</table> -->

			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
						<td class='crm_edit_item_content'><input class="text"
							type="text" class="kuandu" name="itemCode" id="itemCode" size="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							maxlength="32" onkeypress="eventOnKeyPress('itemName')"  max="32" dataType="LimitB" msg="代码输入过长" value="<%=data.getItemCode() %>"/></td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
						<td class='crm_edit_item_content'><input class="text"
							type="text" class="kuandu" name="itemName" size="20" maxlength="9" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=data.getItemName()%>" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  				<td class='crm_edit_item_content'>
      	  					<input class="text" type="text" class="kuandu" name="seqNo"  id="seqNo" size="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							maxlength="9" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长"
							value="<%=data.getSeqNo()%>"/>
      	  				</td>  
      	  				<td class='crm_edit_item_name'>备注</td>
      	  				<td class='crm_edit_item_content' colspan="3">
      	  					<input class="text" type="text" class="kuandu" name="comments" id="comments" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							size="20" maxlength="20" value="<%=data.getComments()%>"  onkeypress="eventOnKeyPress('btnSaveForm')"  max="40" dataType="LimitB" msg="备注输入过长"/> 
      	  				</td>
      	  			</tr>  
				</table>
			</div>
			<!-- Sheet operation button area -->
			<div class='crm_button_sub'>
				<input type="button" name="btnSaveForm" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  		</div>
		</form>
	</body>
</html>