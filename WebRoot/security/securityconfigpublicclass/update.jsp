<%@page import="java.util.Iterator"%>
<%@page import="com.tianjian.security.bean.SecurityConfigPublicClass"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="dataForm" scope="request" class="com.tianjian.security.struts.form.SecurityConfigPublicClassForm" />
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
				key="security.jsp.securityconfigpublicclass.update.title"
				bundle="conf.security.security" />
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script language="javascript" src="include/javascript/jquery-1.4.4.min.js"></script>
		
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script language="javascript" src='<bean:message key="include.js.TJMessage.path" bundle="security" />'></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		<script type="text/javascript" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/js/radioDefault.js"></script>
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
		<script language="javascript">
			function saveForm(){
				if(!Validator.Validate(document.forms.form,3)){
			      	return ;
			   	}
				if(document.form.classCode.value == ""){
					$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn" bundle="security"/>');
				 	return ;
				}
				if(isNaN(document.form.classCode.value)){
						$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
						return ; 
				}
				if(document.form.className.value == ""){
					$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn1" bundle="security"/>');
				 	return ;
				}
				$.messager.confirm('确认', '确定要保存该条记录吗？', function(r){
    				if (r){    
					 document.form.verbId.value = "update";
					    var formData = $("#form").serialize();
					    $.ajax({
					    	dataType: "text/html",
					    	type:"POST",
					    	url:"security/securityConfigPublicClass.do",
					    	processData:true,
					    	data:formData,
					    	error: function(a, b, c){
				        		$.messager.alert('提示',a + "-" + b + "-" + c);
				        	},
					    	success:function(data){
					    		if(data != null){
					    			try{
					    				var json = eval(data);
					    			}catch(e){
					    				$.messager.alert('提示',"请重新登录！");
					    				return;
					    			}
					    			if(json[0].flag == '1'){
					    				var oldParentId = document.getElementById("oldParentId").value;
					    				var parentId = document.getElementById("parentId").value;
					    				if(oldParentId.length == 0 || parentId.length == 0){
					    					parent.frames["treeFrame"].refreshRootNode();
					    				}else{
						      				if(parentId.length > 0){
						      					parent.frames["treeFrame"].refreshByIdAndType(parentId, "1");
						      				}
						      				<%--当改变了一级模块类别时，旧的一级模块类别节点也要刷新--%>
					      					if(oldParentId.length > 0 && oldParentId != parentId){
						      					parent.frames["treeFrame"].refreshByIdAndType(oldParentId, "1");
						      				}
					    				}
					      				$.messager.alert('提示',json[0].msg);
					    			}else{
					    				$.messager.alert('提示',json[0].msg);
					    			}
					    		}
					    	}
					    });
			   		 } 
			    });
			}
			function showMessage(message){
				if(message != '' && message != null){
					$.messager.alert('提示',message);
					return;
				}
			}
			function changlevelFlag(){
			 	var parentId = document.getElementById("parentId").value;
			 	if(parentId != null && parentId.length > 0){
			 		var radios= document.getElementsByName("data.levelFlag")
			 		radios[1].checked=true;;
			 	}else{
			 		var radios= document.getElementsByName("data.levelFlag")
			 		radios[0].checked=true;;
			 	}
			 }
	</script>
