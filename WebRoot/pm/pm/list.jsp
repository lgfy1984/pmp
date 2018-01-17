<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <meta name="Author" content=""/>
  <meta name="Keywords" content=""/>
  <meta name="Description" content=""/>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
  <title>项目信息维护</title>
  <link type="text/css" rel="stylesheet" href="../style/default.css"/>
  <link rel="stylesheet" type="text/css" href="../style/jscal2.css"/>
  <link rel="stylesheet" type="text/css" href="../style/border-radius.css"/>
  <link rel="stylesheet" type="text/css" href="../style/gold/gold.css"/>
  <link rel="stylesheet" type="text/css" href="../style/steel/steel.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
  <script type="text/javascript" src="${path}/js/pager2.js"></script>
  <script type="text/javascript" src="${path}/js/pm.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="${path}/js/jscal2.js"></script>
  <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
<script type="text/javascript" src="${path}/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
 <script type="text/javascript">
$(document).ready(
 function(){
    
    var projectClassCode = $('#projectClassCode').combobox('getValue');
    var operFlag = $('#operFlag').val();
    var flag = $('#flag').val();
    if(operFlag=="1"){
      clearInput();
    }
    if(projectClassCode==1){
		       $('#onlineTimetr').show();
		       $('#develop1').hide();
		       $('#develop2').hide();
	}else if(projectClassCode==2){
		       $('#onlineTimetr').hide();
		       $('#develop1').show();
		       $('#develop2').show();
    }else if(projectClassCode==3){
       $('#onlineTimetr').hide();
       $('#develop1').hide();
       $('#develop2').hide();
    }
    if(flag=="1"){
      $("#projectClassCode").combobox({disabled:true});
      $("#projectCode").attr('readonly','readonly');
      $("#projectName").attr('readonly','readonly');
    }
    
    $("#projectClassCode").combobox({
		onChange: function (n,o) {
            var code = $('#projectClassCode').combobox('getValue');
		    if(code==3){
		       $('#onlineTimetr').hide();
		       $('#develop1').hide();
		       $('#develop2').hide();
		    }else if(code==1){
		       $('#onlineTimetr').show();
		       $('#develop1').hide();
		       $('#develop2').hide();
		    }else if(code==2){
		       $('#onlineTimetr').hide();
		       $('#develop1').show();
		       $('#develop2').show();
		    }
		}
		});
 }
); 

