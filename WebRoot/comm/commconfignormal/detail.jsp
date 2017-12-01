<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commConfigNormal" scope="request" class="com.tianjian.comm.struts.form.CommConfigNormalForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
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
		    	var detailName=document.getElementById("detail").value+"详细信息";
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
		</script>
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
	<body>
		<form name="form" method="post">
			<input type="hidden" name="verbId" value="detail" />
			<div style="height:4px;"></div>
			<!-- <table width="100%" border="0" cellpadding="0" cellspacing="0"
				class="tblView" align="center">
				<tr>
					<td class="tblTitle" colspan="4"><bean:message
							key="comm.jsp.common.zycMessage" bundle="conf.comm.Comm" /></td>
				</tr>
				<tr>
					<td class="tblLable"><bean:message key="comm.jsp.common.item"
							bundle="conf.comm.Comm" />:</td>
					<td class="hou"><%=commConfigNormal.getItemCode()%></td>
					<td class="tblLable"><bean:message key="comm.jsp.common.names"
							bundle="conf.comm.Comm" />:</td>
					<td class="hou"><%=commConfigNormal.getItemName()%></td>
	
				</tr>
	
				<tr>
					<td class="tblLable"><bean:message key="comm.jsp.common.seqNo"
							bundle="conf.comm.Comm" />:</td>
					<td class="hou"><%=commConfigNormal.getSeqNo()%></td>
					<td class="tblLable"><bean:message
							key="comm.jsp.common.inputItemCode" bundle="conf.comm.Comm" />:</td>
					<td class="hou"><%=commConfigNormal.getInputCode()%></td>
				</tr>
				<tr>
					<td class="tblLable"><bean:message
							key="comm.jsp.common.comments" bundle="conf.comm.Comm" />:</td>
					<td class="hou" colspan="3"><%=commConfigNormal.getComments()%>
					</td>
				</tr>
			</table> -->
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'>代码</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigNormal.getItemCode()%>" type="text"
							class="text" readonly="readonly" />
						</td>
						<td class='crm_edit_item_name'>名称</td>
						<td class='crm_edit_item_content'><input id="detail" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigNormal.getItemName()%>" type="text"
							class="text" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>输入码</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigNormal.getInputCode()%>" type="text"
							class="text" readonly="readonly" />
						</td>
						<td class='crm_edit_item_name'>序号</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigNormal.getSeqNo()%>" type="text" class="text"
							readonly="readonly" />
						</td>
					</tr>
					
					<tr>
						<td class='crm_edit_item_name'>备注</td>
						<td class='textArea' colspan="3"><textarea onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
								class="crm_textarea_style" readonly="readonly"><%=commConfigNormal.getComments()%></textarea>
						</td>
					</tr>
				</table>
			</div>
			<!-- Sheet operation button area -->
		    <div class="crm_button_sub" id="btnSave">
		    <div class=" download_button_s1 left" onclick="QWPrint();" id="downprintarea" style="margin-left: 30px;">
					<img alt="" src="${path }/style/img/print.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="position: fixed;color: #fff;">打印</span>
				</div>
		  		 <input type="button"  name="btnBack" value="<bean:message key="comm.jsp.common.return" bundle="conf.comm.Comm"/>" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);" />
		  		              
		    </div>
		</form>
	</body>
</html>
