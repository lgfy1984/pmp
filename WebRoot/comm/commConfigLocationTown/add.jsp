<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommConfigLocationTownForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if (request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title><bean:message key="comm.jsp.common.addVillageMessage" bundle="conf.comm.Comm"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<script language="javascript" src="<bean:message key="comm.js.comm.message" bundle="conf.comm.Comm"/>"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
		<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript">
		function trim(str){  //删除左右两端的空格
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
		
		function yznumber(id,itermname,integer,decimal){
		var inputvalue= (document.getElementById(id)).value;
		if(inputvalue != ""){
			var reg = /^[0-9]+(\.[0-9]+)?$/;
			if(reg.test(inputvalue)){
				if(inputvalue.indexOf(".")!=-1){
					array = inputvalue.split(".");
					arg1 = array[0];
					arg2 = array[1];										
					if(arg1.length > integer){
						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="comm.jsp.common.warm2" bundle="conf.comm.Comm"/>！"+integer+<bean:message key="comm.jsp.common.weishu" bundle="conf.comm.Comm"/>);

						return false;
					}
					if(arg2.length > decimal){

						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="comm.jsp.common.warm1" bundle="conf.comm.Comm"/>！"+decimal+<bean:message key="comm.jsp.common.weishu" bundle="conf.comm.Comm"/>);

						return false;
					}				
				}else{
					if(inputvalue.length > integer){

						$.messager.alert('提示',"\""+itermname+"\""+"<bean:message key="comm.jsp.common.warm3" bundle="conf.comm.Comm"/>！"+integer+<bean:message key="comm.jsp.common.weishu" bundle="conf.comm.Comm"/>);						

						return false;
					}
				}			
			}else{
				$.messager.alert('提示',"\""+itermname+"\"<bean:message key="comm.jsp.common.musthavenumber" bundle="conf.comm.Comm"/>！");
				return false;
				}
			}		
		}
			function saveForm(){
			    if(!Validator.Validate(document.forms.form,3)){
				      return ;
				   }
				if($('#commConfigLocationId1').combobox('getValue')== ""){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.selectProvince" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				if($('#commConfigLocationId2').combobox('getValue')== ""){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.selectCity" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				if($('#commConfigLocationId3').combobox('getValue')== ""){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.selectTown" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				if(document.form.seqNo.value == ""){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.alert11" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				if(isNaN(document.form.seqNo.value)){
			       $.messager.alert('提示',"<bean:message key="comm.jsp.common.alert1" bundle="conf.comm.Comm"/>"); 
			       return true;
			    }
			    if(document.form.itemCode.value == ""){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.alert13" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				if(isNaN(document.form.itemCode.value)){
			       $.messager.alert('提示',"<bean:message key="comm.jsp.common.alert16" bundle="conf.comm.Comm"/>"); 
			       return true;
			    }
			    if(document.form.itemCode.value.length !=8){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.alert15" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				if(document.form.itemName.value == ""){
				 	$.messager.alert('提示',"<bean:message key="comm.jsp.common.selectVillageName" bundle="conf.comm.Comm"/>");
				 	return ;
				}
				 
				     
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
			function setCity(url){
				var province = document.getElementById("commConfigLocationId1").value;
				var xmlHttp = newXMLHttpRequest();
				var sendTo = url + "?verbId=setCity&province=" + province;
				xmlHttp.open("GET", sendTo, true);
				var handlerFunction = getReadyStateHandler(xmlHttp, updateCity);
				xmlHttp.onreadystatechange = handlerFunction;
				xmlHttp.send(null);
			}
			function updateCity(cityXML) {
				var city = document.getElementById("commConfigLocationId2");
			    while (city.options.length) {
			        city.remove(0);
			    }
			    
			    var country = document.getElementById("commConfigLocationId3");
			    while (country.options.length) {
			        country.remove(0);
			    }
			    
				var indexObj = cityXML.getElementsByTagName("index")[0];
				var index = indexObj.childNodes[0].nodeValue;
				for (var i = 0; i < index; i++) {
					var keyObj = cityXML.getElementsByTagName("key")[i];
					var valueObj = cityXML.getElementsByTagName("value")[i];
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
					city.add(newElem);
				}
			}
			function setCounty(url){
				var city = document.getElementById("commConfigLocationId2").value;
				var xmlHttp = newXMLHttpRequest();
				var sendTo = url + "?verbId=setCounty&city=" + city;
				xmlHttp.open("GET", sendTo, true);
				var handlerFunction = getReadyStateHandler(xmlHttp, updateCounty);
				xmlHttp.onreadystatechange = handlerFunction;
				xmlHttp.send(null);
			}
			function updateCounty(countyXML) {
				var county = document.getElementById("commConfigLocationId3");
				while (county.options.length) {
			        county.remove(0);
			    }
			    
				var indexObj = countyXML.getElementsByTagName("index")[0];
				var index = indexObj.childNodes[0].nodeValue;
				for (var i = 0; i < index; i++) {
					var keyObj = countyXML.getElementsByTagName("key")[i];
					var valueObj = countyXML.getElementsByTagName("value")[i];
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
					county.add(newElem);
				}
			}
			function updateItemCode(countyXML){
				//$.messager.alert('提示',"countyXML" + countyXML);
				var code=countyXML.getElementsByTagName("country")[0].childNodes[0].nodeValue;
				var itemCode=countyXML.getElementsByTagName("itemCode")[0].childNodes[0].nodeValue;
				//$.messager.alert('提示',"code" + code + "itemCode" + itemCode);
				//document.getElementById("sasa").innerHTML = code;
				//document.all('cmi').value=cmi;
				document.form.itemCode.value = itemCode;
			}
			function setItemCode(){
				var country=document.getElementById("commConfigLocationId3").value;
				//$.messager.alert('提示',"country" + country);
				var xmlHttp = newXMLHttpRequest();
				var url = "<%=request.getContextPath()%>/comm/commConfigLocationTown.do?verbId=setItemCode&country="+country;
				xmlHttp.open("GET", url, true);
				var handlerFunction = getReadyStateHandler(xmlHttp, updateItemCode);
				xmlHttp.onreadystatechange = handlerFunction;
				xmlHttp.send(null);
			}
		</script>
		<%--<link rel="stylesheet" rev="stylesheet" href="comm/include/css/comm_add.css" />--%>
    <link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
<style type="text/css">
.redlable{
	color:#FF0000;
	font-size:16px;
}
.crm_button_sub{
	margin-top: 10px;
	margin-left: 40%;
}
.crm_textarea_style{
	width:87%;
	height:80px;
	border:1px #E0E0E0 solid;
	overflow-y:hidden;
}
</style>
	</head>
	
	<body onload="showCommMessage('','<%=data.getMessage()%>','1');document.form.commConfigLocationId1.focus();">
		<form name="form" method="post" action="comm/commConfigLocationTown.do">
			<input type="hidden" name="verbId" value="add" />
			<input type="hidden" name="id" value="<%=data.getId()%>" />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>所属省</td>
      	  		<td class='crm_edit_item_content'>
      	  			<select class="easyui-combobox" editable="false" name="commConfigLocationId1"
      	  					id="commConfigLocationId1" style="width: 206px;height:30px;"
							onkeypress="eventOnKeyPress('commConfigLocationId2')" data-options="    
        valueField: 'id',    
        textField: 'text',    
        url: 'get_data1.php',    
        onSelect: function(rec){    
            var url = 'comm/commConfigLocationGroup.do?verbId=setCity&province='+rec.id;  
            $('#commConfigLocationId2').combobox('clear');     
            $('#commConfigLocationId2').combobox('reload', url);    
        }"   
							 >
							<%
								if (data.getCommConfigLocationIds1() != null && data.getCommConfigLocationIds1().length > 0) {
									for (int i = 0; i < data.getCommConfigLocationIds1().length; i++) {
										String tempId = data.getCommConfigLocationIds1()[i];
										String tempName = data.getCommConfigLocationNames1()[i];
							%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data
											.getCommConfigLocationId1()) ? "selected"
									: ""%>>
								<%=tempName%>
							</option>
							<%
									}
								}
							%>
						</select>
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>所属市</td>
      	  		<td class='crm_edit_item_content'>
      	  			<select class="easyui-combobox" editable="false" name="commConfigLocationId2"
							id="commConfigLocationId2" style="width: 206px;height:30px;"
							onkeypress="eventOnKeyPress('commConfigLocationId3')" data-options="valueField:'id',textField:'itemName', url: 'get_data2.php',    
        onSelect: function(rec){    
            var url = 'comm/commConfigLocationGroup.do?verbId=setCounty&city='+rec.id;  
            $('#commConfigLocationId3').combobox('clear');     
            $('#commConfigLocationId3').combobox('reload', url);    
        }"
							 >
							<%
								if (data.getCommConfigLocationIds2() != null && data.getCommConfigLocationIds2().length > 0) {
									for (int i = 0; i < data.getCommConfigLocationIds2().length; i++) {
										String tempId = data.getCommConfigLocationIds2()[i];
										String tempName = data.getCommConfigLocationNames2()[i];
							%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data
											.getCommConfigLocationId2()) ? "selected"
									: ""%>>
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
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>所属县</td>
      	  		<td class='crm_edit_item_content'>
      	  			<select class="easyui-combobox" editable="false" name="commConfigLocationId3"
							id="commConfigLocationId3" style="width: 206px;height:30px;"
							onkeypress="eventOnKeyPress('seqNo')" data-options="valueField:'id',textField:'itemName',url: 'get_data3.php',    
        onSelect:function(){
        	setItemCode();
        }">
							<%
								if (data.getCommConfigLocationIds3() != null && data.getCommConfigLocationIds3().length > 0) {
									for (int i = 0; i < data.getCommConfigLocationIds3().length; i++) {
										String tempId = data.getCommConfigLocationIds3()[i];
										String tempName = data.getCommConfigLocationNames3()[i];
							%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data
											.getCommConfigLocationId3()) ? "selected"
									: ""%>>
								<%=tempName%>
							</option>
							<%
									}
								}
							%>
						</select>
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" class="kuandu" name="seqNo"  id="seqNo" size="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							maxlength="9" onkeypress="eventOnKeyPress('itemCode')"  max="11" dataType="LimitB" msg="序号输入过长"
							value="<%=data.getSeqNo()%>"/>
      	  		</td>     	  	
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" class="kuandu" name="itemCode" id="itemCode" size="20" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							maxlength="32" onkeypress="eventOnKeyPress('itemName')"  max="40" dataType="LimitB" msg="代码输入过长"
							value="<%=data.getItemCode()%>"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input class="text" type="text" class="kuandu" name="itemName" size="20" maxlength="9" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							onkeypress="eventOnKeyPress('comments')"  max="100" dataType="LimitB" msg="名称输入过长"
							value="<%=data.getItemName()%>" />
      	  		</td>     	  	
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content' colspan="3">
      	  			<input class="text" type="text" class="kuandu" name="comments" id="comments" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							size="20" maxlength="20" value="<%=data.getComments()%>"  max="40" dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('btnSaveForm')"/> 
      	  		</td>
      	  	</tr>     	  	
      	  </table>
      </div>
      <br/>
      <div class='crm_button_sub'>
		<input type="button" name="btnSaveForm" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();"/>
		<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  </div>
	 <!--zyc--add--e-->			
			
			
			<%--<table border="0" cellspacing="1" cellpadding="0" class="table" align="center">
				<tr>
					<td height="30px" class="biaoti" colspan="4">
						<font color="red">※</font>&nbsp;&nbsp;<bean:message key="comm.jsp.common.addVillage" bundle="conf.comm.Comm"/>&nbsp;&nbsp;
						<font color="red">※</font>
					</td>
				</tr>				
				<tr>
					<td class="qian">
						<font color="red">*</font><bean:message key="comm.jsp.common.province" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<select  name="commConfigLocationId1"
							id="commConfigLocationId1"
							onkeypress="eventOnKeyPress('commConfigLocationId2')" onchange="setCity('comm/commConfigLocationTown.do')">
							<%
								if (data.getCommConfigLocationIds1() != null && data.getCommConfigLocationIds1().length > 0) {
									for (int i = 0; i < data.getCommConfigLocationIds1().length; i++) {
										String tempId = data.getCommConfigLocationIds1()[i];
										String tempName = data.getCommConfigLocationNames1()[i];
							%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data
											.getCommConfigLocationId1()) ? "selected"
									: ""%>>
								<%=tempName%>
							</option>
							<%
									}
								}
							%>
						</select>
					</td>
					<td class="qian">
						<font color="red">*</font> <bean:message key="comm.jsp.common.city" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<select  name="commConfigLocationId2"
							id="commConfigLocationId2"
							onkeypress="eventOnKeyPress('commConfigLocationId3')" onchange="setCounty('comm/commConfigLocationTown.do')">
							<%
								if (data.getCommConfigLocationIds2() != null && data.getCommConfigLocationIds2().length > 0) {
									for (int i = 0; i < data.getCommConfigLocationIds2().length; i++) {
										String tempId = data.getCommConfigLocationIds2()[i];
										String tempName = data.getCommConfigLocationNames2()[i];
							%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data
											.getCommConfigLocationId2()) ? "selected"
									: ""%>>
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
					<td class="qian">
						<font color="red">*</font><bean:message key="comm.jsp.common.town" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<select name="commConfigLocationId3"
							id="commConfigLocationId3"
							onkeypress="eventOnKeyPress('seqNo')" onchange="setItemCode()">
							<%
								if (data.getCommConfigLocationIds3() != null && data.getCommConfigLocationIds3().length > 0) {
									for (int i = 0; i < data.getCommConfigLocationIds3().length; i++) {
										String tempId = data.getCommConfigLocationIds3()[i];
										String tempName = data.getCommConfigLocationNames3()[i];
							%>
							<option value="<%=tempId%>"
								<%=tempId.equals(data
											.getCommConfigLocationId3()) ? "selected"
									: ""%>>
								<%=tempName%>
							</option>
							<%
									}
								}
							%>
						</select>
					</td>
					<td class="qian">
						<font color="red">*</font><bean:message key="comm.jsp.common.seqNo" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<input type="text" class="kuandu" name="seqNo"  id="seqNo" size="20"
							maxlength="9" onkeypress="eventOnKeyPress('itemCode')"  max="11" dataType="LimitB" msg="序号输入过长"
							value="<%=data.getSeqNo()%>"/>
					</td>				
				</tr>				
				<tr>
					<td class="qian">
						<font color="red">*</font><bean:message key="comm.jsp.common.item" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<input type="text" class="kuandu" name="itemCode" id="itemCode" size="20"
							maxlength="32" onkeypress="eventOnKeyPress('itemName')"  max="40" dataType="LimitB" msg="代码输入过长"
							value="<%=data.getItemCode()%>" readonly="readonly"/>
					</td>
					<td class="qian">
						<font color="red">*</font> <bean:message key="comm.jsp.common.names" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<input type="text" class="kuandu" name="itemName" size="20"
							maxlength="9"
							onkeypress="eventOnKeyPress('comments')"  max="100" dataType="LimitB" msg="名称输入过长"
							value="<%=data.getItemName()%>" />
					</td>
				</tr>
				<tr>				
					<td class="qian">
						<bean:message key="comm.jsp.common.comments" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<input type="text" class="kuandu" name="comments" id="comments"
							size="20" maxlength="20" value="<%=data.getComments()%>"  max="40" dataType="LimitB" msg="备注输入过长"
							onkeypress="eventOnKeyPress('btnSaveForm')"/>  
					</td>
					<td class="qian">
					</td>
					<td class="hou">
					</td>
				</tr>
			</table>

			<!-- Sheet operation button area -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="30" align="center">
						<input type="button" name="btnSaveForm" value="<bean:message key="comm.jsp.common.save" bundle="conf.comm.Comm"/>" onclick="saveForm()" />
						<input type="button" name="btnBack" value="<bean:message key="comm.jsp.common.return" bundle="conf.comm.Comm"/>" onclick="history.go(-1);" />
					</td>
				</tr>
			</table>
		--%></form>

	</body>
</html>
