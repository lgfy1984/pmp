<%@ page language="java" pageEncoding="UTF-8"%>
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
				key="security.jsp.securitystaffbaseinfo.add.title" bundle="security" />
		</title>
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
			src="<bean:message key="security.js.gettext_staff.path" bundle="security" />"></script>
		<script type="text/javascript"
			src="security/include/javascript/jianbian.js"></script>
		<link rel="stylesheet" href="include/css/open.css" />
		<link type="text/css" rev="stylesheet" rel="stylesheet"
			href="include/css/form.css" />
		<script type="text/javascript"
			src="<bean:message key="include.js.checkbox_radio.path" bundle="security" />"></script>
		<script language="javascript"
			src="<bean:message key="includes.js.validator.path" bundle="security" />"
			defer="defer"></script>
		<script type="text/javascript" src="include/javascript/utrim.js"></script>
		<script type="text/javascript"
			src="<bean:message key="include.js.checkbox_radio.path" bundle="security" />"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/include/javascript/searchwindow.js"></script>

		<link rel="stylesheet" href="include/calendar/theme.css" />
<!--		<script src="include/calendar/calendar.js"></script>-->
<!--		<script src="include/calendar/calendar-setup.js"></script>-->
<!--		<script src="include/calendar/calendar-zh.js"></script>-->
		<link type="text/css" rel="stylesheet"
			href="${path}/style/default.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/border-radius.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/steel/steel.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
		<script type="text/javascript" src="${path}/js/jscal2.js"></script>
		<script type="text/javascript" src="${path}/js/lang/cn.js"></script>
		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${path}/js/default.js"></script>
  		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script language="javascript">
			function huiche(){
				if(event.keyCode==13){
						event.keyCode=9
					}
				}
			 function  huicheName() {
	           if(event.keyCode==13){
	           		eventOnKeyPress('hspConfigBaseinfoName');
	           		add('hsp/hspConfigBaseinfoBase.do?verbId=getHsp&hspType=3','displayInputId_1','hiddenInputId_1','','displayInputId_1')
	           }
	          
			}
			function saveForm(){
				if(!Validator.Validate(document.forms.form,3)){
      				return ;
   				}				
				if(!Validator.Validate(document.forms.form,3)){
      				return ;
   				}
				
				if(document.form.hspConfigBaseinfoName.value == ""){
					$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn1" bundle="security"/>');
				 	return ;
				}
				if(document.form.name.value == ""){
					$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn2" bundle="security"/>');
			        document.form.name.focus();
				 	return ;
				}	
				if(document.form.email.value == "") {
					$.messager.alert('提示','<bean:message key="security.jsp.findpassword.warn1" bundle="security"/>');
  					return ;
  				}else{
  					if(!regIsEmail(document.form.email.value)){ 
						$.messager.alert('提示','<bean:message key="security.jsp.findpassword.warn2" bundle="security"/>');
						return ;
 			    	}			
  				}		
				
				if(document.form.comments.value.length>49){
					$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn3" bundle="security"/>');
				 	return ;
				}
				var commConfigSex = $('#commConfigSexId').combobox('getText')
				if(document.form.idNo.value != ""){	
					var iIdNo=document.form.idNo.value;	
					if(checkIdcard() == false){
						return;
					}
					var sexStr="";
					if(iIdNo.length == 15){
               			var sexStr = parseInt(iIdNo.substring(14, 1),10) % 2 ? "男" : "女";
		            }else{
		                var sexStr = parseInt(iIdNo.substring(17, 1),10) % 2 ? "男" : "女";
		            }
					if(commConfigSex!="" && commConfigSex!=sexStr){
						$.messager.alert('提示','身份证获取的性别与选择的性别不一致，请确认输入是否正确！','info');
						return;
					}	
				}

		        var idNumber=document.form.idNo.value;
		        var y=document.form.year.value;
		        var m=document.form.month.value;
		        var d=document.form.day.value;
	           	if(y.length>0) {
		            if(y == "0000" || y.length !=4){
					   $.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn4" bundle="security"/>');
			           return;
			        }
			        if(trim(document.form.month.value)==""){
					   $.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn5" bundle="security"/>');
			           return;
			        }
			        if(trim(document.form.day.value)==""){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn6" bundle="security"/>');
			            return;
			        }
			        if(trim(document.form.month.value)>12 || trim(document.form.month.value) < 1){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn7" bundle="security"/>');
			      	    return;
			        }
			        if(trim(document.form.day.value)>31){
					$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
			        return;
			        }
		        }
		        if(m.length>0) {
		            if(y == "0000" || y.length != 4){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn4" bundle="security"/>');
			            return;
			        }
			        if(trim(document.form.day.value) == ""){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn6" bundle="security"/>');
			            return;
			        }
			        if(trim(document.form.day.value)>31){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
			        	return;
			        }
			         if(m == 2){
						if((y % 400 == 0) || (y % 4 == 0) && (y % 100 != 0)){
							if((d < 1) || (d > 29)){
								 $.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
	     						 return false;
	  						  }
						}else{
							if((d < 1) || (d > 28)){
								$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
								return false;
						}
	 				 }
					}else if((m == 1) ||
							 (m == 3) ||
							 (m == 5) ||
							 (m == 7) ||
							 (m == 8) ||
							 (m == 10) ||
							 (m == 12)){
								if((d < 1) || (31 < d)){
									$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
									return false;
								}
					}else{
						if((d < 1) || (30 < d)){
							$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn8" bundle="security"/>');
							return false;
	 					}
					}
		        }
		        if(d.length>0) {
		            if(y == "0000" || y.length != 4){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn4" bundle="security"/>');
			            return;
			        }
			        if(trim(document.form.month.value)==""){
						$.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn5" bundle="security"/>');
			            return;
			        }
			        if(trim(document.form.month.value)>12){
					    $.messager.alert('提示','<bean:message key="security.jsp.securitystaffbaseinfo.add.warn7" bundle="security"/>');
			            return;
			        }
		        }
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
				//添加
				     
				    document.form.verbId.value = "add";    
				    document.form.submit(); 
				      
			}
			function goback(url){
				//document.form.verbId.value = 'addInit';
				//document.form.submit();
				location.href=url;
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
	function createXMLHttpRequest(){
		if(window.XMLHttpRequest){ 
			xmlrequest = new XMLHttpRequest();
		}else if(window.ActiveXObject){
				try{
					xmlrequest = new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					try{
					xmlrequest = new ActiveXObject("Microsoft.XMLHTTP");
					}catch(e){}
				}
			}
		}
	 function sendRequest(code){
			createXMLHttpRequest();	
			var staffCode = document.getElementById (code).value;
			var url = "<%=request.getContextPath()%>/security/securityStaffBaseinfo.do?verbId=verification&staffCode="+staffCode+"";		
            xmlrequest.open("GET", url, true);          
			xmlrequest.onreadystatechange = processResponse;
			xmlrequest.send(null);
		}
      function processResponse(){
			if (xmlrequest.readyState == 4){
				if (xmlrequest.status == 200){
               		document.getElementById("message").innerHTML = xmlrequest.responseText;
				 } 
			}
		}
		function showHspMessage(message){
				if(message != ''&& message != null){
					$.messager.alert('提示',message);
					return;
				}
			}
		function centerLayer( obj ) {
				var ocw = obj.clientWidth;
				var och = obj.clientHeight;
				var bsl = document.body.scrollLeft || document.documentElement.scrollLeft;
				var bst = document.body.scrollTop || document.documentElement.scrollTop;
				var bcw = document.body.clientWidth || document.documentElement.clientWidth;
				var bch = document.body.clientHeight || document.documentElement.clientHeight;
				var osl = bsl + Math.floor( ( bcw - ocw ) / 2 );
				    osl = Math.max( bsl , osl );
				var ost = bst + Math.floor( ( bch - och ) / 2 );
				    ost = Math.max( bst , ost );
				obj.style.left  = osl + 'px';
				obj.style.top   = ost + 'px';
			}
		
		//function openLayer(){
		///		iframe1.location="<%=request.getContextPath()%>/hsp/hspStaffBaseinfoLocalBase.do?verbId=getXml";
		//        document.getElementById('iframe1').style.display='';
		 //       document.getElementById('iframe1').style.visibility='visible';
		 //       var obj = document.getElementById('iframe1');
       	//		centerLayer(obj);
       	//	}
       		function openLayer(){
				iframe1.location="<%=request.getContextPath()%>/hsp/hspStaffBaseinfo.do?verbId=getXml";
		        document.getElementById('iframe1').style.display='';
		        document.getElementById('iframe1').style.visibility='visible';
		        var obj = document.getElementById('iframe1');
       			centerLayer(obj);
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
       	<!--获得拼音英文名称-->
		function getPY(){
			var name = document.getElementById("displayInputId_2").value;
			var xmlHttp = newXMLHttpRequest();
			var url   = "<%=request.getContextPath()%>/security/securityStaffBaseinfo.do?verbId=getPY&name="+encodeURI(encodeURI(name));
			var sendTo = url;
			xmlHttp.open("GET", sendTo, true);
			var handlerFunction = getReadyStateHandler(xmlHttp, setEname);
			xmlHttp.onreadystatechange = handlerFunction;
			xmlHttp.send(null);
		}
		function setEname(dataXML) {
			var messageObj = dataXML.getElementsByTagName("message")[0];
			var message = messageObj.childNodes[0].nodeValue;
			document.getElementById("nameEn").value=message;
		}
		function goBack(){
			location.href = "<%=request.getContextPath()%>/security/securityStaffBaseinfo.do?verbId=init&navtext=操作员管理主菜单-操作人员查询";
		}
</script>
	</head>
	<body onload="showHspMessage('${message }')">
		<iframe name="iframe1" id="iframe1"
			style="display: none; width: 600px; height: 464px; background-color: white; position: absolute; top: 50; left: 225; border: #DAEBF5 solid; border-width: 1 1 3 1; z-index: 101;"
			scrolling="no" frameborder=0></iframe>
		<div id="mask"></div>
		<form name="form" method="post" id="form"
			action="security/securityStaffBaseinfo.do">
			<input type="hidden" name="verbId" value="add" />
			<input type="hidden" name="id"
				value="<%=securityStaffBaseinfo.getId()%>" />
			<input type="hidden" name="seqNo"
				value="<%=securityStaffBaseinfo.getSeqNo()%>" />

			<div class='crm_edit_panel'>
				<table class='crm_panel_table' cellspacing=1>
					<tr>
						<td class="crm_edit_item_name" width="120px;">
							卫生人员选择
							
						</td>
						<td>
							<input type="hidden" id="hspStaffBaseinfoId"class="text"
								name="hspStaffBaseinfoId" />
							<img
								src="<%=request.getContextPath()%>/include/images/select.gif"
								style="cursor: pointer;" onclick="openLayer();" />
						</td>
						<td class="crm_edit_item_name">
							<span style="color: red;">*</span>
							<bean:message key="security.jsp.commom.name" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="displayInputId_2" class="text"
								name="name" size="20" maxlength="13" onblur="getPY()" max="40"
								dataType="LimitB" msg="姓名输入过长" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								value="<%=securityStaffBaseinfo.getName()%>"
								onkeypress="eventOnKeyPress('hspConfigBaseinfoName')" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<span style="color: red;">*</span>
							<bean:message key="security.jsp.commom.hspConfigBaseinfoName"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="displayInputId_1"class="text"
								name="hspConfigBaseinfoName" onkeydown="huiche()" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								value="<%=securityStaffBaseinfo.getHspConfigBaseinfoName()%>"
								readonly="readonly" onkeypress="eventOnKeyPress('name')" />
							<!--这是准备存储到数据的字段-->
							<input type="hidden" id="hiddenInputId_1"
								value="<%=securityStaffBaseinfo.getHspConfigBaseinfoId()%>"
								name="hspConfigBaseinfoId" />
							<!--弹出的选择按钮，add(arg1,arg2,arg3)其中arg1代表基本录入框的id，arg2代表保存存储到数据库字段对应的input的id
								arg3代表需要传递到.do的数据库检索参数
							-->
							<!-- hspType 1为除去卫生服务站2为只包括服务站和服务中心3为所有 -->
							<img src="security/include/images/select.gif"
								style="cursor: pointer; position: relative;"
								onclick="add('hsp/hspConfigBaseinfoBase.do?verbId=getHsp&hspType=3','displayInputId_1','hiddenInputId_1')" />
						</td>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.nameEn" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" name="nameEn" id="nameEn"
								class="text" maxlength="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeyup="value=value.replace(/[^\''\w]/g,'')"
								onkeydown="huiche()" onkeypress="eventOnKeyPress('idNo')"
								value="<%=securityStaffBaseinfo.getNameEn()%>" />
						</td>
					</tr>
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
						<td class="crm_edit_item_name">
							<span style="color: red;">*</span>
							<bean:message key="security.jsp.securitystaffbaseinfo.commom1"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="email" name="email" class="text"
								max="100" dataType="LimitB" msg="邮箱输入过长" maxlength="100"
								onkeypress="eventOnKeyPress('year')" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								value="<%=securityStaffBaseinfo.getEmail()%>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.birthDay"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" size="3" name="year" style="width: 40px;"class="text"
								value="<%=securityStaffBaseinfo.getYear()%>"
								onkeydown="huiche()" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeypress="eventOnKeyPress('commConfigSexId[0]')"
								onkeyup="value=value.replace(/[^\d]/g,'')" id="statYear"
								maxlength="4" />
							<bean:message key="security.jsp.commom.Year" bundle="security" />
							&nbsp;
							<input type="text" name="month" id="month"
								value="<%=securityStaffBaseinfo.getMonth()%>"
								onkeydown="huiche()" style="width: 30px;"class="text"
								onkeypress="eventOnKeyPress('year')" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="2" />
							
							<bean:message key="security.jsp.commom.month" bundle="security" />
							&nbsp;
							<input type="text" name="day" id="day"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')"class="text"
								style="width: 30px;" value="<%=securityStaffBaseinfo.getDay()%>"
								onkeydown="huiche()" maxlength="2" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								onkeypress="eventOnKeyPress('month')" />
							<bean:message key="security.jsp.commom.day" bundle="security" />
							&nbsp;
						</td>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.commConfigSexId"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<select name="commConfigSexId" class="easyui-combobox"
								id="commConfigSexId" onblur="checkGender()"
								style="width: 205px;height:30px;"editable="false" 
								onkeypress="eventOnKeyPress('commConfigStafftypeId')">
								<option value="">&nbsp;</option>
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
							<bean:message key="security.jsp.commom.commConfigStafftypeId"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<select name="commConfigStafftypeId" id="commConfigStafftypeId"
								editable="false"  class="easyui-combobox" style="width: 205px;height:30px;"
								>
								<option value="">&nbsp;</option>
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
							<bean:message key="security.jsp.commom.islocation"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<select name="islocation" id="islocation"class="easyui-combobox" style="width: 205px;height:30px;"
								editable="false"  onkeypress="eventOnKeyPress('phone')">
								<option value="">&nbsp;</option>
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
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.mobilecode"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								class="text" onblur="checkcell()" max="40" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								dataType="LimitB" msg="手机号输入过长" maxlength="40"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getPhone()%>" />
						</td>
						<td class="crm_edit_item_name">
							有效截止日期
						</td>
						<td class="crm_edit_item_content">
							<span  class="calendarspan">
							<input type="text" id="stopDate" name="stopDate"
								class="text" dataType="Custom" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								regexp="^(?:(?:([0-9]{4}(-|\/)(?:(?:0?[1,3-9]|1[0-2])(-|\/)(?:29|30)|((?:0?[13578]|1[02])(-|\/)31)))|([0-9]{4}(-|\/)(?:0?[1-9]|1[0-2])(-|\/)(?:0?[1-9]|1\\d|2[0-8]))|(((?:(\\d\\d(?:0[48]|[2468][048]|[13579][26]))|(?:0[48]00|[2468][048]00|[13579][26]00))(-|\/)0?2(-|\/)29))))$"
								msg="日期格式不正确，期待格式为：XXXX-XX-XX！" require="false"
								onkeypress="eventOnKeyPress('comments')"
								value="<%=securityStaffBaseinfo.getStopDate()%>"
								readonly="readonly"  />
							<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg" style="vertical-align: middle;left:180px"/>
								</span>
						</td>
						<!--<td class="tdLeft_L">
						<bean:message key="security.jsp.commom.homePageType" bundle="security"/>：
					</td>
					<td class="crm_edit_item_content">
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
					</td>-->
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commmom.comments"
								bundle="security" />
							
						</td>
						<td colspan="3"class="crm_edit_item_content">
							<textarea name="comments" class="textarea_w" max="100" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
								dataType="LimitB" msg="备注输入过长" id="comments" cols="45" rows="5"><%=securityStaffBaseinfo.getComments()%></textarea>
						</td>
					</tr>
				</table>
			</div>
			<!-- Sheet operation button area -->
				<div class="horizontal_line_10"></div>
					<div class="crm_button_sub" id="btnSave" align="center">
					<input type="button" name="btnSaveForm" class="button_green1_s0" onmouseout="this.className='button_green1_s0'" onmousedown="this.className='button_green1_s1'"
						value="<bean:message key="security.jsp.commom.button1" bundle="security"/>"
						onclick="saveForm();" />
					&nbsp;&nbsp;
					<input type="button" name="btnBack" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
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
			cal.manageFields("date_input1", "stopDate", "%Y-%m-%d");
		</script>
</html>
