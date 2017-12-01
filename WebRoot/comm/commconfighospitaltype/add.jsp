<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommConfigHospitalTypeForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title><bean:message key="comm.jsp.common.text44" bundle="conf.comm.comm"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		
		<script language="javascript" src="<bean:message key="include.js.TJMessage.path" bundle="conf.comm.comm"/>"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.CommMessage.path" bundle="conf.comm.comm"/>"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript">
			function saveForm(){
				if(document.form.seqNo.value == ""){
					$.messager.alert('提示',"序号不能为空！");
					return ;
				}
				
				if(!Validator.Validate(document.forms.form,3)){
		         return ;
		         }
				if(isNaN(document.form.seqNo.value)){
					$.messager.alert('提示','<bean:message key="comm.jsp.common.text49" bundle="conf.comm.comm"/>'); 
					return;
				}
				if(isNaN(document.form.principal_phone.value)){
					$.messager.alert('提示','<bean:message key="comm.jsp.common.text49" bundle="conf.comm.comm"/>');
					return true;
					    }
				if(document.form.itemCode.value == ""){
					$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn" bundle="security"/>');
				 	return ;
				}
				if(isNaN(document.form.itemCode.value)){
					$.messager.alert('提示','<bean:message key="comm.jsp.commconfigtrue.add.sc" bundle="conf.comm.CommMessageguoh"/>');
					return ; 
				}
				if(document.form.itemName.value == ""){
					$.messager.alert('提示','<bean:message key="security.jsp.securityConfigParamClass1.update.warn1" bundle="security"/>');
				 	return ;
				}
				     
				    //document.form.idHidden.value = id;  
				    document.form.verbId.value = "add";    
				    document.form.submit(); 
				       
				}
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
			
			
			function setLevel2(url){
				var levelCode_1 = document.getElementById("levelCode_1").value;
				var xmlHttp = newXMLHttpRequest();
				var sendTo = url + "?verbId=setLevel2&levelCode1=" + levelCode_1;
				//$.messager.alert('提示',sendTo);
				xmlHttp.open("GET", sendTo, true);
				var handlerFunction = getReadyStateHandler(xmlHttp, updateLevel2);
				xmlHttp.onreadystatechange = handlerFunction;
				xmlHttp.send(null);
			}
			function updateLevel2(level2XML) {
				//$.messager.alert('提示',);
			   	var level2 = document.getElementById("levelCode_2");
			    while (level2.options.length) {
			        level2.remove(0);
			    }
			   	var indexObj = level2XML.getElementsByTagName("index")[0];
				var index = indexObj.childNodes[0].nodeValue;
				for (var i = 0; i < index; i++) {
					var keyObj = level2XML.getElementsByTagName("key")[i];
					var valueObj = level2XML.getElementsByTagName("value")[i];
					var newElem = document.createElement("option");
					if(valueObj.childNodes[0] == null){
						newElem.text = "" ;
					} else {
						newElem.text = valueObj.childNodes[0].nodeValue ;
					}
					if(keyObj.childNodes[0] == null){
						newElem.value = "" ;
					} else {
						newElem.value = keyObj.childNodes[0].nodeValue ;
					}
					level2.add(newElem);
				}
			}
			function showHspMessage(message){
						if(message != ''&& message != null){
							$.messager.alert('提示',message);
							return;
						}
					}
		</script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
		<style type="text/css">
		.redlable {
			color: #FF0000;
			font-size: 16px;
		}
	
		.crm_button_sub {
			margin-top: 10px;
			margin-left: 40%;
		}
		
		.crm_textarea_style {
			width: 87%;
			height: 80px;
			border: 1px #E0E0E0 solid;
			overflow-y: hidden;
		}
		</style>
		</head>
	
	<body onload="showHspMessage('<%=data.getMessage() %>')">
		<form name="form" method="post" action="comm/commConfigHospitalType.do">
			<input type="hidden" name="verbId" value="add" />
			<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="seqNo" id="principal_phone" maxlength="11"  class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"  onkeypress="eventOnKeyPress('levelCode_1')" max="11" dataType="LimitB" msg="序号输入过长" value="<%=data.getSeqNo() %>" />
						</td>
						<td class='crm_edit_item_name'>大类</td>
						<td class='crm_edit_item_content'>
							<select name="levelCode_1" id="levelCode_1"  class="easyui-combobox" editable="false" style="width: 206px;height:30px;"
							data-options="	valueField: 'id',
											textField: 'text',    
									        url: 'get_data1.php',    
									        onSelect: function(rec){    
									            var url = 'comm/commConfigHospitalType.do?verbId=setLevel2&levelCode1='+rec.id;  
									            $('#levelCode_2').combobox('clear');     
									            $('#levelCode_2').combobox('reload', url);    
									        }"   
							onkeypress="eventOnKeyPress('levelCode_2')">
							<%
							if (data.getLevelCode_1List() != null && data.getLevelCode_1List().length > 0) {
								for (int i = 0; i < data.getLevelCode_1List().length; i++) {
									String tempId = data.getLevelCode_1List()[i];
									String tempName = data.getLevelName_1List()[i];
									%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data.getLevelCode_1()) ? "selected": ""%>>
								<%=tempName%>
							</option>
							<%
								}
							}
							%>
							</select>
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>中类</td>
						<td class='crm_edit_item_content'>
							<select name="levelCode_2" id="levelCode_2"  class="easyui-combobox" editable="false" style="width: 206px;height:30px;"
							onkeypress="eventOnKeyPress('itemCode')"   data-options="valueField:'itemCode',textField:'itemName'">
							</select>
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
						<td class='crm_edit_item_content'>
							<input type="text"  class="text" name="itemCode"
							id="itemCode" maxlength="8" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('itemName')" max="32" dataType="LimitB"
							msg="代码输入过长" value="<%=data.getItemCode() %>" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="itemName" id="itemName"  class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							maxlength="50" onkeypress="eventOnKeyPress('comments')" max="100"
							dataType="LimitB" msg="名称输入过长" value="<%=data.getItemName() %>" />
						</td>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="comments" id="comments"  class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							maxlength="50" onkeypress="eventOnKeyPress('btnSaveForm')" max="40"
							dataType="LimitB" msg="备注输入过长" value="<%=data.getComments() %>" />
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
							<div style="height:20px;"></div>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
				<input type="button" name="btnSaveForm" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
						</td>
					</tr>
				</table>
			</div>
			<!-- Sheet operation button area -->
<!--			<div class='crm_button_sub'>-->
<!--				<input type="button" name="btnSaveForm" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>-->
<!--				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>-->
<!--	  		</div>-->
		</form>
	</body>
</html>
