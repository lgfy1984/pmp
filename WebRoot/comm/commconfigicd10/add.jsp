<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<jsp:useBean id="commConfigIcd10" scope="request" class="com.tianjian.comm.struts.form.CommConfigIcd10Form" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%if(request.getServerPort() == 80) {%>
<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
<%} else {%>
<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
<%}%>
<title><bean:message key="comm.jsp.common.text24" bundle="conf.comm.comm"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
<script language="javascript" src="<bean:message key="comm.js.CommMessage.path" bundle="conf.comm.comm"/>"></script>
<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
<script type="text/javascript"
	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
<script language="javascript" src="<bean:message  key="comm.js.includeTJMessage.path"  bundle="comm.commLocale"/>"></script>
<script type="text/javascript" src="${path}/js/default.js"></script>
    <link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
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
<script language="javascript">

function trim(str){  //删除左右两端的空格
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
function saveForm(){
    if(!Validator.Validate(document.forms.form,3)){
      return ;
   }

	var itemCode = trim(document.form.itemCode.value);
	if(itemCode == ""){	   
	 	$.messager.alert('提示',"<bean:message bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
	 	
	 	return ;
	}
	if(isNaN(itemCode)){
		$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
		return ; 
}
	var itemName = trim(document.form.itemName.value);
	if(itemName == ""){
	 	$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.jsp.itemNameText'/>");
	 	return ;
	}
	if(itemName.length>20){
		$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.commconfigaboadd.text26'/>"+itemName.length+"<bean:message  bundle='comm.commLocale' key='comm.jsp.commconfigabo.warn1_1'/>");
		return ;
	}

	document.form.verbId.value = "add";
	document.form.submit();
}

</script>
<%--<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />--%>
</head>

<body onload="showCommMessage('','<%=commConfigIcd10.getMessage() %>','1')" >
<form name="form" method="post" action= "comm/commConfigIcd10.do" >

<input type="hidden" name="verbId" value="add" />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" name="itemCode" size="20" maxlength="9" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
            			onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"
              			value="<%=commConfigIcd10.getItemCode() %>" />
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" name="itemName" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
              			onkeypress="eventOnKeyPress('seqNo')" max="100" dataType="LimitB" msg="名称输入过长"
              			value="<%=commConfigIcd10.getItemName() %>" />
      	  		</td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" name="seqNo" id="principal_phone" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="20"
               			onkeypress="eventOnKeyPress('comments')" max="11" dataType="LimitB" msg="序号输入过长"
              			onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" 
              			value="<%=commConfigIcd10.getSeqNo() %>" /> <span style="margin-left: 3px;color:red;font-size: 11px;">0-20个数字</span>
      	  		</td>      	  	
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" name="comments" id="principal" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" size="30" maxlength="20" max="40" dataType="LimitB" msg="备注输入过长"
           				value="<%=commConfigIcd10.getComments() %>" />
      	  		</td>
      	  	</tr>      	  	
      	  </table>
      </div>
      <div class='crm_button_sub'>
		<input type="button" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
		<input type="button" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  </div>
	 <!--zyc--add--e-->
<%--<table border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
    <tr>
         <td class="tblTitle" colspan="4"><span>※</span> <bean:message key="comm.jsp.different.text36" bundle="conf.comm.comm"/><span>※</span></td>
    </tr>
    <tr>
        <td class="tblLable">
         	<span>*</span> <bean:message key="comm.jsp.common.text10" bundle="conf.comm.comm"/>：
        </td>
        <td>
            <input type="text" name="itemCode" size="20" maxlength="9"
            	onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"
              value="<%=commConfigIcd10.getItemCode() %>" />
        </td>  
    	<td class="tblLable">
          <span>*</span> <bean:message key="comm.jsp.common.text29" bundle="conf.comm.comm"/>：
        </td>
        <td>
            <input type="text" name="itemName" size="50" maxlength="50"
              onkeypress="eventOnKeyPress('seqNo')" max="100" dataType="LimitB" msg="名称输入过长"
              value="<%=commConfigIcd10.getItemName() %>" />
        </td>
    </tr>
    <tr>
            
		 <td class="tblLable">
            <bean:message key="comm.jsp.common.text48" bundle="conf.comm.comm"/>：
        </td>
        <td>
            <input type="text" name="seqNo" id="principal_phone" size="30" maxlength="20"
               onkeypress="eventOnKeyPress('comments')" max="11" dataType="LimitB" msg="序号输入过长"
              value="<%=commConfigIcd10.getSeqNo() %>" />
        </td>
        <td class="tblLable">
            <bean:message key="comm.jsp.common.text4" bundle="conf.comm.comm"/>：
        </td>
        <td>
            <input type="text" name="comments" id="principal" size="30" maxlength="20" max="40" dataType="LimitB" msg="备注输入过长"
           value="<%=commConfigIcd10.getComments() %>" />
        </td>
    </tr>
  </table>


  <!-- Sheet operation button area -->
  <div class="btnSave">
  		<input type="button"  name="btnSaveForm" value="<bean:message key="comm.jsp.common.text3" bundle="conf.comm.comm"/>" onclick="saveForm()" />
        <input type="button"  name="btnBack" value="<bean:message key="comm.jsp.common.text19" bundle="conf.comm.comm"/>" onclick="history.go(-1);" /> 
  </div>
--%></form>
</body>
</html>
