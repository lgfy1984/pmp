<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><%@ taglib prefix="c"
	uri="http://java.sun.com/jstl/core_rt"%>
<html>
	<head>
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<title>添加信息</title>
<link type="text/css" rel="stylesheet" href="${path}/style/default.css" />
<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet"	href="${path}/include/css/searchsuggest.css" />
<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"	href="${path}/style/easyuiUpdate.css">
<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${path}/js/default.js"></script>
<script type="text/javascript" src="${path}/js/pm.js"></script>
<script type="text/javascript"	src="${path}/include/javascript/searchsuggest.js"></script>
<script type="text/javascript" src="${path}/js/enter_next.js"></script>
<script type="text/javascript" src="${path}/js/jscal2.js"></script>
<script type="text/javascript" src="${path}/js/lang/cn.js"></script>
<style type="text/css">
.voice_button {
	position: relative;
	float: right;
	right: 60px;
	top: 1px;
	width: 24px;
	height: 24px;
}
</style>
		<script type="text/javascript">
  	/**查找电话号码历史 */
  	function findHistory(){
  		$.ajax({
  	        type: "post",
  	        url: "crmConsultation.do?verbId=queryRecentByTel",
  	        data: {"telphone":$('#tel').val()},
  	        dataType: "JSON",
  	        success: function(data){
  	        	var json =eval(data); 
  	        	if(json!=null&&json.length>0){
  	        		$("#name").val(json[0].name);
  	        		$('#sexId').combobox('setValue',json[0].sexId);
  	        		if(json[0].id.length>0)
  	        		parent.window.getHistoryConsultation(json,"0");
  	        	}else{
  	        		parent.window.clearnHistorydate();
  	        		parent.window.hideHistoryData();
  	        	}
  	           }
  	    });
  	}
  	/**转投诉 */
  	function toComplaints(){
  		var name=$("#name").val();
  		var tel=$("#tel").val();
  		window.parent.openOtherWindow('asd1234asd566543','投诉登记','complaints.do?verbId=add&name='+name+'&incomingTelegramNo='+tel);
  	  	}
  	  	
  	/**转预约 */
  	function  goReservationRegister(){
  		var authorityId='';
  	  	var pid='';
  	  if($('#tel').val()==""){
			$.messager.alert('提示','电话不能为空！','info');
			return;
		}
  	window.parent.openOtherWindow('sda1234sda566543','预约挂号','reservation/phoneUser.do?verbId=phoneUserList&phoneNo='+$('#tel').val());
	
  	  	
  	}
  	 
  	</script>
	</head>

	<body onload="showHspMessage('${data.message}')">
		<form name="form" id="form" method="post" action="projectbaseinfo.do">
			<input type="hidden" name="verbId" id="verbId" value="add" />
			<input type="hidden" name="toFlog" value="" />
			<input type="hidden" name="fileFlog" value="" />

			<div class="clear"></div>
			<div style="height: 20px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'>
							<label class="redlable">
								*
							</label>
							项目编号
						</td>

						<td colspan="3" class='crm_edit_item_content'>
							<input type="text" name="projectCode" id="projectCode" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />

						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>
							<label class="redlable">
								*
							</label>
							项目名称
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="projectName" id="projectName" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							<label class="redlable">
								*
							</label>
							项目类别
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<select name="projectClassCode" id="projectClassCode"
								class="easyui-combobox" editable="false"
								style="width: 206px; height: 30px;" required="true"
								panelHeight="100">
								<c:forEach items="${data.projectClass}" var="kd">
									<option value="${kd.key}" ${data.projectClassCode==kd.key?"selected":""}>
										${kd.value}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 项目经理
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="staffName" id="staffName" class="text"
							    value='${data.createUserName}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							项目开始日期
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="startTime" id="startTime" class="text"
							    value='${data.startTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							项目上线日期
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="onlineTime" id="onlineTime" class="text"
							    value='${data.onlineTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input2" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 项目结束日期
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="endTime" id="endTime" class="text"
							    value='${data.endTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input3" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
					</tr>
				</table>
			</div>
			<div class='crm_button_sub'>
				<input type="button" value="保存" class="button_blue1_s0"
					onmousedown="this.className='button_blue1_s1'"
					onmouseout="this.className='button_blue1_s0'"
					onclick="saveForm('0');" />
			</div>
		</form>
		<script type="text/javascript">
		var cal = Calendar.setup({            //日期控件
		onSelect : function(cal) {
			cal.hide()
		},
		showTime : true
	});
	cal.manageFields("date_input1", "startTime", "%Y-%m-%d");
	cal.manageFields("date_input2", "onlineTime", "%Y-%m-%d");
	cal.manageFields("date_input3", "endTime", "%Y-%m-%d");
  </script>
	</body>
</html>
