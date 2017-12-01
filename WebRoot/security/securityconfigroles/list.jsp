<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="dataForm" scope="request" 
	class="com.tianjian.security.struts.form.SecurityConfigRolesForm"  />
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
		<title><bean:message key="security.jsp.securityConfigroles.list.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="javascript" src="<bean:message key="include.js.TJMessage.path" bundle="security" />"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css"/>
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
			$.messager.alert('提示',message);
			return;
		}
	}
</script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
		  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		  <script type="text/javascript" src="${path}/js/default.js"></script>
		  <script type="text/javascript" src="${path}/js/pager.js"></script>
	</head>
	<body onload="showHspMessage('<%=dataForm.getMessage()%>')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="security/securityConfigRoles.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="${dataForm.verbId}">
			<input type="hidden" name="orderNo" value="${dataForm.orderNo}">
			<input type="hidden" name="asc" value="${dataForm.asc}">
			<input type="hidden" name="idHidden" value="${dataForm.idHidden}">
			<!--查询条件-->
			<div class='crm_content_div'>
			 <div class='crm_search_div'>
				<div class="crm_input_item">
					<span><bean:message key="security.jsp.commom.menuCode" bundle="security"/></span>
					<input name="roleCode" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('roleDetail')" value="${dataForm.roleCode}" class="crm_search_input_text">
				</div>
				<div class="crm_input_item">
					<span><bean:message key="security.jsp.commmom.classCode" bundle="security"/></span>
					<input name="roleDetail" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('inputCode')" value="${dataForm.roleDetail}" class="crm_search_input_text">
				</div>
				<div class="crm_input_item">
					<span><bean:message key="security.jsp.commom.inputcode" bundle="security"/></span>
					<input name="inputCode" type="text" value="${dataForm.inputCode}" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('btnsubmit')" class="crm_search_input_text">
				</div>
				<div class="crm_input_item">
				<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" value="<bean:message key="security.jsp.securityConfigParamClass.query.button1" bundle="security"/>" onClick="submitQueryForm();" name="btnsubmit"/>
				<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" value="新增" onclick="cmdAdd()" />
				</div>
				<div style="clear:both"></div>	
			</div>
			<div class="horizontal_line_2"></div>
		 <div class='crm_table_out'>
			<!--列表标题-->
			<table class='crm_table_content'>
			    <thead>
			    	<tr class="lstName">
			            <th width="5%">
			            <bean:message key="security.jsp.commom.menuCode" bundle="security"/>
			            <!-- 
			            <img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('1', '0')" />
			            <img border="0" onclick="commandOrderBy('1', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />
			             -->
			            </th>
			            <th width="15%"><bean:message key="security.jsp.commmom.classCode" bundle="security"/>
			             <!-- 
			            <img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('2', '0')" />
			            <img border="0" onclick="commandOrderBy('2', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />
			            -->
			            </th>
			            <th width="5%"><bean:message key="security.jsp.commom.serialNo" bundle="security"/>
			            <!-- 
			            <img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('3', '0')" />
			            <img border="0" onclick="commandOrderBy('3', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />
			            -->
			            </th>
			            <th width="4%"><bean:message key="security.jsp.commom.inputcode" bundle="security"/>
			            <!-- 
			            <img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('4', '0')" />
			            <img border="0" onclick="commandOrderBy('4', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />
			            -->
			            </th>
			            <th width="3%"><bean:message key="security.jsp.commom.button6" bundle="security"/></th>
			            <th width="3%"><bean:message key="security.jsp.commom.button7" bundle="security"/></th>
			            <th width="3%"><bean:message key="security.jsp.commom.button8" bundle="security"/></th>
			        </tr>
				</thead>
			    <tbody id="interval_row_id">
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
					<logic:notEmpty name="dataForm" property="dataList">
						<logic:iterate id="data" indexId="indexId" name="dataForm" property="dataList">
							<tr>
								<td>
									${data.roleCode}
								</td>
								<td >
									${data.roleDetail}
								</td>
								<td>
									${data.serialNo}
								</td>
								<td >
									${data.inputCode}
								</td>
								<td>
									<input type="button" onClick="cmdView('${data.id}')" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细" />
								</td>
								<td>
									<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改" onClick="cmdEdit('${data.id}')"/>
								</td>
								<td>
									<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除" onClick="cmdDel('${data.id}')"/>
								</td>
							</tr>
						</logic:iterate>
					</logic:notEmpty>
				</tbody>
				<tfoot <c:if test="${pb.count<=0}">style="display:none"</c:if>>
			  <tr>
			  <td colspan="7">
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
			</table>
			</div>
			
			</div>
		</form>
		<script language="javascript" src="include/javascript/interval_row_color.js"></script>
	</body>
</html>
