<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<jsp:useBean id="commConfigVocation" scope="request" class="com.tianjian.comm.struts.form.CommConfigVocationForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%if(request.getServerPort() == 80) {%>
<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
<%} else {%>
<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
<%}%>
<title><bean:message key="comm.jsp.commconfigvocation.add.title" bundle="conf.comm.CommMessageguoh"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
<script language="javascript" src='<bean:message key="comm.js.commMessageguoh" bundle="conf.comm.CommMessageguoh"/>'></script>
<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
<script language="javascript" src='<bean:message key="comm.js.TJMessage" bundle="conf.comm.CommMessageguoh"/>'></script>
<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript">
function trim(str){  //删除左右两端的空格
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
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
						$.messager.alert('提示',"\""+itermname+"\""+'<bean:message key="comm.jsp.commconfigrh.add.yznumber1" bundle="conf.comm.CommMessageguoh"/>'+integer+'<bean:message key="comm.jsp.commconfigrh.add.yznumber2" bundle="conf.comm.CommMessageguoh"/>');
						return false;
					}
					if(arg2.length > decimal){
						$.messager.alert('提示',"\""+itermname+"\""+'<bean:message key="comm.jsp.commconfigrh.add.yznumber3" bundle="conf.comm.CommMessageguoh"/>'+decimal+'<bean:message key="comm.jsp.commconfigrh.add.yznumber4" bundle="conf.comm.CommMessageguoh"/>');
						return false;
					}				
				}else{
					if(inputvalue.length > integer){
						$.messager.alert('提示',"\""+itermname+"\""+'<bean:message key="comm.jsp.commconfigrh.add.yznumber5" bundle="conf.comm.CommMessageguoh"/>'+integer+'<bean:message key="comm.jsp.commconfigrh.add.yznumber6" bundle="conf.comm.CommMessageguoh"/>');					
						return false;
					}
				}			
			}else{
				$.messager.alert('提示',"\""+itermname+'\"<bean:message key="comm.jsp.commconfigrh.add.yznumber7" bundle="conf.comm.CommMessageguoh"/>');
				return false;
				}
			}		
		}
	function saveForm(){
	    if(!Validator.Validate(document.forms.form,3)){
        return ;
         }
		//if(document.form.principal_phone.value !== null){ 
			//if(yznumber('principal_phone','<bean:message key="comm.jsp.commconfigrh.add.saveForm" bundle="conf.comm.CommMessageguoh"/>','6','2')==false){
				//return;
			//}
		//}
		if(document.form.itemCode.value == ""){
	 	$.messager.alert('提示',"<bean:message bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
		 	return ;
		}
		if(document.form.itemName.value == ""){
		 	$.messager.alert('提示','<bean:message key="comm.jsp.commconfigvocation.add.saveForm1" bundle="conf.comm.CommMessageguoh"/>');
		 	return ;
		}
		
		
	
		document.form.verbId.value = "add";
		document.form.submit();
		
	}

</script>
<script type="text/javascript" src="${path}/js/default.js"></script>
<%--<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />--%>
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
</head>

<body onload="showCommMessage('','<%=commConfigVocation.getMessage() %>','1')" >
<form name="form" method="post" action= "comm/commConfigVocation.do" >

<input type="hidden" name="verbId" value="add" />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemCode" size="20" maxlength="8" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"  value="<%=commConfigVocation.getItemCode()%>" />
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemName" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=commConfigVocation.getItemName()%>" />
      	  		</td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="seqNo"  id="seqNo" size="30" maxlength="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长" value="<%=commConfigVocation.getSeqNo()%>" />
      	  		</td>      	  	
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="comments" id="comments" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="50" value="<%=commConfigVocation.getComments()%>" max="40" dataType="LimitB" msg="备注输入过长"  onkeypress="eventOnKeyPress('btnSave')"/>
      	  		</td>
      	  	</tr>      	  	
      	  </table>
      </div>
      <div class='crm_button_sub'>
		<input type="button" name="btnSave" id="btnSave" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
		<input type="button" name="btnHistory" id="btnHistory" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  </div>
	 <!--zyc--add--e-->
	 
<%--<table align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
    <tr>
        <td class="tblTitle" colspan="4"><span>※</span><bean:message key="comm.jsp.commconfigvocation.add.td1" bundle="conf.comm.CommMessageguoh"/><span>※</span></td>
    </tr>
    <tr>
        <td class="tblLable">
         	<span>*</span> <bean:message key="comm.jsp.commconfigrh.add.td2" bundle="conf.comm.CommMessageguoh"/>
        </td>
        <td>
            <input type="text"  name="itemCode" size="20" maxlength="9"
            	onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"
              	value="<%=commConfigVocation.getItemCode() %>" />
        </td>  
         <td class="tblLable" >
          <span>*</span>  <bean:message key="comm.jsp.commconfigrh.add.td3" bundle="conf.comm.CommMessageguoh"/>
        </td>
        <td>
            <input type="text" name="itemName" size="50" maxlength="50"
              onkeypress="eventOnKeyPress('comments')" max="40" dataType="LimitB" msg="名称输入过长"
              value="<%=commConfigVocation.getItemName() %>" />
        </td>
    </tr>
    <tr>
       
        <td class="tblLable">
            <bean:message key="comm.jsp.commconfigrh.add.td4" bundle="conf.comm.CommMessageguoh"/>
        </td>
        <td>
            <input type="text" name="seqNo" id="principal_phone" size="30" maxlength="20"
               onkeypress="eventOnKeyPress('itemCode')" max="11" dataType="LimitB" msg="序号输入过长"
              value="<%=commConfigVocation.getSeqNo() %>" />
        </td>
    	<td class="tblLable">
           <bean:message key="comm.jsp.commconfigrh.add.td5" bundle="conf.comm.CommMessageguoh"/>
     	 </td>
      	<td>
          <input type="text" name="comments" id="comments" size="30" maxlength="50" onkeypress="eventOnKeyPress('btnSave')" max="40" dataType="LimitB" msg="备注输入过长" value="<%=commConfigVocation.getComments() %>" onkeypress="eventOnKeyPress('btnSave')"/>
     	 </td>
    </tr>
  </table>
  <!-- Sheet operation button area -->
    <div class="btnSave">
		<input type="button"  id="btnSave" name="btnSave" value='<bean:message key="comm.jsp.commconfigrh.add.td6" bundle="conf.comm.CommMessageguoh"/>' onclick="saveForm()" />
        <input type="button"  id="btnHistory" name="btnHistory" value='<bean:message key="comm.jsp.commconfigrh.add.td7" bundle="conf.comm.CommMessageguoh"/>' onclick="history.go(-1);" />  
	</div>
--%></form>
</body>
</html>
