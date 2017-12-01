<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commDictPublicChar" scope="request"
	class="com.tianjian.comm.struts.form.CommDictPublicCharForm" />
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
		<title><bean:message key="Comm.jsp.commom.title" bundle="conf.comm.CommMessage" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<!--  <script language="javascript" src="include/javascript/init.js"></script>-->
		<script language="javascript" src="<bean:message key="security.js.gettext_staff.path" bundle="security" />"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/open.css" />
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript">
		function yznumber(id,itermname,integer,decimal){
			var inputvalue= (document.getElementById(id)).value;
			if(inputvalue != ""){
				var reg = /^[0-9]+(\.[0-9]+)?$/;
				if(reg.test(inputvalue)){
					if(inputvalue.indexOf(".")!=-1){
						array = inputvalue.split(".");
						arg1 = array[0];
						arg2 = array[1];										
						if(arg1.length > integer){
							$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="Comm.js.commom.msg1" bundle="conf.comm.CommMessage" />"+integer+"<bean:message key="Comm.js.commom.msg8" bundle="conf.comm.CommMessage" />");				
							return false;
						}
						if(arg2.length > decimal){
							$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="Comm.js.commom.msg2" bundle="conf.comm.CommMessage" />"+decimal+"<bean:message key="Comm.js.commom.msg8" bundle="conf.comm.CommMessage" />");
							return false;
						}				
					}else{
						if(inputvalue.length > integer){
							$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="Comm.js.commom.msg3" bundle="conf.comm.CommMessage" />"+integer+"<bean:message key="Comm.js.commom.msg8" bundle="conf.comm.CommMessage" />");						
							return false;
						}
					}			
				}else{
					$.messager.alert('提示',"\""+itermname+"\"<bean:message key="Comm.js.commom.msg7" bundle="conf.comm.CommMessage" />");					
					return false;
					}
				}		
		 }	
		function saveForm(){
			if(!Validator.Validate(document.forms.form,3)){
		      return ;
		   	}
		    if(document.form.classCode.value == ""){
			 	$.messager.alert('提示','<bean:message key="Comm.js.commom.msg10" bundle="conf.comm.CommMessage" />');
			 	return ;
			}
			if(document.form.dictCode.value == ""){
			 $.messager.alert('提示','<bean:message key="comm.jsp.common.text31" bundle="conf.comm.comm"/>');
			 return;
			}
			if(document.form.dictCode.value !== null){ 
				if(yznumber('dictCode','<bean:message key="Comm.js.commom.msg5" bundle="conf.comm.CommMessage"/>','6','2')==false){
				return;
				}
			}
			if(document.form.dictValue.value == ""){
			   $.messager.alert('提示','<bean:message key="comm.jsp.common.text32" bundle="conf.comm.comm"/>');
			   return ;
			}
			if(/\D/.test(document.form.seqNo.value)){
				$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.warn1'/>");
				return;
			}
			for(var i=0; i<document.form.dictCode.value.length; i++){
				if(document.form.dictCode.value.charAt(i)<'0' || document.form.dictCode.value.charAt(i)>'9'){
					$.messager.alert('提示','<bean:message key="Comm.js.commom.msg14" bundle="conf.comm.CommMessage"/>');
					return ;
				}
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
	<body
		onload="showHspMessage('<%=commDictPublicChar.getMessage()%>')">
		<form name="form" method="post" action="comm/commDictPublicChar.do">
			<input type="hidden" name="verbId" value="add" />
			<!-- <table align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
				<tr>
					<td class="tblTitle" colspan="4"><span>※</span> 
						<bean:message key="Comm.jsp.commom.addDictInfo"
							bundle="conf.comm.CommMessage" />
						<span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span>
						<bean:message key="Comm.jsp.commom.typeName"
							bundle="conf.comm.CommMessage" />
						:
					</td>
					<td>
						<input type="text" class="input" id="displayInputId_1"
							name="className" style="font-size:12px;width:180px"
							onkeydown="huiche()" value="<%=commDictPublicChar.getClassName()%>"
							readonly="readonly" onkeypress="eventOnKeyPress('dictCode')" />
						<input type="hidden" id="hiddenInputId_1"
							value="<%=commDictPublicChar.getClassCode()%>" name="classCode" />
						<img src="security/include/images/select.gif"
							style="cursor: pointer;"
							onclick="add('<%=request.getContextPath()%>/comm/commDictPublicChar.do?verbId=getClass','displayInputId_1','hiddenInputId_1')" />
					</td>
					<td class="tblLable">
						<span>*</span>
						<bean:message key="Comm.jsp.commom.dictCode"
							bundle="conf.comm.CommMessage" />
						:
					</td>
					<td>
						<input type="text"name="dictCode" id="dictCode"
							size="20" maxlength="20" onkeypress="eventOnKeyPress('dictValue')"
							max="20" dataType="LimitB" msg="项目代码输入过长"
							value="<%=commDictPublicChar.getDictCode()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span>
						<bean:message key="Comm.jsp.commom.dictValue"
							bundle="conf.comm.CommMessage" />
						:
					</td>
					<td>
						<input type="text" name="dictValue" size="50"
							maxlength="60" onkeypress="eventOnKeyPress('seqNo')"
							max="60" dataType="LimitB" msg="项目名称输入过长"
							value="<%=commDictPublicChar.getDictValue()%>" />
					</td>
					<td class="tblLable">
						<bean:message key="Comm.jsp.commom.seqNo"
							bundle="conf.comm.CommMessage" />
						:
					</td>
					<td>
						<input type="text"name="seqNo" id="seqNo"
							size="30" maxlength="11" onkeypress="eventOnKeyPress('comments')"
							value="<%=commDictPublicChar.getSeqNo()%>" readonly />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="Comm.jsp.commom.comments"
							bundle="conf.comm.CommMessage" />
						:
					</td>
					<td colspan="3">
						<input type="text" name="comments" id="comments"
							size="30" maxlength="40" max="40" dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('btnSaveForm')"
							value="<%=commDictPublicChar.getComments()%>" />
					</td>
				</tr>
			</table> -->
			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>类别名称</td>
						<td class='crm_edit_item_content'>
							<input type="text" class="text" id="displayInputId_1"
							name="className" style="font-size:12px;width:180px"
							onkeydown="huiche()" value="<%=commDictPublicChar.getClassName()%>"
							readonly="readonly" onkeypress="eventOnKeyPress('dictCode')" disabled="disabled"/>
							<input type="hidden" id="hiddenInputId_1"
							value="<%=commDictPublicChar.getClassCode()%>" name="classCode" />
							<img src="security/include/images/select.gif"
							style="cursor: pointer;"
							onclick="add('<%=request.getContextPath()%>/comm/commDictPublicChar.do?verbId=getClass','displayInputId_1','hiddenInputId_1')" />
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>项目代码</td>
						<td class='crm_edit_item_content'>
							<input type="text"name="dictCode" id="dictCode" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" maxlength="20" onkeypress="eventOnKeyPress('dictValue')"
							max="20" dataType="LimitB" msg="项目代码输入过长"
							value="<%=commDictPublicChar.getDictCode()%>" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>项目名称</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="dictValue" class="text"
							maxlength="60" onkeypress="eventOnKeyPress('seqNo')" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="60" dataType="LimitB" msg="项目名称输入过长"
							value="<%=commDictPublicChar.getDictValue()%>" />
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="seqNo" id="seqNo" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" maxlength="11" onkeypress="eventOnKeyPress('comments')"
							value="<%=commDictPublicChar.getSeqNo()%>" readonly />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="comments" id="comments" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" maxlength="40" max="40" dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('btnSaveForm')"
							value="<%=commDictPublicChar.getComments()%>" />
						</td>
					
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
