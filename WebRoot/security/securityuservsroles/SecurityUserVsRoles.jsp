<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="securityUserVsRolesForm" scope="request" class="com.tianjian.security.struts.form.SecurityUserVsRolesForm" />
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
		<title><bean:message key="security.jsp.ssecurityuservsroles.SecurityUserVsRoles.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" rev="stylesheet" href="include/css/form.css" />
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
		<script language="javascript" src="<bean:message key="security.js.SecurityMessage.path" bundle="security" />"></script>
		<script src="<%=request.getContextPath()%>/include/javascript/searchsuggest.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/searchsuggest.css" />
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
		<script language="javascript">
		function securityUserVsRoles_pageSubmit(url){
			var userIdSelected = document.form.userIdSelected.value;	
			var totalRows = document.form.totalRows.value;
			var temp = "";
			if(userIdSelected == ""){
				$.messager.alert('提示','<bean:message key="security.jsp.ssecurityuservsroles.SecurityUserVsRoles.warn" bundle="security"/>');
				return;
			}
			if(totalRows == "1"){
				if(document.form.checkBox.checked == true){
					temp = temp + "&rolesIdSelected=" + document.form.rolesId.value;
				}
			} else {
				for(var i = 0; i < document.form.checkBox.length; i++){
					if(document.form.checkBox[i].checked == true){
						temp = temp + "&rolesIdSelected=" + document.form.roleId[i].value;
					}
				}		
			}
	
			var xmlHttp = newXMLHttpRequest();
			var sendTo = "verbId=execute&userIdSelected=" + userIdSelected + temp;
			xmlHttp.open("POST", url, true);
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
			var securityUserVsRoles_handlerFunction1 = getReadyStateHandler(xmlHttp, securityUserVsRoles_updateRoles1);
			xmlHttp.onreadystatechange = securityUserVsRoles_handlerFunction1;
			xmlHttp.send(sendTo);
			
		}	

function securityUserVsRoles_updateRoles1(rolesXML1) {
	var messageXML = rolesXML1.getElementsByTagName("message")[0];
	if(messageXML.childNodes[0] != null && messageXML.childNodes[0].nodeValue != null){
		message = messageXML.childNodes[0].nodeValue;
		$.messager.alert('提示',message);
		
	}	
}

function securityUserVsRoles_tableClick(row, userId, url){
	document.form.selectedRow.value = row;
	document.form.userIdSelected.value = userId;
	securityUserVsRoles_setRoles(url);
}

function securityUserVsRoles_setRoles(url){
	var userIdSelected = document.form.userIdSelected.value;	
	var xmlHttp = newXMLHttpRequest();
	var sendTo = "verbId=find&userIdSelected=" + userIdSelected;
	xmlHttp.open("POST", url, true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
	var securityUserVsRoles_handlerFunction = getReadyStateHandler(xmlHttp, securityUserVsRoles_updateUserRoles);
	xmlHttp.onreadystatechange = securityUserVsRoles_handlerFunction;
	xmlHttp.send(sendTo);
}

function securityUserVsRoles_updateUserRoles(rolesXML) {
	var totalRows = document.form.totalRows.value;
	if(totalRows == "1"){
		document.form.checkBox.checked = false;
	} else {
		for(var j = 0; j < document.form.checkBox.length; j++){
			document.form.checkBox[j].checked = false;
		}
	}
	
	var index = -1;
	var indexXML = rolesXML.getElementsByTagName("index")[0];
	if(indexXML.childNodes[0] != null && indexXML.childNodes[0].nodeValue != null){
		index = indexXML.childNodes[0].nodeValue;
		if(parseInt(index) < 1){
			return;
		}
	}
	
	for(var i = 0; i < parseInt(index); i++){
		var valueXML = rolesXML.getElementsByTagName("value")[i];
		if(valueXML.childNodes[0] != null && valueXML.childNodes[0].nodeValue != null){
			value = valueXML.childNodes[0].nodeValue;
			if(totalRows == "1"){
				if(document.form.roleId.value == value){
					document.form.checkBox.checked = true;
				}
			} else {
				for(var j = 0; j < document.form.checkBox.length; j++){
					if(document.form.roleId[j].value == value){
						document.form.checkBox[j].checked = true;
					}
				}
			}
		}
	}	
}

function securityUserVsRoles_tableClickRoles(row){
	var totalRows = document.form.totalRows.value;
	
	if(totalRows == "1"){
		if(document.form.checkBox.checked){
			document.form.checkBox.checked = false;
		} else {
			document.form.checkBox.checked = true;
		}
	} else {
		if(document.form.checkBox[row].checked){
			document.form.checkBox[row].checked = false;
		} else {
			document.form.checkBox[row].checked = true;
		}
	}
}

function newXMLHttpRequest() {
	var xmlreq = false;
	if (window.XMLHttpRequest) {
		xmlreq = new XMLHttpRequest();		
	} else if (window.ActiveXObject) {
	    try {
      		xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
        		xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
			xmlreq = false;
	    	}
    	}
	}	
	return xmlreq;
}

