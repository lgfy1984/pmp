<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="commConfigEmptitle" scope="request" class="com.tianjian.comm.struts.form.CommConfigEmptitleForm" />
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
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
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
	 var title="专业技术职务字典("+$("table tr td:eq(3) input").val()+")详情";
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
      	  		  <input value="<%=commConfigEmptitle.getItemCode() %>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigEmptitle.getItemName() %>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly">
			    </td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigEmptitle.getSeqNo() %> " type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>输入码</td>
      	  		<td class='crm_edit_item_content'>
			      <input value="<%=commConfigEmptitle.getInputCode() %>" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="text" readonly="readonly"/>
			    </td>       	  		
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='textArea' colspan="3">
      	  			<textarea class="crm_textarea_style" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly"><%=commConfigEmptitle.getComments() %></textarea>
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
		
	  </div>
	  <!--zyc--add--e-->
			
			<%--<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblView" align="center">
				<tr>
					<td class="tblTitle" colspan="4">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commconfigemptitledetail.text69"/>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/>:
					</td>
					<td class="hou">
						<%=commConfigEmptitle.getItemCode()%>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/>:
					</td>
					<td class="hou">
						<%=commConfigEmptitle.getItemName()%>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>:
					</td>
					<td class="hou">
						<%=commConfigEmptitle.getSeqNo()%>
					</td>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.inputCode"/>:
					</td>
					<td class="hou">
						<%=commConfigEmptitle.getInputCode()%>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.comments"/>:
					</td>
					<td class="hou" colspan="3">
						<%=commConfigEmptitle.getComments()%>
					</td>
				</tr>
			</table>
			<!-- Sheet operation button area -->
			<div class="btnSave">
				<input type="button"  name="btnBack" value="<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.back"/>" onClick="history.go(-1);" />
			</div>
		--%></form>
	</body>
</html>
