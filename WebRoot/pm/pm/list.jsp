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
  <script type="text/javascript" src="${path}/js/consultion.js"></script>
  <script type="text/javascript" src="${path}/js/default.js"></script>
  <script type="text/javascript" src="../js/jscal2.js"></script>
  <script type="text/javascript" src="../js/lang/cn.js"></script>
  <script type="text/javascript">
	function downList(){
	var start = $('#f_date1').val();
	var end = $('#f_date2').val();
	if(start!=''&&end!=''&&end<=start){
		$.messager.alert('提示',"结束时间不能小于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "downList"; 
	document.form.message.value = ""; 
	document.form.cur_page.value="0";
	document.form.submit();
}
  </script>

 </head>
 <body onload="showHspMessage('${data.message}')">
 <form name="form" method="post" action="/pm/projectbaseinfo.do">
  <input type="hidden" name="verbId" value="queryConsultation" />
  <input type="hidden" name="idHidden" id="idHidden" value="" />
  <input type="hidden" name="message" id="message" value="" />
  <div class='crm_content_div'>
	  <div style="height: 40px;">
		 <%--  <div class="crm_input_item" >
		  	<span class="">咨询途径</span>
		  		 <select name="consultationByIdHidden" id="consultationByIdHidden" class="easyui-combobox" editable="false" panelHeight="168" style="width: 120px;height:24px;" >
		  		 	<option value="">全部</option>
					<c:forEach items="${data.consultationWay}" var="kd">
						<option value="${kd.key}" ${data.consultationByIdHidden==kd.key?"selected":""}>${kd.value}</option>
			      	</c:forEach>
			      </select>
		  </div>
		  <div class="crm_input_item" >
		  	<span class="">咨询类别</span>
		  		  <select name="consultationClassIdHidden" id="consultationClassIdHidden" class="easyui-combobox" editable="false" panelHeight="168" style="width: 120px;height:24px;">
		  		  	<option value="">全部</option>
			    	<c:forEach items="${data.consultationClass}" var="kd">
						<option value="${kd.key}" ${data.consultationClassIdHidden==kd.key?"selected":''}>${kd.value}</option>
			      	</c:forEach>
			      </select>
		  </div>
		  
		  <div class="crm_input_item" >
		  	<span class="">状&nbsp;&nbsp;&nbsp;&nbsp;态</span>
		  		  <select name="executedFlagIdHidden" id="executedFlagIdHidden" class="easyui-combobox" editable="false" panelHeight="68" style="width: 120px;height:24px;">
		  		  	<option value="" >全部</option>
					<option value="0" ${data.executedFlagIdHidden=='0'?"selected":""}>完成</option>
					<option value="1" ${data.executedFlagIdHidden=='1'?"selected":""}>待回复</option>
			      </select>
		  </div>
		   <div class="crm_input_item" >
		      <input type="radio" name="sort" id="sort" value="0" <c:if test="${data.sort eq '0' || data.sort == null}">checked="checked"</c:if>>升序</input>
		    </div>
		    <div class="crm_input_item" >
		      <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="clearSelect();query_button();" />
		    </div>
		 </div> 
		 <div class="crm_input_item" >
		  	<span class="">咨询时间</span>
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="f_date1" name="collectTimeHidden" value="${data.collectTimeHidden}" readonly/>
		  			<img id="date_input1" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>-
		  			<span  class="calendarspan">
		  			<input type="text" class="crm_search_input_text crm_width_3" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" id="f_date2" name="collectTimeEndHidden" value="${data.collectTimeEndHidden}" readonly/>
		  			<img id="date_input2" src="${path}/style/img/calendar_button.gif" class="calendarimg"/></span>
		  </div> --%>
		  <div class="crm_input_item" style="margin-left: 109px;">
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
 			<div class="download_button_s1 " onclick="downList();">
		     <img alt="" src="${path }/style/img/down.png" style="margin-top: 5px;margin-left: 10px;">
		     <span style="position: absolute;color: #fff;">导出</span>
		    </div>
		</div>
		  <div style="clear:both"></div>
	  </div>
	  <div class="horizontal_line_2"></div>
	  <div class='crm_table_out'>
		  <table style="table-layout: fixed;" class='crm_table_content' >
		  <thead>
		  <tr>
		  <td style="width:15%">序号</td>
		  <td style="width:10%">项目名字</td>
		  <td style="width:25%;text-align: left;padding-left: 30px;">项目类别</td>
		  <td style="width:10%">开始时间</td>
		  <td style="width:10%">上线时间</td>
		  <td style="width:10%">结束时间</td>
		  <td colspan="3" style="width:220px">操作</td>
		  
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
			  	 <c:forEach items='${data.pbi}' var='kd'>
				  <tr>
					  <td>${kd.seqNo}</td>
					  <td>${kd.projectName}</td>
					  <td>${kd.projectClass}</td>
					  <td>${kd.startTime}</td>
					  <td>${kd.onlineTime}</td>
					  <td>${kd.endTime}</td> 
					  <td style="cursor:pointer;" onclick="showDetail('${kd.id}')"><input type="button" class="button_grey2_s0" onmousedown="this.className='button_grey2_s1'" onmouseout="this.className='button_grey2_s0'" value="详细"  /></td>
				  	 <c:choose>
       					<c:when test='${data.createUserName eq kd.executedOperateHuman}'>
       						<td style="cursor:pointer;" onclick="updateConsultation('${kd.id}');"><input type="button" class="button_grey2_s0" onmousedown="this.className='button_grey2_s1'" onmouseout="this.className='button_grey2_s0'" value="修改"  /></td>
					  		<td style="cursor:pointer;" onclick="deleteConsultationById('${kd.id}');"><input type="button" class="button_grey2_s0" onmousedown="this.className='button_grey2_s1'" onmouseout="this.className='button_grey2_s0'" value="删除"  /></td>
					  		
       					</c:when>
       					<c:otherwise>
       						<td></td>
       						<td></td>
       					</c:otherwise>
					</c:choose>	
				  </tr>
				  </c:forEach>
			  </tbody>
			  <tfoot <c:if test='${pb.count<=0}'>style="display:none"</c:if>>
			  <tr>
			  <td colspan="9">
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
	cal.manageFields("date_input1", "f_date1", "%Y-%m-%d");
	cal.manageFields("date_input2", "f_date2", "%Y-%m-%d");
	</script>
	<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
 </form>
 </body>
</html>