<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<jsp:useBean id="commConfigUnittype" scope="request" class="com.tianjian.comm.struts.form.CommConfigUnittypeForm" />
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
		<title><bean:message key="comm.jsp.commconfigunittype.update.title" bundle="conf.comm.CommMessageguoh"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src='<bean:message key="comm.js.TJMessage" bundle="conf.comm.CommMessageguoh"/>'></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript">
function saveForm(){
    if(!Validator.Validate(document.forms.form,3)){
      return ;
    }
	if(document.form.itemCode.value == ""){
	 	$.messager.alert('提示',"<bean:message bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
	 	return ;
	}
	if(document.form.itemName.value == ""){
	 	$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.jsp.itemNameText'/>");
	 	return ;
	}
	if(isNaN(document.form.seqNo.value)){
					$.messager.alert('提示','<bean:message key="comm.jsp.commconfigunittype.update.saveForm1" bundle="conf.comm.CommMessageguoh"/>'); 
				return true;
				}

	
	document.form.verbId.value = "update";
	document.form.submit();
	
}


</script>
<%--<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />--%>
    <link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
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
	<body onload="showMessage('','<%=commConfigUnittype.getMessage()%>','')">
		<form name="form" method="post" action="comm/commConfigUnittype.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="itemCodeHidden" value=<%=commConfigUnittype.getItemCodeHidden()%> />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemCode" size="20" maxlength="8" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"  value="<%=commConfigUnittype.getItemCode()%>" readonly/>
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemName" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=commConfigUnittype.getItemName()%>" />
      	  		</td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="seqNo"  id="seqNo" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="20" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长" value="<%=commConfigUnittype.getSeqNo()%>" />
      	  		</td>      	  	
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="comments" id="comments" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="50" value="<%=commConfigUnittype.getComments()%>" max="40" dataType="LimitB" msg="备注输入过长"  onkeypress="eventOnKeyPress('btnSave')"/>
      	  		</td>
      	  	</tr>      	  	
      	  </table>
      </div>
      <div class='crm_button_sub'>
		<input type="button" name="btnSave" id="btnSave" value="修改" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
		<input type="button" name="btnHistory" id="btnHistory" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  </div>
	 <!--zyc--add--e-->

			<%--<table  align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
				<tr>
					<td class="tblTitle" colspan="4"><span>※</span> <bean:message key="comm.jsp.commconfigunittype.update.td1" bundle="conf.comm.CommMessageguoh"/> <span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span> <bean:message key="comm.jsp.commconfigrh.update.td2" bundle="conf.comm.CommMessageguoh"/>
					</td>
					<td>
						<input type="text" name="itemCode" size="20" maxlength="9" onkeypress="eventOnKeyPress('itemName')" value="<%=commConfigUnittype.getItemCode()%>" readonly/>
					</td>
					<td class="tblLable">
						<span>*</span> <bean:message key="comm.jsp.commconfigrh.update.td3" bundle="conf.comm.CommMessageguoh"/>
					</td>
					<td>
						<input type="text" name="itemName" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=commConfigUnittype.getItemName()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="comm.jsp.commconfigrh.update.td5" bundle="conf.comm.CommMessageguoh"/>
					</td>
					<td class="hou" nowrap>
						<input type="text" name="seqNo" id="seqNo" size="20" maxlength="6" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长"  value="<%=commConfigUnittype.getSeqNo()%>" />
					</td>
					<td class="tblLable">
						<bean:message key="comm.jsp.commconfigrh.update.td6" bundle="conf.comm.CommMessageguoh"/>
					</td>
					<td>
						<input type="text" name="comments" id="comments" size="50" maxlength="50" onkeypress="eventOnKeyPress('btnSaveForm')"  max="40" dataType="LimitB" msg="备注输入过长" value="<%=commConfigUnittype.getComments()%>" />
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<div class="btnSave">
				<input type="button"  name="btnSaveForm" value='<bean:message key="comm.jsp.commconfigrh.update.td7" bundle="conf.comm.CommMessageguoh"/>' onClick="saveForm()" />
				<input type="button"  name="btnBack" value='<bean:message key="comm.jsp.commconfigrh.update.td4" bundle="conf.comm.CommMessageguoh"/>' onClick="history.go(-1);" />
			</div>
		--%></form>
	</body>
</html>
