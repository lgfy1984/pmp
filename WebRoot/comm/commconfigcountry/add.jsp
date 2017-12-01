<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="commConfigCountry" scope="request" class="com.tianjian.comm.struts.form.CommConfigCountryForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title><bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigcountryadd.text33"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="<bean:message  key="comm.js.includeTJMessage.path"  bundle="comm.commLocale"/>"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
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
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.integerBigThan"/>"+integer+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text28"/>!");
						return false;
					}
					if(arg2.length > decimal){
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.decimalLessThan"/>"+decimal+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text28"/>!");
						return false;
					}				
				}else{
					if(inputvalue.length > integer){
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.integerBigThan"/>"+integer+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text28"/>!");						
						return false;
					}
				}			
			}else{
				$.messager.alert('提示',"\""+itermname+"\"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.warn1"/>!");
				return false;
				}
			}		
		}

function saveForm(){	
	if(!Validator.Validate(document.forms.form,3)){
      return ;
     }
	if(document.form.itemCode.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn" bundle="security"/>');
	 	return ;
	}
	if(isNaN(document.form.itemCode.value)){
			$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
			return ; 
	}
	if(document.form.itemName.value == ""){
		$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn1" bundle="security"/>');
	 	return ;
	}
	if(/\D/.test(document.form.seqNo.value)){
		$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.warn1'/>");
		return;
	}
	if(document.form.seqNo.value !== null){ 
		if(yznumber('seqNo','<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>','6','2')==false){
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
	<body onload="showHspMessage('<%=commConfigCountry.getMessage()%>')">
		<form name="form" method="post" action="comm/commConfigCountry.do">
			<input type="hidden" name="verbId" value="add" />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemCode" size="20" maxlength="8" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"  value="<%=commConfigCountry.getItemCode()%>" />
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemName" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=commConfigCountry.getItemName()%>" />
      	  		</td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="seqNo"  id="seqNo" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="20" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长" value="<%=commConfigCountry.getSeqNo()%>" />
      	  		</td>      	  	
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="comments" id="comments" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="50" value="<%=commConfigCountry.getComments()%>" max="40" dataType="LimitB" msg="备注输入过长"  onkeypress="eventOnKeyPress('btnSave')"/>
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
					<td class="tblTitle" colspan="4"><span>※</span><bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigcountryadd.text32"/><span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/>:
					</td>
					<td class="hou">
						<input type="text" class="kuandu" name="itemCode" size="20" maxlength="9" onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"  value="<%=commConfigCountry.getItemCode()%>" />
					</td>
					<td class="tblLable">
						<span>*</span><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="itemName" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqNo')" max="40" dataType="LimitB" msg="名称输入过长"  value="<%=commConfigCountry.getItemName()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="seqNo" id="seqNo"  size="30" maxlength="20" onkeypress="eventOnKeyPress('comments')" max="11" dataType="LimitB" msg="序号输入过长"  value="<%=commConfigCountry.getSeqNo()%>"  />
					</td>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.comments"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="comments" id="comments" size="30" maxlength="50" onkeypress="eventOnKeyPress('btnSave')" max="40" dataType="LimitB" msg="备注输入过长" value="<%=commConfigCountry.getComments()%>" />
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<div class="btnSave">
				<input type="button" style="font-size:12px;font-family:Arial;" id="btnSave" name="btnSave"  value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.save"/>" onClick="saveForm()" />
				<input type="button" style="font-size:12px;font-family:Arial;" id="btnHistory" name="btnHistory"  value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.back"/>" onClick="history.go(-1);" />
			</div>
		--%></form>
	</body>
</html>
