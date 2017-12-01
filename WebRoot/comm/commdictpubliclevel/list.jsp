<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="commDictPublicLevel" scope="request" type="com.tianjian.comm.struts.form.CommDictPublicLevelForm" />
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
		<title><bean:message key="Comm.jsp.commom.genearlLevelDictInfoMaintain" bundle="conf.comm.CommMessage"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script language="javascript" src="<bean:message key="security.js.gettext_staff.path" bundle="security" />"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/open.css" />
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
		    if(!isMadeOf(_tp.value,'1234567890')) {
		      $.messager.alert('提示','<bean:message key="js.pagewarn1" bundle="conf.Init" />');
		      return;
		    }
		    if(_tp.value<=0){
		    	$.messager.alert('提示','<bean:message key="js.pagewarn2" bundle="conf.Init" />');
				return;
		    }
		    if(parseInt(_tp.value)>parseInt(_total.value)){
		      $.messager.alert('提示','<bean:message key="js.pagewarn3" bundle="conf.Init" />');
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
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/open.css" />
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/gold/gold.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
	</head>
	<body onload="showHspMessage('<%=commDictPublicLevel.getMessage()%>')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="comm/commDictPublicLevel.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=commDictPublicLevel.getVerbId()%>">
			<input type="hidden" name="orderNo" value="<%=commDictPublicLevel.getOrderNo()%>">
			<input type="hidden" name="asc" value="<%=commDictPublicLevel.getAsc()%>">
			<input type="hidden" name="idHidden" value="<%=commDictPublicLevel.getIdHidden()%>">
			
			
			<div class='crm_search_div' style='overflow: hidden'>
				<div class="crm_input_item">
					<span>字典类型</span>

					<input type="text" class="crm_search_input_text" id="displayInputId_1"
							name="tableName" 

							onkeydown="huiche()" value="<%=commDictPublicLevel.getTableCode()%>"
							readonly="readonly" onkeypress="eventOnKeyPress('itemName')" disabled="disabled"/>
						<input type="hidden" id="hiddenInputId_1"
							value="<%=commDictPublicLevel.getTableName()%>" name="tableCode" />
							<img src="security/include/images/select.gif"
							style="cursor: pointer;"
							onclick="add('<%=request.getContextPath()%>/comm/commDictPublicChar.do?verbId=getClass','displayInputId_1','hiddenInputId_1')" />
				</div>
				<div class="crm_input_item" >
					<span>父项目</span>
						<select name="parentItemCode" id="parentItemCode" class="easyui-combobox" style="width: 99px;height:25px;" onkeypress="eventOnKeyPress('itemName')">
								<%
										if (commDictPublicLevel.getParentItemCodes() != null && commDictPublicLevel.getParentItemCodes().length > 0) {
										for (int i = 0; i < commDictPublicLevel.getParentItemCodes().length; i++) {
											String tempId = commDictPublicLevel.getParentItemCodes()[i];
											String tempName = commDictPublicLevel.getParentItemNames()[i];
								%>
								<option value="<%=tempId%>" <%=tempId.equals(commDictPublicLevel.getParentItemCode()) ? "selected" : ""%>>
									<%=tempName%>
								</option>
								<%
									}
									}
								%>
						</select>
				</div>
				<div class="crm_input_item">
					<span>项目名称</span>
					<input name="itemName" class="crm_search_input_text" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('inputCode')" value="<%=commDictPublicLevel.getItemName()%>">
				</div>
				<div class="crm_input_item">
					<span>输入码</span>
					<input name="inputCode" class="crm_search_input_text" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('<bean:message key="jsp.btnsubmit" bundle="conf.Init"/>')" value="<%=commDictPublicLevel.getInputCode()%>">
				</div>
				<div class="crm_input_item">
				<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" name="btnSave"
					value="查询" onclick="submitQueryForm();" /> 
				<input type="button"
					class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
					name="<bean:message key="comm.jsp.common.commit" bundle="conf.comm.Comm"/>"
					value="新增" onclick="cmdAdd();" />
					
				</div>
				<div style="clear: both"></div>
			</div>
			<!--列表标题-->
			<div class="horizontal_line_2"></div>
			<div id="dvh1" class='crm_table_out'>
			<table style="table-layout: fixed;" class='crm_table_content'>
				
				<thead>
		 			<tr>
		  				<td style="width:16%">项目级别</td>
		  				<td style="width:16%">项目名称</td>
		  				<td style="width:16%">序号</td>
		  				<td style="width:16%">父项目名称</td>
		  				<td style="width:16%">字典类型</td>
		  				<td colspan="3" style="width:220px">操作</td>
		  			</tr>
		  		</thead>
				<tbody  id="interval_row_id">
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
							if (commDictPublicLevel.getItemCodeList() != null && commDictPublicLevel.getItemCodeList().length > 0) {
							for (int i = 0; i < commDictPublicLevel.getItemCodeList().length; i++) {
							if(i%2==0){%>
									<tr class="odd">
								<%}else{ %>
									<tr class="even">
							<%}
					%>
					
						<td>
							<%=commDictPublicLevel.getClassLevelList()[i]%>
						</td>
						<td>
							<%=commDictPublicLevel.getItemNameList()[i]%>
						</td>
						<td>
							<%=commDictPublicLevel.getSeqInLevelList()[i]%>
						</td>
						<td>
							<%=commDictPublicLevel.getParentItemNameList()[i]%>
						</td>
						<td> 
							<%=commDictPublicLevel.getTableNameList()[i]%>
						</td>
						
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"  onclick="cmdView('<%=commDictPublicLevel.getItemCodeList()[i]%>')"/></td>
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改"  onclick="cmdEdit('<%=commDictPublicLevel.getItemCodeList()[i]%>')"/></td>
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"  onclick="cmdDel('<%=commDictPublicLevel.getItemCodeList()[i]%>')"/></td>
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
			
			
		</form>
		<script language="javascript" src="include/javascript/interval_row_color.js"></script>
	</body>
</html>
