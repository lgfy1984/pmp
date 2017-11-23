<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><%@ taglib prefix="c"
	uri="http://java.sun.com/jstl/core_rt"%>
<html>
	<head>
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<title>添加咨询信息</title>
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
		<link type="text/css" rel="stylesheet"
			href="${path}/style/default.css" />
		<link type="text/css" rel="stylesheet"
			href="${path}/style/consultion.css" />
		<link type="text/css" rel="stylesheet"
			href="${path}/include/css/searchsuggest.css" />

		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/icon.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyuiUpdate.css">
		<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script type="text/javascript" src="${path}/js/consultion.js"></script>
		<script type="text/javascript"
			src="${path}/include/javascript/searchsuggest.js"></script>
		<script type="text/javascript" src="${path}/js/enter_next.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${path}/style/voicewo.css">
		<script src="${path}/js/jquery.voicewo.js" type="text/javascript"></script>
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
		<form name="form" id="form" method="post" action="crmConsultation.do"
			enctype="multipart/form-data">
			<input type="hidden" name="verbId" value="add" />
			<input type="hidden" name="toFlog" value="" />
			<input type="hidden" name="fileFlog" value="" />

			<div class='crm_search_position'
				style='width: 870px; margin-left: 172px;'>
				<div class="crm_search_bar">
					<span style="color: #666666;">咨询知识库</span>
					<input type="text" class="search_text"
						style="width: 194px; height: 26px;" onblur="fEvent('blur',this)"
						onmouseover="fEvent('mouseover',this)"
						onfocus="fEvent('focus',this)"
						onmouseout="fEvent('mouseout',this)" name="keywordHidden"
						id="searchContent"
						onkeyup="GiveOptions(event, '${path}/searchSuggest.do', 'crmConsultationKnowledge_00000000001', 'keyWord')"
						onkeydown="huanhang(event);" />
					<input type="hidden" id="keyWord" name="keyWord"
						onkeydown="huanhang(event)" style="width: 206px;" />
					<span id="spanOutput" class="spanTextDropdown"
						style="display: none;" onclick="openWin();"></span>
					<input type="button" value="查询" class="button_grey1_s0"
						onmousedown="this.className='button_grey1_s1'"
						onmouseout="this.className='button_grey1_s0'" onclick="openWin();">
				</div>
			</div>
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
							<input type="text" name="project" id="name" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />

						</td>
					</tr>
					<tr>


						<td class='crm_edit_item_name'>
							项目名称
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="name" id="name" class="text"
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
							<input type="text" name="name" id="name" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 项目经理
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="name" id="name" class="text"
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
							<input type="text" name="name" id="name" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							项目上线日期
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="name" id="name" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 项目结束日期
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="name" id="name" class="text"
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
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
  	   if($('#tel').val()!=''){
  		 findHistory();
  	   }
  </script>
	</body>
</html>
