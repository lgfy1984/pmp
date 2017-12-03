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
  <script type="text/javascript" src="${path}/js/pager.js"></script>
<script type="text/javascript" src="${path}/js/work.js"></script>
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
 //已选择的短信用户
var selectUsersData = new Array(); 	 
function findProjectList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目',
	    width: 820,
	    height: 450,
	    top: ($(window).height()-300) * 0.5,
	    left: ($(window).width()-800) * 0.5,
	    shadow: true,
	    modal: true,
	    closed: true,
	    minimizable: false,
	    maximizable: false,
	    collapsible: false
	});

	$('#win').window('open'); 
	
	var projectCodeCase=$('#projectCodeCase').val();
	var projectNameCase=$('#projectNameCase').val();
	var timeCase=$('#timeCase').val();
	var pageIndex = page;
	var path = '${path}/pm/projectwork.do?verbId=findProjectList&pageIndex='
			+ pageIndex + '&projectCodeCase=' + projectCodeCase+ '&projectNameCase=' + projectNameCase+ '&timeCase=' + timeCase;
	$.ajax({
		type : "post",
		url : '${path}/pm/projectwork.do?verbId=findProjectPage',
		data : {
			pageIndex:pageIndex,
			projectCodeCase:projectCodeCase,
			projectNameCase:projectNameCase,
			timeCase:timeCase
		},
		dataType : "text",
		success : function(data) {
			getPageSuccess(data);
		}
	});
	$('#dg').datagrid( {
		url : encodeURI(encodeURI(path)),
		nowrap : false,
		striped : true,
		remoteSort : false,
		fitColumns:true,
		height:300,
		columns : [ [ {
			idField : 'id',
			hidden : true
		}, {
			field : 'projectCode',
			title : '项目编号',
			align : 'center',
			width : $(this).width()*0.1
		}, {
			field : 'projectName',
			title : '项目名称',
			align : 'center',
			width : $(this).width()*0.1
		}, {
			field : 'projectClassName',
			title : '项目类别',
			align : 'center',
			width : $(this).width()*0.1
		}, {
			field : 'startTime',
			title : '开始时间',
			align : 'center',
			width : $(this).width()*0.15
		}, {
			field : 'onlineTime',
			title : '上线时间',
			align : 'center',
			width : $(this).width()*0.15
		}, {
			field : 'endTime',
			title : '验收时间',
			align : 'center',
			width : $(this).width()*0.15
		} ] ],
		onDblClickRow:function(rowIndex,rowData){
	        $("#dg").datagrid("selectRow",rowIndex);
	        var currentRow = $("#dg").datagrid("getSelected");//alert(rowData.id);
	        $('#projectBaseinfoId').val(rowData.id);
	        $('#projectCode').val(rowData.projectCode);
	        $('#projectName').val(rowData.projectName);
	        $('#staffName').val(rowData.staffName);
	        $('#projectClassCode').val(rowData.projectClassCode);
	        $('#projectClassName').val(rowData.projectClassName);
	        
	        var projectClassCode= $('#projectClassCode').val();
	        var path2 = '${path}/pm/projectwork.do?verbId=findProjectTask&projectClassCode='+ projectClassCode;
	        $.ajax({
				type : "post",
				url : encodeURI(encodeURI(path2)),
				data : {
					projectClassCode:projectClassCode,
				},
				dataType : "text",
				success : function(data) {
				   /*  alert(data);
	                alert(eval(data)); */
	               var dataList = [];
                   $('#taskCode').combobox('clear');
                   var json2map=JSON.parse(data);
				    for(var key in json2map)
					{
					dataList.push({"value": key,"text":json2map[key]});
					} 
                    
                   $("#taskCode").combobox("loadData", dataList);
				    
					
				}
			});
	        $('#win').window('close'); 
	    },
		onLoadSuccess : function(data) {
			//将selectUsersData中的短信用户全部勾上
			for ( var i = 0; i < data.rows.length; i++) {
				$.each(selectUsersData, function(index, item) {
					if (data.rows[i].id == item.id) {
						$('#dg').datagrid('checkRow', i);
					}
				});
				
			}
		}			
	});
}