<style type="text/css">
.redlable {
	color: #FF0000;
	font-size: 16px;
}
</style>
	</head>
	<body onload="showMessage('${dataForm.message}')">
		<form name="form" id="form" method="post"
			action="security/securityConfigPublicClass.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="data.id" value="${dataForm.data.id}" />
			<input type="hidden" name="idHidden" value="${dataForm.idHidden}" />
			<input type="hidden" name="classCodeHidden" value="${dataForm.data.classCode}" />
			<input type="hidden" id="oldParentId" value="${dataForm.data.parentId}" />
			<div class="crm_edit_panel">
			<table class="crm_panel_table">
				<tr>
					<td class="crm_edit_item_name" colspan="4">
						<label style="float: left;font-size:14;color:#498ED3"><bean:message key="security.jsp.securityconfigpublicclass.update.topic" bundle="conf.security.security" /></label>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label><bean:message key="security.jsp.securityconfigpublicclass.common.className" bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.className" class="text" style="width:150px"
							id="className" size="50" maxlength="40"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="名称输入过长"
							onkeypress="eventOnKeyPress('serialNo')"
							value="${dataForm.data.className}" />
					</td>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label>
							<bean:message
							key="security.jsp.securityconfigpublicclass.common.classCode"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.classCode" class="text" style="width:150px"
							id="classCode" size="20" maxlength="9" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="20" dataType="LimitB" msg="代码输入过长"
							onkeypress="eventOnKeyPress('className')"
							value="${dataForm.data.classCode}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigpublicclass.common.serialNo"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.serialNo" class="text" style="width:150px"
							id="serialNo" size="20" maxlength="11" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('comments')"
							value="${dataForm.data.serialNo}" readonly />
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigpublicclass.common.comments"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.comments" class="text" style="width:150px"
							id="comments" size="50" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('parentId')"
							value="${dataForm.data.comments}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigpublicclass.common.parentId"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<select id="parentId"  name="data.parentId" class="easyui-combobox"  style="width: 162px;height: 28px;border:1px solid rgb(218,218,218);"
							onkeypress="eventOnKeyPress('levelFlag')" onchange="changlevelFlag();">
							<option value=""></option>
							<%
								List<?> list = dataForm.getSecurityConfigPublicClassList();
								if(list != null){
									Iterator<?> iterator = list.iterator();
									String parentId = dataForm.getData().getParentId();
									while(iterator.hasNext()){
										SecurityConfigPublicClass publicClass = (SecurityConfigPublicClass)iterator.next();
										if(!publicClass.getId().equals(dataForm.getData().getId())){
							%>
							<option value="<%=publicClass.getId() %>" <%=publicClass.getId().equals(parentId) ? "selected" : "" %>>
								<%=publicClass.getClassName() %>
							</option>
							<%
										}
									}
								}
							%>
						</select>
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigpublicclass.common.levelFlag"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
							<%if(dataForm.getData().getLevelFlag()!=null && String.valueOf(dataForm.getData().getLevelFlag()).equals("1")){ %>
								<div class="crm_radio_group">
								<label  class="label_checked"><input type="radio"  name="data.levelFlag" id="levelFlag"  onkeypress="eventOnKeyPress('picPath')"
				             	 value="1" checked="checked" />1级</label>
				                <label  class="label_nocheck"><input type="radio"  name="data.levelFlag" id="levelFlag"  onkeypress="eventOnKeyPress('picPath')"
				              		value="2" />2级</label>
				              	</div>
							<%}else if(dataForm.getData().getLevelFlag()!=null && String.valueOf(dataForm.getData().getLevelFlag()).equals("2")){ %>
								<div class="crm_radio_group">
								 <label  class="label_nocheck"><input type="radio"  name="data.levelFlag" id="levelFlag"  onkeypress="eventOnKeyPress('picPath')"
				             	 value="1" />1级</label>
				                 <label  class="label_checked"><input type="radio"  name="data.levelFlag" id="levelFlag"  onkeypress="eventOnKeyPress('picPath')" checked="checked" 
				              		value="2" />2级</label>
				              		</div>
							<%}else{ %>
							<%} %>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigpublicclass.common.picPath"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.picPath" id="picPath"  class="text" style="width:150px"
							size="30" maxlength="32" onkeypress="eventOnKeyPress('sysFlag')" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="32" dataType="LimitB" msg="图片路径输入过长"
							value="${dataForm.data.picPath}" />
					</td>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label><bean:message
							key="security.jsp.securityconfigpublicclass.common.sysFlag"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<%if(dataForm.getData().getSysFlag()!= null && String.valueOf(dataForm.getData().getSysFlag()).equals("0")){ %>
							<div class="crm_radio_group">
							  <label  class="label_checked"><input type="radio"  name="data.sysFlag" id="sysFlag" onkeypress="eventOnKeyPress('redirectUrl')"
				             	 value="0" checked="checked" />系统外</label>
				              <label  class="label_nocheck"><input type="radio"  name="data.sysFlag" id="sysFlag" onkeypress="eventOnKeyPress('redirectUrl')"
				              		value="1" />系统内</label>
				            </div>
						<%}else if(dataForm.getData().getSysFlag()!=null && String.valueOf(dataForm.getData().getSysFlag()).equals("1")){ %>
							<div class="crm_radio_group">
							 <label  class="label_nocheck"><input type="radio"  name="data.sysFlag" id="sysFlag" onkeypress="eventOnKeyPress('redirectUrl')"
				             	value="0"  />系统外</label>
				             <label  class="label_checked"><input type="radio"  name="data.sysFlag" id="sysFlag"  onkeypress="eventOnKeyPress('redirectUrl')" checked="checked"
				              	value="1" />系统内</label>
				           </div>
						<%}else{ %>
						<%} %>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigpublicclass.common.redirectUrl"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.redirectUrl" class="text" style="width:150px"
							id="redirectUrl" size="30" maxlength="100" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('appSysFlag')"
							max="100" dataType="LimitB" msg="转向地址输入过长"
							value="${dataForm.data.redirectUrl}" />
					</td>

					<td  class="crm_edit_item_name">
						<label><label class="redlable">*</label>所属系统分类</label>
					</td>
					<td class="crm_edit_item_content">
						<%if(dataForm.getData().getAppSysFlag()!= null && String.valueOf(dataForm.getData().getAppSysFlag()).equals("0")){ %>
							<div class="crm_radio_group">
							<label  class="label_checked"><input type="radio"   name="data.appSysFlag" id="appSysFlag"  value="0" checked="checked" />支撑系统</label>
             				<label  class="label_nocheck"><input type="radio"   name="data.appSysFlag" id="appSysFlag" onkeypress="eventOnKeyPress('supportSystem')" value="1" />应用系统</label>
             				</div>
						<%}else if(dataForm.getData().getAppSysFlag()!= null && String.valueOf(dataForm.getData().getAppSysFlag()).equals("1")){ %>
							<div class="crm_radio_group">
							<label  class="label_nocheck"><input type="radio"  name="data.appSysFlag" id="appSysFlag"  value="0"/>支撑系统</label>
             				<label  class="label_checked"><input type="radio"  name="data.appSysFlag" id="appSysFlag" onkeypress="eventOnKeyPress('supportSystem')"  checked="checked" value="1" />应用系统</label>
             				</div>
						<%}else{ %>
						<%} %>
					</td>
				</tr>
			</table>
			</div>
			<p style="color: red;text-align: center">*注：一级模块类别的下一级可以是二级模块类别，也可以是模块，但两者不能共同存在。当一级模块类别下已添加模块时，不能再添加二级模块类别！</p>	
			<!-- Sheet operation button area -->
			 <div align="center" >
		  	   	<input class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" type="button" name="btnSaveForm" value="<bean:message key="security.jsp.commom.button1" bundle="security"/>"
							onClick="saveForm()" />
				<input class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" type="button" name="btnBack" value='<bean:message key="security.jsp.commom.button2" bundle="security"/>'
							onClick="history.go(-1);" /> 
		 	 </div>
		</form>
	</body>
</html>
