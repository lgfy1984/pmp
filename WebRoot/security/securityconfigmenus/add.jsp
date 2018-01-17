﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="dataForm" scope="request" class="com.tianjian.security.struts.form.SecurityConfigMenusForm" />
<!DOCTYPE html>
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
		<title><bean:message key="security.jsp.securityconfigmenus.add.title" bundle="conf.security.security" />
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="${path}/include/javascript/validator.js" /></script>
		<script language="javascript" src='<bean:message key="Comm.js.TJMessagepath" bundle="conf.comm.CommMessage"/>'></script>
		<script language="javascript" src="${path}/include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="${path}/security/include/javascript/jianbian.js"></script>
		<script type="text/javascript" src="${path}/security/include/javascript/gettext_en.js"></script>
		<link rel="stylesheet" href="${path}/include/css/open.css" />
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="${path}/include/css/form.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
	    <script type="text/javascript" src="${path}/include/javascript/jquery-1.4.4.min.js"></script>
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
	
		<script language="javascript">
		function savePara(){
			var id = document.getElementById("id").value;
			
				if(!Validator.Validate(document.forms.form,3)){
     			 return ;
   				}
				parent.parent.$.messager.confirm("提示","<bean:message key='security.jsp.commom.save' bundle='security'/>",function(r){
				    if (r){   
				    	document.form.verbId.value = "add";
					    var formData = $("#form").serialize();
					    $.ajax({
					    	dataType: "text/html",
					    	type:"POST",
					    	url:"${path}/security/securityConfigMenus.do",
					    	processData:true,
					    	data:formData,
					    	error: function(a, b, c){
				        		parent.parent.$.messager.alert('提示',a + "-" + b + "-" + c);
				    				
				        	},
					    	success:function(data){
					    			    alert(1);
					    		if(data != null){
					    			try{
					    				var json = eval(data);
					    			}catch(e){
					    				parent.parent.$.messager.alert('提示',"请重新登录！");
					    				return;
					    			}
					    			if(json[0].flag == '1'){
					    				var securityConfigPublicId = document.getElementById("securityConfigPublicId").value;
					      				var parentId = document.getElementById("parentId").value;
					      				if(parentId != null && parentId.length > 0){
					      					parent.frames["treeFrame"].refreshByIdAndType(parentId, "4");
					      				}else if(securityConfigPublicId != null && securityConfigPublicId.length > 0){
					      					parent.frames["treeFrame"].refreshByIdAndType(securityConfigPublicId, "3");
				      					}
					      				parent.parent.$.messager.alert('提示',json[0].msg);
					    				
					    				location.reload(false);	
					    			}else{
					    				parent.parent.$.messager.alert('提示',json[0].msg);
					    				
					    			}
					    		}
					    	}
					    });
				    }   
				});
				
		}
