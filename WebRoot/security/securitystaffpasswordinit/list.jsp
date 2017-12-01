<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.tianjian.util.comm.TJInit"%>
<jsp:useBean id="securityStaffPasswordInit" scope="request" class="com.tianjian.security.struts.form.SecurityStaffPasswordInitForm" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
		if (request.getServerPort() == 80) {
		%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%
		} else {
		%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%
		}
		%>
		<title><bean:message key="security.jsp.securitystaffpasswordinit.list.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script type="text/javascript" src="include/javascript/TJMessage.js"></script>
		<script type="text/javascript" src="include/javascript/daohang.js"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="<bean:message key="security.js.gettext_staff.path" bundle="security" />"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script src="<%=request.getContextPath()%>/include/javascript/searchsuggest.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/searchsuggest.css" />
 		<script type="text/javascript" src="<%=request.getContextPath()%>/include/javascript/searchwindow.js"></script>	
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
 		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script language="javascript">
		function confirminit(staffId, url){
				if (confirmMessage("<bean:message key='security.jsp.securitystaffpasswordinit.list.warn' bundle='security'/>?")){     
				   	 cmdPasswordInit(staffId, url);
				   }   
			}
function submitQueryForm() { 
  
  document.form.page.value = 1; 
  document.form.orderNo.value = ""; 
  document.form.asc.value = ""; 
  document.form.method = "POST";
  document.form.verbId.value = "query";
  document.form.submit();
}

function commandOrderBy(order, asc) { 
  
  document.form.orderNo.value = order; 
  document.form.asc.value = asc; 
  document.form.method = "POST";
  document.form.verbId.value = "query";
  document.form.submit();
}

function cmdViewCase(userId, url) {
    url = url + "?userId=" + userId + "&verbId=query";
	window.open(url, "", "height=600, width=1024, top=" + (screen.availHeight-600)/2 + ", left=" + (screen.availWidth-1024)/2 + ", directions=no, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=yes");
	
}

function cmdViewClinic(userId, url) {
    url = url + "?userId=" + userId + "&verbId=query";
	document.location.href = url;
	
}

function cmdViewDetail(userId, url) {
    url = url + "&staffId=" + userId + "";
	document.location.href = url;
	
}

function openNewWindow(url){
	window.open(url, "", "height=600, width=1024, top=" + (screen.availHeight-600)/2 + ", left=" + (screen.availWidth-1024)/2 + ", directions=no, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=yes");
}

function cmdViewUser(url){
	document.location.href = url;
}

function paging(page) {  
   
  document.form.page.value = page;
  document.form.verbId.value = "query";    
  document.form.submit();
}

