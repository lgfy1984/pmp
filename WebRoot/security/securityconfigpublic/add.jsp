<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ page import="com.tianjian.security.bean.SecurityConfigPublicClass"%>
<jsp:useBean id="dataForm" scope="request" class="com.tianjian.security.struts.form.SecurityConfigPublicForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%if(request.getServerPort() == 80) {%>
  <base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
  <%} else {%>
  <base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
<%}%>
<title><bean:message key="security.jsp.securityConfigpublicadd.title" bundle="security"/></title>
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
<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script language="javascript">
		function savePara(){
			if(!Validator.Validate(document.forms.form,3)){
    			 return ;
  				}
			var modCode = $.trim($("#modeCode").val());
			if(isNaN(modCode)){
				parent.parent.$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
	 			return ; 
			}
			parent.parent.$.messager.confirm('确认', '确定要保存该条记录吗？', function(r){
	    	if (r){
	    		document.form.verbId.value = "add";
				    var formData = $("#form").serialize();
				    $.ajax({
				    	dataType: "text/html",
				    	type:"POST",
				    	url:"security/securityConfigPublic.do",
				    	processData:true,
				    	data:formData,
				    	error: function(a, b, c){
			        		alert(a + "-" + b + "-" + c);
			        	},
				    	success:function(data){
				    		if(data != null){
				    			try{
				    				var json = eval(data);
				    			}catch(e){
				    				parent.parent.$.messager.alert('提示','请重新登录！');
				    				return;
				    			}
				    			if(json[0].flag == '1'){
				    				var scpcId = document.getElementById("scpcId").value;
				      				if(scpcId != null && scpcId.length > 0){
				      					parent.frames["treeFrame"].refreshByIdAndType(scpcId, "1");
				      					parent.frames["treeFrame"].refreshByIdAndType(scpcId, "2");
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
<form name="form" id="form" method="post" action= "security/securityConfigPublic.do" >
<input type="hidden" name="verbId" value="add" />
<div class="crm_edit_panel">
 <table class="crm_panel_table">
		<tr>
			<td class="crm_edit_item_name" colspan="4">
			<label style="float: left;font-size:14;color:#498ED3"><bean:message key="security.jsp.securityConfigpublicadd.title" bundle="security"/></label>
			</td>
		</tr>
    <tr>
        <td class="crm_edit_item_name">
            <label><label class="redlable">*</label><bean:message key="security.jsp.commmom.classCode" bundle="security"/><label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.reason" id="reason" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" style="width: 150px"
              onkeypress="eventOnKeyPress('serialNo')" min="1" max="50" dataType="LimitB" msg="名称的长度应在1-50个字节范围内"
              value="${dataForm.data.reason}" />
        </td>
        <td class="crm_edit_item_name">
         	<label><label class="redlable">*</label><label><bean:message key="security.jsp.commom.menuCode" bundle="security"/></label><label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.modCode" id="modCode" size="20" maxlength="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" style="width: 150px"
            	onkeypress="eventOnKeyPress('reason')" require="true" dataType="Integer" msg="代码应为1-20位数字"
              	value="${dataForm.data.modCode}" />
        </td>  
    </tr>
    <tr>
        <td class="crm_edit_item_name">
           <label><bean:message key="security.jsp.commom.serialNo" bundle="security"/></label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.serialNo" id="serialNo" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="11" dataType="Integer" class="text" style="width: 150px"
               onkeypress="eventOnKeyPress('comments')" 
              value="${dataForm.data.serialNo}" readonly/>
        </td>
        <td class="crm_edit_item_name">
            <label><bean:message key="security.jsp.commmom.comments" bundle="security"/></label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.comments" id="comments" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="40" class="text" style="width: 150px"
         	 onkeypress="eventOnKeyPress('reasonValue')" max="40" dataType="LimitB" msg="备注输入过长"
              value="${dataForm.data.comments}" />
        </td>
    </tr>
    <tr>
        <td class="crm_edit_item_name">
           <label><bean:message key="security.jsp.commom.SecurityConfigPublic" bundle="security"/></label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.reasonValue" id="reasonValue" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="100" class="text" style="width: 150px"
               onkeypress="eventOnKeyPress('scpcId')" max="100" dataType="LimitB" msg="模块描述输入过长"
               value="${dataForm.data.reasonValue}" />
        </td>
        <td class="crm_edit_item_name" >
            <label><label class="redlable">*</label><bean:message key="security.jsp.commom.scpcId" bundle="security"/><label>
        </td>
        <td class="crm_edit_item_content">
           <!--  <select id="scpcId" name="data.scpcId" onkeypress="eventOnKeyPress('picPath')" min="1" dataType="LimitB" msg="模块类别不能为空">
				<option value=""></option>
					<logic:iterate id="commBean" name="dataForm" property="securityConfigPublicClassList" indexId="ind">
						<option value="${commBean.id}">
							${commBean.className}
						</option>
					</logic:iterate>
			</select>-->
			<select name="data.scpcId" id="scpcId" onkeypress="eventOnKeyPress('publicUrl')" min="1" class="easyui-combobox" dataType="LimitB" msg="模块类别不能为空" readonly="readonly"  style="width: 162px;height: 28px;border:1px solid rgb(218,218,218);">
							<%
								if (dataForm.getSecurityConfigPublicClassList() != null&& dataForm.getSecurityConfigPublicClassList().size() > 0) {
									for (int i = 0; i < dataForm.getSecurityConfigPublicClassList().size(); i++) {
										SecurityConfigPublicClass data = (SecurityConfigPublicClass)dataForm.getSecurityConfigPublicClassList().get(i);
										String tempId = data.getId();
										String tempName = data.getClassName();
							%>
									<option value="<%=tempId%>"
										<%=tempId.equals(dataForm.getSecurityPublicClassId()) ? "selected": ""%>>
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
        <td class="crm_edit_item_name" >
           	<label>模块链接</label>
        </td>
        <td class="crm_edit_item_content" colspan="3">
            <input type="text"  name="data.publicUrl" id="publicUrl" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="200" class="text" style="width: 91%"
          		onkeypress="eventOnKeyPress('publicTarget')"  max="200" dataType="LimitB" msg="模块地址输入过长"
             	value="${dataForm.data.publicUrl}" />
        </td>
    </tr>
    <tr>
    	<td class="crm_edit_item_name" >
           	<label>模块目标</label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.publicTarget" id="publicTarget" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" size="30" maxlength="200" class="text" style="width: 150px"
          		onkeypress="eventOnKeyPress('picPath')"  max="200" dataType="LimitB" msg="模块目标输入过长"
             	value="${dataForm.data.publicTarget}" />
        </td>
        <td class="crm_edit_item_name" >
           <label><bean:message key="security.jsp.commom.picPath" bundle="security"/></label>
        </td>
        <td class="crm_edit_item_content">
            <input type="text"  name="data.picPath" id="picPath" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="40" class="text" style="width: 150px"
          		onkeypress="eventOnKeyPress('btnSaveForm')"  max="40" dataType="LimitB" msg="模块描述输入过长"
             	value="${dataForm.data.picPath}" />
        </td>
    </tr>
  </table>
  </div>
  <p style="color: red;text-align: center">*注：一级模块类别的下一级可以是二级模块类别，也可以是模块，但两者不能共同存在。当一级模块类别下已添加二级模块类别时，不能再添加模块！</p>
  <!-- Sheet operation button area -->
  <div align="center">
		<input class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" type="button" name="btnSaveForm" value="<bean:message key="security.jsp.commom.button1" bundle="security"/>" onClick="savePara();" />
  </div>
</form>

</body>
</html>
