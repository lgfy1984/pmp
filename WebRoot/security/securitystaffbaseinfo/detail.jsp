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
				key="security.jsp.securitystaffbaseinfo.detail.title"
				bundle="security" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link type="text/css" rel="stylesheet"
			href="${path}/style/default.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/border-radius.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/steel/steel.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
			
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/icon.css">
		
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>		
		
		<script language="javascript" src="${path}/js/LodopFuncs.js"></script>
		<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
			<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
		</object>
		
		<script language="javascript">
		    function QWPrint(){
	    		var detailName=document.getElementById("detailName").value+"个人详细信息";
		    	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),detailName);
		    	if(LODOP!=undefined){
		    		//table表格信息
		    		LODOP.ADD_PRINT_TABLE(60,0,"100%","100%",document.documentElement.innerHTML);		    		
		    		
		    		document.getElementById("btnSave").style.display="none";
		    		//执行打印
		    		LODOP.PREVIEW();
		    		//LODOP.PRINT();
		    		document.getElementById("btnSave").style.display="block";
		    	}else{
		    		$.messager.alert("操作提示", "打印环境异常,请稍后!","error");
		    	}	   
	  		}
	  		function goBack(){
			location.href = "<%=request.getContextPath()%>/security/securityStaffBaseinfo.do?verbId=init&navtext=操作员管理主菜单-操作人员查询";
		}
		</script>
	</head>
	<body>
		<form name="form" method="post"
			action="security/securityStaffBaseinfo.do">
			<input type="hidden" name="verbId" value="add" />
			<input type="hidden" name="id"
				value="<%=securityStaffBaseinfo.getId()%>" />
			<input type="hidden" name="message"
				value="<%=securityStaffBaseinfo.getMessage()%>" />
			<div class='crm_edit_panel'>
				<table  class='crm_panel_table' cellspacing=1>

					<!-- <tr>
					<td  class="tblLable">
						<bean:message key="security.jsp.commom.staffCode" bundle="security"/>：
					</td>
					<td class="td_col3" colspan="3">
						<%=securityStaffBaseinfo.getStaffCode()%>
					</td>
				</tr> -->
				<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.staffCode"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content" 　style="width: 30%">
							<input type="text" name="name" size="20" class="text"
								maxlength="40" onkeypress="eventOnKeyPress('name')" max="40"
								dataType="LimitB" readonly="readonly"
								value="<%=securityStaffBaseinfo.getStaffCode()%>" />
						</td>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.name" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content" style="width: 30%">
							<input id="detailName" type="text" name="name" size="20" class="text"
								maxlength="40"
								onkeypress="eventOnKeyPress('hspConfigBaseinfoName')" max="40"
								dataType="LimitB" msg="姓名输入过长" readonly="readonly"
								value="<%=securityStaffBaseinfo.getName()%>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.hspConfigBaseinfoName"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content" >
							<input type="text" id="displayInputId_1"
								name="hspConfigBaseinfoName" readonly="readonly"
								value="<%=securityStaffBaseinfo.getHspConfigBaseinfoName()%>"
								readonly="true" onkeypress="eventOnKeyPress('nameEn')"
								class="text" />
						</td>


						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.nameEn" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" onkeyup="value=value.replace(/[^\''\w]/g,'')"
								name="year" onkeypress="eventOnKeyPress('idNo')" maxlength="40"
								class="text" onkeydown="huiche()" max="40" dataType="LimitB"
								readonly="readonly"
								value="<%=securityStaffBaseinfo.getNameEn()%>" />
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
								onkeydown="huiche()" readonly="readonly"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')" id="statYear"
								maxlength="4" />
							<bean:message key="security.jsp.commom.Year" bundle="security" />
							&nbsp;
							<input type="text" name="month" class="text"
								onkeypress="eventOnKeyPress('day')" readonly="readonly"
								value="<%=securityStaffBaseinfo.getMonth()%>"
								onkeydown="huiche()" style="width: 30px;"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')" maxlength="2" />
							<bean:message key="security.jsp.commom.month" bundle="security" />
							&nbsp;
							<input type="text" name="day" class="text"
								onkeypress="eventOnKeyPress('email')" style="width: 30px;"
								readonly="readonly" value="<%=securityStaffBaseinfo.getDay()%>"
								onkeydown="huiche()"
								onkeyup="value=value.replace(/[^\d]|\\.{1}/g,'')" maxlength="2" />
							<bean:message key="security.jsp.commom.day" bundle="security" />
						</td>


						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.commConfigSexId"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="email" name="email" class="text" max="100"
								dataType="LimitB" msg="邮箱输入过长" maxlength="100"
								onkeypress="eventOnKeyPress('commConfigSexId')"
								readonly="readonly"
								value="<%=securityStaffBaseinfo.getCommConfigSexName()%>" />

						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.securitystaffbaseinfo.commom1"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="email" name="email" class="text" max="100"
								dataType="LimitB" msg="邮箱输入过长" maxlength="100"
								onkeypress="eventOnKeyPress('commConfigSexId')"
								readonly="readonly"
								value="<%=securityStaffBaseinfo.getEmail()%>" />
						</td>

						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.idNo" bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">

							<input type="text" id="email" name="email" class="text" max="100"
								dataType="LimitB" maxlength="100" readonly="readonly"
								onkeypress="eventOnKeyPress('commConfigSexId')"
								value="<%=securityStaffBaseinfo.getIdNo()%>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.commConfigStafftypeId"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" msg="手机号输入过长" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getCommConfigStafftypeName()%>" />
						</td>

						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.islocation"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getIslocationName()%>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commom.mobilecode"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getPhone()%>" />
						</td>

						<td class="crm_edit_item_name">
							注册码
						</td>
						<td class="crm_edit_item_content">

							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getRegistCode() %>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							注册码生成时间
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								readonly="readonly" onblur="checkcell()" maxlength="40"
								class="text" max="40" dataType="LimitB"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getRegTime() %>" />
						</td>

						<td class="crm_edit_item_name">
							激活时间
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getStartTime() %>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							有效截止日期
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="mobilecode" name="phone"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getStopDate() %>" />
						</td>
						<td class="crm_edit_item_name">
							人员费用类别
						</td>
						<td class="crm_edit_item_content">
							<input type="text" id="commConfigStaffChargeTypeName" name="commConfigStaffChargeTypeName"
								onblur="checkcell()" maxlength="40" class="text" max="40"
								dataType="LimitB" readonly="readonly"
								onkeypress="eventOnKeyPress('stopDate')"
								value="<%=securityStaffBaseinfo.getCommConfigStaffChargeTypeName() %>" />
						</td>
					</tr>
					<tr>
						<td class="crm_edit_item_name">
							<bean:message key="security.jsp.commmom.comments"
								bundle="security" />
							
						</td>
						<td class="crm_edit_item_content" colspan="3">
							<textarea name="comments" max="100" dataType="LimitB"
								class="textarea_w" readonly="readonly" msg="备注输入过长"
								id="comments" cols="45" rows="5"><%=securityStaffBaseinfo.getComments()%></textarea>
						</td>
					</tr>
					<tr>
					</tr>
					<!--<tr>
					<td class="tdLeft">
						<bean:message key="security.jsp.commom.homePageType" bundle="security"/>：
					</td>
					<td class="tdRight">
						<%if(securityStaffBaseinfo.getHomePageType().equals("1")){
							%>
							<bean:message key="security.jsp.commom.item8" bundle="security"/>
							<%
						}%>
						<%if(securityStaffBaseinfo.getHomePageType().equals("2")){
							%>
							<bean:message key="security.jsp.commom.item9" bundle="security"/>
							<%
						}%>
						<%if(securityStaffBaseinfo.getHomePageType().equals("3")){
							%>
							<bean:message key="security.jsp.commom.item10" bundle="security"/>
							<%
						}%>
					</td>
				</tr>-->
				</table>
			</div>
			<div class="horizontal_line_8"></div>
			<div class="crm_title_item" align="center">
				<bean:message
					key="security.jsp.securitystaffbaseinfo.detail.userName"
					bundle="security" />
				
				<font style="color: #0060BF;"><%=securityStaffBaseinfo.getCreateUserName()%></font>&nbsp;&nbsp;&nbsp;&nbsp;
				<bean:message
					key="security.jsp.securitystaffbaseinfo.detail.recordDate"
					bundle="security" />
				
				<%
					if(securityStaffBaseinfo.getCreateDateYear() != null && securityStaffBaseinfo.getCreateDateYear().length() > 0){
				 %>
				<font style="color: #0060BF;"><%=securityStaffBaseinfo.getCreateDateYear()%>-<%=securityStaffBaseinfo.getCreateDateMonth()%>-<%=securityStaffBaseinfo.getCreateDateDay()%></font>&nbsp;&nbsp;
				<%
					}
				 %>
			</div>
			<div class="horizontal_line_10"></div>
			<div class="crm_button_sub" id="btnSave" align="center">
			 <div  class=" download_button_s1 left" onclick="QWPrint();" id="downprintarea" style="margin-left: 300px;">
					<img alt="" src="${path }/style/img/print.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="color: #fff;">打印</span>
					</div>
					<input type="button" name="btnBack"class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
						value="<bean:message key="security.jsp.commom.button2" bundle="security"/>"
						onclick="goBack();" />
			</div>
		</form>
	</body>
</html>
