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
  <script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${path}/js/pager.js"></script>
  <script type="text/javascript" src="${path}/js/stat.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="${path}/js/jscal2.js"></script>
  <script type="text/javascript" src="${path}/js/lang/cn.js"></script>
 <script type="text/javascript">
  /**详细*/
function showDetail(idHidden){
       
		window.location.href='${path}/pm/projectstat.do?verbId=stat&projectBaseinfoIdCase='+idHidden+'&flag=1';
		
  /*   var urls= '${path}/pm/projectstat.do?verbId=statprInit&idHidden'+idHidden;
	alert(urls);
	$('#form').form('submit', {
		url:urls,
		onSubmit: function(){
		//进行表单验证
		//如果返回false阻止提交
		},
		success:function(data){
		}
		}); */
}
  	</script>

 </head>
 <body onload="showHspMessage('${data.message}')">
 <form name="form" id="form" method="post" action="projectbaseinfo.do">
  <input type="hidden" name="verbId" value="queryProjectBaseinfo" />
  <input type="hidden" name="idHidden" id="idHidden" value="" />
  <input type="hidden" name="staffCode" id="staffCode" value="" />
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
		  <div class="crm_input_item" style="">
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
		    </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();query_button();" />
		    </div>
			<!-- <div class="crm_input_item" >
	 			<div class="download_button_s1 " onclick="downList();">
			     <img alt="" src="${path }/style/img/down.png" style="margin-top: 5px;margin-left: 10px;">
			     <span style="position: absolute;color: #fff;">导出</span>
			    </div> -->
			</div>
		 </div> 
		 
		 <div class="crm_input_item" >
		  	<span class="">项目名称</span>
		  		 <input type="text" style="width: 112px;height:20px;" name="projectNameHidden" id="projectNameHidden" class="crm_input_text" value='${data.projectNameHidden}'  panelHeight="168" style="width: 120px;height:24px;" />
		  </div>
		 <div class="crm_input_item" >
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
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="onlineStartTimeHidden" name="onlineStartTimeHidden" value="${data.onlineStartTimeHidden}" />
		  			<img id="date_input3" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="onlineEndTimeHidden" name="onlineEndTimeHidden" value="${data.onlineEndTimeHidden}" />
		  			<img id="date_input4" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div>
		 <div class="crm_input_item" >
		  	<span class="">结束时间</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="endStartTimeHidden" name="endStartTimeHidden" value="${data.endStartTimeHidden}" />
		  			<img id="date_input5" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="endEndTimeHidden" name="endEndTimeHidden" value="${data.endEndTimeHidden}" />
		  			<img id="date_input6" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div>
		  <div style="clear:both"></div>
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td style="width:15%">序号</td>
		  <td style="width:10%">项目编号</td>
		  <td style="width:25%;text-align: left;padding-left: 30px;">项目名称</td>
		  <td style="width:10%">项目类别</td>
		  <td style="width:10%">项目经理</td>
		  <td style="width:10%">开始时间</td>
		  <td style="width:10%">上线时间</td>
		  <td style="width:10%">结束时间</td>
		  <td style="width:20%">操作</td>
		  
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
			  	 <c:forEach items='${data.pbi}' var="kd">
				  <tr>
					  <td>${kd.seqNo}</td>
					  <td>${kd.projectCode}</td>
					  <td  style="width:25%;text-align: left;padding-left: 30px;">${kd.projectName}</td>
					  <td>${kd.projectClassName}</td>
					  <td>${kd.staffName}</td>
					  <td>${kd.startTime}</td>
					  <td>${kd.onlineTime}</td>
					  <td>${kd.endTime}</td> 
					  <td style="cursor:pointer;" onclick="showDetail('${kd.id}')"><input type="button" class="button_grey2_s0" onmousedown="this.className='button_grey2_s1'" onmouseout="this.className='button_grey2_s0'" value="详细"  /></td>
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
			
  <!-- date show -->
	<script language="javascript" type="text/javascript">
	var cal = Calendar.setup({            //日期控件
		onSelect : function(cal) {
			cal.hide()
		},
		showTime : true
	});
	cal.manageFields("date_input1", "startStartTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input2", "startEndTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input3", "onlineStartTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input4", "onlineEndTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input5", "endStartTimeHidden", "%Y-%m-%d");
	cal.manageFields("date_input6", "endEndTimeHidden", "%Y-%m-%d");
	</script>
	<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
 </form>
 </body>
</html>
