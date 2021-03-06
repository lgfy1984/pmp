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
<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="${path}/js/work.js"></script>
  <script type="text/javascript" src="${path}/js/jscal2.js"></script>
  <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
  <script type="text/javascript">
  var array= new Array();
	
	$(document).ready(function(){
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
	$("input[name='ids']:checked").each(function(){
		if (true == $(this).prop("checked")) {
              array.push($(this).val());
		}
		});
	if(array==""){
		$.messager.alert('提示',"请选择记录。","info"); 
		return;
	}
    document.form.status.value = "1"; 
	document.form.verbId.value = "check"; 
	document.form.message.value = ""; 
	document.form.cur_page.value="1";
	document.form.submit();
   }
   function paging(page){
	$("#cur_page").val(page);
	document.form.verbId.value = "checkList"; 
	document.form.submit();
}
function check_button(){
	var start = $('#startTimeHidden').val();
	var end = $('#endTimeHidden').val();
	if(start!=''&&end!=''&&end<start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "checkList"; 
	document.form.message.value = ""; 
	document.form.cur_page.value="1";
	document.form.submit();
}
   document.onkeydown=banBackSpace;   
  </script>

 </head>
 <body onload="showHspMessage('${data.message}')">
 <form name="form" method="post" action="projectwork.do">
  <input type="hidden" name="verbId" value="queryProjectWorkTimeinfo" />
  <input type="hidden" name="idHidden" id="idHidden" value="" />
  <input type="hidden" name="status" id="status" value="" />
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
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();check_button();" />
		    </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="审核" onclick="checkall_button();" />
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
		  <td style="width:15%">序号</td>
		  <td style="width:25%;text-align: left;padding-left: 30px;">项目编号</td>
		  <td style="width:10%">项目名称</td>
		  <td style="width:10%">员工姓名</td>
		  <td style="width:10%">工作任务</td>
		  <td style="width:10%">工作日期</td>
		  <td style="width:10%">工时</td>
		  <td style="width:10%">审核状态</td>
		  
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
			  	 <c:forEach items='${data.pwv}' var="kd" step="1" varStatus="status">
				  <tr>
					  <td>
					  <c:if test='${kd.status!=1}'>
					  <input type="checkbox" name="ids" id="ids${status.index}" value="${kd.id}"/>
					  </c:if>
					  </td>
					  <td>${kd.seqNo}</td>
					  <td  style="width:25%;text-align: left;padding-left: 30px;">${kd.projectCode}</td>
					  <td>${kd.projectName}</td>
					  <td>${kd.createUserName}</td>
					  <td>${kd.taskName}</td>
					  <td>${kd.workDate}</td>
					  <td>${kd.longTimeCode}</td>
					  <td>${kd.statusName}</td> 
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
	</script>
	<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
 </form>
 </body>
</html>
