﻿<%@page contentType="text/html; charset=utf-8"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="commConfigDegreeLevel" scope="request" type="com.tianjian.comm.struts.form.CommConfigDegreeLevelForm" />
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
		<title><bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigdegreelist.text49"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="javascript" src="<bean:message  key="comm.js.includeTJMessage.path"  bundle="comm.commLocale"/>"></script>
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
    	$.messager.defaults = { ok: "是", cancel: "否" };
    	$.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
    	if (r){
		    document.form.idHidden.value = id;  
		    document.form.verbId.value = "delete";    
		    document.form.submit(); 
		  }   
    });
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
      $.messager.alert('提示',"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.warn4"/>!");
      return;
    }
    if (_tp.value<=0){
    	$.messager.alert('提示',"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.pageGreateThanZero"/>!");
		return;
    }
    if(parseInt(_tp.value)>parseInt(_total.value)){
      $.messager.alert('提示',"<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.warn3"/>!");
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

</script>
<%--<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />--%>
<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${path}/js/default.js"></script>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  		<script type="text/javascript" src="${path}/js/pager.js"></script>
	</head>
	<body>
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="comm/commConfigDegreeLevel.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=commConfigDegreeLevel.getVerbId()%>">
			<input type="hidden" name="orderNo" value="<%=commConfigDegreeLevel.getOrderNo()%>">
			<input type="hidden" name="asc" value="<%=commConfigDegreeLevel.getAsc()%>">
			<input type="hidden" name="idHidden" value="<%=commConfigDegreeLevel.getIdHidden()%>">
		<!--zyc--add--b-->
		<div class='crm_search_div' style='overflow: hidden'>
		 <div class="crm_input_item">
		  	<span>代码</span>
		  	<input class="crm_search_input_text" name="itemCode" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" onkeypress="eventOnKeyPress('itemName')" value="<%=commConfigDegreeLevel.getItemCode()%>" />
		 </div>
		 <div class="crm_input_item">
		  	<span>名称</span>
		  	<input class="crm_search_input_text" name="itemName" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" onkeypress="eventOnKeyPress('inputCode')" value="<%=commConfigDegreeLevel.getItemName() %>" />
		 </div>
		 <div class="crm_input_item">
		  	<span>输入码</span>
		  	<input class="crm_search_input_text" name="inputCode" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" onkeypress="eventOnKeyPress('btnSave')" value="<%=commConfigDegreeLevel.getInputCode() %>" />
		 </div>
		 <div class="crm_input_item">
		 <input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"  name="btnSave" value="查询" onclick="submitQueryForm();" />
		 <input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" value="新增" onclick="cmdAdd();"/>
		 </div>	
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td >代码
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('1', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('1', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td >名称
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('2', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('2', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td>序号
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('3', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('3', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td >输入码
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('4', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('4', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td colspan="3" style="width:20%">操作</td>
		  </tr>
		  </thead>
		  <tbody>
		    	<c:if test="${pb.count<=0}">
						<tr>
							<td colspan="7">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
			<%if (commConfigDegreeLevel.getItemCodeList() != null && commConfigDegreeLevel.getItemCodeList().length > 0) {
				for (int i = 0; i < commConfigDegreeLevel.getItemCodeList().length; i++) {
					if(i%2==0){%>
						<tr class="odd">
					<%}else{ %>
						<tr class="even">
					<%}
					%>
					<td><%=commConfigDegreeLevel.getItemCodeList()[i]%></td>
					<td><%=commConfigDegreeLevel.getItemNameList()[i]%></td>
					<td><%=commConfigDegreeLevel.getSeqNoList()[i]%></td>
					<td><%=commConfigDegreeLevel.getInputCodeList()[i]%></td>
					<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"  onclick="cmdView('<%=commConfigDegreeLevel.getItemCodeList()[i] %>')"/></td>
					<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改"  onclick="cmdEdit('<%=commConfigDegreeLevel.getItemCodeList()[i] %>')"/></td>
					<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"  onclick="cmdDel('<%=commConfigDegreeLevel.getItemCodeList()[i] %>')"/></td>
				  </tr>
				<%}
			}
			%>
		  </tbody>
		  <tfoot <c:if test="${pb.count<=0}">style="display:none"</c:if>>
			  <tr>
			  <td colspan="7">
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
	  <!--zyc--add--e-->
			<!--查询条件-->
			<%--<table border="0" cellpadding="0" cellspacing="0" class="tblSearch" align="center">
					<tr>
					<td class="tblTitle" colspan="4">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigdegreelist.text47"/>
					</td>
				</tr>
				<tr>
					<td>
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/>:
						<input name="itemCode" type="text" onkeypress="eventOnKeyPress('itemName')" value="<%=commConfigDegreeLevel.getItemCode()%>">
					
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/>:
						<input name="itemName" type="text" onkeypress="eventOnKeyPress('inputCode')" value="<%=commConfigDegreeLevel.getItemName()%>">
					
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.inputCode"/>:
						<input name="inputCode" type="text" value="<%=commConfigDegreeLevel.getInputCode()%>" onkeypress="eventOnKeyPress('btnSearch')">
					
						<input type="button" class="btnSave"  id="btnSearch" name="btnSearch"  value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.submit1"/>" onClick="submitQueryForm();" />
					</td>
				</tr>
			</table>
			<!--列表标题-->
			<div id="dvh1">
			<table border="0" cellpadding="0" cellspacing="0" class="tblSearchList" align="center">
				<caption style="text-align:left;">
					<img src="<%=request.getContextPath()%>/comm/include/images/comm_list_nav_red.jpg" width="20" height="20" align="absmiddle" /> <span style="font-weight:bold; color:#333;"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.selectList"/></span>
					<span class="titleBtn"><img  src="<bean:message key="security.jsp.securityconfigpublicclass.add" bundle="conf.security.security"/>"  align="absmiddle" />
						<a href="javascript:cmdAdd()" target="_self"><bean:message key="security.jsp.commom.button3" bundle="security"/></a></span>
			    </caption>
			    <thead>
			    	<tr class="lstName">
			            <th width="5%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('1', '0')" /><img border="0" onclick="commandOrderBy('1', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="15%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('2', '0')" /><img border="0" onclick="commandOrderBy('2', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="5%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('3', '0')" /><img border="0" onclick="commandOrderBy('3', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="4%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.inputCode"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('4', '0')" /><img border="0" onclick="commandOrderBy('4', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="3%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.search"/></th>
			            <th width="3%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.change"/></th>
			            <th width="3%" height="26"><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.delete"/></th>
			        </tr>
				</thead>
				<tbody id="interval_row_id">
					<%
							if (commConfigDegreeLevel.getItemCodeList() != null && commConfigDegreeLevel.getItemCodeList().length > 0) {
							for (int i = 0; i < commConfigDegreeLevel.getItemCodeList().length; i++) {
					%>
					<tr>
						<td>
							<%=commConfigDegreeLevel.getItemCodeList()[i]%>
						</td>
						<td style="text-align:left;padding-left:10px;">
							<%=commConfigDegreeLevel.getItemNameList()[i]%>
						</td>
						<td>
							<%=commConfigDegreeLevel.getSeqNoList()[i]%>
						</td>
						<td style="text-align:left;padding-left:10px;">
							<%=commConfigDegreeLevel.getInputCodeList()[i]%>
						</td>
						<td>
							<img onClick="cmdView('<%=commConfigDegreeLevel.getItemCodeList()[i]%>')" alt="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.detail"/>" src="include/images/cmdView_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
						<td>
							<img onClick="cmdEdit('<%=commConfigDegreeLevel.getItemCodeList()[i]%>')" alt="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.change"/>" src="include/images/cmdEdit_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
						<td>
							<img onClick="cmdDel('<%=commConfigDegreeLevel.getItemCodeList()[i]%>')" alt="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.delete"/>" src="include/images/cmdDel_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
			</div>
			--%><!--列表内容-->
			
		</form>
		<script language="javascript" src="include/javascript/interval_row_color.js"></script>
	</body>
</html>