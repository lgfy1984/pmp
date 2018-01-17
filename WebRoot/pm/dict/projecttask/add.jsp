<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<!DOCTYPE html><%@ taglib prefix="c"	uri="http://java.sun.com/jstl/core_rt"%>
<jsp:useBean id="commConfigNormal" scope="request" class="com.tianjian.comm.struts.form.CommConfigNormalForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title>人员类别添加</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.comm.message" bundle="conf.comm.Comm"/>"></script>
		<script language="javascript" src="<bean:message key="includes.js.validator.path" bundle="security" />" defer="defer"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
				<script language="javascript">
		function saveForm(){
			if(!Validator.Validate(document.forms.form,3)){
		      return ;
		   }
			if(isNaN(document.form.itemCode.value)){
				$.messager.alert('提示','项目代码只能为数字，请重新输入');
			 	return true;
			}
			if(trim(document.form.itemName.value) == ""){
			 	$.messager.alert('提示','名称不能为空');
			 	return ;
			}
			if(trim(document.form.itemCode.value) == ""){
				$.messager.alert('提示','代码不能为空'); 
				return ;
				
			}
			     
			    document.form.verbId.value = "add";    
			    document.form.submit(); 
		     
			}
		function showHspMessage(message){
						if(message != ''&& message != null){
							$.messager.alert('提示',message);
							return;
						}
					}
		function trim(str){  //删除左右两端的空格
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
		</script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/icon.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
			<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
		<style type="text/css">
		.redlable {
			color: #FF0000;
			font-size: 16px;
		}
		
		.crm_button_sub {
			margin-top: 10px;
			margin-left: 40%;
		}
		
		.crm_textarea_style {
			width: 87%;
			height: 80px;
			border: 1px #E0E0E0 solid;
			overflow-y: hidden;
		}
		</style>
	</head>
	<body onload="showHspMessage('${data.message}')" >
		<form name="form" method="post" action= "pm/projecttask.do" >
		
		<input type="hidden" name="verbId" value="add" />
		<div style="height:4px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="itemCode" id="itemCode" size="20"
							maxlength="32" onkeypress="eventOnKeyPress('itemName')" max="32"
							dataType="LimitB" msg="代码输入过长"
							value="" />
						</td>
						<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
						<td class='crm_edit_item_content'><input class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							type="text" class="kuandu" name="itemName" size="20" maxlength="9"
							onkeypress="eventOnKeyPress('seqNo')" max="40" dataType="LimitB"
							msg="名称输入过长" value="" /></td>
					</tr>
					<tr>
					   <td class='crm_edit_item_name' >
							项目类别
						</td>
						<td class='crm_edit_item_content'>
						<select name="itemClass" id="itemClass"
								class="easyui-combobox" editable="false"
								style="width: 206px; height: 30px;" required="true"
								panelHeight="100">
								<c:forEach items="${data.projectClass}" var="kd">
									<option value="${kd.key}" ${data.itemClass==kd.key?"selected":""}>
										${kd.value}
									</option>
								</c:forEach>
							</select>
		  		
						</td>
						<td class='crm_edit_item_name'>备注</td>
						<td class='crm_edit_item_content' colspan="3"><input onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" 
							class="text" type="text" class="kuandu" name="comments"
							id="comments" size="20" maxlength="20"
							value=""
							onkeypress="eventOnKeyPress('btnSaveForm')" max="40"
							dataType="LimitB" msg="备注输入过长" /></td>
					</tr>
				</table>
			</div>
			<!-- Sheet operation button area -->
			<div class='crm_button_sub'>
				<input type="button" name="btnSaveForm" value="保存"
					class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveForm();" /> 
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"
					onclick="history.go(-1);" />
			</div>
		</form>
	</body>
</html>
		  
 <!--  <body onload="showHspMessage('${commConfigStafftype.message}')">
  	  <form name="form" id="form" method="post" action="commConfigStafftype.do" enctype="multipart/form-data">
  	  <input type="hidden" name="verbId" value="add" />
  	  <input type="hidden" id="message" name="message" value="${commConfigStafftype.message}" />
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'><input type="text" name="itemCode" id="itemCode" class="text" required="true"  validtype="length[1,8]" invalidMessage="有效长度1-8"/></td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'><input type="text" name="itemName" id="itemName" class="text" required="true"  validtype="length[1,40]" invalidMessage="有效长度1-40"/></td>
 	  		
      	  	</tr>      	  	
      	  
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'><input type="text" name="seqNo" id="seqNo" value="${commConfigStafftype.seqNo }" class="text" validtype="length[0,25]" invalidMessage="有效长度0-25"/></td>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'><input type="text" name="comments" id="comments" class="text" validtype="length[0,25]" invalidMessage="有效长度0-25"/></td>     	  		
      	  	</tr>
      	  </table>
      </div>
      <div class='crm_button_sub'>
		<input type="button" value="保存" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'" onclick="saveStafftype();"/>
		<input type="button" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="returnStafftype();"/>
	  </div>

<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
	  </form>
  </body>
</html> -->
