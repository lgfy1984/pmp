<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <meta name="Author" content=""/>
  <meta name="Keywords" content=""/>
  <meta name="Description" content=""/>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
  <title>项目费用信息维护</title>
  <link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/gold/gold.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
  <script type="text/javascript" src="${path}/js/pager2.js"></script>
  <script type="text/javascript" src="${path}/js/chargework.js"></script>
  <script type="text/javascript" src="${path}/js/jscal2.js"></script>
  <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
<script type="text/javascript" src="${path}/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
  
  
  <style type="text/css">
 </style>
  <script type="text/javascript">
  
	$(function() {
		$("#loadlayer").hide();
         var arrChk=$("input[name='ids']"); 
         $(arrChk).each(function(){
                 var val = $(this).parents('tr').children().eq(7).find("select").combobox('getValue');
                 //alert(val);
                 if(val>8){
                        $(this).parents('tr').children().eq(7).find("span").find("input").css('color','red');
                 }
			});
	});
	//导出客观excel文件
	function exportExcelFile(){
	    var projectClassCodeCase=$("#projectClassCodeCase").val();
		var staffName=$("#staffName").val();
		var startTimeHidden=$("#startTimeHidden").val();
		var endTimeHidden=$("#endTimeHidden").val();
		//var orderNo = $("#orderNo").combobox('getValue');
		//var sort = $('input:radio:checked').val();
		//前置条件
		$.messager.confirm("操作提示", "确定导出数据？", function (data) {
            if (data) {
            	window.location='${path}/pm/projectfinancew.do?verbId=exportFile&projectClassCodeCase='+projectClassCodeCase
            			+'&staffName='+staffName+'&startTimeHidden='+startTimeHidden+'&endTimeHidden='+endTimeHidden;          	
            }
        });	
	}
	//导入客观excel文件
	function dialogMiddle(className){
		var dialogElement = $("."+className);
		var shadow=$(".window-shadow");
		
 		var width=dialogElement.css('width');
		var height=dialogElement.css('height');
		var left=$(window).width()-parseInt(width);
		var  top=$(window).height()-parseInt(height);
		var l=left/2+"px";
		var t=top/2+"px";
		shadow.css('left',l);
		shadow.css('top',t); 
		
		shadow.css('left',l);
		shadow.css('top',t);
		dialogElement.css('left',l);
		dialogElement.css('top',t);
	}
	function importExcelFile(){ 
			$.ajaxFileUpload(
              	 	 	{          	
			                url:'${path}/pm/projectfinancew.do?verbId=importfile',          
			                secureuri:false,
			                fileElementId:'fileToUpload',                        //文件选择框的id属性
			                dataType: 'json',                                     //服务器返回的格式，可以是json
					        success: function (data, status)            //相当于java中try语句块的用法
			                {  
			                	if(data.result=='error'){
			                		$.messager.alert("操作提示", "导入文件格式错误!","error");
			                		dialogMiddle("messager-window");
			                	}else if(data.result=='success'){
			                		$.messager.alert("操作提示", "导入数据完成!","info",function(){
			                			window.location.reload();
			                		});
			                		dialogMiddle("messager-window");
			                	}else if(data.result=='exception'){
			                		$.messager.alert("操作提示", "导入数据格式有误!","error");
			                		dialogMiddle("messager-window");
			                	}else{
			                		$.messager.alert("操作提示", "导入数据失败!","error");
			                		dialogMiddle("messager-window");
			                	}
			                	 
			                },
			                error: function(data, status, e)
			                {
			                	$.messager.alert("操作提示", "导入数据失败!","error");
			                	dialogMiddle("messager-window");
			                }
              	 	 	}                  
		             );  
			}
	
	//选择导入文件
	function fileSelect() {
		$.messager.confirm("操作提示", "确定导入数据？", function (data) {
            if (data) {
            	document.getElementById("fileToUpload").click();
            }
        });	
   	 }
	function HideLoading(){
		$("#loadlayer").hide();
	}
	var array= new Array();
	$(document).ready(function() {
	  $("#checkedAll").click(function(){
	    if($(this).attr('checked')){
	     $("input[name='ids']").each(function(){
	       if(!$(this).attr('checked')){
	         $("input[name='ids']").prop("checked", true);
	       }
	     });
	    }else{
	        $("input[name='ids']").removeAttr("checked"); 
	    }
	 });
	 
	  $("input[name='ids']").change(function(){
	    if($("input[name='ids']").not("input:checked").size() <= 0){
	        //如果其它的复选框全部被勾选了，那么全选勾中
		       $("#checkedAll").prop("checked", true);
	    }else{        
		       $("#checkedAll").prop("checked", false);
	    }
	   });
	 });
	 
   function checkall_button(){
         var arrChk=$("input[name='ids']:checked"); 
		$(arrChk).each(function(){
	              array.push($(this).val());
			});
		if(array==""){
			$.messager.alert('提示',"请选择记录。","info"); 
			return;
		}
		document.form.verbId.value = "delete"; 
		document.form.message.value = ""; 
		document.form.cur_page.value="1";
		document.form.submit();
   }
   function saveall_button(){
         var arrChk=$("input[name='ids']:checked"); 
         $(arrChk).each(function(){
                 var val = $(this).parents('tr').children().eq(7).find("select").combobox('getValue');
		         //var val = $(this).parents('tr').children().eq(7).html();
		        // var val = $(this).closest('tr').find('td:eq(7)');
		        //alert(val);
	              array.push(val);
			});
        
		
		if(array==""){
			$.messager.alert('提示',"请选择记录。","info"); 
			return;
		}
		$("#longTimesHidden").val(array);
		document.form.verbId.value = "updateall"; 
		document.form.message.value = ""; 
		document.form.cur_page.value="1";
		document.form.submit();
   }
   document.onkeydown=banBackSpace;   
   function findProjectList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目',
	    width: 820,
	    height: 350,
	    top: ($(window).height()-500) * 0.5,
	    left: ($(window).width()-900) * 0.5,
	    shadow: true,
	    modal: true,
	    closed: true,
	    minimizable: false,
	    maximizable: false,
	    collapsible: false
	});

	$('#win').window('open'); 
	
	var projectCodeCase=$('#projectCodeCase').val();
	var projectNameCase=$('#projectNameCase2').val();
	var timeCase=$('#timeCase').val();
	var pageIndex = page;
	var path = '${path}/pm/projectwork.do?verbId=findProjectList&pageIndex='
			+ pageIndex + '&projectCodeCase=' + projectCodeCase+ '&projectNameCase2=' + projectNameCase+ '&timeCase=' + timeCase;
	$.ajax({
		type : "post",
		url : '${path}/pm/projectwork.do?verbId=findProjectPage',
		data : {
			pageIndex:pageIndex,
			projectCodeCase:projectCodeCase,
			projectNameCase2:projectNameCase,
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
		height:200,
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
	        var currentRow = $("#dg").datagrid("getSelected");
	        //alert(rowData.projectCode);
	        $('#projectBaseinfoId').val(rowData.id);
	        $('#projectBaseinfoIdCase').val(rowData.id);
	        $('#projectNameCase').val(rowData.projectName);
	     
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
	$('#count2').val(count);
	$('#page_index2').val(pageIndex);
	$('#page_count2').val(pageCount);
	$('#page_size2').val(pageSize);
	updatePager2();
	$('#pageshow').show();
	activePage="pageshow";
}
function paging2(page) {
	$("#cur_page2").val(page);
	if(activePage=="pageshow"){
		findProjectList(page);
	}if(activePage=="pageshowstaff"){
		findStaffList(page);
	}else	if(activePage=="grouppageshow"){
		getPreview(selectNode,page);
	}else	if(activePage=="pageTempletShow"){
		getTempletContent(selectNode.id,page);
	}
}
  </script>

 </head>
 <body onload="showHspMessage('${data.message}')">
 <form  name="form1" id="form1" method="post" enctype="multipart/form-data" >
			 <div id='uploadPictureWrapper'  class="crm_input_item" style="margin-top: 3px;margin-left: 10px;float: right;">
		         	<span class="">导入excel</span>
			    <input type="file" id="fileToUpload"   class="crm_search_input_text"  name="fileToUpload" onchange="importExcelFile();" />
		      </div>
 </form>
 <form name="form" id="form" method="post" action="projectfinancew.do">
  <input type="hidden" name="verbId" value="queryFinanceRecordinfo" />
	<input type="hidden" name="projectBaseinfoId" id="projectBaseinfoId" value="${data.projectBaseinfoId}" />
	<input type="hidden" name="projectBaseinfoIdCase" id="projectBaseinfoIdCase" value="${data.projectBaseinfoIdCase}" />
	<input type="hidden" name="longTimesHidden" id="longTimesHidden" value="" />
		<input type="hidden" id="startTimeHidden" name="startTimeHidden" value="${data.startTimeHidden}" />
		  			<input type="hidden"  id="endTimeHidden" name="endTimeHidden" value="${data.endTimeHidden}"/>
  <input type="hidden" name="idHidden" id="idHidden" value="${data.id}" />
  <input type="hidden" name="flag" id="flag" value="" />
  <input type="hidden" name="message" id="message" value="" />
  <div class='crm_content_div'>
	  <div style="height: 40px;">
	      <div class="crm_input_item" >
		  	<span class="">项目名称</span>
						<input type="text" name="projectNameCase" id="projectNameCase" class="crm_input_text"
							onblur="fEvent('blur',this)"  value='${data.projectNameCase}' style="width: 112px;height:20px;"
							onmouseover="fEvent('mouseover',this)"  
							onfocus="fEvent('focus',this)" 
							onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
							invalidMessage="有效长度1-25" />
						
		  </div>
		  <div class="crm_input_item" style="padding-left: 28px;" >
		  	<span class="">项目类别</span>
		  		 <select name="projectClassCodeCase" id="projectClassCodeCase" class="easyui-combobox" editable="false" panelHeight="168" style="width: 120px;height:24px;" >
		  		 	<option value="">全部</option>
					<c:forEach items="${data.projectClass}" var="kd">
						<option value="${kd.key}" ${data.projectClassCodeCase==kd.key?"selected":""}>${kd.value}</option>
			      	</c:forEach>
			      </select>
		  </div>
		  					
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();query_button();" />
		    </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="删除" onclick="checkall_button();" />
		    </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="保存" onclick="saveall_button();" />
		    </div>
			<div class="crm_input_item" >
	 			<div class="download_button_s1 " onclick="exportExcelFile();">
			     <img alt="" src="${path }/style/img/down.png" style="margin-top: 5px;margin-left: 10px;">
			     <span style="position: absolute;color: #fff;">导出</span>
			    </div>
			</div>
		   
		  <div style="clear:both"></div>
		 <div class="crm_input_item" >
		  	<select class="easyui-combobox" style="height:24px;width: 50px;" name="timeSelect" id="timeSelect" panelHeight="80px">
		  		<option value="0" <c:if test="${data.timeSelect eq '0'}">selected="selected"</c:if> >日</option>
		  		<option value="1" <c:if test="${data.timeSelect eq '1'}">selected="selected"</c:if> >周</option>
			 </select>
		  </div>
		   <div class="crm_input_item"  >
		  			<input type="text" class="crm_search_input_text crm_width_3"  style="position: relative;bottom:6px;" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="timeCase" name="timeCase" value="${data.timeCase}" />
		  			<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg"/>
		  </div>
		 <div class="crm_input_item" >
		  	<span class="">员工姓名</span>
		  		 <input type="text" style="width: 112px;height:20px;" name="staffNameHidden" id="staffNameHidden" class="crm_input_text" value='${data.staffNameHidden}'  panelHeight="168"  />
		  </div>
		  		
			
		  <div style="clear:both"></div>
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td style="width:15%"><input type="checkbox" name="checkedAll" id="checkedAll"/>全选</td>
		  <td style="width:10%">员工姓名</td>
		  <td style="width:10%">项目编号</td>
		  <td style="width:25%">项目名称</td>
		  <td style="width:15%">项目类别</td>
		  <td style="width:15%">工作任务</td>
		  <td style="width:15%">工作日期</td>
		  <td style="width:15%">工时</td>
		  
		  </tr>
		  </thead>
			  <tbody id="interval_row_id" >
			    <c:if test='${pb.count<=0}'>
						<tr>
							<td colspan="9">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
			  	 <c:forEach items='${data.pfv}' var="kd" step="1" varStatus="status">
				  <tr>
					  <td><input type="checkbox" name="ids" id="ids${status.index}" value="${kd.id}"/></td>
					  <td>${kd.workStaffName}</td>
					  <td>${kd.projectCode}</td>
					  <td><a href="javascript:void(0)" onclick="showDetail('${kd.id}')">${kd.projectName}</a></td>
					  <td>${kd.projectClassName}</td>
					  <td>${kd.taskName}</td>
					  <td>${kd.workDate}</td>
					  <td>
							     <select name="longTimeCode" id="longTimeCode"
									class="easyui-combobox" editable="false"
									style="width:50px;" required="true"
									panelHeight="100">
									<c:forEach items="${data.longTimeDict}" var="ld">
										<option value="${ld.key}" ${kd.longTimeCode==ld.key?"selected":""}>
											${ld.value}
										</option>
									</c:forEach>
								</select>
						</td>
					 
				  </tr>
				  </c:forEach>
			  </tbody>
			  <tfoot <c:if test='${pb.count<=0}'>style="display:none"</c:if>>
			  <tr>
			  <td colspan="8">
			  	<input type="hidden" title="当前第几页" name="page_index" id="page_index" value="${pb.page}"/>
			    <input type="hidden" title="一共多少页" name="page_count" id="page_count" value="${pb.pageCount}"/>
			    <input type="hidden" title="一共多少条记录" name="count" id="count" value="${pb.count}"/>
			    <input type="hidden" title="每页显示多少条记录" name="page_size" id="page_size" value="${pb.pageSize}"/>
			  	<input type="hidden" name="cur_page" id="cur_page" value="${pb.page}"/>
			  	<div class="pager_num"></div>
			  	<div class="pager_text"></div>
			  </td>
			  </tr>
			  </tfoot>
		  </table>
  </div>
  	<c:if test='${data.resultFlag!=""}'>
	    <c:forEach items='${data.pfv2}' var="pv2" step="1" varStatus="status">
		  <div class="horizontal_line_2"></div>
			  <div class='crm_table_out'>
			  <c:if test="${fn:length(pv2.pfv3)>0}">
				  <table style="table-layout: fixed;" class='crm_table_content' >
				  <thead>
				   <tr>
				  <td colspan="8" style="text-align: left;padding-left: 10px;">
				  	 	<c:if test='${data.timeSelect!=1}'>
				  	 	   ${pv2.timeCase}
				  	 	</c:if>   
				  	 	<c:if test='${data.timeSelect==1}'>
				  	 	  ${pv2.timeStartCase}-${pv2.timeEndCase}
				  	 	</c:if>   
				  	 	  ${pv2.workStaffName}
				  </td>
				  </tr>
				  <tr>
				  <td style="width:15%"></td>
				  <td style="width:10%">员工姓名</td>
				  <td style="width:10%">项目编号</td>
				  <td style="width:25%">项目名称</td>
				  <td style="width:15%">项目类别</td>
				  <td style="width:15%">工作任务</td>
				  <td style="width:15%">工作日期</td>
				  <td style="width:15%">工时</td>
				  
				  </tr>
				  </thead>
					  <tbody id="interval_row_id" >
					  	 <c:forEach items='${pv2.pfv3}' var="kd" step="1" varStatus="status">
						  <tr>
							  <td><input type="checkbox" name="ids" id="ids${status.index}" value="${kd.id}"/></td>
							  <td>${kd.workStaffName}</td>
							  <td>${kd.projectCode}</td>
							  <td><a href="javascript:void(0)" onclick="showDetail('${kd.id}')">${kd.projectName}</a></td>
							  <td>${kd.projectClassName}</td>
							  <td>${kd.taskCode}</td>
							  <td>${kd.workDate}</td>
							  <td>
							     <select name="longTimeCode" id="longTimeCode"
									class="easyui-combobox" editable="false"
									style="width:50px;" required="true"
									panelHeight="100">
									<c:forEach items="${data.longTimeDict}" var="ld">
										<option value="${ld.key}" ${kd.longTimeCode==ld.key?"selected":""}>
											${ld.value}
										</option>
									</c:forEach>
								</select>
							</td>
						  </tr>
						  </c:forEach>
					  </tbody>
				  </table>
				  </c:if>
		  </div>
	   </c:forEach>
   </c:if>
   <c:if test='${data.resultFlag==""}'>
	   <div class="horizontal_line_2"></div>
		  <div class='crm_table_out'>
			  <table style="table-layout: fixed;" class='crm_table_content' >
			  <thead>
			  </thead>
				  <tbody id="interval_row_id" >
							<tr>
								<td colspan="9">
									<div>
										<img alt="" src="${path }/style/img/nodate.png">
										<p>主人，暂无超时查询结果！</p>
									</div>
								</td>
							</tr>
				  </tbody>
				 
			  </table>
	  </div>
  </c:if>
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
						<input id="projectNameCase2" type="text" class="crm_input_text crm_width_3"
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
					<div style="clear: both"></div>
					<div style="height: 10px; widows: 100%"></div>
					
				<table id="dg"></table>
				<tfoot>
					<div id="pageshow" style="display: none;">
						<input type="hidden" title="当前第几页" name="page_index2"
							id="page_index2" value="" />
						<input type="hidden" title="一共多少页" name="page_count2"
							id="page_count2" value="" />
						<input type="hidden" title="一共多少条记录" name="count2" id="count2"
							value="" />
						<input type="hidden" title="每页显示多少条记录" name="page_size2"
							id="page_size2" value="" />
						<div class="pager_num2"></div>
						<div class="pager_text2"></div>
					</div>
				</tfoot>
				</div>
			</div>
  
	
	<!-- 加载遮罩效果层 -->
      <div id="loadlayer" style="position: fixed;left:45%;top:45%;">  
          <img src="../style/img/loading60.gif"/>   
        </div> 
  <!-- date show -->
	<script language="javascript" type="text/javascript">
	var cal = Calendar.setup({            //日期控件
		weekNumber: true,
		showTime : true,
		onSelect : function(cal) {
			cal.hide()
		}
	});
	cal.manageFields("date_input1", "timeCase", "%Y-%m-%d");
	//cal.manageFields("date_input1", "startTimeHidden", "%Y-%m-%d");
	//cal.manageFields("date_input2", "endTimeHidden", "%Y-%m-%d");
	</script>
	<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
 </form>
 </body>
</html>
