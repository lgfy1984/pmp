<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
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
		<title><bean:message key="security.jsp.securityConfigpublic.update.title" bundle="security" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="<bean:message key="include.js.TJMessage.path" bundle="security" />"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="include/javascript/jquery-1.4.4.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
		<script language="javascript">
		function savePara(){
			var modCode = document.getElementById("modCode").value;
			var serialNo = document.getElementById("serialNo").value;
				if(!Validator.Validate(document.forms.form,3)){
     			 return ;
   				}
				if(isNaN(modCode)){
					parent.parent.$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
					return ; 
				}
				if(isNaN(serialNo)){
					parent.parent.$.messager.alert('提示','<bean:message key="security.jsp.securityConfigpublic.commom.warn" bundle="security"/>');
					return ; 
				}
				parent.parent.$.messager.confirm('确认', '确定要保存该条记录吗？', function(r){
		    		if (r){
		    			document.form.verbId.value = "update";
						    var formData = $("#form").serialize();
						    $.ajax({
						    	dataType: "text/html",
						    	type:"POST",
						    	url:"security/securityConfigPublic.do",
						    	processData:true,
						    	data:formData,
						    	error: function(a, b, c){
					        		parent.parent.$.messager.alert('提示',a + "-" + b + "-" + c);
					        	},
						    	success:function(data){
						    		if(data != null){
						    			try{
						    				var json = eval(data);
						    			}catch(e){
						    				parent.parent.$.messager.alert('提示',"请重新登录！");
						    				return;
						    			}
						    			if(json[0].flag == '1'){
						    				var oldScpcId = document.getElementById("oldScpcId").value;
						    				var scpcId = document.getElementById("scpcId").value;
						      				if(scpcId != null && scpcId.length > 0){
						      					parent.frames["treeFrame"].refreshByIdAndType(scpcId, "1");
						      					parent.frames["treeFrame"].refreshByIdAndType(scpcId, "2");
						      				}
						      				<%--当改变了模块类别时，旧的模块类别节点也要刷新--%>
						      				if(oldScpcId != null && oldScpcId.length > 0 && oldScpcId != scpcId){
						      					parent.frames["treeFrame"].refreshByIdAndType(oldScpcId, "1");
						      					parent.frames["treeFrame"].refreshByIdAndType(oldScpcId, "2");
						      				}
						      				parent.parent.$.messager.alert('提示',json[0].msg);
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
		<form name="form" id="form" method="post"
			action="security/securityConfigPublic.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="data.id" id="id" value="${dataForm.data.id}" />
			<input type="hidden" name="idHidden" value="${dataForm.idHidden}" />
			<input type="hidden" name="modCodeHidden" value="${dataForm.modCodeHidden}" />
			<input type="hidden" id="oldScpcId" value="${dataForm.data.scpcId}" />
			<div class="crm_edit_panel">
			<table class="crm_panel_table">
				<tr>
					<td class="crm_edit_item_name" colspan="4">
						<label style="float: left;font-size:14;color:#498ED3">
						<bean:message key="security.jsp.securityConfigpublic.update.title" bundle="security" />
						</label>
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label>
						<bean:message key="security.jsp.commmom.classCode" bundle="security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.reason" id="reason" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:150px"
							size="50" maxlength="50" onkeypress="eventOnKeyPress('serialNo')"
							max="50" dataType="LimitB" require="true" msg="名称的长度应在1-50字节范围"
							value="${dataForm.data.reason}" />
					</td>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label>
						<bean:message key="security.jsp.commom.menuCode" bundle="security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.modCode" id="modCode" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width:150px"
							size="20" maxlength="20" onkeypress="eventOnKeyPress('reason')"
							max="20" dataType="Integer" require="true" msg="代码应为1-20位数字"
							value="${dataForm.data.modCode}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.serialNo" bundle="security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.serialNo" class="text" style="width:150px" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							id="serialNo" size="30" maxlength="11" require="true" dataType="Integer" msg="序号应为1-11位数字"
							onkeypress="eventOnKeyPress('comments')"
							value="${dataForm.data.serialNo}" readonly />
					</td>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commmom.comments" bundle="security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text"  name="data.comments" class="text" style="width:150px"
							id="comments" size="30" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							max="40" dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('reasonValue')"
							value="${dataForm.data.comments}" />
					</td>
				</tr>
				<tr>
					<td class="crm_edit_item_name">
						<label><bean:message key="security.jsp.commom.SecurityConfigPublic"bundle="security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<input type="text" name="data.reasonValue" class="text" style="width:150px"
							id="reasonValue" size="30" maxlength="100" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('scpcId')"
							max="100" dataType="LimitB" msg="模块描述输入过长"
							value="${dataForm.data.reasonValue}" />
					</td>
					<td class="crm_edit_item_name">
						<label><label class="redlable">*</label><bean:message key="security.jsp.commom.scpcId" bundle="security" /></label>
					</td>
					<td class="crm_edit_item_content">
						<select id="scpcId" name="data.scpcId" onkeypress="eventOnKeyPress('picPath')" 
							class="easyui-combobox" style="width: 162px;height: 28px;border:1px solid rgb(218,218,218);"
							min="1" dataType="LimitB" msg="模块类别不能为空">
							<option value=""></option>
							<logic:notEmpty name="dataForm" property="securityConfigPublicClassList">
								<logic:iterate id="commmBean" name="dataForm" property="securityConfigPublicClassList" indexId="ind">
									<logic:equal name="commmBean" value="${dataForm.data.scpcId}" property="id">
										<option value="${commmBean.id}" selected="selected">
											${commmBean.className}
										</option>
									</logic:equal>
									<logic:notEqual name="commmBean" value="${dataForm.data.scpcId}" property="id">
										<option value="${commmBean.id}">
											${commmBean.className}
										</option>
									</logic:notEqual>
								</logic:iterate>
							</logic:notEmpty>
						</select>
					</td>
				</tr>
				 <tr>
        <td class="crm_edit_item_name" >
           	<label>模块链接</label>
        </td>
        <td class="crm_edit_item_content" colspan="3">
            <input type="text" class="text" name="data.publicUrl" id="publicUrl" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" size="30" maxlength="200" style="width:91%"
          		onkeypress="eventOnKeyPress('publicTarget')"  max="200" dataType="LimitB" msg="模块地址输入过长"
             	value="${dataForm.data.publicUrl}" />
        </td>
    </tr>
    <tr>
    	<td class="crm_edit_item_name" >
           	<label>模块目标</label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text" class="text" name="data.publicTarget" id="publicTarget" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" size="30" maxlength="200" style="width:150px"
          		onkeypress="eventOnKeyPress('picPath')"  max="200" dataType="LimitB" msg="模块目标输入过长"
             	value="${dataForm.data.publicTarget}" />
        </td>
        <td class="crm_edit_item_name">
           <label><bean:message key="security.jsp.commom.picPath" bundle="security"/></label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.picPath" id="picPath" size="30" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" style="width:150px"
          		onkeypress="eventOnKeyPress('btnSaveForm')"  max="40" dataType="LimitB" msg="模块描述输入过长"
             	value="${dataForm.data.picPath}" />
        </td>
    </tr>
			</table>
			</div>
			<p style="color: red;text-align: center">*注：一级模块类别的下一级可以是二级模块类别，也可以是模块，但两者不能共同存在。当一级模块类别下已添加二级模块类别时，不能再添加模块！</p>
			<!-- Sheet operation button area -->
			<div align="center">
				<input type="button"  class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" name="btnSaveForm" value="<bean:message key="security.jsp.commom.button1" bundle="security"/>" onClick="savePara();" />
				<input type="button"  class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" name="btnBack" value='返回' onClick="javascript:history.go(-1);void(0);" />
			</div>
		</form>
	</body>
</html>
