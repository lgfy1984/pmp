<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <meta name="Author" content=""/>
  <meta name="Keywords" content=""/>
  <meta name="Description" content=""/>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
  <title>项目费用信息维护</title>
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
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
  <script type="text/javascript" src="${path}/js/pager2.js"></script>
  <script type="text/javascript" src="${path}/js/charge.js"></script>
  <script type="text/javascript" src="${path}/js/jscal2.js"></script>
<script type="text/javascript" src="${path}/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
  <script type="text/javascript">
  	


	/**查找电话号码历史 */
  	var selectUsersData = new Array(); 	 
function findStaffList(page){// open a window  	
	$win = $('#winstaff').window({
	    title: '选择人员',
	    width: 820,
	    height: 350,
	    top: ($(window).height()-400) * 0.5,
	    left: ($(window).width()-900) * 0.5,
	    shadow: true,
	    modal: true,
	    closed: true,
	    minimizable: false,
	    maximizable: false,
	    collapsible: false
	});

	$('#winstaff').window('open'); 
	
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
			getPageStaffSuccess(data);
		}
	});
	$('#dgstaff').datagrid( {
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
	        $('#workStaffCode').val(rowData.id);
	        $('#workStaffName').val(rowData.staffName);
	        $('#winstaff').window('close');  
	    }		
	});
} 
function findProjectList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目',
	    width: 820,
	    height: 350,
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