</script>
<style type="text/css">
.redlable {
	color: #FF0000;
	font-size: 16px;
}
</style>
	</head>
	<body>
		<form name="form" id="form" method="post" action="security/securityConfigMenus.do">
			<input type="hidden" name="verbId" value="add" />
			<div class="crm_edit_panel">
			<table class="crm_panel_table">
				<tr>
					<td class="crm_edit_item_name" colspan="4">
					<label style="float: left;font-size:14;color:#498ED3">
						<bean:message key="security.jsp.securityconfigmenus.add.topic" bundle="conf.security.security" />
					</label>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label>模块</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<select name="data.securityConfigPublicId" id="securityConfigPublicId" 
						onkeypress="eventOnKeyPress('menuCode')"   class="easyui-combobox"
						style="width:445px;height: 28px;border:1px solid rgb(218,218,218);" readonly
						onkeydown="if(event.keyCode==13){event.keyCode=9}" require="true" msg="模块不能为空">
							<%
								if (dataForm.getSecurityConfigPublicIds() != null&& dataForm.getSecurityConfigPublicIds().length > 0) {
									for (int i = 0; i < dataForm.getSecurityConfigPublicIds().length; i++) {
										String tempId = dataForm.getSecurityConfigPublicIds()[i];
										String tempName = dataForm.getSecurityConfigPublicNames()[i];
							%>
									<option value="<%=tempId%>"
										<%=tempId.equals(dataForm.getData().getSecurityConfigPublicId()) ? "selected": ""%>>
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
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label>ID</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" style="width:150px" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"name="data.id" id="id" onkeypress="eventOnKeyPress('menuDetail')" size="20" maxlength="20" onkeydown="if(event.keyCode==13){event.keyCode=9}" require="true" dataType="Integer" msg="ID应为1-20位数字" value="${dataForm.data.id}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label>
						<bean:message key="jsp.name" bundle="conf.Init" /></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text" class="text" style="width:150px" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"name="data.menuDetail" id="menuDetail" onkeypress="eventOnKeyPress('serialNo')"  size="50" maxlength="100" min="1" max="100" require="true" dataType="LimitB" msg="名称的长度应在1-100字节范围" onkeydown="if(event.keyCode==13){event.keyCode=9}" value="" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="jsp.serialNo" bundle="conf.Init" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" class="text"  style="width:150px" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"name="data.serialNo" onkeypress="eventOnKeyPress('menuNotice')" id="serialNo" size="30" maxlength="11" onkeydown=" if(event.keyCode==13){event.keyCode=9}" value="${dataForm.data.serialNo}" readonly />
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigmenus.common.menuNotice"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.menuNotice" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"style="width:150px"
							onkeypress="eventOnKeyPress('menuUrl')" id="menuNotice" size="30"
							maxlength="20" onkeydown="if(event.keyCode==13){event.keyCode=9}"
							max="100" dataType="LimitB" msg="菜单描述输入过长"
							value="${dataForm.data.menuNotice}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单URL  -->
						<label>
						<bean:message key="security.jsp.securityconfigmenus.common.menuUrl" bundle="conf.security.security" />
						</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text"  name="data.menuUrl" id="menuUrl" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:150px"
							onkeypress="eventOnKeyPress('endLevelFlag')" size="30"
							max="200" dataType="LimitB" msg="菜单URL输入过长"
							maxlength="200" value="${dataForm.data.menuUrl}"
							onkeydown="if(event.keyCode==13){event.keyCode=9}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label>
						<bean:message
							key="security.jsp.securityconfigmenus.common.parentId"
							bundle="conf.security.security" />
						</label>
					</td>
					<td colspan="3" class="crm_edit_item_content">
						<input type="text" style="width:434px;" class="text"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							id="parentIdname" onkeypress="eventOnKeyPress('displayType')"
							name="parentIdname" value="<%=dataForm.getData().getMenuDetail() %>"
							onkeydown="if(event.keyCode==13){event.keyCode=9}" />
						<input type="hidden" id="parentId" value="${dataForm.idHidden}" name="data.parentId" />
						<img src="${path}/security/include/images/select.gif" onkeydown="huiche()"
							style="cursor: pointer;"
							onclick="add('${path}/security/securityConfigMenus.do?verbId=getSecurityConfigMenus','parentIdname','parentId');" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--末节点标志  -->
						<label>
						<bean:message key="security.jsp.securityconfigmenus.common.endLevelFlag"
							bundle="conf.security.security" />
						</label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.endLevelFlag" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:150px"
							onkeypress="eventOnKeyPress('menuLevel')" id="endLevelFlag"
							size="30" maxlength="1"
							onkeydown="if(event.keyCode==13){event.keyCode=9}"
							value="${dataForm.data.endLevelFlag}" />
					</td>
					<td class="crm_edit_item_name">
						<!--菜单级别  -->
						<label>
						<bean:message key="security.jsp.securityconfigmenus.common.menuLevel"
							bundle="conf.security.security" />
						</label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.menuLevel" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:150px"
							id="menuLevel" onkeypress="eventOnKeyPress('menuSeq')" size="30"
							maxlength="1" value="${dataForm.data.menuLevel}"
							onkeydown="if(event.keyCode==13){event.keyCode=9}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单序号  -->
						<label>
						<bean:message
							key="security.jsp.securityconfigmenus.common.menuSeq"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.menuSeq" id="menuSeq" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" style="width:150px"
							onkeypress="eventOnKeyPress('menuIcon')" size="30" maxlength="3"
							onkeydown="if(event.keyCode==13){event.keyCode=9}"
							value="${dataForm.data.menuSeq}" />
					</td>
					<td class="crm_edit_item_name">
						<!--菜单数据  -->
						<label>
						<bean:message
							key="security.jsp.securityconfigmenus.common.menuData"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.menuData" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:150px"
							id="menuData" onkeypress="eventOnKeyPress('menuTarget')"
							size="30" maxlength="150" max="150" dataType="LimitB" msg="菜单数据输入过长"
							onkeydown="if(event.keyCode==13){event.keyCode=9}"
							value="${dataForm.data.menuData}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!-- 菜单方法 -->
						<label>
						<bean:message
							key="security.jsp.securityconfigmenus.common.menuMethod"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.menuMethod" id="menuMethod" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" style="width:150px"
							onkeypress="eventOnKeyPress('parentIdname')" size="30"
							max="50" dataType="LimitB" msg="菜单方法输入过长"
							maxlength="50" onkeydown="if(event.keyCode==13){event.keyCode=9}"
							value="${dataForm.data.menuMethod}" />
					</td>
					<td class="crm_edit_item_name">
						<label>终端类型</label>
					</td>
					<td class="crm_edit_item_content">
						<%
							String isFlagMenu = dataForm.getData().getIsFlatMenu();
						%>
						<select name="data.isFlagMenu" class="easyui-combobox" style="width:162px;height: 28px;border:1px solid rgb(218,218,218);">
							<option>web浏览器</option>
							<option value="1" <%="1".equals(isFlagMenu) ? "selected" : "" %>>平板</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单图标  -->
						<label>
						<bean:message
							key="security.jsp.securityconfigmenus.common.menuIcon"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text"  name="data.menuIcon" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:434px;"
							id="menuIcon" onkeypress="eventOnKeyPress('menuData')" size="30"
							max="50" dataType="LimitB" msg="菜单图标输入过长"
							maxlength="50" value="${dataForm.data.menuIcon}"
							onkeydown="if(event.keyCode==13){event.keyCode=9}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<!--菜单目标-->
						<label>
						<bean:message
							key="security.jsp.securityconfigmenus.common.menuTarget"
							bundle="conf.security.security" />
						</label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text"  name="data.menuTarget" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:434px;"
							id="menuTarget" onkeypress="eventOnKeyPress('menuMethod')"
							size="30" maxlength="200" value="${dataForm.data.menuTarget}"
							max="200" dataType="LimitB" msg="菜单目标输入过长"
							onkeydown="if(event.keyCode==13){event.keyCode=9}" />
					</td>
				</tr>
				<%-------------------------源代码屏蔽-------开始--------------------------  
		
					
					<td class="qian" nowrap>
						父类代码：
					</td>
					<td class="hou" nowrap>
						 <select class="select" id="parentId" name="data.parentId" onkeydown="eventOnKeyPress('picPath')">
							<option value=""></option>
							<logic:iterate id="commBean" name="dataForm" property="securityConfigMenusList" indexId="ind">
								<option value="${commBean.id}">
									${commBean.menuDetail}
								</option>
							</logic:iterate>
						</select>
					</td>
				
				------------------------源代码屏蔽-------结束-----------------onfocus="if(this.value=='')add('security/securityConfigMenus.do?verbId=getSecurityConfigMenus','parentIdname','parentId');"-----%>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message
							key="security.jsp.securityconfigmenus.common.displayType"
							bundle="conf.security.security" /></label>
					</td>
					<td class="crm_edit_item_content" colspan="3" >
						<select  onkeypress="eventOnKeyPress('comments')" id="displayType" class="easyui-combobox"
							style="width:445px;height: 28px;border:1px solid rgb(218,218,218);"
							name="data.displayType"
							onkeydown="if(event.keyCode==13){event.keyCode=9}">
							<option value="0"
								<logic:equal name="dataForm" property="data.displayType" value="0">selected</logic:equal>>
								<bean:message
									key="security.jsp.securityconfigmenus.common.displayTypeOption1"
									bundle="conf.security.security" />
							</option>
							<option value="1"
								<logic:equal  name="dataForm" property="data.displayType" value="1">selected</logic:equal>>
								<bean:message
									key="security.jsp.securityconfigmenus.common.displayTypeOption2"
									bundle="conf.security.security" />
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="jsp.comments" bundle="conf.Init" /></label>
					</td>
					<td class="crm_edit_item_content" colspan="3">
						<input type="text"  name="data.comments" onkeypress="eventOnKeyPress('btnSaveForm')" id="comments"
							max="40" dataType="LimitB" msg="备注输入过长" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:434px;"
							size="30" maxlength="40" value="${dataForm.data.comments}"
							onkeydown="if(event.keyCode==13){event.keyCode=9}" />
					</td>
				</tr>
			</table>
			</div>
			<!-- Sheet operation button area -->
			<div align="center" style="margin-top:10px;">
				<input type="button"  class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" name="btnSaveForm" value="<bean:message key="security.jsp.commom.button1" bundle="security"/>" onClick="savePara();" />
			</div>
		</form>
	</body>
</html>
