<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<jsp:useBean id="data" scope="request" class="com.tianjian.comm.struts.form.CommConfigFtManageForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/"/>
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"/>
		<%}%>
		<title><bean:message key="comm.jsp.different.text15" bundle="conf.comm.comm"/>DETAIL.JSP</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<script language="javascript">
			function goBack(){
				document.form.verbId.value="query";
				document.form.submit();
			}
		</script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	 
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
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

	<body>
		<form name="form" method="post">
			<input type="hidden" name="verbId" value="detail" />
			<!-- <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblView" align="center">
				<tr>
					<td class="tblTitle" colspan="4">
						<bean:message key="comm.jsp.different.text14" bundle="conf.comm.comm"/>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="comm.jsp.common.text10" bundle="conf.comm.comm"/>
					</td>
					<td class="hou">
						<%=data.getItemCode() %>
					<td class="tblLable" nowrap>
						<bean:message key="comm.jsp.common.text29" bundle="conf.comm.comm"/>
					</td>
					<td class="hou">
						<%=data.getItemName() %>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="comm.jsp.common.text48" bundle="conf.comm.comm"/>
					</td>
					<td class="hou">
						<%=data.getSeqNo() %>

					</td>
					<td class="tblLable">
						<bean:message key="comm.jsp.common.text38" bundle="conf.comm.comm"/>
					</td>
					<td class="hou">
						<%=data.getInputCode() %>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message key="comm.jsp.common.text4" bundle="conf.comm.comm"/>
					</td>
					<td class="hou" colspan="3">
						<%=data.getComments() %>
					</td>
				</tr>
			</table> -->
			<div class='crm_edit_panel'>
			<table class='crm_panel_table'>
				<tr>
					<td class='crm_edit_item_name'>代码</td>
					<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						value="<%=data.getItemCode()%>" type="text"
						class="text" readonly="readonly" />
					</td>
					<td class='crm_edit_item_name'>名称</td>
					<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						value="<%=data.getItemName()%>" type="text"
						class="text" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class='crm_edit_item_name'>序号</td>
					<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						value="<%=data.getSeqNo()%>" type="text" class="text"
						readonly="readonly" />
					</td>
					<td class='crm_edit_item_name'>输入码</td>
					<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
						value="<%=data.getInputCode()%>" type="text"
						class="text" readonly="readonly" />
					</td>
					
				</tr>
				
				<tr>
					<td class='crm_edit_item_name'>备注</td>
					<td class='textArea' colspan="3"><textarea
							class="crm_textarea_style" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly"><%=data.getComments()%></textarea>
					</td>
				</tr>
			</table>
			</div>

			<!-- Sheet operation button area -->
			<div class='crm_button_sub'>
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
	 		</div>
		</form>
	</body>
</html>