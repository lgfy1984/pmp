<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commConfigProfession" scope="request" class="com.tianjian.comm.struts.form.CommConfigProfessionForm" />
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
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<%--<link rel="stylesheet" rev="stylesheet" href="comm/include/css/comm_detail.css" />--%>
    	<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	  
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">	
		<script type="text/javascript" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/js/LodopFuncs.js"></script>
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
		<script type="text/javascript">
			function print(){
				 var title="专业字典("+$("table tr td:eq(3) input").val()+")详情";
				 var lodop= getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),title);
					//document.getElementById("btnSave").style.display="none";
					lodop. ADD_PRINT_table(60,0,"100%","100%",document.documentElement.innerHTML);
					//lodop.print();
					lodop.PREVIEW();
					//document.getElementById("btnSave").style.display="block";
			 }
		</script>
	</head>
	<body>
		<form name="form" method="post">
			<input type="hidden" name="verbId" value="detail">
		<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
		<table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigProfession.getItemCode() %>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigProfession.getItemName() %>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly">
			    </td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigProfession.getSeqNo() %> " type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>输入码</td>
      	  		<td class='crm_edit_item_content'>
			      <input value="<%=commConfigProfession.getInputCode() %>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
			    </td>       	  		
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='textArea' colspan="3">
      	  			<textarea class="crm_textarea_style" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly"><%=commConfigProfession.getComments() %></textarea>
			    </td>       	  		
      	  	</tr>
      	  </table>
      </div>
      <div class='crm_button_sub'>
      <div class=" download_button_s1 left" onclick="print();" id="downprintarea" style="margin-left: 30px;">
					<img alt="" src="${path }/style/img/print.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="position: fixed;color: #fff;">打印</span>
				</div>
		<input type="button" id="btnBack" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
		<%--<input type="button" name="btn" value="打印" class="button_green1_s1" onclick="QWPrint();"/>--%>
	  </div>
	  <!--zyc--add--e-->

			<%--<table border="0" cellspacing="1" cellpadding="0" class="table">
				<tr>
					<td class="biaoti" colspan="4" nowrap>
						<bean:message key="comm.jsp.common.zyzdMessage" bundle="conf.comm.Comm"/>
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.item" bundle="conf.comm.Comm"/>
					</td>
					<td class="hou" nowrap>
						<%=commConfigProfession.getItemCode()%>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.names" bundle="conf.comm.Comm"/>
					</td>
					<td class="hou" nowrap>
						<%=commConfigProfession.getItemName()%>
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.seqNo" bundle="conf.comm.Comm"/>
					</td>
					<td class="hou" nowrap>
						<%=commConfigProfession.getSeqNo()%>
					</td>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.inputItemCode" bundle="conf.comm.Comm"/>
					</td>
					<td class="hou" nowrap>
						<%=commConfigProfession.getInputCode()%>
					</td>
				</tr>
				<tr>
					<td class="qian" nowrap>
						<bean:message key="comm.jsp.common.comments" bundle="conf.comm.Comm"/>
					</td>
					<td class="hou" nowrap>
						<%=commConfigProfession.getComments()%>
					</td>
					<td class="qian" nowrap>
					</td>
					<td class="hou" nowrap>
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="30" align="center">
						<input type="button" name="btnBack" value="<bean:message key="comm.jsp.common.return" bundle="conf.comm.Comm"/>" onClick="history.go(-1);" />
					</td>
				</tr>
			</table>
		--%></form>
	</body>
</html>
