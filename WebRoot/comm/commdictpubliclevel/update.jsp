<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commDictPublicLevel" scope="request" 
	class="com.tianjian.comm.struts.form.CommDictPublicLevelForm" />
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
		<title><bean:message key="Comm.jsp.commom.updateGeneralLevelDictInfo" bundle="conf.comm.CommMessage"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="<bean:message key="security.js.gettext_staff.path" bundle="security" />"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/open.css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		
		<script language="javascript">
			function trim(str){  //删除左右两端的空格
				return str.replace(/(^\s*)|(\s*$)/g, "");
			}
			function saveForm(){
				if(!Validator.Validate(document.forms.form,3)){
	         	return ;
	   	    	}
			    if(document.form.tableCode.value == ""){
			 	$.messager.alert('提示','<bean:message key="Comm.js.commom.msg16" bundle="conf.comm.CommMessage" />');
			 	return ;
				}
				if(document.form.classLevel.value == ""){
				 $.messager.alert('提示','<bean:message key="comm.jsp.common.warn31" bundle="conf.comm.comm"/>');
				 return;
				}
				if(/\D/.test(document.form.seqInLevel.value)){
					$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.warn1'/>");
					return;
				}
				if(document.form.itemName.value == ""){
					//$.messager.alert('提示',{message:'<bean:message key="comm.jsp.common.warn32" bundle="conf.comm.comm"/>');
					$.messager.alert('提示','<bean:message key="comm.jsp.common.warn32" bundle="conf.comm.comm"/>');
				   return ;
				}
				
				for(var i=0; i<document.form.classLevel.value.length; i++){
					if(document.form.classLevel.value.charAt(i)<'0' || document.form.classLevel.value.charAt(i)>'9'){
						$.messager.alert('提示','<bean:message key="Comm.js.commom.msg17" bundle="conf.comm.CommMessage"/>');
						return ;
					}
			    } 
			    for(var i=0; i<document.form.itemName.value.length; i++){
					if(document.form.itemName.value.charAt(i)<'0' || document.form.itemName.value.charAt(i)>'9'){
						$.messager.alert('提示','<bean:message key="Comm.js.commom.msg15" bundle="conf.comm.CommMessage"/>');
						return ;
					}
			    } 
				   
				    document.form.verbId.value = "update";    
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
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
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
	<body onload="showHspMessage('<%=commDictPublicLevel.getMessage()%>')">
		<form name="form" method="post" action="comm/commDictPublicLevel.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="itemCode" value="<%=commDictPublicLevel.getItemCode()%>" />
			<input type="hidden" name="idHidden" value=<%=commDictPublicLevel.getIdHidden()%> />
			<!-- <table align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
				<tr>
					    <td class="tblTitle" colspan="4"><span>※</span><bean:message key="Comm.jsp.commom.modifyGeneralDict"bundle="conf.comm.CommMessage"/>
						<span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span> <bean:message key="Comm.jsp.commom.dictType" bundle="conf.comm.CommMessage"/>:
					</td>
					<td>
						<input type="text" class="input" id="displayInputId_1"
							name="tableName" style="font-size: 12px; width: 180px"
							onkeydown="huiche()" value="<%=commDictPublicLevel.getTableName()%>"
							readonly="readonly" onkeypress="eventOnKeyPress('hidden_1')" />
						<input type="hidden" id="hiddenInputId_1"
							value="<%=commDictPublicLevel.getTableCodes()%>" name="tableCode" />
						<img src="security/include/images/select.gif"
							style="cursor: pointer;"
							onclick="add('<%=request.getContextPath()%>/comm/commDictPublicChar.do?verbId=getClass','displayInputId_1','hiddenInputId_1')" />
					</td>
					<td class="tblLable">
						 <bean:message key="Comm.jsp.commom.parentItemName" bundle="conf.comm.CommMessage"/>:
					</td>
					<td>
						<select name="parentItemCode" id="parentItemCode" onkeypress="eventOnKeyPress('classLevel')">
							<%
									if (commDictPublicLevel.getParentItemCodes() != null && commDictPublicLevel.getParentItemCodes().length > 0) {
									for (int i = 0; i < commDictPublicLevel.getParentItemCodes().length; i++) {
										String tempId = commDictPublicLevel.getParentItemCodes()[i];
										String tempName = commDictPublicLevel.getParentItemNames()[i];
							%>
							<option value="<%=tempId%>" <%=tempId.equals(commDictPublicLevel.getParentItemCode()) ? "selected" : ""%>>
								<%=tempName%>
							</option>
							<%
								}
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span> <bean:message key="Comm.jsp.commom.itemLevel" bundle="conf.comm.CommMessage"/>: 	
					</td>
					<td>
						<input type="text"  name="classLevel" size="20" maxlength="5" onkeypress="eventOnKeyPress('itemName')" max="5" dataType="LimitB" msg="项目级别输入过长" value="<%=commDictPublicLevel.getClassLevel()%>" />
					</td>
					<td class="tblLable">
						<span>*</span> <bean:message key="jsp.dictValue" bundle="conf.Init"/>:
					</td>
					<td>
						<input type="text" name="itemName" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqInLevel')"  max="60" dataType="LimitB" msg="项目名称输入过长" value="<%=commDictPublicLevel.getItemName()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="jsp.seqNo" bundle="conf.Init"/>:
					</td>
					<td>
						<input type="text"  name="seqInLevel" id="seqInLevel" size="20" maxlength="6" onkeypress="eventOnKeyPress('comments')" value="<%=commDictPublicLevel.getSeqInLevel()%>"  readonly/>
					</td>
					<td class="tblLable">
						<bean:message key="jsp.comments" bundle="conf.Init"/>:
					</td>
					<td>
						<input type="text" name="comments" id="comments" size="50" maxlength="50" onkeypress="eventOnKeyPress('btnSaveForm')" max="40" dataType="LimitB" msg="备注输入过长" value="<%=commDictPublicLevel.getComments()%>" />
					</td>
				</tr>
			</table> -->
			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>字典类型</td>
						<td class='crm_edit_item_content'>
							<input type="text" class="text" id="displayInputId_1"
							name="tableName" style="font-size: 12px; width: 180px"
							onkeydown="huiche()" value="<%=commDictPublicLevel.getTableName()%>"
							readonly="readonly" onkeypress="eventOnKeyPress('hidden_1')" disabled="disabled"/>
						<input type="hidden" id="hiddenInputId_1"
							value="<%=commDictPublicLevel.getTableCode()%>" name="tableCode" />
						<img src="security/include/images/select.gif"
							style="cursor: pointer;"
							onclick="add('<%=request.getContextPath()%>/comm/commDictPublicChar.do?verbId=getClass','displayInputId_1','hiddenInputId_1')" />
						</td>
						<td class='crm_edit_item_name'>父项目名称</td>
						<td class='crm_edit_item_content'>
							<select name="parentItemCode" class="easyui-combobox" editable="false" style="width: 206px;height:30px;" id="parentItemCode" onkeypress="eventOnKeyPress('classLevel')">
							<%
									if (commDictPublicLevel.getParentItemCodes() != null && commDictPublicLevel.getParentItemCodes().length > 0) {
									for (int i = 0; i < commDictPublicLevel.getParentItemCodes().length; i++) {
										String tempId = commDictPublicLevel.getParentItemCodes()[i];
										String tempName = commDictPublicLevel.getParentItemNames()[i];
							%>
							<option value="<%=tempId%>" <%=tempId.equals(commDictPublicLevel.getParentItemCode()) ? "selected" : ""%>>
								<%=tempName%>
							</option>
							<%
								}
								}
							%>
						</select>
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>项目级别</td>
						<td class='crm_edit_item_content'>
							<input type="text" class="text" name="classLevel" size="20" maxlength="5" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('itemName')" max="5" dataType="LimitB" msg="项目级别输入过长" value="<%=commDictPublicLevel.getClassLevel()%>" />
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>项目名称</td>
						<td class='crm_edit_item_content'>
							<input type="text" class="text" name="itemName" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('seqInLevel')"  max="60" dataType="LimitB" msg="项目名称输入过长" value="<%=commDictPublicLevel.getItemName()%>" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
						<td class='crm_edit_item_content'>
							<input type="text" class="text" name="seqInLevel" id="seqInLevel" size="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="6" onkeypress="eventOnKeyPress('comments')" value="<%=commDictPublicLevel.getSeqInLevel()%>"  readonly/>
						</td>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content'>
							<input type="text" class="text" name="comments" id="comments" size="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="50" onkeypress="eventOnKeyPress('btnSaveForm')" max="40" dataType="LimitB" msg="备注输入过长" value="<%=commDictPublicLevel.getComments()%>" />
						</td>
					</tr>
				</table>
			</div>
			<!-- Sheet operation button area -->
			<div class='crm_button_sub'>
				<input type="button" name="btnSaveForm" value="修改"
					class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm()" /> 
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
					onclick="history.go(-1);" />
			</div>
		</form>
	</body>
</html>
