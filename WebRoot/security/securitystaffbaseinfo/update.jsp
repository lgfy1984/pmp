<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="securityStaffBaseinfo" scope="request"
	class="com.tianjian.security.struts.form.SecurityStaffBaseinfoForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
			if (request.getServerPort() == 80) {
		%>
		<base
			href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%
			} else {
		%>
		<base
			href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%
			}
		%>
		<title><bean:message
				key="security.jsp.securitystaffbaseinfo.update.title"
				bundle="security" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<script language="javascript"
			src="<bean:message key="include.js.TJMessage.path" bundle="security" />"></script>
		<script language="javascript"
			src="include/javascript/eventOnKeyPress.js"></script>
		<script language="javascript"
			src="<bean:message key="include.js.time.path" bundle="security" />"></script>
		<script language="javascript"
			src="<bean:message key="includes.js.validator.path" bundle="security" />"
			defer="defer"></script>
		<script language="javascript"
			src="<bean:message key="security.js.gettext_staff.path" bundle="security" />"></script>
		<script type="text/javascript"
			src="security/include/javascript/jianbian.js"></script>
		<script type="text/javascript" src="include/javascript/utrim.js"></script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		<link rel="stylesheet" href="include/css/open.css" />
		<link rel="stylesheet" href="include/calendar/theme.css" />
		<link type="text/css" rel="stylesheet"
			href="${path}/style/default.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/border-radius.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/steel/steel.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
			<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
  		<script type="text/javascript" src="${path}/js/jscal2.js"></script>
		<script type="text/javascript" src="${path}/js/lang/cn.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${path}/js/default.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript">
			function huiche(){
				if(event.keyCode==13){
						event.keyCode=9
					}
			}
			function saveForm(){	
				if(!$("#form").form('validate')){
					return false;
				}
				if(document.form.email.value != "") {
  					if(!regIsEmail(document.form.email.value)){ 
						$.messager.alert('提示','<bean:message key="security.jsp.findpassword.warn2" bundle="security"/>');
						return ;
 			    	}			
  				}	
				if(document.form.comments.value.length>50){
					$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.update.warn3" bundle="security"/>');
				 	return ;
				}
				if(document.form.idNo.value != ""){		
					if(checkIdcard() == false){
					return;
					}
				}		
				//修改
				
				    document.form.verbId.value = "update";    
				    document.form.submit(); 
				      
			}
			function regIsEmail(fData){
	       	 	var reg = new RegExp(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
	       		return reg.test(fData);
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
			<!--处理科室-->
			function setHspDept(url){
				var hspConfigBaseinfoId = document.getElementById("hspConfigBaseinfoId").value;
				var xmlHttp = newXMLHttpRequest();
				var sendTo = url + "?verbId=setHspDeptBaseinfo&hspConfigBaseinfoId=" + hspConfigBaseinfoId;
				xmlHttp.open("GET", sendTo, true);
				var handlerFunction = getReadyStateHandler(xmlHttp, updateHspDept);
				xmlHttp.onreadystatechange = handlerFunction;
				xmlHttp.send(null);				
			}
			<!--更新科室-->
			function updateHspDept(deptXML) {
				var dept = document.getElementById("hspDeptBaseinfoId");
				while (dept.options.length) {
			        dept.remove(0);
			    }
			    
				var indexObj = deptXML.getElementsByTagName("index")[0];
				var index = indexObj.childNodes[0].nodeValue;
				for (var i = 0; i < index; i++) {
					var keyObj = deptXML.getElementsByTagName("key")[i];
					var valueObj = deptXML.getElementsByTagName("value")[i];
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
					dept.add(newElem);
				}
			}
		</script>
		<script language="javascript">
	 		function trim(str){
	 			return str.replace(/(^\s*)|(\s*$)/g, "");
			} 
			function checkId(){
			var id;
			id = trim(document.form.idNo.value);
			var stry="";
			var strm="";
			var strd="";
			var lastStr="";
			if(id.length == 18){
				stry=id.substr(6, 4);
				strm=id.substr(10, 2);
				strd=id.substr(12, 2);
				strsex=id.substr(16, 1);
				if(checkDate(stry,strm,strd) && checkIdcard()!=false){
					document.form.year.value = stry;
					document.form.month.value = strm;
					document.form.day.value = strd;
					if(strsex%2==0){
						document.form.commConfigSexId.value=2;
					}else{
						document.form.commConfigSexId.value=1;
					}
					document.form.year.focus();
				}
				}
				if(id.length == 15){
			    document.form.year.focus();
			}
		}
       function checkDate(y,m,d) 
		{ 
			var dateElement = y+"-"+m+"-"+d;
			var pattern=/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/; 
			if(pattern.test(dateElement)){
				return true;
			} 
			else{
				return false;
			}
		}
</script>
		<script language="javascript">
		function checkBirthday(){
	        var idNumber = document.form.idNo.value;
	        var y=document.form.year.value;
	        var m=document.form.month.value;
	        var d=document.form.day.value;
	        if(idNumber != null && idNumber.length > 0){
	           if(document.form.year.value != null){
	           		if(y != idNumber.substr(6, 4)){
							$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn4" bundle="security"/>');
				           	document.form.year.value="";
				           	document.form.year.focus();
				           	return;
				   }
	           }
	            
	        }
		}

function checkMonth(){
        if(trim(document.form.month.value)>13){
		$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn7" bundle="security"/>');
	        document.form.month.value="";
	        document.form.month.focus();
	        return;
        }
}

function checkDay(){
        if(trim(document.form.day.value)>32){
		$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
	        document.form.day.value="";
	        document.form.day.focus();
	        return;
        }
}

function checkGender(){
         var idNumber=document.form.idNo.value;
          if(idNumber.length == 18){
         var strsex=idNumber.substr(16, 1);
        if(idNumber!=null){
         if(strsex%2==0){
						document.form.commConfigSexId.value=2;
					}if(strsex%2==1){
						document.form.commConfigSexId.value=1;
					}else{
					document.form.commConfigSexId.value="";
					}
         }
         }
}
</script>
		<script language="javascript"> 
	function checkIdcard(){
		var idcard=document.form.idNo.value;
		var area={11:"",12:"",13:"",14:"",15:"",21:"",22:"",23:"",31:"",32:"",33:"",34:"",35:"",36:"",37:"",41:"",42:"",43:"",44:"",45:"",46:"",50:"",51:"",52:"",53:"",54:"",61:"",62:"",63:"",64:"",65:"",71:"",81:"",82:"",91:""}
		var idcard,Y,JYM;
		var S,M;
		var idcard_array = new Array();
			idcard_array = idcard.split("");
		//地区检验
		if(area[parseInt(idcard.substr(0,2))]==null){
			$.messager.alert('提示',"<bean:message key="security.jsp.securitystaffbaseinfo.add.warn10" bundle="security"/>!");
			//$.messager.alert('提示',"身份证地区非法!");
			//doit = false;
			return false;
		}
		//身份号码位数及格式检验
		switch(idcard.length){
			case 15:
				if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
					ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
				} else {
					ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
				}
				if(!ereg.test(idcard)){
					//$.messager.alert('提示',"证件号码码出生日期超出范围或含有非法字符!");
					$.messager.alert('提示',"<bean:message key="security.jsp.securitystaffbaseinfo.add.warn10" bundle="security"/>!");
					doit = false;
					return false;
				}
				break;
			case 18:
				if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
					ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
				} else {
					ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
				}
				if(ereg.test(idcard)){
					//测试出生日期的合法性
					//计算校验位
					S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
						+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
						+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
						+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
						+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
						+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
						+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
						+ parseInt(idcard_array[7]) * 1 
						+ parseInt(idcard_array[8]) * 6
						+ parseInt(idcard_array[9]) * 3 ;
					Y = S % 11;
					M = "F";
					JYM = "10X98765432";
					M = JYM.substr(Y,1);//判断校验位
					if(M != idcard_array[17]){
						//$.messager.alert('提示',"证件号码码校验错误!");
						$.messager.alert('提示',"<bean:message key="security.jsp.securitystaffbaseinfo.add.warn10" bundle="security"/>!");
						//doit = false;
						return false;
					}
				}else{
					//$.messager.alert('提示',"证件号码码出生日期超出范围或含有非法字符!");
					$.messager.alert('提示',"<bean:message key="security.jsp.securitystaffbaseinfo.add.warn10" bundle="security"/>!");
					//doit = false;
					return false;
				}
				break;
			default:
			{
				$.messager.alert('提示',"<bean:message key="security.jsp.securitystaffbaseinfo.add.warn11" bundle="security"/>!");
				//doit = false;
				return false;
			}
			break;
		}
	}
	function showHspMessage(message){
				if(message != ''&& message != null){
					$.messager.alert('提示',message);
					return;
				}
			}
	function regIsEmail(fData){
   	 	var reg = new RegExp(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
   		return reg.test(fData);
	}
	
	function checkcell(){
	     var code=document.getElementById("mobilecode").value;
	     var re=/^0{0,1}(13[0-9]|15[0-9]|153|156|18[7-9])[0-9]{8}$/; 
	        if(code!=null && code!=""){
	     if(!re.test(code)){  
	        $.messager.alert('提示',"手机输入的格式不对");
	        document.getElementById("mobilecode").value="";
	        return ;
	     } 
	     }
	}
	function goBack(){
			location.href = "<%=request.getContextPath()%>/security/securityStaffBaseinfo.do?verbId=init&navtext=操作员管理主菜单-操作人员查询";
		}
</script>
	</head>
	<body
		onload="showHspMessage('<%=securityStaffBaseinfo.getMessage()%>')">
		<form name="form" id="form" method="post"
			action="security/securityStaffBaseinfo.do">
			<input type="hidden" name="verbId" value="add" />
			<input type="hidden" name="hspStaffBaseinfoId"
				value="<%=securityStaffBaseinfo.getHspStaffBaseinfoId()%>" />
			<input type="hidden" name="seqNo"
				value="<%=securityStaffBaseinfo.getSeqNo()%>" />
			<div class='crm_edit_panel'>
				<table class='crm_panel_table' cellspacing=1>
					<tr>
					    <td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.idNo" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="idNo" name="idNo" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
								onchange="checkId();" onkeypress="eventOnKeyPress('email')"
								class="text" max="40" dataType="LimitB" msg="身份证号输入过长"
								value="<%=securityStaffBaseinfo.getIdNo()%>" />
						</td>
							
					</tr>
					<tr>
					  <td class="crm_edit_item_name">
							<span style="color: red;">*</span>
							登陆名
						</td>
						<td  class="crm_edit_item_content">
							<input type="text" id="staffCode" name="staffCode" class="text"
								name="name" maxlength="20" size="20" onkeyup="value=value.replace(/[^\d\w]/g,'')"   max="40"  required="true"
								dataType="LimitB" msg="姓名输入过长" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								value="<%=securityStaffBaseinfo.getStaffCode()%>"
								onkeypress="eventOnKeyPress('name')" />
						</td>
						<td class="crm_edit_item_name">
							<label class="redlable" style="color: red;">
								*
							</label>
							<bean:message key="security.jsp.commom.name" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" name="name" size="20" class="text"  required="true"
								maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeypress="eventOnKeyPress('hspConfigBaseinfoName')" max="40"
								dataType="LimitB" msg="姓名输入过长"
								value="<%=securityStaffBaseinfo.getName()%>" />
						</td>



					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.nameEn" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" onkeyup="value=value.replace(/[^\''\w]/g,'')"
								name="nameEn" onkeypress="eventOnKeyPress('idNo')" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								maxlength="40" class="text" onkeydown="huiche()" max="40"
								dataType="LimitB" msg="英文姓名输入过长"
								value="<%=securityStaffBaseinfo.getNameEn()%>" />
						</td>
                        <td class="crm_edit_item_name">
								<span style="color: red;">*</span>
								员工编号
							</td>
							<td  class="crm_edit_item_content">
								<input type="text" id="id" name="id" class="text"
									name="name" maxlength="20" size="20" onkeyup="value=value.replace(/[^\d\w]/g,'')"   max="40" required="true"
									dataType="LimitB" msg="姓名输入过长" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
									onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly
									value="<%=securityStaffBaseinfo.getId()%>"
									onkeypress="eventOnKeyPress('name')" />
							</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.birthDay"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" size="3" name="year" class="text"
								onkeypress="eventOnKeyPress('month')" style="width: 40px;"
								value="<%=securityStaffBaseinfo.getYear()%>"
								onkeydown="huiche()" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')" id="statYear"
								maxlength="4" />
							<bean:message key="security.jsp.commom.Year" bundle="security" />
							&nbsp;
							<input type="text" name="month" class="text"
								onkeypress="eventOnKeyPress('day')"
								value="<%=securityStaffBaseinfo.getMonth()%>" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeydown="huiche()" style="width: 30px;"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')" maxlength="2" />
							<bean:message key="security.jsp.commom.month" bundle="security" />
							&nbsp;
							<input type="text" name="day" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeypress="eventOnKeyPress('email')" style="width: 30px;"
								value="<%=securityStaffBaseinfo.getDay()%>" onkeydown="huiche()"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')" maxlength="2" />
							<bean:message key="security.jsp.commom.day" bundle="security" />



						</td>
<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.commConfigSexId"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content" align="center">
							<select name="commConfigSexId" class="easyui-combobox"
								id="commConfigSexId" onblur="checkGender()"
								style="width: 205px;height:30px;"editable="false" 
								onkeypress="eventOnKeyPress('commConfigStafftypeId')">
								<%
									if (securityStaffBaseinfo.getCommConfigSexIds() != null
											&& securityStaffBaseinfo.getCommConfigSexIds().length > 0) {
										for (int i = 0; i < securityStaffBaseinfo.getCommConfigSexIds().length; i++) {
											String tempId = securityStaffBaseinfo.getCommConfigSexIds()[i];
											String tempName = securityStaffBaseinfo
													.getCommConfigSexNames()[i];
								%>
								<option value="<%=tempId%>"
									<%=tempId.equals(securityStaffBaseinfo
							.getCommConfigSexId()) ? "selected" : ""%>>
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
					
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.securitystaffbaseinfo.commom1"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="email" name="email" class="text" max="100"
								dataType="LimitB" msg="邮箱输入过长" maxlength="100" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeypress="eventOnKeyPress('commConfigSexId')"
								value="<%=securityStaffBaseinfo.getEmail()%>" />
						</td>
						
					</tr>
					<tr>
					

						<td class="crm_edit_item_name">
							员工系列
						</td>
						<td class="crm_edit_item_content">
							<select name="commConfigStafftypeId" id="commConfigStafftypeId"
								class="easyui-combobox" style="width: 205px;height:30px;"editable="false" 
								>
								<%
									if (securityStaffBaseinfo.getCommConfigStafftypeIds() != null
											&& securityStaffBaseinfo.getCommConfigStafftypeIds().length > 0) {
										for (int i = 0; i < securityStaffBaseinfo
												.getCommConfigStafftypeIds().length; i++) {
											String tempId = securityStaffBaseinfo
													.getCommConfigStafftypeIds()[i];
											String tempName = securityStaffBaseinfo
													.getCommConfigStafftypeNames()[i];
								%>
								<option value="<%=tempId%>"
									<%=tempId.equals(securityStaffBaseinfo
							.getCommConfigStafftypeId()) ? "selected" : ""%>>
									<%=tempName%>
								</option>
								<%
									}
									}
								%>
							</select>
						</td>
						
						<td class="crm_edit_item_name">
						<span style="color: red;">*</span>
                                                                 员工类别
						</td>
                          <td class="crm_edit_item_content">
							<select name="commConfigStaffChargeTypeId" id="commConfigStaffChargeTypeId" class="easyui-combobox"
								style="width: 205px;height:30px;"editable="false"   required="true"
								onkeypress="eventOnKeyPress('comments')">
								<%
									if (securityStaffBaseinfo.getCommConfigStaffChargeTypeIds() != null
											&& securityStaffBaseinfo.getCommConfigStaffChargeTypeIds().length > 0) {
										for (int i = 0; i < securityStaffBaseinfo.getCommConfigStaffChargeTypeIds().length; i++) {
											String tempId = securityStaffBaseinfo.getCommConfigStaffChargeTypeIds()[i];
											String tempName = securityStaffBaseinfo
													.getCommConfigStaffChargeTypeNames()[i];
								%>
								<option value="<%=tempId%>"
									<%=tempId.equals(securityStaffBaseinfo
							.getCommConfigStaffChargeTypeId()) ? "selected" : ""%>>
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
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.islocation"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<select name="islocation" id="islocation" class="easyui-combobox"
								style="width: 205px;height:30px;"editable="false"   
								onkeypress="eventOnKeyPress('phone')">
								<%
									if (securityStaffBaseinfo.getIslocationIds() != null
											&& securityStaffBaseinfo.getIslocationIds().length > 0) {
										for (int i = 0; i < securityStaffBaseinfo.getIslocationIds().length; i++) {
											String tempId = securityStaffBaseinfo.getIslocationIds()[i];
											String tempName = securityStaffBaseinfo
													.getIslocationNames()[i];
								%>
								<option value="<%=tempId%>"
									<%=tempId.equals(securityStaffBaseinfo
							.getIslocation()) ? "selected" : ""%>>
									<%=tempName%>
								</option>
								<%
									}
									}
								%>
							</select>
						</td>

						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.mobilecode"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" msg="手机号输入过长" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getPhone()%>" />
						</td>
					</tr>
					<!--<tr>
					<td class="tdLeft_L">
						<bean:message key="security.jsp.commom.homePageType" bundle="security"/>：
					</td>
					<td class="tdRight_R">
						<select name="homePageType" id="homePageType" style="width: 150px;" onkeypress="eventOnKeyPress('comments')">
							
							<option value="0" <%="0".equals(securityStaffBaseinfo.getHomePageType())
					? "selected"
					: ""%>>
								
							</option>
							<option value="1" <%="1".equals(securityStaffBaseinfo.getHomePageType())
					? "selected"
					: ""%>>
							<bean:message key="security.jsp.commom.item8" bundle="security"/>	
							</option>
							<option value="2" <%="2".equals(securityStaffBaseinfo.getHomePageType())
					? "selected"
					: ""%>>
							<bean:message key="security.jsp.commom.item9" bundle="security"/>	
							</option>
							<option value="3" <%="3".equals(securityStaffBaseinfo.getHomePageType())
					? "selected"
					: ""%>>
							<bean:message key="security.jsp.commom.item10" bundle="security"/>
							</option>
							
						</select>
					</td>
				</tr>  -->
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commmom.comments"
								bundle="security" />
							
						</td>
						<td colspan="3" class="crm_edit_item_content">
							<textarea name="comments" max="100" dataType="LimitB" class="textarea_w" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								msg="备注输入过长" id="comments" cols="45" rows="5"><%=securityStaffBaseinfo.getComments()%></textarea>
						</td>
					</tr>
				</table>
			</div>
				<!-- Sheet operation button area -->
				<div class="horizontal_line_10"></div>
					<div class="crm_button_sub" id="btnSave" align="center">
					<input type="button" name="btnSaveForm"class="button_green1_s0" onmouseout="this.className='button_green1_s0'" onmousedown="this.className='button_green1_s1'"
						value="修改"
						onclick="saveForm();" />
					&nbsp;&nbsp;
					<input type="button" name="btnBack"class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
						value="<bean:message key="security.jsp.commom.button2" bundle="security"/>"
						onclick="goBack();" />
				</div>
				<div class="horizontal_line_10"></div>
		</form>
		
	</body>
	<script language="javascript" type="text/javascript">
			/* date show */
			var cal = Calendar.setup({
				onSelect : function(cal) {
					cal.hide()
				},
				showTime : true
			});
			cal.manageFields("stopDateButton", "stopDate", "%Y-%m-%d");
		</script>
</html>
