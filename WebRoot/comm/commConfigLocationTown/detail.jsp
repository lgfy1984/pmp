<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommConfigLocationTownForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title><bean:message key="comm.jsp.common.tllocationMessage" bundle="conf.comm.Comm"/>detail.jsp</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<%--<link rel="stylesheet" rev="stylesheet" href="comm/include/css/comm_detail.css" />--%>
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
	height:24px;
	line-height:24px;
	border:1px #E0E0E0 solid;
	overflow-y:hidden;
}
</style>
	</head>

	<body onload="document.form.btnBack.focus();">
		<form name="form" method="post">
			<input type="hidden" name="verbId" value="detail"/>
			<input type="hidden" name="id" value="<%=data.getId()%>" />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>所属省</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=data.getCommConfigLocationName1()%>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>所属市</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=data.getCommConfigLocationName2()%>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly">
			    </td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>所属县</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=data.getCommConfigLocationName3()%>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>序号</td>
      	  		<td class='crm_edit_item_content'>
			      <input value="<%=data.getSeqNo()%>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
			    </td>       	  		
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=data.getItemCode()%>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>名称</td>
      	  		<td class='crm_edit_item_content'>
			      <input value="<%=data.getItemName()%>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
			    </td>       	  		
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='textArea' colspan="3">
      	  			<textarea class="crm_textarea_style" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly"><%=data.getComments() %></textarea>
			    </td>       	  		
      	  	</tr>
      	  </table>
      </div>
      <div class='crm_button_sub'>
		<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	  </div>
	  <!--zyc--add--e-->
			<%--<table border="0" cellspacing="1" cellpadding="0" class="table" align="center">
				<tr>
					<td class="biaoti" colspan="4">
						<bean:message key="comm.jsp.common.tlMessage" bundle="conf.comm.Comm"/>
					</td>
				</tr>				
				<tr>
					<td class="qian">
						<bean:message key="comm.jsp.common.province" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getCommConfigLocationName1()%>
					</td>
					<td class="qian">
						<bean:message key="comm.jsp.common.city" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getCommConfigLocationName2()%>
					</td>
				</tr>
				<tr>
					<td class="qian">
						<bean:message key="comm.jsp.common.town" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getCommConfigLocationName3()%>
					</td>

					<td class="qian">
						<bean:message key="comm.jsp.common.seqNo" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getSeqNo()%>
					</td>
				</tr>
				<tr>
					<td class="qian">
						<bean:message key="comm.jsp.common.item" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getItemCode()%>
					</td>
					<td class="qian">
						<bean:message key="comm.jsp.common.names" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getItemName()%>
					</td>
				</tr>
				<tr>
					<td class="qian">
						<bean:message key="comm.jsp.common.comments" bundle="conf.comm.Comm"/>：
					</td>
					<td class="hou">
						<%=data.getComments() %>
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
						<input type="button" name="btnBack" value="<bean:message key="comm.jsp.common.return" bundle="conf.comm.Comm"/>" onclick="history.go(-1);" />
					</td>
				</tr>
			</table>
		--%></form>
	</body>
</html>
