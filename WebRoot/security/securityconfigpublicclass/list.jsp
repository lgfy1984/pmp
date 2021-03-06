﻿<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@page import="com.tianjian.security.bean.SecurityConfigPublicClass"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="dataForm" 
	scope="request" class="com.tianjian.security.struts.form.SecurityConfigPublicClassForm" />
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
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
		<title><bean:message key="security.jsp.securityconfigpublicclass.list.title" bundle="conf.security.security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="javascript" src='<bean:message key="include.js.TJMessage.path" bundle="security" />'></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript">
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

//添加
function cmdAdd() {
    document.form.verbId.value = "addInit";    
    document.form.submit();
}

//查看详细
function cmdView(id) {
    document.form.idHidden.value = id;  
    document.form.verbId.value = "detail";    
    document.form.submit();
}

//修改
function cmdEdit(id) {
    document.form.idHidden.value = id;  
    document.form.verbId.value = "updateInit";    
    document.form.submit();     
}

//删除
function cmdDel(id) {    
	if (confirmMessage("<bean:message key='security.jsp.commom.delete' bundle='security'/>")){     
	    document.form.idHidden.value = id;  
	    document.form.verbId.value = "delete";    
	    document.form.submit(); 
    } 
}

function goPage(page) {  
   document.form.page.value = page;
   document.form.verbId.value = "query";    
   document.form.submit();
}

