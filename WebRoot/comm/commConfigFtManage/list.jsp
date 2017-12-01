<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page import="com.tianjian.util.comm.PageBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommConfigFtManageForm" />
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if (request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/"/>
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"/>
		<%}%>
		<title><bean:message key="comm.jsp.different.text16" bundle="conf.comm.comm"/>LIST.JSP</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<script language="javascript" src="<bean:message key="comm.js.CommMessage.path" bundle="conf.comm.comm"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script language="javascript">
			function submitQueryForm() { 
				document.form.page.value = 1; 
			  	document.form.orderNo.value = ""; 
			  	document.form.asc.value = ""; 
			  	document.form.method = "POST";
			  	document.form.verbId.value = "query";
			  	document.form.isQuery.value = "yes";
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
			      		$.messager.alert('提示',"<bean:message key="comm.jsp.common.text8" bundle="conf.comm.comm"/>!");
			      		return;
			    	}
			    	if (_tp.value<=0){
			    		$.messager.alert('提示',"<bean:message key="comm.jsp.common.text56" bundle="conf.comm.comm"/>!");
						return;
			    	}
			    	if(parseInt(_tp.value)>parseInt(_total.value)){
			      		$.messager.alert('提示',"<bean:message key="comm.jsp.common.text5" bundle="conf.comm.comm"/>!");
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
		</script>
     	<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
	</head>
	<body onload="showCommMessage('','<%=data.getMessage() %>','1')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="<%=request.getContextPath()%>/comm/commConfigFtManage.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=data.getVerbId()%>" />
			<input type="hidden" name="orderNo" value="<%=data.getOrderNo()%>" />
			<input type="hidden" name="asc" value="<%=data.getAsc()%>" />
			<input type="hidden" name="itemCodeHidden" value="<%=data.getItemCodeHidden()%>" />
			<input type="hidden" name="isQuery" value="<%=request.getParameter("isQuery") %>"/>

			
			<div class='crm_search_div' style='overflow: hidden'>
				<div class="crm_input_item">
					<span>代码</span> <input class="crm_search_input_text"
						name="itemCode" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						onkeypress="eventOnKeyPress('itemName')"
						value="<%=data.getItemCode()%>" />
				</div>
				<div class="crm_input_item">
					<span>名称</span> <input class="crm_search_input_text"
						name="itemName" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						onkeypress="eventOnKeyPress('inputCode')"
						value="<%=data.getItemName()%>" />
				</div>
				<div class="crm_input_item">
					<span>输入码</span> <input class="crm_search_input_text"
						name="inputCode" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						onkeypress="eventOnKeyPress('<bean:message key="comm.jsp.commom.submit" bundle="comm.commLocale"/>')"
						value="<%=data.getInputCode()%>" />
				</div>
				<div class="crm_input_item">
				<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" name="btnSave"
					value="查询" onclick="submitQueryForm();" /> 
				<input type="button"class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
					name="<bean:message key="comm.jsp.common.commit" bundle="conf.comm.Comm"/>"
					value="新增" onclick="cmdAdd();" />
				</div>
			</div>
			<!--列表标题-->
			<div class="horizontal_line_2"></div>
			<div id="dvh1" class='crm_table_out'>
			<table style="table-layout: fixed;" class='crm_table_content'>
				
				<thead>
		 			<tr>
		  				<td style="width:20%">代码</td>
		  				<td style="width:20%">名称</td>
		  				<td style="width:20%">序号</td>
		  				<td style="width:20%">输入码</td>
		  				<td colspan="3" style="width:220px">操作</td>
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
					<%
						if (data.getItemCodeList() != null && data.getItemCodeList().length > 0) {
							for (int i = 0; i < data.getItemCodeList().length; i++) {
							if(i%2==0){%>
									<tr class="odd">
								<%}else{ %>
									<tr class="even">
							<%}
					%>
					
						<td>
							<%=data.getItemCodeList()[i]%>
						</td>
						<td>
							<%=data.getItemNameList()[i]%>
						</td>
						<td>
							<%=data.getSeqNoList()[i]%>
						</td>
						<td>
							<%=data.getInputCodeList()[i]%>
						</td>
						<!-- <td>
							<img onClick="cmdView('<%=data.getItemCodeList()[i]%>')" alt="<bean:message key="comm.jsp.common.text46" bundle="conf.comm.comm"/>" src="include/images/cmdView_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
						<td>
							<img onClick="cmdEdit('<%=data.getItemCodeList()[i]%>')" alt="<bean:message key="comm.jsp.common.text47" bundle="conf.comm.comm"/>" src="include/images/cmdEdit_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
						<td>
							<img onClick="cmdDel('<%=data.getItemCodeList()[i]%>')" alt="<bean:message key="comm.jsp.common.text35" bundle="conf.comm.comm"/>" src="include/images/cmdDel_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td> -->
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"  onclick="cmdView('<%=data.getItemCodeList()[i]%>')"/></td>
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改"  onclick="cmdEdit('<%=data.getItemCodeList()[i]%>')"/></td>
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"  onclick="cmdDel('<%=data.getItemCodeList()[i]%>')"/></td>
					</tr>
					<%
							}
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