function goPage2() {
 var _tp=document.getElementById('_tp');
  var _total=document.getElementById('_total');
    if (!isMadeOf(_tp.value,'1234567890')) {
    	$.messager.$.messager.alert('提示','提示', "请先选择接收人手机号！！", "info");
   	  $.messager.alert('提示','');
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
  document.form.verbId.value = "query";    
  document.form.submit();
}


function isMadeOf(val,str)
{
	var jj;
	var chr;
	for (jj=0;jj<val.length;++jj){
		chr=val.charAt(jj);
		if (str.indexOf(chr,0)==-1)
			return false;
	}

	return true;
}

function showInitMessage(message){
	if(message != ""){	
   	  	$.messager.alert('提示',message);
	 	return ;
	}	
}
////////////Ajax-start
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
			  function huiche(){
				if(event.keyCode==13){
						event.keyCode=9
					}
			  }
function getReadyStateHandler(req, responseXmlHandler) {
	return function () {
		if (req.readyState == 4) {
      		if (req.status == 200) {
      			//$.messager.alert('提示',req.responseText); 
      			responseXmlHandler(req.responseXML);
			} else {
			    $.messager.alert('提示',"HTTP error: " + req.status);
      		}
    	}
  	}
}
/////
function cmdPasswordInit(staffId, url){
	var xmlHttp = newXMLHttpRequest();
	url = url + "&staffId=" + staffId + "";	
	xmlHttp.open("GET", url, true);
	
	var securityPasswordInit_handlerFunction = getReadyStateHandler(xmlHttp, securityPasswordInit_update);
	xmlHttp.onreadystatechange = securityPasswordInit_handlerFunction;
	xmlHttp.send(null);
	
}	

function securityPasswordInit_update(xml) {
	var messageXML = xml.getElementsByTagName("message")[0];
	if(messageXML.childNodes[0] != null && messageXML.childNodes[0].nodeValue != null){
		message = messageXML.childNodes[0].nodeValue;
		$.messager.alert('提示',message);
	}	 
}
function showMessage(message){
				if(message != ''&& message != null){
					$.messager.alert('提示',message);
					return;
				}
			}

////////Ajax-stop

</script>
	</head>
	<body onload="showMessage('<%=securityStaffPasswordInit.getMessage()%>')">
		<%
		 				int curPage = 0;
						int totalNum = 0;
						int pageSize = 0;
			
						curPage = pb.getPage();
						totalNum = pb.getCount();
						pageSize = pb.getPageSize();
			
						int totalPage = totalNum / pageSize;
						if (totalNum % pageSize > 0)
							totalPage += 1;
						if (totalPage == 0) {
							curPage = 0;
						}
					%>
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="security/securityStaffPasswordInit.do" autocomplete=“off”>
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=securityStaffPasswordInit.getVerbId()%>" />
			<input type="hidden" name="orderNo" value="<%=securityStaffPasswordInit.getOrderNo()%>" />
			<input type="hidden" name="asc" value="<%=securityStaffPasswordInit.getAsc()%>" />
			<input type="hidden" name="staffHspId" value="<%=securityStaffPasswordInit.getStaffHspId() %>" />
			<div class='crm_content_div'>

				<div class='crm_search_div'>
					<div class="crm_input_item">
						<span><bean:message key="security.jsp.commom.hspConfigBaseinfoName" bundle="security"/>：</span>
						<input type="text"  id="itemName" name="itemName" class="crm_search_input_text"
						value="<%=securityStaffPasswordInit.getItemName()%>"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
						onkeyup="GiveOptions(event, '<%=request.getContextPath()%>/searchSuggest.do', 'getHspName_00000000004')"
						onkeydown="huanhang(event)"/>
					</div>
					<div class="crm_input_item">	
						<span><bean:message key="security.jsp.commom.staffCode" bundle="security"/>：</span>
						<input name="staffId" id="staffId" onKeyDown="huiche()" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="crm_search_input_text"
							type="text" value="<%=securityStaffPasswordInit.getStaffId()%>" /> 
					</div>
					<div class="crm_input_item">	
						<span><bean:message key="security.jsp.commom.name" bundle="security"/>：</span>
						 <input name="name" id="name" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
						 type="text"  value="<%=securityStaffPasswordInit.getName()%>" 
						 onkeyup="GiveOptions(event, '<%=request.getContextPath()%>/searchSuggest.do', 'getStaffName_0000000001')" 
						 onkeydown="huanhang(event)"/>
						 
						 <span id="spanOutput" class="spanTextDropdown" style="display: none;"></span>
					</div>
					<div class="crm_input_item">
						<input type="button" value="查询" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="submitQueryForm()" />
					</div>
					<div style="clear: both"></div>
				</div>
				<div class="horizontal_line_2"></div>
			<!--列表标题-->
			<div class='crm_table_out'>
				<table class='crm_table_content'>
				 <thead>
			    	<tr>
								<td>
									序号
								</td>
								<td>
									卫生机构
								</td>
								<td>
									用户名
								</td>
								<td>
									姓名
								</td>
								<td>
									性别
								</td>
								<td>
									激活时间
								</td>
								<td>
									有效时间
								</td>
								<td colspan="3" style="width:20%">
									操作
								</td>

							</tr>
				</thead>
				<tbody id="interval_row_id">
					<%
						if (securityStaffPasswordInit.getIdList() != null && securityStaffPasswordInit.getIdList().length > 0) {
							for (int i = 0; i < securityStaffPasswordInit.getIdList().length; i++) {
					%><tr >
						<td style="text-align:center;"><%=(curPage-1)*pageSize+i+1%></td>
						<td ><%=securityStaffPasswordInit.getItemNameList()[i]%></td>
						<td><%=securityStaffPasswordInit.getStaffIdList()[i]%></td>
						<td ><%=securityStaffPasswordInit.getNameList()[i]%></td>
						<td ><%=securityStaffPasswordInit.getSexList()[i]%></td>
						<td ><%=securityStaffPasswordInit.getRegTimes()[i]%></td>
						<td ><%=securityStaffPasswordInit.getStopTimes()[i]%></td>
						<td style="cursor: pointer;">
									<input type="button" class="button_green1_s1"  value="重置密码"
										onclick="confirminit('<%=securityStaffPasswordInit.getIdList()[i]%>', 'security/securityStaffPasswordInit.do?verbId=update')" />
						</td>
					</tr>
					<%
							}
							}
					%>
				</tbody>
				<tfoot>
			  <tr>
			  <td colspan="10">
			  	<input type="hidden" title="当前第几页" name="page_index" id="page_index" value="${pb.page}"/>
			    <input type="hidden" title="一共多少页" name="page_count" id="page_count" value="${pb.pageCount}"/>
			    <input type="hidden" title="一共多少条记录" name="count" id="count" value="${pb.count}"/>
			    <input type="hidden" title="每页显示多少条记录" name="page_size" id="page_size" value="${pb.pageSize}"/>
			  	<input type="hidden" name="cur_page" id="cur_page" value="${pb.page}"/>
			  	<input type="hidden" name="page" id="page" value="${pb.page}"/>
			  	<div class="pager_num"></div>
			  	<div class="pager_text"></div>
			  </td>
			  </tr>
		  </tfoot>
			</table>
			</div>
			
			</div>
			<script type="text/javascript" src="include/javascript/interval_row_color.js"></script>
		</form>
	</body>
</html>