function getReadyStateHandler(req, responseXmlHandler) {
	return function () {
		if (req.readyState == 4) {
      		if (req.status == 200) {
      			//$.messager.alert('提示',req.responseText); 
			    responseXmlHandler(req.responseXML);
			} else {
			    
("HTTP error: " + req.status);
      		}
    	}
  	}
}

function zcTableMouseOver(row, expect){
	var objTB = document.getElementById("tjTable1");
    var j = objTB.rows.length;
    for(var m = j - 1; m >= 1; m--) {
 		var t = objTB.rows[m];
 		if(m != expect){ 
	 		if(row == m){
	    		t.style.backgroundColor = "#D3D3D3";
	 		} else if(m % 2 == 0){
	  			t.style.backgroundColor = "#F5F5F5";
	 		} else {
	 			t.style.backgroundColor = "#FFFFFF";
	 		}
 		}
    }
}
function paging(page) {  
   document.form.page.value = page;
   document.form.verbId.value = "search";    
   document.form.submit();
}

function goPage2() {
  var _tp=document.getElementById('_tp');
  var _total=document.getElementById('_total'); 
    if (!isMadeOf(_tp.value,'1234567890')) {
		$.messager.alert('提示','<bean:message key="security.jsp.commom.warn" bundle="security"/>!');
      return;
    }
    if (_tp.value<=0){
		$.messager.alert('提示','<bean:message key="security.jsp.commom.warn1" bundle="security"/>!');
		return;
    }
    if(parseInt(_tp.value)>parseInt(_total.value)){
	  $.messager.alert('提示','<bean:message key="security.jsp.commom.warn2" bundle="security"/>!');
      return;
    } 
    
  document.form.verbId.value = "search";    
  document.form.submit();
}

function isMadeOf(val,str){
	var jj;
	var chr;
	for (jj=0;jj<val.length;++jj){
		chr=val.charAt(jj);
		if (str.indexOf(chr,0)==-1)
			return false;
	}

	return true;
}

function zc_tableMouseOver(row){
    var ex = document.form.selectedRow.value;
    zcTableMouseOver(row, ex);
}

function zcTableClick(row){
	var objTB = document.getElementById("tjTable1");
    var j = objTB.rows.length;
    for(var m = j - 1; m >= 1; m--) {
 		var t = objTB.rows[m];
 		if(row == m){
    		t.style.backgroundColor = "#C71585";
 		} else if(m % 2 == 0){
  			t.style.backgroundColor = "#F5F5F5";
 		} else {
 			t.style.backgroundColor = "#FFFFFF";
 		}
    }
}

function securityUserVsRoles_pageSearch(){
	document.form.verbId.value = "search";
	document.form.submit();
}

