﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ page import="com.tianjian.security.struts.form.LoginForm"%>
<%@ page import="java.util.Locale,java.util.Enumeration,java.util.Date"%>
<%@ page import="com.tianjian.util.comm.DateUtil"%>

<%@ page import="org.apache.struts.Globals"%>
<%
		for (Enumeration e = session.getAttributeNames(); e.hasMoreElements();) {
			String attr = (String)e.nextElement();
			if(attr!=Globals.LOCALE_KEY){
				session.removeAttribute(attr);
			}
		
		}
		LoginForm loginForm = (LoginForm) request.getAttribute("loginForm");
		if (loginForm == null) {
			loginForm = new LoginForm();
		}
		String lang = request.getParameter("lang");
		if(lang!=null&&lang.trim().length()>0){
			Locale currentLocale = Locale.getDefault(); 
			if ("zh".equals(lang)) {
				currentLocale = new Locale("zh", "CN");
			}else if("en".equals(lang)) {
				currentLocale = new Locale("en", "US");
			}else if("es".equals(lang)) {
				currentLocale = new Locale("es", "ES");
			}
			request.getSession().setAttribute(Globals.LOCALE_KEY, currentLocale);
		}
		
		int verflag = 0;
		if(application.getAttribute("security.LOGIN_NEED_VERIFY")!=null&&((String)application.getAttribute("security.LOGIN_NEED_VERIFY")).trim().equalsIgnoreCase("TRUE")){
			verflag=1;
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
		if (request.getServerPort() == 80) {
		%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%
		} else {
		%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%
		}
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<title><bean:message key="home.jsp.login.title" bundle="conf.home.Message"/></title>
		<link rel="stylesheet" type="text/css" href="include/css/ymPrompt.css" />
		
		<SCRIPT LANGUAGE=JAVASCRIPT>
			
			if (top.location !== self.location) {
			top.location=self.location;
			}
		</SCRIPT>
		
		<script language="javascript" src="security/include/javascript/SecurityMessage.js"></script>
		<script language="javascript" src="include/javascript/ymPrompt.js" ></script>
		<script language="javascript" src="include/javascript/utrim.js" ></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		
		<script language="javascript">
			function cn(){
				ymPrompt.setDefaultCfg({title:'标题', message:"内容",okTxt:' 确 定 ',cancelTxt:' 取 消 ',closeTxt:'关闭',minTxt:'最小化',maxTxt:'最大化'});
			}
			function en(){
				ymPrompt.setDefaultCfg({title:'Mensaje', message:"Default Message",okTxt:' OK ',cancelTxt:' Cancel ',closeTxt:'Close',minTxt:'Minimize',maxTxt:'Maximize'});
			}
			function checkUser() {
			    if(trim(document.form.staffCode.value) == ""){
			    	alert('<bean:message key="home.jsp.login.script1" bundle="conf.home.Message"/>');
					return false;
			    }
			    if(trim(document.form.password.value) == ""){
			    	alert('<bean:message key="home.jsp.login.script2" bundle="conf.home.Message"/>');
					return false;
			    }
			    
			    <%if(verflag==1){%>
			    if(trim(document.form.loginVerCode.value) == ""){
			    	alert('验证码不能为空!');
					return false;
			    }
			    <%}%>
			    
			    document.form.verbId.value = "login";       
			    document.form.submit();
			}

		</script>
		<link href="home/include/css/login.css" rel="stylesheet" type="text/css"/>
		<SCRIPT LANGUAGE="JavaScript">
		<!--
			function $( id ){return document.getElementById( id );}
			function fEvent(sType,oInput){
			   switch (sType){
			    case "focus" :
			     oInput.isfocus = true;
			    case "mouseover" :
			     oInput.style.borderColor = '#2B76C2';
			     break;
			    case "blur" :
			     oInput.isfocus = false;
			    case "mouseout" :
			     if(!oInput.isfocus){
			      oInput.style.borderColor='#cccccc';
			     }
			     break;
			   }
			}
			function huiche(){
				if(event.keyCode==13){
					event.keyCode=9
				}
			}
		//-->
		</SCRIPT>
		<script type="text/javascript">
			function juzhong(){
				
				var bodyheight = window.screen.availHeight - 70;
				//alert(bodyheight);
				document.getElementById("full").style.marginTop=(bodyheight-411)/2;
			}
			function showMessage(msg){
				if(msg!='null'&&msg!=''){
					alert(msg);
					return false;
				}
				
			}
		</script>
	</head>
	<body onload="juzhong();showMessage('<%=loginForm.getMessage()%>');" class="newbody" >
		<form name="form" method="post" action="security/security_login.do" >
                      <div class="backimg">
                               <div class="logodiv"> </div>
                               <div class="logindiv">
                               <div  class="newtable"  cellpadding="0" cellspacing="0" align="left" >
	                               	<div class="clear">
		                               	<div width="50" class="td_name">
		                               		<bean:message key="home.jsp.login.body1" bundle="conf.home.Message" />
		                               	</div>
		                               	<div width="186" class="td_input">
		                               		<input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" onfocus="fEvent('focus',this)" tabindex="2" onmouseout="fEvent('mouseout',this)" type="text" value="<%=loginForm.getStaffCode()%>" maxlength="20" size="20" class="input_left" id="userId" name="staffCode" onkeyup="value=value.replace(/[^\d\w]/g,'')"  onkeypress="eventOnKeyPress('password')" />
		                               	</div>
	                               	</div >
	                               	<div class="clear">
		                               	<div width="50" class="td_name">
		                               		<bean:message key="home.jsp.login.body2" bundle="conf.home.Message"/>
		                               	</div>
		                               	<div width="186" class="td_input">
		                               		<input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" onfocus="fEvent('focus',this)" tabindex="2" onmouseout="fEvent('mouseout',this)" type="password" value="<%=loginForm.getPassword()%>" maxlength="20" size="20" class="password" id="passwd" name="password" onkeydown="if(event.keyCode == 13)<%=(verflag==1)?"eventOnKeyPress('loginVerCode');":" checkUser();" %> " />
		                               	</div>
	                               	</div>
	                               <%if(verflag==1){
											%>	
	                               	<div class="clear">
		                               	<div width="50" class="td_name">
		                               		验证码：
		                               	</div>
		                               	<div width="186" class="td_input">
		                               		<input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" onfocus="fEvent('focus',this)" tabindex="2" onmouseout="fEvent('mouseout',this)" type="text" value="" maxlength="20" size="20"  id="loginVerCode" name="loginVerCode" class="input_loginvercode" onkeydown="if(event.keyCode == 13)checkUser();" />
											<div class="yzm_div"><img  id="loginVerCodeImage" src="<%=request.getContextPath()%>/genRandomCode"  onclick="this.src='<%=request.getContextPath()%>/genRandomCode?'+Math.random()" style="vertical-align:middle;"  /></div>
													
		                               	</div>
	                               	</div>
	                               	<% } %>
	                               		<div class="clear" >
		                               	<div width="50" class="td_name">
		                               	</div>
		                               	<div  class="td_input ">
		                               		<div style="float: left;"><input name="enter.x2" type="button" class="inp_L1" id="enter.x" tabindex="4" onclick="checkUser()" onmousedown="this.className='inp_L3'" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'" value='<bean:message key="home.jsp.login.body3" bundle="conf.home.Message"/>' /></div>
<%-- 											<div style="float: right;"><input name="enter.x3" type="button" class="inp_L1" id="enter.x2" tabindex="4" onclick="window.location='<%=request.getContextPath()%>/security/SecuritySystemUsersRegist.do?verbId=registInit'" onmousedown="this.className='inp_L3'" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'" value='<bean:message key="home.jsp.login.body5" bundle="conf.home.Message"/>' /></div>		 --%>
		                               	</div>
	                               	</div>
	                               	 <!-- <div class="newfpsw" >
													<a href="security/securitysystemusers/find_password.jsp">忘记密码了?</a>
                                             </div> -->
                               </div>
										<%-- <table width="236" height="102" class="newtable" border="0" cellpadding="0" cellspacing="0" align="left" >
										    <tr >
												<td width="50" class="td_name" >
													<bean:message key="home.jsp.login.body1" bundle="conf.home.Message" />
												</td>
												<td width="186" class="td_input">
													<input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" onfocus="fEvent('focus',this)" tabindex="2" onmouseout="fEvent('mouseout',this)" type="text" value="<%=loginForm.getStaffCode()%>" maxlength="20" size="20" class="input_left" id="userId" name="staffCode" onkeyup="value=value.replace(/[^\d\w]/g,'')"  onkeypress="eventOnKeyPress('password')" />
												</td>
											</tr>
											<tr>
												<td class="td_name">
													<bean:message key="home.jsp.login.body2" bundle="conf.home.Message"/>
												</td>
												<td class="td_input">
													<input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" onfocus="fEvent('focus',this)" tabindex="2" onmouseout="fEvent('mouseout',this)" type="password" value="<%=loginForm.getPassword()%>" maxlength="20" size="20" class="password" id="passwd" name="password" onkeydown="if(event.keyCode == 13)<%=(verflag==1)?"eventOnKeyPress('loginVerCode');":" checkUser();" %> " />
												</td>
											</tr>
											<%if(verflag==1){
											%>	
											<tr>
												<td class="td_name">
													验证码：
												</td>
												<td align="left" class="td_input">
													<input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" onfocus="fEvent('focus',this)" tabindex="2" onmouseout="fEvent('mouseout',this)" type="text" value="" maxlength="20" size="20"  id="loginVerCode" name="loginVerCode" class="input_loginvercode" onkeydown="if(event.keyCode == 13)checkUser();" />
													<div style='display:inline-block;vertical-align:middle;width:50px;height:20px;overflow:hidden;border-right:1px solid black;border-bottom:1px solid black;'><img  id="loginVerCodeImage" src="<%=request.getContextPath()%>/genRandomCode"  onclick="this.src='<%=request.getContextPath()%>/genRandomCode?'+Math.random()" style="vertical-align:middle;"  /></div>
													
												</td>
											</tr>
											<% } %>
											<tr>
												<td height="22"></td>
												<td align="left" valign="bottom" class="tdLabel">
													<label style="float: left;"><input name="enter.x2" type="button" class="inp_L1" id="enter.x" tabindex="4" onclick="checkUser()" onmousedown="this.className='inp_L3'" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'" value='<bean:message key="home.jsp.login.body3" bundle="conf.home.Message"/>' /></label>
													<!--<label><input name="enter.x" type="reset" class="inp_L1" id="input_btn1" tabindex="4" onmousedown="this.className='inp_L3'" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'" value='<bean:message key="home.jsp.login.body4" bundle="conf.home.Message"/>' /></label> -->	
													<label style="float: right;"><input name="enter.x3" type="button" class="inp_L1" id="enter.x2" tabindex="4" onclick="window.location='<%=request.getContextPath()%>/security/SecuritySystemUsersRegist.do?verbId=registInit'" onmousedown="this.className='inp_L3'" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'" value='<bean:message key="home.jsp.login.body5" bundle="conf.home.Message"/>' /></label>
												</td>
											</tr>
										</table> --%>
                                            
                                        </div>
                                        <div id="full" class="vesion">
                                                                    <table width="212" border="0" align="center" cellpadding="0" cellspacing="0" >
                                                                        <tr>
                                                                            <td height="18">
                                                                                版权归北京天健科技集团所有
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="18">
                                                                                <img src="home/include/images/gg.png" alt="" width="12" height="12" />
                                                                                2015 ALL RIGHTS RESERVED
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                    </table>
                                                  
                                        </div>   
                              </div>
                                <div class="newrex"> </div>
			<input type="hidden" name="verbId" value="" />
		</form>
	</body>
</html>