function goPage2() {
  var _tp=document.getElementById('_tp');
  var _total=document.getElementById('_total'); 
    if (!isMadeOf(_tp.value,'1234567890')) {
	  alert('<bean:message key="js.pagewarn1" bundle="conf.Init"/>');
      return;
    }
    if (_tp.value<=0){
		alert('<bean:message key="js.pagewarn2" bundle="conf.Init"/>');
		return;
    }
    if(parseInt(_tp.value)>parseInt(_total.value)){
		alert('<bean:message key="js.pagewarn3" bundle="conf.Init"/>');
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
function showHspMessage(message){
				if(message != ''&& message != null){
					alert(message);
					return;
				}
			}
</script>
	<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
	</head>
	<body  onload="showHspMessage('<%=dataForm.getMessage()%>')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post"  action="security/securityConfigPublicClass.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="${dataForm.verbId}" />
			<input type="hidden" name="orderNo" value="${dataForm.orderNo}" />
			<input type="hidden" name="asc" value="${dataForm.asc}" />
			<input type="hidden" name="idHidden" value="${dataForm.idHidden}" />
			<!--查询条件-->
			<table border="0" cellpadding="0" cellspacing="0" class="tblSearch" align="center">
				<tr>
					<td class="tblTitle" colspan="4">
						<bean:message key="security.jsp.securityconfigpublicclass.list.topic" bundle="conf.security.security"/>
					</td>
				</tr>
				<tr>
					<td>
						级别：
						<input name="levelFlag" type="text" onkeyup="value=value.replace(/[^\d]/g,'')" onkeypress="eventOnKeyPress('parentId')" value="${dataForm.levelFlag}" />
							
						<bean:message key="security.jsp.securityconfigpublicclass.common.parentId" bundle="conf.security.security"/>：
						<select class="select" id="parentId" name="parentId"  onkeypress="eventOnKeyPress('classCode')">
							<option value=""></option>
							<%
										if (dataForm.getSecurityConfigPublicClassList() != null
										&& dataForm.getSecurityConfigPublicClassList().size() > 0) {
									for (int i = 0; i < dataForm.getSecurityConfigPublicClassList().size(); i++) {
										SecurityConfigPublicClass publicClass = (SecurityConfigPublicClass)dataForm.getSecurityConfigPublicClassList().get(i);
										String tempId = publicClass.getId();
										String tempName = publicClass.getClassName();
							%>
									<option value="<%=tempId %>" <%=tempId.equals(dataForm.getParentId())?"selected":"" %>>
										<%=tempName %>
									</option>
							<%
								}
								}
							%>
						</select>
						
						<bean:message key="security.jsp.securityconfigpublicclass.common.classCode" bundle="conf.security.security"/>：
						<input name="classCode" type="text" onkeypress="eventOnKeyPress('className')" value="${dataForm.classCode}" />

						<bean:message key="security.jsp.securityconfigpublicclass.common.className" bundle="conf.security.security"/>：
						<input name="className" type="text" onkeypress="eventOnKeyPress('inputCode')" value="${dataForm.className}" />

						<bean:message key="security.jsp.securityconfigpublicclass.common.inputCode" bundle="conf.security.security"/>：
						<input name="inputCode" type="text" onkeypress="eventOnKeyPress('tijiao')" value="${dataForm.inputCode}" />


						<input type="button" class="btnSave"  name="tijiao" value="<bean:message key="security.jsp.securityConfigParamClass.query.button1" bundle="security"/>" onClick="submitQueryForm();" />
					</td>
				</tr>
			</table>
			<!--列表标题-->
			<div id="dvh1">
			<table border="0" cellpadding="0" cellspacing="0" class="tblSearchList" align="center">
					<caption style="text-align:left;">
						<img src="<%=request.getContextPath()%>/comm/include/images/comm_list_nav_red.jpg" width="20" height="20" align="absmiddle"  /> <span><bean:message key="jsp.resultlist" bundle="conf.Init"/></span>
						<span class="titleBtn"><img  src="<bean:message key="security.jsp.securityconfigpublicclass.add" bundle="conf.security.security"/>"  align="absmiddle" />
						<a href="javascript:cmdAdd()" target="_self"><bean:message key="security.jsp.commom.button3" bundle="security"/></a></span>
   				 	</caption>
					<thead>
				    	<tr class="lstName">
				            <th width="5%" height="26"><bean:message key="security.jsp.securityconfigpublicclass.common.classCode" bundle="conf.security.security"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('1', '0')" /><img border="0" onclick="commandOrderBy('1', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
				            <th width="10%"height="26"><bean:message key="security.jsp.securityconfigpublicclass.common.className" bundle="conf.security.security"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('2', '0')" /><img border="0" onclick="commandOrderBy('2', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
				          	<th width="4%" height="26">父类别名称<div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('3', '0')" /><img border="0" onclick="commandOrderBy('3', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
				            <th width="4%" height="26">级别<div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('4', '0')" /><img border="0" onclick="commandOrderBy('4', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
				            <th width="4%" height="26"><bean:message key="security.jsp.securityconfigpublicclass.common.serialNo" bundle="conf.security.security"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('5', '0')" /><img border="0" onclick="commandOrderBy('5', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
				            <th width="4%" height="26"><bean:message key="security.jsp.securityconfigpublicclass.common.inputCode" bundle="conf.security.security"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('5', '0')" /><img border="0" onclick="commandOrderBy('6', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
				            <th width="3%" height="26"><bean:message key="jsp.view" bundle="conf.Init"/></th>
				            <th width="3%" height="26"><bean:message key="jsp.update" bundle="conf.Init"/></th>
				            <th width="3%" height="26"><bean:message key="jsp.delete" bundle="conf.Init"/></th>
				        </tr>
					</thead>
					<tbody id="interval_row_id">
					<%
						if(dataForm.getClassNameList() != null && dataForm.getClassNameList().length > 0){
							for(int i=0;i < dataForm.getClassNameList().length;i++){
					%>
							<tr>
								<td>
									<%=dataForm.getClassCodeList()[i] %>
								</td>
								<td style="text-align:left;padding-left:10px;">
									<%=dataForm.getClassNameList()[i] %>
								</td>
								<td style="text-align:left;padding-left:10px;">
									<%=dataForm.getClassPartenNameL()[i] %>
								</td>
								<td>
									<%=dataForm.getLevelFlagList()[i] %>
								</td>
								<td>
									<%=dataForm.getSerialNoList()[i] %>
								</td>
								<td style="text-align:left;padding-left:10px;">
									<%=dataForm.getInputCodeList()[i] %>
								</td>
								<td>
									<img onClick="cmdView('<%=dataForm.getIdList()[i] %>')" alt='<bean:message key="jsp.detail" bundle="conf.Init"/>' src="include/images/cmdView_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
								</td>
								<td>
									<img onClick="cmdEdit('<%=dataForm.getIdList()[i] %>')" alt='<bean:message key="jsp.update" bundle="conf.Init"/>' src="include/images/cmdEdit_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
								</td>
								<td>
									<img onClick="cmdDel('<%=dataForm.getIdList()[i] %>')" alt='<bean:message key="jsp.delete" bundle="conf.Init"/>' src="include/images/cmdDel_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
								</td>
							</tr>
						<%
							}
						}	 
						%>
				</tbody>
			</table>
			<!--列表内容-->
			<table width="100%" align="center" class="tblScrollFooter" align="center">		
				<tr>
					<td colspan="11" align="center" class="footer">
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
						<input type="hidden" id="pageId" name="pageId" value="page_282881f5346450a201346450a2ad0000" />
						<input type="hidden" id="reHref" name="reHref" value="<%=request.getContextPath()%>/security/securityConfigPublicClass.do?verbId=query" />
						<%@ include file="/include/changepagesize.jsp" %>
						
						<input id="_total" name="totalPage" type="hidden" value="<%=totalPage%>" />
						<bean:message key="security.jsp.commom.item2" bundle="security"/><%=curPage%><bean:message key="security.jsp.commom.item3" bundle="security"/><%=totalPage%><bean:message key="security.jsp.commom.item4" bundle="security"/><%=totalNum%><bean:message key="security.jsp.commom.item5" bundle="security"/>&nbsp;|&nbsp;
					<%
						if (curPage > 1) {
					%>
						<a href="javascript:goPage('0')"><img src="include/images/shouye.gif" align="middle" border="0" /></a>&nbsp; <a href="javascript:goPage('<%=curPage - 1 %>')"><img src="include/images/shang.gif" align="middle" border="0" /></a>&nbsp;
					<%
						} else {
							out.println("<img src='include/images/shouye_s.gif' align='middle' border='0px' />&nbsp;&nbsp;<img src='include/images/shang_s.gif' align='middle' border='0px' />&nbsp;");
						}
						if (curPage < totalPage) {
					%>
						<a href="javascript:goPage('<%=curPage + 1 %>')"><img src="include/images/xia.gif" align="middle" border="0" /></a>&nbsp; <a href="javascript:goPage('<%=totalPage %>')"><img src="include/images/mo.gif" align="middle" border="0" /></a>&nbsp;
					<%
						} else {
							out.println("<img src='include/images/xia_x.gif' align='middle' border='0px' />&nbsp;&nbsp;<img src='include/images/mo_m.gif' align='middle' border='0px' />&nbsp;");
						}
					%>
						| &nbsp;<bean:message key="jsp.pagetext3" bundle="conf.Init"/>
						<input id="_tp" name="page" type="text" value="<%=curPage%>" size="2" class="txt" />
						<bean:message key="jsp.pagetext4" bundle="conf.Init"/>
						&nbsp;
						<img style="cursor:hand;" src="include/images/go.jpg" width="18" border="0" onClick="goPage2()" />
					</td>
				</tr>
			</table>
		</form>
		<script language="javascript" src="include/javascript/interval_row_color.js"></script>
	</body>
</html>
