<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>信息修改</title>
    <meta http-equiv="keywords" content=""/>
    <meta http-equiv="description" content=""/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
  	<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css" />
  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  	<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
  	<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
	<script type="text/javascript"	src="${path}/style/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
  	<script type="text/javascript" src="${path}/js/default.js"></script>
  	<script type="text/javascript" src="${path}/js/pm.js"></script>
    <script type="text/javascript" src="${path}/js/jscal2.js"></script>
    <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
  </head>
  	<script type="text/javascript">
  	/**查找电话号码历史 */
  	var selectUsersData = new Array(); 	 
function findStaffList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目经理',
	    width: 820,
	    height: 450,
	    top: ($(window).height()-650) * 0.5,
	    left: ($(window).width()-900) * 0.5,
	    shadow: true,
	    modal: true,
	    closed: true,
	    minimizable: false,
	    maximizable: false,
	    collapsible: false
	});

	$('#win').window('open'); 
	
	var staffCodeCase=$('#staffCodeCase').val();
	var staffNameCase=$('#staffNameCase').val();
	var pageIndex = page;
	var path = '${path}/pm/projectbaseinfo.do?verbId=findStaffList&&pageIndex='
			+ pageIndex + '&staffCode='+ staffCodeCase + '&staffName=' + staffNameCase;
	$.ajax({
		type : "post",
		url : '${path}/pm/projectbaseinfo.do?verbId=findStaffPage',
		data : {
			pageIndex:pageIndex,
			staffCode:staffCodeCase,
			staffName:staffNameCase
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
			field : 'staffCode',
			title : '员工代码',
			align : 'center',
			width : $(this).width()*0.1
		}, {
			field : 'staffName',
			title : '姓名',
			align : 'center',
			width : $(this).width()*0.1
		}, {
			field : 'sexName',
			title : '性别',
			align : 'center',
			width : $(this).width()*0.1
		}, {
			field : 'staffClass',
			title : '人员类别',
			align : 'center',
			width : $(this).width()*0.15
		}] ],
		onDblClickRow:function(rowIndex,rowData){
	        //alert(rowData.projectCode);
	        $('#staffId').val(rowData.id);
	        $('#staffCode').val(rowData.staffCode);
	        $('#staffName').val(rowData.staffName);
	        
	        $('#win').window('close');  
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
		findStaffList(page);
	}else	if(activePage=="grouppageshow"){
		getPreview(selectNode,page);
	}else	if(activePage=="pageTempletShow"){
		getTempletContent(selectNode.id,page);
	}
}

function selectStaffUser() {

}  	
</script>
  <body>
  	  <form name="form" id="form" method="post" action="projectbaseinfo.do" >
			<input type="hidden" name="verbId" value="update" />
  	  <input type="hidden" name="message" id="messageId" value="修改成功！"/>
  	  <input type="hidden" name="idHidden" value="${data.id}" />
  	  <input type="hidden" name="cur_page" id="cur_page" value="${data.page_index}"/>
  	  <input type="hidden" name="projectClassCodeHidden" id="projectClassCodeHidden" value="${data.projectClassCodeHidden}"/>
  	  <input type="hidden" name="staffCode" id="staffCode" value="${data.staffCode}"/>
  	  <input type="hidden" name="startTimeHidden" id="startTimeHidden" value="${data.startTimeHidden}"/>
  	  <input type="hidden" name="endTimeHidden" id="endTimeHidden" value="${data.endTimeHidden}"/>
  	  <input type="hidden" name="projectNameHidden" id="projectNameHidden" value="${data.projectNameHidden}"/>
      
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
							<input type="text" name="projectCode" id="projectCode" class="text" value='${data.projectCode}'
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
							<input type="text" name="projectName" id="projectName" class="text" value='${data.projectName}'
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
								class="easyui-combobox" 
								style="width: 206px; height: 30px;"
								panelHeight="100">
								<c:forEach items="${data.projectClass}" var="kd">
									<option value="${kd.key}"  ${data.projectClassCode==kd.key?"selected":""}>
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
							<input type="text" name="staffName" id="staffName" class="text"  value='${data.staffName}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						   <input type="button" value="请选择" class="button_grey1_s0"
							style="vertical-align: top;"
							onmousedown="this.className='button_grey1_s1'"
							onmouseout="this.className='button_grey1_s0'"
							onclick="findStaffList('1')" />
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
					<tr>
						<td class='crm_edit_item_name' >
							 序号
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" name="seqNo" id="seqNo" class="text" 
							    value='${data.seqNo}'
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
		<input type="button" value="修改" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" onclick="clearSelect();update_Form();"/>&nbsp;&nbsp;
		<input type="button" value="返回" class="button_grey1_s0" onmousedown="this.className='button_grey1_s1'" onmouseout="this.className='button_grey1_s0'" onclick="query_List();"/>
	  </div>
	  <div id="win" class="easyui-window" closed="true" title=""
				style="overflow: hidden;">
				<div class='crm_search_div' align="center">
					<div style="height: 10px; widows: 100%" id="firstCondition"></div>
					<div class="crm_input_item">
						<span style="margin-left: 3px;">员工代码：</span>
						<input id="staffCodeCase" type="text" class="crm_input_text crm_width_3"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							value="" style="width:80px;height:22px;line-height: 22px;">
					</div>
					<div class="crm_input_item">
						<span>员工姓名：</span>
						<input id="staffNameCase" type="text" class="crm_input_text crm_width_3"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							value=""style="width:80px;height:22px;line-height: 22px;">
					</div>
					<div class="crm_input_item">
						<input type="button" value="查询" class="button_blue1_s0" 
							onmousedown="this.className='button_blue1_s1'"
							onmouseout="this.className='button_blue1_s0'"
							onclick="findStaffList('1')" />
					</div>
					<div class="crm_input_item">
						<input type="button" value="确定" class="button_green1_s0" 
							onmousedown="this.className='button_green1_s1'"
							onmouseout="this.className='button_green1_s0'"
							onclick="selectStaffUser()" />
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
	cal.manageFields("date_input1", "startTime", "%Y-%m-%d");
	cal.manageFields("date_input2", "onlineTime", "%Y-%m-%d");
	cal.manageFields("date_input3", "endTime", "%Y-%m-%d");
  </script>
  </body>
</html>
