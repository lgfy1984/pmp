<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page import="com.tianjian.util.comm.PageBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="data" scope="request"
	class="com.tianjian.security.struts.form.SecurityConfigParamClassForm" />
<jsp:useBean id="pb" scope="request"
	class="com.tianjian.util.comm.PageBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%
			if (request.getServerPort() == 80) {
		%>
		<base
			href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
		<%
			} else {
		%>
		<base
			href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
		<%
			}
		%>
		<title><bean:message key="security.jsp.securityConfigParamClassM.list.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
		<script language="javascript" src="comm/include/javascript/CommMessage.js"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
 		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
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
    document.form.classCode1.value = id;  
    document.form.verbId.value = "detail";    
    document.form.submit();
}

//修改
function cmdEdit(id) {
    document.form.classCode1.value = id;  
    document.form.verbId.value = "updateInit";    
    document.form.submit();     
}

//删除
function cmdDel(id) {   
	$.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
    	if (r){  
		    document.form.classCode1.value = id;  
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
			function showMessage(message){
				if(message != ''&& message != null){
					$.messager.alert('提示',message);
					return;
				}
			}

</script>
	</head>
	<body onload="showMessage('<%=data.getMessage()%>')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post"
			action="<%=request.getContextPath()%>/security/securityConfigParamClass.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=data.getVerbId()%>">
			<input type="hidden" name="orderNo" value="<%=data.getOrderNo()%>">
			<input type="hidden" name="asc" value="<%=data.getAsc()%>">
			<input type="hidden" id="classCode1" name="classCode1" value="<%=data.getClassCode1()%>">

			<!--查询条件-->
			<div class='crm_content_div'>
				<div class='crm_search_div'>
					<div class="crm_input_item">
					<span>所属工程:</span>
					<input name="projectName" type="text" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('classCode')" value="<%=data.getProjectName()%>" />				
					</div>
					<div class="crm_input_item">
					<span>程序包代码:</span>
				    <input name="classCode" type="text" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('className')" value="<%=data.getClassCode()%>" />
				    </div>
				    <div class="crm_input_item">
				    <span><bean:message key="security.jsp.securityConfigParamClass1.commom2" bundle="security"/>:</span>
				    <input name="className" type="text" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('inputCode')" value="<%=data.getClassName()%>" />
					</div>
					<div class="crm_input_item">
					<span><bean:message key="security.jsp.securityConfigParamClass1.commom3" bundle="security"/>:</span>
					<input name="inputCode" type="text"  style="width: 80px;"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="crm_search_input_text" onkeypress="eventOnKeyPress('btnsubmit')" value="<%=data.getInputCode()%>" />
					</div>
					<div class="crm_input_item">
						<input type="button" value="查询" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="submitQueryForm()" />
						<input type="button" value="新增" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="cmdAdd()" />
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
									程序包代码
								</td>
								<td>
									程序包名称
								</td>
								<td>
									输入码
								</td>
								<td>
									功能描述
								</td>
								<td>
									所属工程
								</td>
								<td colspan="3" style="width: 20%">
									操作
								</td>
							</tr>
						</thead>
						<tbody id="interval_row_id">
						  <c:if test="${pb.count<=0}">
						<tr>
							<td colspan="8">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
							<%
								if (data.getClassCodeList() != null
										&& data.getClassCodeList().length > 0) {
									for (int i = 0; i < data.getClassCodeList().length; i++) {
							%>
							<tr>
								<td>
									<%=data.getClassCodeList()[i]%>
								</td>
								<td >
									<%=data.getClassNameList()[i]%>
								</td>
								<td >
									<%=data.getInputCodeList()[i]%>
								</td>
								<td >
									<%=data.getFunctionDescriptionList()[i]%>
								</td>
								<td >
									<%=data.getProjectNameList()[i]%>
								</td>
								<td style="cursor: pointer;">
									<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"
										onclick="cmdView('<%=data.getClassCodeList()[i]%>')" />
								</td>
								<td style="cursor: pointer;">
									<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改"
										onclick="cmdEdit('<%=data.getClassCodeList()[i]%>')" />
								</td>
								<td style="cursor: pointer;">
									<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"
										onclick="cmdDel('<%=data.getClassCodeList()[i]%>')" />
								</td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
						<tfoot <c:if test="${pb.count<=0}">style="display:none"</c:if>>
			  <tr>
			  <td colspan="8">
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
	</body>
	<script language="javascript"
		src="include/javascript/interval_row_color.js"></script>
</html>
