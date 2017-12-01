<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
  <head>
    <meta http-equiv="keywords" content=""/>
    <meta http-equiv="description" content=""/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>人员类别详细</title>
    <link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">

  	<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
  	<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
	<script type="text/javascript"	src="${path}/style/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
  	<script type="text/javascript" src="${path}/js/default.js"></script>
  	<script type="text/javascript" src="${path}/include/javascript/searchsuggest.js"></script>
  	<script type="text/javascript" src="${path}/js/enter_next.js"></script>
  	<script type="text/javascript" src="../js/jscal2.js"></script>
  	<script type="text/javascript" src="../js/lang/cn.js"></script>
  	
<style type="text/css">
.redlable{
	color:#FF0000;
	font-size:16px;
}
.crm_button_sub{
	margin-top: 10px;
	
}
.crm_textarea_style{
	width:87%;
	height:80px;
	border:1px #E0E0E0 solid;
	overflow-y:hidden;
}
</style> 	
<script type="text/javascript">
$(function () {//esayui验证
    $("input[type=text]").validatebox();//设置text需要验证
    $('select').validatebox();
    $('textarea').validatebox();
});
	function saveStafftype(){
		if(!$("#form").form("validate")){//先验证必填项等内容是否合理
			return false;
		}
		$.messager.confirm("操作提示", "确认保存吗？", function (data) {
	    	if (data) {
				document.getElementById("form").submit();
	     	}else {
	           return;
	        }
		});
	}
	function returnStafftype(){
	    window.location="commConfigStafftype.do?verbId=query";
	}
	window.onload=function(){
		var msg=$("#message").val();
		if(msg=="addOk")
			alert("保存成功");
	}
</script>
  </head>
  
  <body onload="showHspMessage('${commConfigStafftype.message}')">
  	  <form name="form" id="form" method="post" action="commConfigStafftype.do" enctype="multipart/form-data">
  	  <input type="hidden" name="verbId" value="add" />
  	  <input type="hidden" id="message" name="message" value="${commConfigStafftype.message}" />
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="itemCode" id="itemCode" 
      	  				value="${commConfigStafftype.itemCode }" readonly="readonly" 
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				class="text" required="true" /></td>
      	  		<td class='crm_edit_item_name'>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="itemName" id="itemName" 
      	  				value="${commConfigStafftype.itemName }" readonly="readonly"  
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				class="text" required="true"  validtype="length[1,40]" invalidMessage="有效长度1-40"/></td>
 	  		
      	  	</tr>      	  	
      	  
      	  	<tr>
      	  		<td class='crm_edit_item_name'>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="seqNo" id="seqNo" 
      	  				value="${commConfigStafftype.seqNo }"  readonly="readonly" 
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				class="text" validtype="length[0,25]" invalidMessage="有效长度0-25"/></td>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="comments" id="comments" 
      	  				value="${commConfigStafftype.comments }" readonly="readonly" 
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
						class="text" validtype="length[0,25]" invalidMessage="有效长度0-25"/></td>     	  		
      	  	</tr>
      	  </table>
      </div>
      <div class='crm_button_sub' align="center">
		<input type="button" value="返回" class="button_grey1_s0"
			 onmouseout="this.className='button_grey1_s0'"
			 onmousedown="this.className='button_grey1_s1'" onclick="returnStafftype();"/>
	  </div>

<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
	  </form>
  </body>
</html>
