<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="commConfigEconkind" scope="request" class="com.tianjian.comm.struts.form.CommConfigEconkindForm" />
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
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
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
			text-align:center;
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
			<div style="height:4px;"></div>
			<!--  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblView" align="center">
				<tr>
					<td class="tblTitle" colspan="4">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigeconkinddetail.text12"/>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/>:
					</td>
					<td class="hou">
						<%=commConfigEconkind.getItemCode()%>
					<td class="tblLable" nowrap>
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/>:
					</td>
					<td class="hou">
						<%=commConfigEconkind.getItemName()%>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>:
					</td>
					<td class="hou">
						<%=commConfigEconkind.getSeqNo()%>
					</td>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.inputCode"/>:
					</td>
					<td class="hou">
						<%=commConfigEconkind.getInputCode()%>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.comments"/>:
					</td>
					<td class="hou" colspan="3">
						<%=commConfigEconkind.getComments()%>
					</td>
				</tr>
			</table>-->
				<!-- Sheet operation button area -->
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'>代码</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigEconkind.getItemCode()%>" type="text"
							class="text" readonly="readonly" /></td>
						<td class='crm_edit_item_name'>名称</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigEconkind.getItemName()%>" type="text"
							class="text" readonly="readonly"/></td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>输入码</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigEconkind.getInputCode()%>" type="text"
							class="text" readonly="readonly" /></td>
						<td class='crm_edit_item_name'>序号</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigEconkind.getSeqNo()%>" type="text"
							class="text" readonly="readonly" /></td>
					</tr>
	
					<tr>
						<td class='crm_edit_item_name'>备注</td>
						<td class='textArea' colspan="3"><textarea
								class="crm_textarea_style" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly"><%=commConfigEconkind.getComments()%></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class='crm_button_sub' >
				<%--<input type="button"  name="btn" value="打印" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="QWPrint();" />
				--%><input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	 		</div>
		</form>
	</body>
</html>
