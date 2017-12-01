<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commDictPublicClass" scope="request"
	class="com.tianjian.comm.struts.form.CommDictPublicClassForm" />
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
		<title><bean:message key="Comm.jsp.commom.addDictTypeInfo"
				bundle="conf.comm.CommMessage" />
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
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
						$.messager.alert('提示'," \""+itermname+"\" <bean:message key="Comm.js.commom.msg7" bundle="conf.comm.CommMessage" /> ");
						return false;
						}
					}		
				}
				function trim(str){  //删除左右两端的空格
					return str.replace(/(^\s*)|(\s*$)/g, "");
				}
		function saveForm(){
			if(document.form.seqNo.value == ""){
				$.messager.alert('提示',"序号不能为空！");
				return ;
			}
			if(!Validator.Validate(document.forms.form,3)){
		      return ;
		   	}
			var reg1 = /^[a-zA-Z]{1}[a-zA-Z0-9|_]+$/;
			if(document.form.classCode.value == ""){
			 	$.messager.alert('提示','<bean:message key="Comm.js.commom.msg10" bundle="conf.comm.CommMessage" />');
			 	return ;
			}
			if(document.form.className.value == ""){
			 	$.messager.alert('提示','<bean:message key="Comm.js.commom.msg11" bundle="conf.comm.CommMessage" />');
			 	return ;
			}
			if(!reg1.test(document.form.classCode.value)){
				$.messager.alert('提示','<bean:message key="Comm.js.commom.msg12" bundle="conf.comm.CommMessage" />');
				return;
			}
			if(/\D/.test(document.form.seqNo.value)){
				$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.warn1'/>");
				return;
			}
			if(document.form.seqNo.value !== null){ 
			if(yznumber('seqNo','<bean:message key="Comm.js.commom.msg6" bundle="conf.comm.CommMessage" />','6','2')==false){
						return;
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
		onload="showHspMessage('<%=commDictPublicClass.getMessage()%>')">
		<form name="form" method="post" action="comm/commDictPublicClass.do">
			<input type="hidden" name="verbId" value="add" />
			<!-- <table border="0" cellpadding="0" cellspacing="0" class="tblFill" align="center">
				<tr>
					 <td class="tblTitle" colspan="4"><span>※</span>
						<bean:message key="Comm.jsp.commom.addDictType"
							bundle="conf.comm.CommMessage" />
						<span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span>
						<bean:message key="Comm.jsp.commom.typeCode"
							bundle="conf.comm.CommMessage" />:
					</td>
					<td>
						<input type="text" class="kuandu" name="classCode" size="20"
							maxlength="32" onkeypress="eventOnKeyPress('className')"
							max="32" dataType="LimitB" msg="类别代码输入过长"
							value="<%=commDictPublicClass.getClassCode()%>" />
					</td>
					<td class="tblLable">
						<span>*</span>
						<bean:message key="Comm.jsp.commom.typeName"
							bundle="conf.comm.CommMessage" />:
					</td>
					<td>
						<input type="text" class="kuandu" name="className" size="50"
							maxlength="60" onkeypress="eventOnKeyPress('seqNo')" max="60"
							dataType="LimitB" msg="类别名称输入过长"
							value="<%=commDictPublicClass.getClassName()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="jsp.seqNo" bundle="conf.Init" />:
					</td>
					<td>
						<input type="text" class="kuandu" name="seqNo" id="seqNo"
							size="30" maxlength="11" onkeypress="eventOnKeyPress('comments')"
							value="<%=commDictPublicClass.getSeqNo()%>" readonly />
					</td>
					<td class="tblLable">
						<bean:message key="jsp.comments" bundle="conf.Init" />:
					</td>
					<td>
						<input type="text" class="kuandu" name="comments" id="comments"
							size="30" maxlength="40" max="40" dataType="LimitB" msg="备注输入过长"
							value="<%=commDictPublicClass.getComments()%>"
							onkeypress="eventOnKeyPress('btnSaveForm')" />
					</td>
				</tr>
			</table> -->
			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>类别代码</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="classCode" size="20"
							maxlength="32" onkeypress="eventOnKeyPress('className')"
							max="32" dataType="LimitB" msg="类别代码输入过长"
							value="<%=commDictPublicClass.getClassCode()%>" />
						</td>
						
						<td class='crm_edit_item_name'><label class="redlable">*</label>类别名称</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="className" size="50"
							maxlength="60" onkeypress="eventOnKeyPress('seqNo')" max="60"
							dataType="LimitB" msg="类别名称输入过长"
							value="<%=commDictPublicClass.getClassName()%>" /></td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>
						</td>
						<td class='crm_edit_item_content' style="color: red;font-size: 11px;">代码格式为字母、数字、下划线组成，且必须是字母开头
						</td>
						
						<td colspan="2"></td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="seqNo" id="seqNo"
							size="30" maxlength="11" onkeypress="eventOnKeyPress('comments')"
							value="<%=commDictPublicClass.getSeqNo()%>" readonly /></td>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content' colspan="3"><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" type="text" class="kuandu" name="comments" id="comments"
							size="30" maxlength="40" max="40" dataType="LimitB" msg="备注输入过长"
							value="<%=commDictPublicClass.getComments()%>"
							onkeypress="eventOnKeyPress('btnSaveForm')"/></td>
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
