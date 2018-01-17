<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <meta name="Author" content=""/>
  <meta name="Keywords" content=""/>
  <meta name="Description" content=""/>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
  <title>项目工时信息维护</title>
  <link type="text/css" rel="stylesheet" href="../style/default.css"/>
  <link rel="stylesheet" type="text/css" href="../style/jscal2.css"/>
  <link rel="stylesheet" type="text/css" href="../style/border-radius.css"/>
  <link rel="stylesheet" type="text/css" href="../style/gold/gold.css"/>
  <link rel="stylesheet" type="text/css" href="../style/steel/steel.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
  <script type="text/javascript" src="${path}/js/pager2.js"></script>
  <script type="text/javascript" src="${path}/js/worklock.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="${path}/js/jscal2.js"></script>
<script type="text/javascript" src="${path}/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
 <script type="text/javascript">
  	
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
			getPageSuccessp(data);
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
	        //var currentRow = $("#dg").datagrid("getSelected");//alert(rowData.id);
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


function getPageSuccessp(data) {
	eval("var json = " + data + ";");
	var count = json.count;
	var pageIndex = json.pageIndex;
	var pageCount = json.pageCount;
	var pageSize = json.pageSize;
	$('#count2').val(count);
	$('#page_index2').val(pageIndex);
	$('#page_count2').val(pageCount);
	$('#page_size2').val(pageSize);
	updatePager();
	$('#pageshow').show();
	activePage="pageshow";
}
function paging2(page) {
	$("#cur_page2").val(page);
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


	function HideLoading(){
		$("#loadlayer").hide();
	}
	var array= new Array();
	$(document).ready(function() {$("#checkedAll").click(function(){
	  if($("input[name='ids']").prop("checked") == true){ //check all
	   $("input[name='ids']").each(function(){
	       $("input[name='ids']").prop("checked", false);
	   });
	  }else{
	   $("input[name='ids']").each(function(){
	       $("input[name='ids']").prop("checked", true);
	   });
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
  	</script>

 </head>
 <body onload="showHspMessage('${data.message}')">
 
 
 <form name="form" method="post" action="projectwork.do">
  <input type="hidden" name="verbId" value="queryLock" />
	<input type="hidden" name="projectClassCode" id="projectClassCode" value="${data.projectClassCode}" />
	<input type="hidden" name="projectBaseinfoId" id="projectBaseinfoId" value="${data.projectBaseinfoId}" />
	<input type="hidden" name="lockStatus" id="lockStatus" value=""/>
	<input type="hidden" name="createUserIdHidden" id="createUserIdHidden" value=""/>
	<input type="hidden" name="projectBaseinfoIdHidden" id="projectBaseinfoIdHidden" value=""/>
  <input type="hidden" name="idHidden" id="idHidden" value="${data.id}" />
  <input type="hidden" name="seqNo" id="seqNo" value="${data.seqNo}" />
  <input type="hidden" name="flag" id="flag" value="" />
  <input type="hidden" name="message" id="message" value="" />
  <div class='crm_content_div'>
	  <div style="height: 40px;">
		 <div class="crm_input_item" >
		  	<span class="">员工姓名</span>
		  		 <input type="text" style="width: 112px;height:20px;" name="staffNameHidden" id="staffNameHidden" class="crm_input_text" value='${data.staffNameHidden}'  panelHeight="168" style="width: 120px;height:24px;" />
		  </div>
		 
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();lock_button();" />
		    </div>
		 </div> 
		 
		 
		  
		  <div style="clear:both"></div>
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td style="width:10%">员工姓名</td>
		  <td style="width:25%">项目编号</td>
		  <td style="width:10%">项目名称</td>
		  <td style="width:10%">锁定状态</td>
		  <td style="width:10%">操作</td>
		  
		  </tr>
		  </thead>
			  <tbody id="interval_row_id" >
			    <c:if test='${pb.count<=0}'>
						<tr>
							<td colspan="5">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
			  	 <c:forEach items='${data.pwv}' var="kd" step="1" varStatus="status">
				  <tr>
					  </td>
					  <td>${kd.createUserName}</td>
					  <td  style="width:25%">${kd.projectCode}</td>
					  <td>${kd.projectName}</td>
					  <td style="<c:if test="${kd.lockStatus eq 1}">color:red</c:if>">${kd.lockStatusName}</td> 
					  <td style="cursor:pointer;"  onclick="lock('${kd.projectBaseinfoId}','${kd.createUserId}','${kd.lockStatus}')"><input type="button" class="button_grey2_s0" onmousedown="this.className='button_grey2_s1'" onmouseout="this.className='button_grey2_s0'" value="锁定解锁"  /></td>
					  
				  </tr>
				  </c:forEach>
			  </tbody>
			  <tfoot <c:if test='${pb.count<=0}'>style="display:none"</c:if>>
			  <tr>
			  <td colspan="5">
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
