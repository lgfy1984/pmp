<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
	language="java" import="java.util.*,com.tianjian.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>

<title>财务报表统计</title>
<link rel="stylesheet" type="text/css" href="${path}/style/default.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/border-radius.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/gold/gold.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/steel/steel.css">
<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css">
<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
<script type="text/javascript" src="${path}/js/jscal2.js"></script>
<script type="text/javascript" src="${path}/js/lang/cn.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/style/stat.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css">
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	
	$(function() {
		$("#loadlayer").hide();
		
	});
	function statquery(){
		var start = $('#startTimeHidden').val();
		var end = $('#endTimeHidden').val();
		var projectBaseinfoIdCase = $('#projectBaseinfoIdCase').val();
		if(start!=''&&end!=''&&end<start){
			$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
			return;
		}
		if(projectBaseinfoIdCase.replace(/(^s*)|(s*$)/g, "").length == 0){
			$.messager.alert('提示',"请选择项目。","info"); 
			return;
		}
       	document.form.verbId.value = "statfrp"; 
		$('#loadlayer').show();
		document.form.submit();
	}
var selectUsersData = new Array(); 	 
function findProjectList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目',
	    width: 820,
	    height: 450,
	    top: ($(window).height()-700) * 0.5,
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
			field : 'projectClass',
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
	        var currentRow = $("#dg").datagrid("getSelected");
	        //alert(rowData.id);
	        //alert(rowData.projectCode);
	        $('#projectBaseinfoIdCase').val(rowData.id);
	        $('#staffName').val(rowData.staffName);
	        //alert($('#projectBaseinfoIdCase').val());
	        $('#projectCode').val(rowData.projectCode);
	        $('#projectName').val(rowData.projectName);
	        $('#projectClassName').val(rowData.projectClassName);
	        $('#projectTime').val(rowData.startTime+"-"+rowData.endTime);
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

<body>
	<form name="form" action="projectstat.do"	method="post" >
  <input type="hidden" name="verbId" id="verbId" value="" />
	<input type="hidden"  id="projectBaseinfoIdCase" name="projectBaseinfoIdCase" value='${data.projectBaseinfoIdCase}'/>
	<div class='crm_content_div'>
	<div class="crm_search_div">
		<input type="hidden" id="page" name="page">
	<div class="crm_content_div">
	
	  <div class="crm_search_div">
		<div  class="crm_input_item" style="">
			<span class="">项目编号：</span>
			<input type="text" name="projectCode" id="projectCode" class="stat_text" value='${data.projectCode}' />
		</div>
	
		<div  class="crm_input_item" style="">
			<span class="">项目名称：</span>
			<input type="text" name="projectName" id="projectName" class="stat_text" value='${data.projectName}'  />
		</div>
	
		<div  class="crm_input_item" style="">
			<span class="">实施类别：</span>
			<input type="text" name="projectClassName" id="projectClassName" class="stat_text"   value='${data.projectClassName}' />
		</div>
		
		<div class="crm_input_item">
			<input type="button" value="选择项目" class="button_grey1_s0"
							style="vertical-align: top;"
							onmousedown="this.className='button_grey1_s1'"
							onmouseout="this.className='button_grey1_s0'"
							onclick="findProjectList('1')" />
		    <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="statquery();" />
		</div>
		  <div style="clear:both"></div>
		<div  class="crm_input_item" style="">
			<span class="">项目经理：</span>
			<input type="text" name="staffName" id="staffName" class="stat_text"    value='${data.staffName}' />
		</div>
		
		<div  class="crm_input_item" >
			<span class="">项目计划总周期：</span>
			<input type="text" name="projectTime" id="projectTime" class="stat_text"    value='${data.projectTime}' />
		</div>
	
		  <div style="clear:both"></div>
		  
		 <div class="crm_input_item" >
		  	<span class="">时间条件</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="startTimeHidden" name="startTimeHidden" value="${data.startTimeHidden}" readonly/>
		  			<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="endTimeHidden" name="endTimeHidden" value="${data.endTimeHidden}" readonly/>
		  			<img id="date_input2" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div>
	  </div>
		</div>
			</form>
			<div style="clear:both"></div>
		</div>
		<div class="horizontal_line_2"></div>
		<div class='crm_table_out'>
			<table class='crm_table_content' style="table-layout: fixed;">
				<thead>
					<tr>
						<td style="width: 10%;">序号</td>
						<td style="width: 8%;">项目编号</td>
						<td style="width: 8%;">项目名称</td>
						<td style="width: 8%;">员工姓名</td>
						<td>项目阶段</td>
						<td>实际工时(小时)</td>
						<td>人工成本(小时)</td>
						<td>实施费用</td>
						<td>实施成本</td>
						 
					<tr>
				</thead>
				<tbody >
					 <c:forEach items='${data.psv}' var="kd">
					    <tr>
						   <c:choose>
			                   <c:when test="${kd.totalCount eq 1 }">  
			                             <td colspan="6"  style="padding-left:20px;text-align: left;">${kd.projectTaskName}</td>
							   </c:when>
							   <c:otherwise> 
								   <td>${kd.seqNo}</td>
								   <td>${kd.projectCode}</td>
								   <td>${kd.projectName}</td>
								   <td>${kd.createUserName}</td>
		                           <td>${kd.projectTaskName}</td>
		                           <c:choose>
				                   <c:when test="${kd.totalCount eq 2 }">  
				                             <td>${kd.totalLongTime}</td>
				                             <td>${kd.totalcosts}</td>
				                             <td>${kd.totalProjectCosts}</td>
				                             <td>${kd.totalProjectValue}</td>
								   </c:when>
								   <c:otherwise> 
			                           <td>${kd.actLongTime}</td>
			                           <td>${kd.actCosts}</td>
			                           <td>${kd.projectCosts}</td>
			                           <td>${kd.projectValue}</td>
					 			   </c:otherwise>
			                     </c:choose>      
				 			   </c:otherwise>
			                  </c:choose> 
					            
					    </tr>
				  </c:forEach>

				</tbody>
			</table>
		</div>
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
	<!-- 加载遮罩效果层 -->
      <div id="loadlayer" style="position: fixed;left:45%;top:45%;">  
          <img src="../style/img/loading60.gif"/>   
        </div> 
</body>

<!-- date show -->
<script language="javascript" type="text/javascript">
	/* date show */
	var cal = Calendar.setup({
		onSelect : function(cal) {
			cal.hide()
		},
		showTime : true
	});
	cal.manageFields("date_input1", "startTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input2", "endTimeHidden", "%Y-%m-%d");
</script>
</html>
