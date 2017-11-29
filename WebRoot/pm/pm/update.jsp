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
  
  <body>
  	  <form name="form" id="form" method="post" action="projectbaseinfo.do" >
			<input type="hidden" name="verbId" value="update" />
  	  <input type="hidden" name="message" id="messageId" value="修改成功！"/>
  	  <input type="hidden" name="idHidden" value="${data.id}" />
  	  <input type="hidden" name="cur_page" id="cur_page" value="${data.page_index}"/>
  	  <input type="hidden" name="projectClassCodeHidden" id="projectClassCodeHidden" value="${data.projectClassCodeHidden}"/>
  	  <input type="hidden" name="startTimeHidden" id="startTimeHidden" value="${data.startTimeHidden}"/>
  	  <input type="hidden" name="endTimeHidden" id="endTimeHidden" value="${data.endTimeHidden}"/>
      
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
							<input type="text" name="staffName" id="staffName" class="text"  value='${data.createUserName}'
								onblur="fEvent('blur',this)"
								onmouseover="fEvent('mouseover',this)"
								onfocus="fEvent('focus',this)" required="true"
								onmouseout="fEvent('mouseout',this)" validtype="length[1,25]"
								invalidMessage="有效长度1-25" />
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
