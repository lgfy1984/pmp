﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommIHEAuthorityForm" />
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
		<title><bean:message  bundle="comm.comIHE" key="comm.jsp.commIHEAuthority.add"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script language="javascript" src="<bean:message  key="comm.js.includeTJMessage.path"  bundle="comm.commLocale"/>"></script>
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
	var id = trim(document.form.id.value);
	if(id == ""){
		alert("请输入id!");
		return;
	}
	var universalId = trim(document.form.universalId.value);
	if(universalId == ""){
	 	alert("请输入通用ID!");
	 	return ;
	}
	if(universalId.length>50){
		alert("<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigabo.warn1"/>"+universalId.length+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigabo.warn1_1"/>");
	}
	var namespaceId = trim(document.form.namespaceId.value);
	if(namespaceId == ""){
	 	alert("请输入通用ID类型!");
	 	return ;
	}
	if(namespaceId.length>50){
		alert("<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigaboadd.text26"/>"+namespaceId.length+"<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigabo.warn1_1"/>");
	}
	
	if(document.form.seqNo.value !== null){ 
	if(yznumber('seqNo','<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>','6','2')==false){
				return;
		}
	}
	
if (confirmMessage("0-000003")){ 
	document.form.verbId.value = "add";
	document.form.submit();
	}
}

</script>
		<link rel="stylesheet" rev="stylesheet" href="comm/include/css/comm_add.css" />
	</head>
	<body onload="showMessage('','<%=data.getMessage()%>','1')">
		<form name="form" method="post" action="comm/commIHEAuthority.do">
			<input type="hidden" name="verbId" value="add" />
			<table border="0" cellspacing="1" cellpadding="0" class="table">
				<tr>
					<td height="30px" class="biaoti" colspan="4">
						<font color="red">※</font>&nbsp;&nbsp;<bean:message  bundle="comm.comIHE" key="comm.jsp.commIHEAuthority.add"/>&nbsp;&nbsp;
						<font color="red">※</font>
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						ID:
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="id" id="id" size="30" maxlength="32" onkeypress="eventOnKeyPress('seqNo')" value="<%=data.getId()%>" />
					</td>
					<td class="qian" nowrap>
	
					</td>
					<td class="hou" nowrap>
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<bean:message  bundle="comm.comIHE" key="comm.jsp.segment"/>:
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="seqNo" id="seqNo" size="30" maxlength="11" onkeypress="eventOnKeyPress('universalId')" value="<%=data.getSeqNo()%>" />
					</td>
					
					<td class="qian" nowrap>
						<font color="red">*</font><bean:message  bundle="comm.comIHE" key="comm.jsp.segment1"/>:
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="universalId" size="50" maxlength="50" onkeypress="eventOnKeyPress('universalIdType')" value="<%=data.getUniversalId()%>" />
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<font color="red">*</font><bean:message  bundle="comm.comIHE" key="comm.jsp.segment2"/>:
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="universalIdType" size="20" maxlength="50" onkeypress="eventOnKeyPress('namespaceId')" value="<%=data.getUniversalIdType()%>" />
					</td>
					<td class="qian" nowrap>
						<bean:message  bundle="comm.comIHE" key="comm.jsp.segment3"/>:
					</td>
					<td class="hou" nowrap>
						<input type="text" class="kuandu" name="namespaceId" id="namespaceId" size="30" maxlength="50" value="<%=data.getNamespaceId()%>" onkeypress="eventOnKeyPress('btnSave')"/>
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="30" align="center">
						<input type="button" name="btnSave" id="btnSave"   value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.save"/>" onClick="saveForm()" />
						<input type="button" name="btnHistory" id="btnHistory"  value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.back"/>" onClick="history.go(-1);" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
