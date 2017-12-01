<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commConfigProfession" scope="request" class="com.tianjian.comm.struts.form.CommConfigProfessionForm" />
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
		<title><bean:message key="comm.jsp.common.alterZymessage" bundle="conf.comm.Comm"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.comm.tjme" bundle="conf.comm.Comm"/>"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
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
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="comm.jsp.common.warm2" bundle="conf.comm.Comm"/>"+integer+"<bean:message key="comm.jsp.common.weishu" bundle="conf.comm.Comm"/>");
						return false;
					}
					if(arg2.length > decimal){
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="comm.jsp.common.warm1" bundle="conf.comm.Comm"/>"+decimal+"<bean:message key="comm.jsp.common.weishu" bundle="conf.comm.Comm"/>");
						return false;
					}				
				}else{
					if(inputvalue.length > integer){
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="comm.jsp.common.warm3" bundle="conf.comm.Comm"/>"+integer+"<bean:message key="comm.jsp.common.weishu" bundle="conf.comm.Comm"/>");						
						return false;
					}
				}			
			}else{
				$.messager.alert('提示',"\""+itermname+"\"<bean:message key="comm.jsp.common.musthavenumber" bundle="conf.comm.Comm"/>！");
				return false;
				}
			}		
		}
		function saveForm(){
		    if(!Validator.Validate(document.forms.form,3)){
		      return ;
		    }
			if(document.form.itemCode.value == ""){
	 	$.messager.alert('提示',"<bean:message bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
			 	return ;
			}
			if(document.form.itemName.value == ""){
	 	$.messager.alert('提示',"<bean:message  bundle='comm.commLocale' key='comm.jsp.jsp.itemNameText'/>");
			 	return ;
			}
			//if(document.form.seqNo.value !== null){ 
			//if(yznumber('seqNo','<bean:message key="comm.jsp.common.seqNo" bundle="conf.comm.Comm"/>','6','2')==false){
			//			return;
			//	}
			//}
		
			 
			document.form.verbId.value = "update";
			document.form.submit();
			
		}
		
		</script>
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
	<body onload="showMessage('','<%=commConfigProfession.getMessage()%>','')">
		<form name="form" method="post" action="comm/commConfigProfession.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="itemCodeHidden" value=<%=commConfigProfession.getItemCodeHidden()%> />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemCode" size="20" maxlength="8" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB" msg="代码输入过长"  value="<%=commConfigProfession.getItemCode()%>" readonly/>
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" class="text" name="itemName" size="50" maxlength="50" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=commConfigProfession.getItemName()%>" />
      	  		</td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="seqNo"  id="seqNo" size="30" maxlength="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长" value="<%=commConfigProfession.getSeqNo()%>" />
      	  		</td>      	  	
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" class="text" name="comments" id="comments" size="30" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" maxlength="50" value="<%=commConfigProfession.getComments()%>" max="40" dataType="LimitB" msg="备注输入过长"  onkeypress="eventOnKeyPress('btnSave')"/>
      	  		</td>
      	  	</tr>      	  	
      	  </table>
      </div>
      <div class='crm_button_sub'>
		<input type="button" name="btnSave" id="btnSave" value="修改" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
		<input type="button" name="btnHistory" id="btnHistory" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  </div>
	 <!--zyc--add--e-->

			<%--<table border="0" cellspacing="1" cellpadding="0" class="table">
				<tr>
					<td height="30px" class="biaoti" colspan="4">
						<font color="red">※</font>&nbsp;&nbsp;<bean:message key="comm.jsp.common.alterZy" bundle="conf.comm.Comm"/>&nbsp;&nbsp;
						<font color="red">※</font>
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<font color="red">*</font> <bean:message key="comm.jsp.common.item" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="itemCode" size="20" maxlength="9" onkeypress="eventOnKeyPress('itemName')" value="<%=commConfigProfession.getItemCode()%>" readonly/>
					</td>
					<td class="qian" nowrap>
						<font color="red">*</font> <bean:message key="comm.jsp.common.names" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="itemName" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqNo')"  max="40" dataType="LimitB" msg="名称输入过长" value="<%=commConfigProfession.getItemName()%>" />
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.seqNo" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="seqNo" id="seqNo" size="20" maxlength="6" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长" value="<%=commConfigProfession.getSeqNo()%>" />
					</td>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.comments" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="comments" id="comments" onkeypress="eventOnKeyPress('btnSave')" size="50" maxlength="50"  max="40" dataType="LimitB" msg="备注输入过长"  value="<%=commConfigProfession.getComments()%>" />
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="30" align="center">
						<input type="button" id="btnSave" name="btnSave"  name="btnSaveForm" value="<bean:message key="comm.jsp.common.save" bundle="conf.comm.Comm"/>" onClick="saveForm()" />
						<input type="button" id="btnHistory" name="btnHistory"  name="btnBack" value="<bean:message key="comm.jsp.common.return" bundle="conf.comm.Comm"/>" onClick="history.go(-1);" />
					</td>
				</tr>
			</table>
		--%></form>
	</body>
</html>
