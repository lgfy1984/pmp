<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.tianjian.util.comm.PageBean"%>
<jsp:useBean id="data" scope="request" class="com.tianjian.security.struts.form.SecurityConfigParameterForm" />
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base
			href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
		<%} else {%>
		<base
			href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
		<%}%>
		<title><bean:message key="security.jsp.securityConfigParamClass1.list.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.CommMessage.path" bundle="security" />"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="security/include/javascript/gettext_parameter.js"></script>
		
		<script language="javascript" src="include/javascript/validator.js" defer="defer"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/open.css" />
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
 		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script language="javascript">
			function submitQueryForm() { 
			 if(!Validator.Validate(document.forms.form,1)){
			 	return false;
			 }
   			  
			  document.form.page.value = 1; 
			  document.form.orderNo.value = ""; 
			  document.form.asc.value = ""; 
			  document.form.method = "POST";
			  document.form.verbId.value = "query";
			  document.form.submit();
			}
			
			function submitInit() {
				document.form.verbId.value = "refreshInit";
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
			function cmdAdd1() {
			    document.form.verbId.value = "addInit";    
			    document.form.submit();
			}
			//查看详细
			function cmdView(id) {
			    document.form.hiddenId.value = id;  
			    document.form.verbId.value = "detail";    
			    document.form.submit();
			}
			
			//修改
			function cmdEdit(id) {
			    document.form.hiddenId.value = id;  
			    document.form.verbId.value = "updateInit";    
			    document.form.submit();     
			}
	
			//删除
			function cmdDel(id) {     
				$.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
    				if (r){     
				    	document.form.hiddenId.value = id;
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
			function showMessage(message){
					if(message != ''&& message != null){
						$.messager.alert('提示',message);
						return;
					}
				}
			/**
			* 增加行
			*/
			
			function addRow(){
			  var index = document.getElementById("interval_row_id").getElementsByTagName("TR").length;
			  var tableObj = document.getElementById("table1");
			  var item=      "<tr>"+
			                        
									"<td >"+
										"<span>*</span><input type=\"text\"  class=\"crm_search_input_text\"  id=\"displayInputId_"+index+"\" name=\"list["+index+"].className\"  value=\"\" readonly=\"readonly\" />"+
										"<input type=\"hidden\" id=\"hiddenInputId_"+index+"\" value=\"\" name=\"list["+index+"].classCode\" />"+
										"<img src=\"security/include/images/select.gif\" style=\"cursor: pointer;position:relative;\" onclick=\"add('<%=request.getContextPath()%>/security/securityConfigParameter.do?verbId=system','displayInputId_"+index+"','hiddenInputId_"+index+"')\" />"+
									"</td>"+
									"<td>"+
										"<span>*</span><input type=\"text\" class=\"crm_search_input_text\" onblur=\"fEvent('blur',this)\" onmouseover=\"fEvent('mouseover',this)\" "+
															"onfocus=\"fEvent('focus',this)\" onmouseout=\"fEvent('mouseout',this)\" name=\"list["+index+"].itemName\" id=\"list["+index+"].itemName\"  value=\"\" />"+
									"</td>"+
									"<td>"+
										"<span>*</span><input type=\"text\" class=\"crm_search_input_text\" onblur=\"fEvent('blur',this)\" onmouseover=\"fEvent('mouseover',this)\" "+
															"onfocus=\"fEvent('focus',this)\" onmouseout=\"fEvent('mouseout',this)\" name=\"list["+index+"].itemValue\" id=\"list["+index+"].itemValue\"   value=\"\" />"+
									"</td>"+
									"<td>"+
										"<input type=\"text\"  class=\"crm_search_input_text\" onblur=\"fEvent('blur',this)\" onmouseover=\"fEvent('mouseover',this)\" "+
															"onfocus=\"fEvent('focus',this)\" onmouseout=\"fEvent('mouseout',this)\" name=\"list["+index+"].initValue\" id=\"list["+index+"].initValue\"   value=\"\" />"+
									"</td>"+
									"<td>"+
										"<span>*</span><input type=\"text\" class=\"crm_search_input_text\" style=\"width: 250px;\" onblur=\"fEvent('blur',this)\" onmouseover=\"fEvent('mouseover',this)\" "+
															"onfocus=\"fEvent('focus',this)\" onmouseout=\"fEvent('mouseout',this)\" name=\"list["+index+"].usageDescription\" style=\"width:95%\" id=\"list["+index+"].usageDescription\"   value=\"\"  />"+
										"<input type=\"hidden\" name=\"list["+index+"].id\" id=\"list["+index+"]id\" style=\"width: 280px\"  value=\"\" />"+
									"</td>"+
									"<td style=\"cursor: pointer;\">"+
									"<input type=\"button\" class=\"button_grey2_s0\" onmousedown=\"this.className='button_grey2_s1'\" onmouseout=\"this.className='button_grey2_s0'\" value=\"删除\" onClick=\"deleRow(this)\" /> "+
									"</td>"+
			                 "</tr>";

			 InsertRow(tableObj,item);
			 //index ++;
			}
			function InsertRow(table,rowHtml)
			{ 
			    var o=document.createElement("div"),ol;
			    o.innerHTML="<table>"+rowHtml+"</table>" 
			    ol=o.childNodes[0].tBodies[0].rows 
			    while(ol.length>0){ 
			        table.tBodies[0].appendChild(ol[0]) 
			    } 
			    return;
			}
 			 function deleRow(obj){
				   var index = obj.parentNode.parentNode.rowIndex;
				   var tableObj = document.getElementById("table1");
				   tableObj.deleteRow(index);
				}
				
			//添加
			function cmdAdd() {
				 var index = document.getElementById("interval_row_id").getElementsByTagName("TR").length;
				for(var i = 0;i < index; i++){
					var displayInputId = document.getElementById("displayInputId_"+i).value;
					if(displayInputId == ""){
						$.messager.alert('提示',"请选择程序包名称！");
						return false;
					}
					var itemName = document.getElementById("list["+ i +"].itemName").value;
					if(itemName == ""){
						$.messager.alert('提示',"请填写配置参数名称！");
						return false;
					}
					var itemValue = document.getElementById("list["+i+"].itemValue").value;
					if(itemValue == ""){
						$.messager.alert('提示',"请填写配置参数值！");
						return false;
					}
				}
			   	if (confirmMessage("你确定要保存该条记录？")){     
				    document.form.verbId.value = "addList";    
			    	document.form.submit();
			    }   
			}
</script>
	</head>
	<body onload="showMessage('<%=data.getMessage() %>')">
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" 
			action="<%=request.getContextPath()%>/security/securityConfigParameter.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=data.getVerbId()%>" />
			<input type="hidden" name="orderNo" value="<%=data.getOrderNo()%>" />
			<input type="hidden" name="asc" value="<%=data.getAsc()%>" />
			<input type="hidden" id="hiddenId" name="hiddenId" value="<%=data.getId()%>" />
			<!--查询条件-->
			<div class='crm_content_div'>
				<div class='crm_search_div'>
					<div class="crm_input_item">
						<!-- <span>*</span>工程名称:
						<input type="text" class="input" id="displayInputId_p1" 
							name="projectName"
							value="${data.projectName}" readonly="readonly" 
							onkeypress="eventOnKeyPress('className')"
							dataType="Require" msg="请选择一个工程!"
							 />
						<input type="hidden" id="hiddenInputId_p1"
							 name="projectCode" />
						<img src="security/include/images/select.gif"
							style="cursor: pointer;"
							onclick="add('<%=request.getContextPath()%>/security/securityConfigParamProject.do?verbId=getProject','displayInputId_p1','hiddenInputId_p1')" />
						 -->
						
						<span><bean:message key="security.jsp.securityConfigParamClass1.commom2" bundle="security"/>:</span>
								<input class="crm_search_input_text" type="text" id="displayInputId_c1" name="className"  value="${data.className}" onkeypress="eventOnKeyPress('itemName')" readonly="readonly" disabled="disabled"/>
								<input type="hidden" id="hiddenInputId_c1" name="classCode"  value=""  />
								<img src="security/include/images/select.gif" style="cursor: pointer;" 
								onclick="add('<%=request.getContextPath()%>/security/securityConfigParameter.do?verbId=system','displayInputId_c1','hiddenInputId_c1')"  />
						</div>
						
						<div class="crm_input_item">
						<span><bean:message key="security.jsp.securityConfigParamClass1.commom7" bundle="security"/>:</span>
						<input name="itemName" class="crm_search_input_text" type="text"  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" onkeypress="eventOnKeyPress('btnsubmit')" value="${data.itemName}" />
						</div>
						<div class="crm_input_item" >
							<input type="button" value="查询" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="submitQueryForm()" />
							<!--  <input type="button" value="刷新" class="query_button_s1"
							onclick="submitInit()" />-->
							<input type="button" value="新增" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="addRow()" />
							<!-- <button class="button_green1_s1" onclick="javascript:fileSelect()">导入excel</button> -->
							<input type="button" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="cmdAdd()" />
						</div>
					<div style="clear: both"></div>
				</div>
				<!--  <div class='crm_table_out'>
				<table class='crm_table_content'>
					<tr >
						<td style="text-align: right;margin-right: 20px;" >
							<input type="button" value="添加" class="button button_green1_s1"
							onclick="addRow()" />
							 <button class="button_green1_s1" onclick="javascript:fileSelect()">导入excel</button>
							<input type="button" value="保存" class="button button_green1_s1"
							onclick="cmdAdd()" />
						</td>
					</tr>
				</table>
				</div>-->
				  <div class="horizontal_line_2"></div>
				<!--列表标题-->
				<div class='crm_table_out'>
					<table class='crm_table_content' id="table1">
					<thead>
				    	<tr >
								<td>
									程序包名称
								</td>
								<td>
									配置参数名称
								</td>
								<td>
									配置参数值
								</td>
								<td>
									初始值
								</td>
								<td>
									用法
								</td>
								
								<td colspan="2" style="width:10%">
									操作
								</td>
				        </tr>
					</thead>
					<tbody id="interval_row_id">
					    <c:if test="${pb.count<=0}">
						<tr>
							<td colspan="6">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
						<%if (data.getIdList() != null&& data.getIdList().length > 0) {
							for (int i = 0; i < data.getIdList().length; i++) {
						%>
						<tr >
							<td >
								<span>*</span><input  class="crm_search_input_text" type="text" id="displayInputId_<%=i%>" name="list[<%=i%>].className"  value="<%=data.getClassNameList()[i]%>" readonly="readonly" disabled="disabled"/>
								<input type="hidden" id="hiddenInputId_<%=i%>" name="list[<%=i%>].classCode"  value="<%=data.getClassCodeList()[i] %>"  />
								<img src="security/include/images/select.gif" style="cursor: pointer;position:relative;" 
								onclick="add('<%=request.getContextPath()%>/security/securityConfigParameter.do?verbId=system','displayInputId_<%=i%>','hiddenInputId_<%=i%>')"  />
							</td>
							<td>
								<input type="hidden" name="list[<%=i%>].id" id="list[<%=i %>].id"   value="<%=data.getIdList()[i]%>" />
								<span>*</span><input type="text" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" name="list[<%=i %>].itemName" id="list[<%=i %>].itemName"   value="<%=data.getItemNameList()[i]%>" />
							</td>
							<td>
								<span>*</span><input type="text" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" name="list[<%=i %>].itemValue" id="list[<%=i %>].itemValue"   value="<%=data.getItemValueList()[i]%>" />
							</td>
							<td>
								<input type="text" class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" name="list[<%=i%>].initValue" id="list[<%=i %>].initValue"   value="<%=data.getInitValueList()[i]%>" />
							</td>
							<td>
								<span>*</span><input class="crm_search_input_text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" style="width: 250px;" type="text"  name="list[<%=i%>].usageDescription" id="list[<%=i%>].usageDescription"  value="<%=data.getUsageDescriptionList()[i]%>" />
								
							</td>
							<td style="cursor: pointer;">
									<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="删除"
										onclick="cmdDel('<%=data.getIdList()[i] %>')" />
							</td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
					<tfoot <c:if test="${pb.count<=0}">style="display:none"</c:if>>
			  <tr>
			  <td colspan="6">
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
	<script language="javascript" src="include/javascript/interval_row_color.js"></script>
</html>
