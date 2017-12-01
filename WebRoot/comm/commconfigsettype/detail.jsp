<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="commConfigSettype" scope="request" class="com.tianjian.comm.struts.form.CommConfigSettypeForm" />
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
		<script language="javascript">
 			function QWPrint(){
			     if(document.all.PrintActiveX == undefined || document.all.PrintActiveX ==null){
					document.body.innerHTML="<object id=\"PrintActiveX\" style=\"display: none\" classid=\"clsid:3ede745c-4adb-42a6-ab25-5621edbdfd6b\" codebase=\"<%=request.getContextPath()%>/include/QWPrint.cab#version=1,3,8,2\" ></object>" + document.body.innerHTML;
				}
		        PrintActiveX.pageName = "A4"; //设置纸张类型
	            //设置页眉页脚
	            
				printed = true;
			    document.getElementById("budiv").style.display="none";
			       document.getElementById("editDiv").style.display="none";
			    PrintActiveX.PrintView();
			    document.getElementById("budiv").style.display="block";
			      document.getElementById("editDiv").style.display="block";
	   
	  		}
	  		</script>
	  		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${path}/js/default.js"></script>
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
			<input type="hidden" name="verbId" value="detail">
			<!-- <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblView" align="center">
				<tr>
					<td class="tblTitle" colspan="4">
						设置主办单位字典详细信息
						<div id="editDiv"> <img src="include/images/print.gif" width="14" height="14" /><a href="javascript:QWPrint();"> 打印</a></div>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.code"/>
					</td>
					<td class="hou">
						<%=commConfigSettype.getItemCode()%>
					<td class="tblLable" nowrap>
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.name"/>
					</td>
					<td class="hou">
						<%=commConfigSettype.getItemName()%>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.seqNo"/>
					</td>
					<td class="hou">
						<%=commConfigSettype.getSeqNo()%>
					</td>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.inputCode"/>
					</td>
					<td class="hou">
						<%=commConfigSettype.getInputCode()%>
					</td>
				</tr>
				<tr>
					<td class="tblLable">
						<bean:message  bundle="comm.commLocale" key="comm.jsp.commom.comments"/>
					</td>
					<td class="hou" colspan="3">
						<%=commConfigSettype.getComments()%>
					</td>
				</tr>
			</table> -->
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'>代码</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigSettype.getItemCode()%>" type="text"
							class="text" readonly="readonly" />
						</td>
						<td class='crm_edit_item_name'>名称</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigSettype.getItemName()%>" type="text"
							class="text" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>输入码</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigSettype.getInputCode()%>" type="text"
							class="text" readonly="readonly" />
						</td>
						<td class='crm_edit_item_name'>序号</td>
						<td class='crm_edit_item_content'><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							value="<%=commConfigSettype.getSeqNo()%>" type="text" class="text"
							readonly="readonly" />
						</td>
					</tr>
					
					<tr>
						<td class='crm_edit_item_name'>备注</td>
						<td class='textArea' colspan="3"><textarea onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
								class="crm_textarea_style" readonly="readonly"><%=commConfigSettype.getComments()%></textarea>
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
		    	 <!-- <input type="button"  name="btn" value="打印"  class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="QWPrint();" /> -->
		  		 <input type="button"  name="btnBack" value="<bean:message key="comm.jsp.common.return" bundle="conf.comm.Comm"/>" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);" />
		  		             
		    </div>
		</form>
	</body>
</html>