function getPageStaffSuccess(data) {
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
	$('#pageshowstaff').show();
	activePage="pageshowstaff";
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
            	window.location='${path}/pm/projectcost.do?verbId=exportFile&projectClassCodeCase='+projectClassCodeCase
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
			                url:'${path}/pm/projectcost.do?verbId=importfile',          
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
   function clearInput(){
        $('#projectName').val("");
        $('#projectClassName').val("");
        $('#projectCode').val("");
        $('#workDate').val("");
        $('#longTime').val("");
        $('#costs').numberbox('clear');
        $('#staffName').val("");
        $('#workStaffName').val("");
        $('#taskCode').combobox('clear');
        $('#idHidden').val("");
   }
   document.onkeydown=banBackSpace; 
  	</script>

 </head>
 <body onload="showHspMessage('${data.message}')">
  <form  name="form1" id="form1" method="post" enctype="multipart/form-data" >
			 <div id='uploadPictureWrapper'  class="crm_input_item" style="margin-top: 3px;margin-left: 10px;float: right;">
		         	<span class="">导入excel</span>
			    <input type="file" id="fileToUpload"   class="crm_search_input_text"  name="fileToUpload" onchange="importExcelFile();" />
		      </div>
 </form>
 <form name="form" id="form"   method="post" action="projectcost.do">
  <input type="hidden" name="verbId" value="queryFinanceCostinfo" />
	<input type="hidden" name="workStaffCode" id="workStaffCode" value="${data.workStaffCode}" />
	<input type="hidden" name="projectClassCode" id="projectClassCode" value="${data.projectClassCode}" />
	<input type="hidden" name="projectBaseinfoId" id="projectBaseinfoId" value="${data.projectBaseinfoId}" />
  <input type="hidden" name="seqNo" id="seqNo" value="${data.seqNo}" />
  <input type="hidden" name="idHidden" id="idHidden" value="${data.idHidden}" />
  <input type="hidden" name="flag" id="flag" value="" />
  <input type="hidden" name="message" id="message" value="" />
  <div class='crm_content_div'>
	  <div style="height: 40px;">
		  <div class="crm_input_item" >
		  	<span class="">项目类别</span>
		  		 <select name="projectClassCodeCase" id="projectClassCodeCase" class="easyui-combobox" editable="false" panelHeight="168" style="width: 120px;height:24px;" >
		  		 	<option value="">全部</option>
					<c:forEach items="${data.projectClass}" var="kd">
						<option value="${kd.key}" ${data.projectClassCodeCase==kd.key?"selected":""}>${kd.value}</option>
			      	</c:forEach>
			      </select>
		  </div>
		  <div class="crm_input_item" >
		  	<span class="">项目名称</span>
		  		 <input type="text" style="width: 112px;height:20px;" name="projectNameCase" id="projectNameCase" class="crm_input_text" value='${data.projectNameCase}'  panelHeight="168" style="width: 120px;height:24px;" />
		  </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();queryf_button();" />
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
		 </div>
		 
		 <div class="crm_input_item" >
		  	<span class="">员工姓名</span>
		  		 <input type="text" style="width: 112px;height:20px;" name="staffNameHidden" id="staffNameHidden" class="crm_input_text" value='${data.staffNameHidden}'  panelHeight="168" style="width: 120px;height:24px;" />
		  </div> 
		 <div class="crm_input_item" >
		  	<span class="">时间条件</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="startTimeHidden" name="startTimeHidden" value="${data.startTimeHidden}" />
		  			<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="endTimeHidden" name="endTimeHidden" value="${data.endTimeHidden}" />
		  			<img id="date_input2" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div>
		   
		  <div style="clear:both"></div>
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td style="width:15%"><input type="checkbox" name="checkedAll" id="checkedAll"/>全选</td>
		  <td style="width:10%">项目编号</td>
		  <td style="width:25%">项目名称</td>
		  <td style="width:10%">员工姓名</td>
		  <td style="width:10%">发生时间</td>
		  <td style="width:10%">实施费用</td>
		  </tr>
		  </thead>
			  <tbody id="interval_row_id" >
			    <c:if test='${pb.count<=0}'>
						<tr>
							<td colspan="6">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
			  	 <c:forEach items='${data.pfv}' var="kd" step="1" varStatus="status">
				  <tr>
					  <td><input type="checkbox" name="ids" id="ids${status.index}" value="${kd.id}" /></td>
					  <td>${kd.projectCode}</td>
					  <td><a href="javascript:void(0)" onclick="showDetail('${kd.id}')">${kd.projectName}</a></td>
					  <td>${kd.workStaffName}</td>
					  <td>${kd.workDate}</td>
					  <td>${kd.costs}元</td>
					 
				  </tr>
				  </c:forEach>
			  </tbody>
			  <tfoot <c:if test='${pb.count<=0}'>style="display:none"</c:if>>
			  <tr>
			  <td colspan="6">
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
							项目名称
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="projectName" id="projectName" class="text"
								onblur="fEvent('blur',this)"  value='${data.projectName}'
								onmouseover="fEvent('mouseover',this)"  readonly
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
								
						<input type="button" value="选择项目" class="button_grey1_s0"
							style="vertical-align: top;"
							onmousedown="this.className='button_grey1_s1'"
							onmouseout="this.className='button_grey1_s0'"
							onclick="findProjectList('1')" />
						</td>
						<td class='crm_edit_item_name'>
							项目编号
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="projectCode" id="projectCode" class="text"
								onblur="fEvent('blur',this)" value='${data.projectCode}'
								onmouseover="fEvent('mouseover',this)"  readonly
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />

						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							项目类别
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="projectClassName" id="projectClassName" class="text"
								onblur="fEvent('blur',this)" value='${data.projectClassName}'  readonly
								onmouseover="fEvent('mouseover',this)"  readonly
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
						</td>
						<td class='crm_edit_item_name' >
							 项目经理
						</td>
						<td   class='crm_edit_item_content'>
							<input type="text" name="staffName" id="staffName" class="text"  readonly
							    value='${data.staffName}' />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							工作任务
						</td>
						<td   class='crm_edit_item_content'>
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
						<td class='crm_edit_item_name' >
							 费用
						</td>
						<td   class='crm_edit_item_content'>
							<input type="text" name="costs" id="costs" class="easyui-numberbox"
							    value='${data.costs}'   style="width:205px;	height:30px;line-height:26px;padding-left:5px;padding-right:5px;border:1px solid #dedede;font-size:12px;"
								onblur="fEvent('blur',this)" precision="2" validType ="VerifyMoney[{'maxVal':9999999999 ,'minVal':0},'只能输入数字']" required="true"
								onmouseover="fEvent('mouseover',this)" missingMessage="必须填大于0的数字 "
								onfocus="fEvent('focus',this)" 
								onmouseout="fEvent('mouseout',this)" 
								 />
					
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							费用发生月份
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text" name="workDate" id="workDate" class="text"
							    value='${data.workDate}' 
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
								
		  			<span  class="calendarspan">
		  			<img id="date_input3" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
						</td>
						 <td class='crm_edit_item_name' >
							 员工姓名
						</td>
						<td  class='crm_edit_item_content'>
							<input type="text"  name="workStaffName" id="workStaffName" class="text" required="true"  readonly
							    value='${data.workStaffName}' />
					
						    <input type="button" value="选择人员" class="button_grey1_s0"
							style="vertical-align: top;"
							onmousedown="this.className='button_grey1_s1'"
							onmouseout="this.className='button_grey1_s0'"
							onclick="findStaffList('1')" />
						</td>
					</tr>
				</table>
			</div>
			<div class='crm_button_sub'>
				<input type="button" value="保存" class="button_blue1_s0"
					onmousedown="this.className='button_blue1_s1'"
					onmouseout="this.className='button_blue1_s0'"
					onclick="saveForm('0');" />
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
			<div id="winstaff" class="easyui-window" closed="true" title=""
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
					
				<table id="dgstaff"></table>
				<tfoot>
					<div id="pageshowstaff" style="display: none;">
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
	cal.manageFields("date_input1", "startTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input2", "endTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input3", "workDate", "%Y-%m-%d");
	</script>
	<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
 </form>
 </body>
</html>
