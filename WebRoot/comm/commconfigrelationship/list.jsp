<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="commConfigRelationship" scope="request" type="com.tianjian.comm.struts.form.CommConfigRelationshipForm" />
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
		<title><bean:message key="comm.jsp.common.rerelation" bundle="conf.comm.Comm"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="javascript" src="<bean:message key="comm.js.comm.tjme" bundle="conf.comm.Comm"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
<script type="text/javascript" src="${path}/js/default.js"></script>
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
    document.form.itemCodeHidden.value = id;  
    document.form.verbId.value = "detail";    
    document.form.submit();
}

//修改
function cmdEdit(id) {
    document.form.itemCodeHidden.value = id;  
    document.form.verbId.value = "updateInit";    
    document.form.submit();     
}

//删除
function cmdDel(id) {    
   	$.messager.defaults = { ok: "是", cancel: "否" };
   	$.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
    	if (r){
		    document.form.itemCodeHidden.value = id;  
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
      $.messager.alert('提示',"<bean:message key="comm.jsp.common.error" bundle="conf.comm.Comm"/>!");
      return;
    }
    if (_tp.value<=0){
    	$.messager.alert('提示',"<bean:message key="comm.jsp.common.alert2" bundle="conf.comm.Comm"/>!");
		return;
    }
    if(parseInt(_tp.value)>parseInt(_total.value)){
      $.messager.alert('提示',"<bean:message key="comm.jsp.common.morethanpage" bundle="conf.comm.Comm"/>!");
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
<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
	</head>
	<body>
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="comm/commConfigRelationship.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=commConfigRelationship.getVerbId()%>">
			<input type="hidden" name="orderNo" value="<%=commConfigRelationship.getOrderNo()%>">
			<input type="hidden" name="asc" value="<%=commConfigRelationship.getAsc()%>">
			<input type="hidden" name="itemCodeHidden" value="<%=commConfigRelationship.getItemCodeHidden()%>">
		<!--zyc--add--b-->
		<div class='crm_search_div' style='overflow: hidden'>
		 <div class="crm_input_item">
		  	<span>代码</span>
		  	<input class="crm_search_input_text" name="itemCode" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('itemName')" value="<%=commConfigRelationship.getItemCode()%>" />
		 </div>
		 <div class="crm_input_item">
		  	<span>名称</span>
		  	<input class="crm_search_input_text" name="itemName" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('inputCode')" value="<%=commConfigRelationship.getItemName() %>" />
		 </div>
		 <div class="crm_input_item">
		  	<span>输入码</span>
		  	<input class="crm_search_input_text" name="inputCode" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('btnSave')" value="<%=commConfigRelationship.getInputCode() %>" />
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
		  <td style="width:10%">代码
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('1', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('1', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td style="width:25%">名称
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('2', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('2', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td style="width:25%">序号
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('3', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('3', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td style="width:25%">输入码
		  <%--<img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('4', '0')" />--%>
		  <%--<img border="0" onclick="commandOrderBy('4', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" />--%>
		  </td>
		  <td colspan="3" style="width:220px">操作</td>
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
			<%if (commConfigRelationship.getItemCodeList() != null && commConfigRelationship.getItemCodeList().length > 0) {
				for (int i = 0; i < commConfigRelationship.getItemCodeList().length; i++) {
					if(i%2==0){%>
						<tr class="odd">
					<%}else{ %>
						<tr class="even">
					<%}
					%>
					<td><%=commConfigRelationship.getItemCodeList()[i]%></td>
					<td><%=commConfigRelationship.getItemNameList()[i]%></td>
					<td><%=commConfigRelationship.getSeqNoList()[i]%></td>
					<td><%=commConfigRelationship.getInputCodeList()[i]%></td>
					<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"  onclick="cmdView('<%=commConfigRelationship.getItemCodeList()[i] %>')"/></td>
					<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改"  onclick="cmdEdit('<%=commConfigRelationship.getItemCodeList()[i] %>')"/></td>
					<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"  onclick="cmdDel('<%=commConfigRelationship.getItemCodeList()[i] %>')"/></td>
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
			  	<input type="hidden" name="page" id="cur_page" value="${pb.page}"/>
			  	<div class="pager_num"></div>
			  	<div class="pager_text"></div>
			  </td>
			  </tr>
		  </tfoot>
		 </table>
	  </div>
	
		</form>
		<script language="javascript" src="include/javascript/interval_row_color.js"></script>
	</body>
</html>