function getPageSuccess(data) {
	eval("var json = " + data + ";");
	var count = json.count;
	var pageIndex = json.pageIndex;
	var pageCount = json.pageCount;
	var pageSize = json.pageSize;
	$('#count').val(count);
	$('#page_index').val(pageIndex);
	$('#page_count').val(pageCount);
	$('#page_size').val(pageSize);
	updatePager();
	$('#pageshow').show();
	activePage="pageshow";
}
function paging(page) {
	$("#cur_page").val(page);
	if(activePage=="pageshow"){
		findProjectList(page);
	}else	if(activePage=="grouppageshow"){
		getPreview(selectNode,page);
	}else	if(activePage=="pageTempletShow"){
		getTempletContent(selectNode.id,page);
	}
}
function selectPhoneUser() {
	$('#win').window('close');
	$('#phones').val('');
	$('#phones1').val('');
	$('#phones').hide();
	$('#phones1').show();
	var phones = "";
	$.each(selectUsersData, function(index, item) {
		phones += "\"" + item.userName + "\"" + "<" + item.phone + ">,";
	});
	$.each(selectNodeData, function(index, item) {
		phones += "\"" + item.userName + "\"" + "<" + item.phone + ">,";
	});
	$('#phones').val(phones);
	$('#phones1').val(phones);

}
function clearSelect() {
	$('#phones').val('');
	$('#phones1').val('');
	$('#phones1').hide();
	$('#phones').show();
	$('#tempContent').val('');
	selectUsersData = new Array();
	selectNodeData = new Array();
}
  	</script>
	</head>

	<body onload="showHspMessage('${data.message}')">
		<form name="form" id="form" method="post" action="projectwork.do">
			<input type="hidden" name="verbId" id="verbId" value="add" />
			<input type="hidden" name="projectClassCode" id="projectClassCode" value="" />
			<input type="hidden" name="projectBaseinfoId" id="projectBaseinfoId" value="" />

			<div class="clear"></div>
			<div style="height: 20px;"></div>
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'>
							项目名称
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="projectName" id="projectName" class="text"
								onblur="fEvent('blur',this)" value='${data.projectName}'
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
								
						<input type="button" value="选择项目" class="button_grey1_s0"
							style="vertical-align: top;"
							onmousedown="this.className='button_grey1_s1'"
							onmouseout="this.className='button_grey1_s0'"
							onclick="findProjectList('1')" />
						</td>
					</tr>
						<td class='crm_edit_item_name'>
							项目编号
						</td>

						<td colspan="3" class='crm_edit_item_content'>
							<input type="text" name="projectCode" id="projectCode" class="text"
								onblur="fEvent('blur',this)" value='${data.projectCode}'
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />

						</td>
					</tr>
					
					<tr>
						<td class='crm_edit_item_name' >
							项目类别
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="projectClassName" id="projectClassName" class="text"
								onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"  value='${data.projectClassName}'
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
							
								
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 项目经理
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" id="staffName" name="staffName" class="text readonly" readonly
								value="${data.staffName}"  />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							工作任务
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
						<select name="taskCode" id="taskCode"
								class="easyui-combobox" editable="false"
								style="width: 206px; height: 30px;" required="true"
								panelHeight="100">
								<c:forEach items="${data.taskClass}" var="kd">
									<option value="${kd.key}" ${data.taskCode==kd.key?"selected":""}>
										${kd.value}
									</option>
								</c:forEach>
							</select>
		  		
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							工作日期
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="workDate" id="workDate" class="text"
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
							 工时
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="longTime" id="longTime" class="text"
							    value='${data.longTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
					
						</td>
					</tr>
					<tr>
					<td class='crm_edit_item_name' >
							 员工姓名
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="createUserName" id="createUserName" class="text"
							    value='${data.createUserName}'
								onblur="fEvent('blur',this)" readonly="readonly"
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
  	<div id="win" class="easyui-window" closed="true" title=""
				style="overflow: hidden;">
				<div class='crm_search_div' align="center">
					<div style="height: 10px; widows: 100%" id="firstCondition"></div>
					<div class="crm_input_item">
						<span style="margin-left: 3px;">项目编号：</span>
						<input id="projectCodeCase" type="text" class="crm_input_text crm_width_3"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							value="" style="width:80px;height:22px;line-height: 22px;">
					</div>
					<div class="crm_input_item">
						<span>项目名称：</span>
						<input id="projectNameCase" type="text" class="crm_input_text crm_width_3"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							value=""style="width:80px;height:22px;line-height: 22px;">
					</div>
					<div class="crm_input_item">
						<span>验收时间：</span>
						<input id="timeCase" type="text" class="crm_input_text crm_width_3"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							value=""style="width:80px;height:22px;line-height: 22px;">
					</div>
					<div class="crm_input_item">
						<input type="button" value="查询" class="button_blue1_s0" 
							onmousedown="this.className='button_blue1_s1'"
							onmouseout="this.className='button_blue1_s0'"
							onclick="findProjectList('1')" />
					</div>
					<div class="crm_input_item">
						<input type="button" value="确定" class="button_green1_s0" 
							onmousedown="this.className='button_green1_s1'"
							onmouseout="this.className='button_green1_s0'"
							onclick="selectPhoneUser()" />
					</div>
					<div style="clear: both"></div>
					<div style="height: 10px; widows: 100%"></div>
					
				<table id="dg"></table>
				<tfoot>
					<div id="pageshow" style="display: none;">
						<input type="hidden" title="当前第几页" name="page_index"
							id="page_index" value="" />
						<input type="hidden" title="一共多少页" name="page_count"
							id="page_count" value="" />
						<input type="hidden" title="一共多少条记录" name="count" id="count"
							value="" />
						<input type="hidden" title="每页显示多少条记录" name="page_size"
							id="page_size" value="" />
						<div class="pager_num"></div>
						<div class="pager_text"></div>
					</div>
				</tfoot>
				</div>
			</div>
		</form>
		<script type="text/javascript">
		var cal = Calendar.setup({            //日期控件
		onSelect : function(cal) {
			cal.hide()
		},
		showTime : true
	});
	cal.manageFields("date_input2", "workDate", "%Y-%m-%d");
  </script>
	</body>
</html>