//导出客观excel文件
	function exportExcelFile(){
	    var projectClassCodeHidden=$("#projectClassCodeHidden").val();
		var projectNameHidden=$("#projectNameHidden").val();
		var startTimeHidden=$("#startTimeHidden").val();
		var endTimeHidden=$("#endTimeHidden").val();
		//var orderNo = $("#orderNo").combobox('getValue');
		//var sort = $('input:radio:checked').val();
		//前置条件
		$.messager.confirm("操作提示", "确定导出数据？", function (data) {
            if (data) {
            	window.location='${path}/pm/projectbaseinfo.do?verbId=exportFile&projectClassCodeHidden='+projectClassCodeHidden
            			+'&projectNameHidden='+projectNameHidden+'&startTimeHidden='+startTimeHidden+'&endTimeHidden='+endTimeHidden;          	
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
			                url:'${path}/pm/projectbaseinfo.do?verbId=importfile',          
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
   	 
  	var selectUsersData = new Array(); 	 
function findStaffList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目经理',
	    width: 820,
	    height: 350,
	    top: ($(window).height()-550) * 0.5,
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
		height:200,
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
	        $('#staffCode').val(rowData.id);
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
		findStaffList(page);
	}else	if(activePage=="grouppageshow"){
		getPreview(selectNode,page);
	}else	if(activePage=="pageTempletShow"){
		getTempletContent(selectNode.id,page);
	}
}

function selectStaffUser() {

}  	 
var array= new Array();
	$(document).ready(function() {$("#checkedAll").click(function(){
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
   document.onkeydown=banBackSpace;  
   function clearInput(){
        $('#projectCode').val("");
        $('#projectName').val("");
        $("#projectCode").removeAttr('readonly','readonly');
        $("#projectName").removeAttr('readonly','readonly');
        $("#projectClassCode").combobox({disabled:false});  
        $('#projectClassCode').combobox('clear');
        $('#staffName').val("");
        $('#startTime').val("");
        $('#onlineTime').val("");
        $('#endTime').val("");
        $('#idHidden').val("");
        $('#operFlag').val('');
        $('#flag').val('');
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
 <form name="form"  id="form" method="post" action="projectbaseinfo.do">
  <input type="hidden" name="operFlag" id="operFlag" value="${data.operFlag}" />
  <input type="hidden" name="verbId" value="queryProjectBaseinfo" />
  <input type="hidden" name="idHidden" id="idHidden" value="${data.idHidden}" />
  <input type="hidden" name="seqNo" id="seqNo" value="${data.seqNo}" />
  <input type="hidden" name="flag" id="flag" value="${data.flag}" />
  <input type="hidden" name="staffCode" id="staffCode" value="${data.staffCode}" />
  <input type="hidden" name="message" id="message" value="" />
  <div class='crm_content_div'>
	  <div style="height: 40px;">
		 <div class="crm_input_item" >
		  	<span class="">项目类别</span>
		  		 <select name="projectClassCodeHidden" id="projectClassCodeHidden" class="easyui-combobox"  panelHeight="168" style="width: 120px;height:24px;" >
		  		 	<option value="">全部</option>
					<c:forEach items="${data.projectClass}" var="kd">
						<option value="${kd.key}" ${data.projectClassCodeHidden==kd.key?"selected":""}>${kd.value}</option>
			      	</c:forEach>
			      </select>
		  </div>
		  <div class="crm_input_item" >
		  	<span class="">项目名称</span>
		  		 <input type="text" style="width: 112px;height:20px;" name="projectNameHidden" id="projectNameHidden" class="crm_input_text" value='${data.projectNameHidden}'  panelHeight="168" style="width: 120px;height:24px;" />
		  </div>
		 <%-- <div class="crm_input_item" >
		  	<span class="">开始时间</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="startStartTimeHidden" name="startStartTimeHidden" value="${data.startStartTimeHidden}" readonly/>
		  			<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="startEndTimeHidden" name="startEndTimeHidden" value="${data.startEndTimeHidden}" readonly/>
		  			<img id="date_input2" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div>
		  <div style="clear:both"></div>
		 <div class="crm_input_item" >
		  	<span class="">上线时间</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="onlineStartTimeHidden" name="onlineStartTimeHidden" value="${data.onlineStartTimeHidden}" readonly/>
		  			<img id="date_input3" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="onlineEndTimeHidden" name="onlineEndTimeHidden" value="${data.onlineEndTimeHidden}" readonly/>
		  			<img id="date_input4" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div>
		 <div class="crm_input_item" >
		  	<span class="">结束时间</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="endStartTimeHidden" name="endStartTimeHidden" value="${data.endStartTimeHidden}" readonly/>
		  			<img id="date_input5" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="endEndTimeHidden" name="endEndTimeHidden" value="${data.endEndTimeHidden}" readonly/>
		  			<img id="date_input6" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div> --%>
		  <%-- <div class="crm_input_item" style="">
		  	<span class="">排序方式</span>
		  	<select class="easyui-combobox" style="height:24px;width: 120px;" name="orderNo" id="orderNo" panelHeight="80px">
		  		<option value="0" <c:if test="${data.orderNo eq '0'}">selected="selected"</c:if> >序号</option>
		  		<option value="1" <c:if test="${data.orderNo eq '1'}">selected="selected"</c:if> >项目名字</option>
		  		<option value="2" <c:if test="${data.orderNo eq '2'}">selected="selected"</c:if> >项目类别</option>
		  		<option value="3" <c:if test="${data.orderNo eq '3'}">selected="selected"</c:if> >开始时间</option>
		  		<option value="4" <c:if test="${data.orderNo eq '4'}">selected="selected"</c:if> >上线时间</option>
		  		<option value="5" <c:if test="${data.orderNo eq '5'}">selected="selected"</c:if> >结束时间</option>
			 </select>
		  </div>
		  <div class="crm_input_item" >
		    <input type="radio" name="sort" id="sort2" value="1" <c:if test="${data.sort eq '1'}">checked="checked"</c:if>>降序
		  </div>
		   <div class="crm_input_item" >
		      <input type="radio" name="sort" id="sort" value="0" <c:if test="${data.sort eq '0' || data.sort == null}">checked="checked"</c:if>>升序</input>
		    </div> --%>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();query_button();" />
		    </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="删除" onclick="clearSelect();checkall_button();" />
		    </div>
		     <div class="crm_input_item" >
	 			<div class="download_button_s1 " onclick="exportExcelFile();">
			     <img alt="" src="${path }/style/img/down.png" style="margin-top: 5px;margin-left: 10px;">
			     <span style="position: absolute;color: #fff;">导出</span>
			    </div>
			</div>
			
		 </div> 
		 
		 
		  <div style="clear:both"></div>
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td style="width:15%"><input type="checkbox" name="checkedAll" id="checkedAll"/>全选</td>
		  <td style="width:15%">序号</td>
		  <td style="width:10%">项目编号</td>
		  <td style="width:25%">项目名称</td>
		  <td style="width:10%">项目类别</td>
		  <td style="width:10%">项目经理</td>
		  <td style="width:10%">开始时间</td>
		  <td style="width:10%">上线时间</td>
		  <td style="width:10%">结束时间</td>
		  
		  
		  </tr>
		  </thead>
			  <tbody id="interval_row_id" >
			    <c:if test='${pb.count<=0}'>
						<tr>
							<td colspan="11">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
				</c:if>
			  	 <c:forEach items='${data.pbi}' var="kd" step="1" varStatus="status">
				  <tr>
					  <td><input type="checkbox" name="ids" id="ids${status.index}" value="${kd.id}"/></td>
					  <td>${kd.seqNo}</td>
					  <td>${kd.projectCode}</td>
					  <td><a href="javascript:void(0)" onclick="showDetail('${kd.id}')">${kd.projectName}</a></td>
					  <td>${kd.projectClassName}</td>
					  <td>${kd.staffName}</td>
					  <td>${kd.startTime}</td>
					  <td>${kd.onlineTime}</td>
					  <td>${kd.endTime}</td> 
					
				  </tr>
				  </c:forEach>
			  </tbody>
			  <tfoot <c:if test='${pb.count<=0}'>style="display:none"</c:if>>
			  <tr>
			  <td colspan="11">
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

						<td class='crm_edit_item_content'>
							<input type="text" name="projectCode" id="projectCode" class="text"
								onblur="fEvent('blur',this)" value='${data.projectCode}' 
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
						<td class='crm_edit_item_name'>
							<label class="redlable">
								*
							</label>
							项目名称
						</td>
						<td class='crm_edit_item_content'>
							<input type="text" name="projectName" id="projectName" class="text"
								onblur="fEvent('blur',this)"  value='${data.projectName}' 
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
						<td  class='crm_edit_item_content'>
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
						<td class='crm_edit_item_name' >
							 项目经理
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="staffName" id="staffName" class="text"
							    value='${data.staffName}'
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
						<td  class='crm_edit_item_content'>
							<input type="text" name="startTime" id="startTime" class="text"
							    value='${data.startTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="date"
								 />
								
		  			   <span  class="calendarspan">
		  			   <img id="date_input7" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						<td class='crm_edit_item_name' >
							 项目结束日期
						</td>
						<td   class='crm_edit_item_content'>
							<input type="text" name="endTime" id="endTime" class="text"
							    value='${data.endTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)"  required="true"
								onmouseout="fEvent('mouseout',this)" validtype="date" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input9" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						
					</tr>
					<tr id="onlineTimetr">
					   <td class='crm_edit_item_name' >
							项目上线日期
						</td>
						<td colspan="3" class='crm_edit_item_content'>
							<input type="text" name="onlineTime" id="onlineTime" class="text"
							    value='${data.onlineTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)"	onmouseout="fEvent('mouseout',this)" validtype="date"
								/>
								
		  			      <span  class="calendarspan">
		  			      <img id="date_input8" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
					</tr>
					
					<tr  id="develop1">
						<td class='crm_edit_item_name' >
							需求开始日期
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="requireTime" id="requireTime" class="text"
							    value='${data.requireTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" 
								onmouseout="fEvent('mouseout',this)" validtype="date"
								 />
								
		  			   <span  class="calendarspan">
		  			   <img id="date_input10" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						<td class='crm_edit_item_name' >
							 设计开始日期
						</td>
						<td   class='crm_edit_item_content'>
							<input type="text" name="designTime" id="designTime" class="text"
							    value='${data.designTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)"  
								onmouseout="fEvent('mouseout',this)" validtype="date" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input11" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						
					</tr>
					
					<tr id="develop2">
						<td class='crm_edit_item_name' >
							编码开始日期
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="codeTime" id="codeTime" class="text"
							    value='${data.codeTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" 
								onmouseout="fEvent('mouseout',this)" validtype="date"
								 />
								
		  			   <span  class="calendarspan">
		  			   <img id="date_input12" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						<td class='crm_edit_item_name' >
							 测试开始日期
						</td>
						<td   class='crm_edit_item_content'>
							<input type="text" name="testTime" id="testTime" class="text"
							    value='${data.testTime}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)"  
								onmouseout="fEvent('mouseout',this)" validtype="date" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input13" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						
					</tr>
				</table>
			</div>
			<div class='crm_button_sub'>
				<input type="button" value="保存" class="button_blue1_s0"
					onmousedown="this.className='button_blue1_s1'"
					onmouseout="this.className='button_blue1_s0'"
					onclick="saveForm('${path}','0');" />
					<input type="button" value="新增" class="button_blue1_s0"
					onmousedown="this.className='button_blue1_s1'"
					onmouseout="this.className='button_blue1_s0'"
					onclick="clearInput('1');" />
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
  <!-- date show -->
	<script language="javascript" type="text/javascript">
	var cal = Calendar.setup({            //日期控件
		onSelect : function(cal) {
			cal.hide()
		},
		showTime : true
	});
	cal.manageFields("date_input7", "startTime", "%Y-%m-%d");
	cal.manageFields("date_input8", "onlineTime", "%Y-%m-%d");
	cal.manageFields("date_input9", "endTime", "%Y-%m-%d");
	cal.manageFields("date_input10", "requireTime", "%Y-%m-%d");
	cal.manageFields("date_input11", "designTime", "%Y-%m-%d");
	cal.manageFields("date_input12", "codeTime", "%Y-%m-%d");
	cal.manageFields("date_input13", "testTime", "%Y-%m-%d");
	</script>
	<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
 </form>
 </body>
</html>