</script>
	</head>
	<body >
		<form name="form" method="post" action="security/security_securityUserVsRoles.do">
			<input type="hidden" name="verbId" value="<%=securityUserVsRolesForm.getVerbId()%>" />
			<input type="hidden" name="totalRows" value="<%=securityUserVsRolesForm.getRoleId() != null ? securityUserVsRolesForm.getRoleId().length : 0%>" />
			<input type="hidden" name="selectedRow" value="" />
			<input type="hidden" name="userIdSelected" value="" />
			<div class='crm_search_div'>
				<div class="crm_input_item">
					<span><bean:message key="security.jsp.commom.staffCode" bundle="security"/><span>
					<input type="text" class="crm_search_input_text" name="userId" maxlength="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('userName')" value="<%=securityUserVsRolesForm.getUserId()%>" />
				</div>
				<div class="crm_input_item">
					<span><bean:message key="security.jsp.commom.name" bundle="security"/></span>
						<input id="userName" name="userName" type="text"  class="crm_search_input_text"
						value="<%=securityUserVsRolesForm.getUserName()%>"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeyup="GiveOptions(event, '<%=request.getContextPath()%>/searchSuggest.do', 'getStaffName_0000000001')" 
							onkeydown="huanhang(event)" />
						<span id="spanOutput" class="spanTextDropdown" style="display: none;"></span>
				</div>
				<div class="crm_input_item">
					
					<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" value="<bean:message key="security.jsp.securityConfigParamClass.query.button1" bundle="security"/>" name="btnsubmit" onclick="securityUserVsRoles_pageSearch()" />
					<%
				if (securityUserVsRolesForm.getRoleId() != null && securityUserVsRolesForm.getRoleId().length > 0 && securityUserVsRolesForm.getUserIds() != null && securityUserVsRolesForm.getUserIds().length > 0) {
				%>
					<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"  name="<bean:message key="security.jsp.commom.button1" bundle="security"/>" value="<bean:message key="security.jsp.commom.button1" bundle="security"/>" onclick="securityUserVsRoles_pageSubmit('security/security_securityUserVsRoles.do')" />
				<%
				}
				%>
				</div>
			</div>
			<div style="width:100%;height:50px;"></div>
				<%
					if (securityUserVsRolesForm.getUserIds() != null) {
				 %>
						<div id="tjDrag1" class="crm_table_out" style="width:65%;float: left;">
							<table id="tjTable1" class="crm_table_content">
								<thead>
								<tr>
									<td>
										<bean:message key="security.jsp.commom.serialNo" bundle="security"/>
									</td>
									<td>
										<bean:message key="security.jsp.commom.name" bundle="security"/>
									</td>
									<td>
										用户名
									</td>
									<td>
										医疗机构
									</td>
								</tr>
								</thead>
								<tbody>
								<c:if test="${pb.count<=0}">
						<tr>
							<td colspan="4">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
								
								<%
									for (int i = 0; i < securityUserVsRolesForm.getUserIds().length; i++) {
								%>
								<tr onclick="zcTableClick('<%=i + 1%>');securityUserVsRoles_tableClick('<%=i + 1%>', '<%=securityUserVsRolesForm.getUserIds()[i]%>', 'security/security_securityUserVsRoles.do')" onmouseover="zc_tableMouseOver('<%=i + 1%>')" bgcolor="#ffffff">
									<td>
										<%=i + 1%>
									</td>
									<td>
										<%=securityUserVsRolesForm.getUsers()[i].trim()%>
									</td>
									<td>
										<%=securityUserVsRolesForm.getUserNames()[i].trim()%>
									</td>
									<td>
										<%=securityUserVsRolesForm.getHspConfigs()[i].trim()%>
									</td>
								</tr>
								<%
										}
								}
								%>
								<%
								if(securityUserVsRolesForm.getUserIds() != null){ 
							%>
							</tbody>
							<tfoot <c:if test="${pb.count<=0}">style="display:none"</c:if>>
			  <tr>
			  <td colspan="4">
			  	<input type="hidden" title="当前第几页" name="page_index" id="page_index" value="${pb.page}"/>
			    <input type="hidden" title="一共多少页" name="page_count" id="page_count" value="${pb.pageCount}"/>
			    <input type="hidden" title="一共多少条记录" name="count" id="count" value="${pb.count}"/>
			    <input type="hidden" title="每页显示多少条记录" name="page_size" id="page_size" value="${pb.pageSize}"/>
			  	<input type="hidden" name="page" id="cur_page" value="${pb.page}"/>
			  	<div class="pager_num"></div>
			  	<div class="pager_text"></div>
			  </td>
			  </tr>
		  </tfoot>
							<%
							 	}
							 %>
							</table>
							
						</div>
					<%
						if (securityUserVsRolesForm.getRoleId() != null) {
					 %>
						<div id="tjDrag2" style="width:30%;float:right;">
							<table id="tjTable2" class="crm_table_content">
								<thead>
								<tr>
									<td>
										<bean:message key="security.jsp.commom.serialNo" bundle="security"/>
									</td>
									<td>
										<bean:message key="security.jsp.ssecurityuservsroles.SecurityUserVsRoles.item" bundle="security"/>
									</td>
									<td>
										<bean:message key="security.jsp.securityrolevsmenus.SecurityRoleVsMenus.roleId" bundle="security"/>
									</td>
								</tr>
								</thead>
								<%
									for (int i = 0; i < securityUserVsRolesForm.getRoleId().length; i++) {
								%>
								<tr onclick="securityUserVsRoles_tableClickRoles('<%=i%>')">
									<td>
										<%=i + 1%>
									</td>
									<td>
										<input type="checkbox" name="checkBox" value="" onclick="securityUserVsRoles_tableClickRoles('<%=i%>')" />
										<input type="hidden" name="roleId" value="<%=securityUserVsRolesForm.getRoleId()[i]%>" />
									</td>
									<td id="neirong_neirong_td3" class="tdLeftTop">
										<%=securityUserVsRolesForm.getRoleDetail()[i]%>
									</td>
								</tr>
								<%
										}
								}
								%>
							</table>
						</div>
			<div align="center" >
				
			</div>
		</form>
	</body>
</html>