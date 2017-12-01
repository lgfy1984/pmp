<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="commDictPublicClass" scope="request" type="com.tianjian.comm.struts.form.CommDictPublicClassForm" />
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
		<title><bean:message key="Comm.jsp.commom.dictTypeInfoMaintain" bundle="conf.comm.CommMessage" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="include/javascript/examQueryArgsInputs.js" ></script>
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
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
		    document.form.classCodeHidden.value = id;  
		    document.form.verbId.value = "detail";    
		    document.form.submit();
		}
		
		//修改
		function cmdEdit(id) {
		    document.form.classCodeHidden.value = id;  
		    document.form.verbId.value = "updateInit";    
		    document.form.submit();     
		}
		
		//删除
		function cmdDel(id) {
				$.messager.defaults = { ok: "是", cancel: "否" };
				$.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
	    		if (r){  
				    document.form.classCodeHidden.value = id;  
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
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
	</head>
	<body onload="showHspMessage('<%=commDictPublicClass.getMessage()%>')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="comm/commDictPublicClass.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=commDictPublicClass.getVerbId()%>">
			<input type="hidden" name="orderNo" value="<%=commDictPublicClass.getOrderNo()%>">
			<input type="hidden" name="asc" value="<%=commDictPublicClass.getAsc()%>">
			<input type="hidden" name="classCodeHidden" value="<%=commDictPublicClass.getClassCodeHidden()%>">
			<!--查询条件-->
			<!-- <table border="0" cellpadding="0" cellspacing="0" class="tblSearch" align="center">
				<tr>
				   <td class="tblTitle" colspan="4">
				  	 	<bean:message key="Comm.jsp.commom.dictType" bundle="conf.comm.CommMessage"/>
				   </td>
				</tr>
				<tr>
					<td>
						<bean:message key="Comm.jsp.commom.typeCode" bundle="conf.comm.CommMessage"/>:
						<input name="classCode" type="text" onkeypress="eventOnKeyPress('className')" value="<%=commDictPublicClass.getClassCode()%>">
			
						<bean:message key="Comm.jsp.commom.typeName" bundle="conf.comm.CommMessage"/>:
						<input name="className" type="text" onkeypress="eventOnKeyPress('inputCode')" value="<%=commDictPublicClass.getClassName()%>">
			
						<bean:message key="jsp.inputNo" bundle="conf.Init"/>:
						<input name="inputCode" type="text" onkeypress="eventOnKeyPress('<bean:message key="jsp.btnsubmit" bundle="conf.Init"/>')" value="<%=commDictPublicClass.getInputCode()%>">
				
						<input type="button"  class="btnSave"  name="<bean:message key="jsp.btnsubmit" bundle="conf.Init"/>" value="<bean:message key="jsp.btnsubmit" bundle="conf.Init"/>" onClick="submitQueryForm();" />
					</td>
				</tr>
			</table> -->
			<div class='crm_search_div' style='overflow: hidden'>
				<div class="crm_input_item">
					<span>类别代码</span> 
					<input class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						name="classCode" type="text" onkeypress="eventOnKeyPress('className')" value="<%=commDictPublicClass.getClassCode()%>" />
				</div>
				<div class="crm_input_item">
					<span>类别名称</span> 
					<input class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						name="className" type="text" onkeypress="eventOnKeyPress('inputCode')" value="<%=commDictPublicClass.getClassName()%>" />
				</div>
				<div class="crm_input_item">
					<span>输入码</span> 
					<input class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						name="inputCode" type="text" onkeypress="eventOnKeyPress('<bean:message key="jsp.btnsubmit" bundle="conf.Init"/>')" value="<%=commDictPublicClass.getInputCode()%>" />
				</div>
				<div class="crm_input_item">
				<input type="button" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" name="btnSave"
					value="查询" onclick="submitQueryForm();" /> 
				<input type="button"
					class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
					name="<bean:message key="comm.jsp.common.commit" bundle="conf.comm.Comm"/>"
					value="新增" onclick="cmdAdd();" />
				</div>
			</div>
			
			<!--列表标题-->
			<div class="horizontal_line_2"></div>
			<div id="dvh1" class='crm_table_out'>
			<table style="table-layout: fixed;" class='crm_table_content'>
				<!-- <caption style="text-align:left;">
					<img src="<%=request.getContextPath()%>/comm/include/images/comm_list_nav_red.jpg" width="20" height="20" align="absmiddle" /> <span style="font-weight:bold; color:#333;"><bean:message key="jsp.resultlist" bundle="conf.Init"/></span>
					<span class="titleBtn"><img  src="<bean:message key="security.jsp.securityconfigpublicclass.add" bundle="conf.security.security"/>"  align="absmiddle" />
						<a href="javascript:cmdAdd()" target="_self"><bean:message key="security.jsp.commom.button3" bundle="security"/></a></span>
			    </caption>
				<thead>
			    	<tr class="lstName">
			            <th width="15%" height="26"><bean:message key="Comm.jsp.commom.typeCode" bundle="conf.comm.CommMessage"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('1', '0')" /><img border="0" onclick="commandOrderBy('1', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="15%" height="26"><bean:message key="Comm.jsp.commom.typeName" bundle="conf.comm.CommMessage"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('2', '0')" /><img border="0" onclick="commandOrderBy('2', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="5%" height="26"><bean:message key="jsp.seqNo" bundle="conf.Init"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('3', '0')" /><img border="0" onclick="commandOrderBy('3', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="4%" height="26"><bean:message key="jsp.inputNo" bundle="conf.Init"/><div><img src="include/images/cmdOrderByAsc.gif" alt="Ascender" vspace="7" onclick="commandOrderBy('4', '0')" /><img border="0" onclick="commandOrderBy('4', '1')" alt="Descender" src="include/images/cmdOrderByDesc.gif" /></div></th>
			            <th width="3%" height="26"><bean:message key="jsp.view" bundle="conf.Init" /></th>
			            <th width="3%" height="26"><bean:message key="jsp.update" bundle="conf.Init" /></th>
			            <th width="3%" height="26"><bean:message key="jsp.delete" bundle="conf.Init" /></th>
			        </tr>
				</thead> -->
				<thead>
		 			<tr>
		  				<td style="width:20%">类别代码</td>
		  				<td style="width:20%">类别名称</td>
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
						if (commDictPublicClass.getClassCodeList() != null && commDictPublicClass.getClassCodeList().length > 0) {
							for (int i = 0; i < commDictPublicClass.getClassCodeList().length; i++) {
							if(i%2==0){%>
									<tr class="odd">
								<%}else{ %>
									<tr class="even">
							<%}
					%>
					
						<td>
							<%=commDictPublicClass.getClassCodeList()[i]%>
						</td >
						<td>
							<%=commDictPublicClass.getClassNameList()[i]%>
						</td>
						<td>
							<%=commDictPublicClass.getSeqNoList()[i]%>
						</td>
						<td>
							<%=commDictPublicClass.getInputCodeList()[i]%>
						</td>
						<!-- <td>
							<img onClick="cmdView('<%=commDictPublicClass.getClassCodeList()[i]%>')" alt="<bean:message key="jsp.detail" bundle="conf.Init" />" src="include/images/cmdView_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
						<td>
							<img onClick="cmdEdit('<%=commDictPublicClass.getClassCodeList()[i]%>')" alt="<bean:message key="jsp.update" bundle="conf.Init" />" src="include/images/cmdEdit_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td>
						<td>
							<img onClick="cmdDel('<%=commDictPublicClass.getClassCodeList()[i]%>')" alt="<bean:message key="jsp.delete" bundle="conf.Init" />" src="include/images/cmdDel_s.jpg" border="0" style="cursor: hand; vertical-align: middle;" />
						</td> -->
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"  onclick="cmdView('<%=commDictPublicClass.getClassCodeList()[i]%>')"/></td>
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="修改"  onclick="cmdEdit('<%=commDictPublicClass.getClassCodeList()[i]%>')"/></td>
						<td style="cursor:pointer;"><input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"  onclick="cmdDel('<%=commDictPublicClass.getClassCodeList()[i]%>')"/></td>
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
