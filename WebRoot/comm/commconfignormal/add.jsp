<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commConfigNormal" scope="request" class="com.tianjian.comm.struts.form.CommConfigNormalForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title><bean:message key="comm.jsp.common.zczd" bundle="conf.comm.Comm"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.comm.message" bundle="conf.comm.Comm"/>"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
				<script language="javascript">
		function saveForm(){
			if(!Validator.Validate(document.forms.form,3)){
		      return ;
		   }
			if(isNaN(document.form.seqNo.value)){
				$.messager.alert('提示','序号只能是数字！请正确填写'); 
				return true;
			}
			if(isNaN(document.form.itemCode.value)){
				$.messager.alert('提示','项目代码只能为数字，请重新输入');
			 	return true;
			}
			if(document.form.itemName.value == ""){
			 	$.messager.alert('提示','名称不能为空');
			 	return ;
			}
			if(document.form.itemCode.value == ""){
				$.messager.alert('提示','代码不能为空'); 
				return ;
				
			}
			    
			    document.form.verbId.value = "add";    
			    document.form.submit(); 
		      
			}
		function showHspMessage(message){
						if(message != ''&& message != null){
							$.messager.alert('提示',message);
							return;
						}
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

	<body onload="showHspMessage('<%=commConfigNormal.getMessage()%>')" >
		<form name="form" method="post" action= "comm/commConfigNormal.do" >
		
		<input type="hidden" name="verbId" value="add" />
		
		<!-- <table  border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
		    <tr>
		       <td class="tblTitle" colspan="4"><span>※</span><bean:message key="comm.jsp.common.addZyc" bundle="conf.comm.Comm"/><span>※</span></td>
		    </tr>
		    <tr>
		        <td class="tblLable">
		         <span>*</span> <bean:message key="comm.jsp.common.item" bundle="conf.comm.Comm"/>:
		        </td>
		        <td>
		            <input type="text" name="itemCode" size="20" maxlength="2"
		            	onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"
		              value="<%=commConfigNormal.getItemCode() %>" />
		        </td>  
		        <td class="tblLable">
		          <span>*</span><bean:message key="comm.jsp.common.names" bundle="conf.comm.Comm"/>:
		        </td>
		        <td>
		            <input type="text" name="itemName" size="50" maxlength="50"
		              onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长"
		              value="<%=commConfigNormal.getItemName() %>" />
		        </td>
		    </tr>
		    <tr>
		              
		     <td class="tblLable">
		            <bean:message key="comm.jsp.common.seqNo" bundle="conf.comm.Comm"/>:
		        </td>
		        <td>
		            <input type="text" name="seqNo" id="seqNo" size="30" maxlength="20"
		               onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长"
		              value="<%=commConfigNormal.getSeqNo() %>"  />
		        </td>
		     <td class="tblLable">
		        <bean:message key="comm.jsp.common.comments" bundle="conf.comm.Comm"/>:
		    </td>
		    <td>
		        <input type="text" name="comments" id="comments" size="30" maxlength="50"
		     	 onkeypress="eventOnKeyPress('btnSaveForm')"  max="40" dataType="LimitB" msg="备注输入过长"
		          value="<%=commConfigNormal.getComments() %>" />
		    </td>
		    </tr>
		  </table> -->
	
	
			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="itemCode" id="itemCode" size="20"
							maxlength="32" onkeypress="eventOnKeyPress('itemName')" max="32"
							dataType="LimitB" msg="代码输入过长"
							value="<%=commConfigNormal.getItemCode() %>" />
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="itemName" size="20" maxlength="9"
							onkeypress="eventOnKeyPress('seqNo')" max="40" dataType="LimitB"
							msg="名称输入过长" value="<%=commConfigNormal.getItemName() %>" /></td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="seqNo" id="seqNo" size="20"
							maxlength="9" onkeypress="eventOnKeyPress('comments')" max="11"
							dataType="LimitB" msg="序号输入过长"
							value="<%=commConfigNormal.getSeqNo() %>" /></td>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content' colspan="3"><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" type="text" class="kuandu" name="comments"
							id="comments" size="20" maxlength="20"
							value="<%=commConfigNormal.getComments() %>"
							onkeypress="eventOnKeyPress('btnSaveForm')" max="40"
							dataType="LimitB" msg="备注输入过长" /></td>
					</tr>
				</table>
			</div>
			<!-- Sheet operation button area -->
			<div class='crm_button_sub'>
				<input type="button" name="btnSaveForm" value="保存"
					class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();" /> 
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
					onclick="history.go(-1);" />
			</div>
		</form>
	</body>
</html>
