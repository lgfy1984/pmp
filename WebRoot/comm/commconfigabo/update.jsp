<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="commConfigAbo" scope="request" class="com.tianjian.comm.struts.form.CommConfigAboForm" />
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
		<title><bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigaboupdate.text51"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script language="javascript" src="<bean:message  key="comm.js.includeTJMessage.path"  bundle="comm.commLocale"/>"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
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
						alert("\""+itermname+"\""+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.integerBigThan"/>"+integer+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text28"/>!");
						return false;
					}
					if(arg2.length > decimal){
						alert("\""+itermname+"\""+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.decimalLessThan"/>"+decimal+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text28"/>!");
						return false;
					}				
				}else{
					if(inputvalue.length > integer){
						alert("\""+itermname+"\""+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.integerBigThan"/>"+integer+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text28"/>!");						
						return false;
					}
				}			
			}else{
				alert("\""+itermname+"\"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.warn1"/>!");
				return false;
				}
			}		
		}
function saveForm(){
	if(!Validator.Validate(document.forms.form,3)){
      return ;
    }
	if(document.form.itemCode.value == ""){
	 	alert("<bean:message  bundle='comm.commLocale' key='comm.jsp.CodeText'/>");
	 	return ;
	}
	if(isNaN(document.form.itemCode.value)){
			alert('<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
			return ; 
	}
	if(document.form.itemName.value == ""){
	 	alert("<bean:message  bundle='comm.commLocale' key='comm.jsp.jsp.itemNameText'/>");
	 	return ;
	}
	if(isNaN(document.form.seqNo.value)){
		alert("<bean:message  bundle='comm.commLocale' key='comm.jsp.warn1'/>");
	    return;
	}
	if(document.form.seqNo.value !== null){ 
		if(yznumber('seqNo','<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>','6','2')==false){
			return;
		}
	}
	if(document.form.itemName.value.length>20){
		alert("<bean:message  bundle='comm.commLocale' key='comm.jsp.commconfigaboadd.text26'/>"+itemName.length+"<bean:message  bundle='comm.commLocale' key='comm.jsp.commconfigabo.warn1_1'/>");
		return ;
	}
	if (confirmMessage("<bean:message  bundle='comm.commLocale' key='comm.jsp.update.gengxin'/>")){     
	    document.form.verbId.value = "update";    
	    document.form.submit(); 
    }   
}
function showHspMessage(message){
				if(message != ''&& message != null){
					alert(message);
					return;
				}
			}
</script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
	</head>
	<body onload="showHspMessage('<%=commConfigAbo.getMessage()%>')">
		<form name="form" method="post" action="comm/commConfigAbo.do">
			<input type="hidden" name="verbId" value="update" />
			<input type="hidden" name="itemCodeHidden" value=<%=commConfigAbo.getItemCodeHidden()%> />
			<table  align="center" border="0" cellpadding="0" cellspacing="0" class="tblFill" border="0" cellpadding="0" cellspacing="0" class="tblFill">
				<tr>
					<td class="tblTitle" colspan="4"><span>※</span><bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigaboupdate.text50"/><span>※</span></td>
				</tr>
				<tr>
					<td class="tblLable">
						<span>*</span><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="itemCode" size="20" maxlength="16" onkeypress="eventOnKeyPress('itemName')" value="<%=commConfigAbo.getItemCode()%>" readonly/>
					</td>
					<td class="tblLable">
						<span>*</span><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="itemName" size="50" maxlength="50" onkeypress="eventOnKeyPress('seqNo')" max="40" dataType="LimitB" msg="名称输入过长"  value="<%=commConfigAbo.getItemName()%>" />
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="seqNo"  id="seqNo" size="20" maxlength="6" onkeypress="eventOnKeyPress('comments')"  max="11" dataType="LimitB" msg="序号输入过长" value="<%=commConfigAbo.getSeqNo()%>"/>
					</td>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.comments"/>:
					</td>
					<td>
						<input type="text" class="kuandu" name="comments" id=""comments"" size="50" maxlength="50" value="<%=commConfigAbo.getComments()%>" max="40" dataType="LimitB" msg="备注输入过长"  onkeypress="eventOnKeyPress('btnSave')"/>
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<div class="btnSave">
				<input type="button" name="btnSave" id="btnSave"   value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.save"/>" onClick="saveForm()" />
				<input type="button" name="btnHistory" id="btnHistory" value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.back"/>" onClick="history.go(-1);" />
			</div>
		</form>
	</body>
</html>
