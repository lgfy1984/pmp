<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"
	language="java" import="java.util.*,com.tianjian.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>

<title>随访综合统计</title>
<link rel="stylesheet" type="text/css" href="${path}/style/default.css">
<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/border-radius.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/gold/gold.css">
<link rel="stylesheet" type="text/css"	href="${path}/style/steel/steel.css">
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
</script>
</head>

<body>
	<div class='crm_content_div'>
	<input type="hidden" readonly="readonly" id="projectBaseinfoIdCase" value=""/>
	<div class="crm_search_div">
	<form action="${path }/pm/projectstat.do?verbId=statep"
				method="post" id="historicalForm">
		<input type="hidden" id="page" name="page">
	<div class="crm_content_div">
	
	  <div class="crm_search_div">
		<div  class="crm_input_item" style="margin:6px 0px 0px 400px;height:22px;text-align: center;vertical-align: center">
			<span class="">员工工时统计</span>
		</div>
	
		
		<div class="crm_input_item" style="margin-left: 400px;">
		    <input type="submit" class="button_blue1_s0"  onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="$('#loadlayer').show();" />
		</div>
		 
		  <div style="clear:both"></div>
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
						<td style="width: 3%;">序号</td>
						<td style="width: 5%;">姓名</td>
						<td>工作任务</td>
						 <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear}">  
									   <td colspan="12">${kd.year}</td>
							   </c:when>
							   <c:otherwise> 
						          <td style="width: 7%;">${kd.year}</td>
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
					<tr>
					<c:if test="${data.head2 != null && fn:length(data.head2) != 0}">
					  <tr>
					      <td rowspan="2"></td>
					      <td rowspan="2" style="width: 2%;"></td>
					      <td rowspan="2"></td>
					      <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear}">  
									   <c:forEach  items='${data.head2}' var="km">
									      <td rowspan="2">${km.month}</td>
									   </c:forEach>
							   </c:when>
							   <c:otherwise> 
						          <td rowspan="2"> </td>
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
					  <tr>
					</c:if>
				</thead>
				<tbody >
					 <c:forEach items='${data.psv}' var="kd">
					    <tr>
						  <td style="width: 3%;">${kd.seqNo}</td>
						  <td style="width: 5%;">${kd.createUserName}</td>
						  <td>${kd.projectTaskName}</td>
						     <c:if test="${data.head1 != null && fn:length(data.head1) != 0 }">
						         <c:forEach  items='${data.head1}' var="kh">
						                   <c:choose>
							                   <c:when test="${kh.year eq data.curYear}">  
													   <c:forEach  items='${data.head2}' var="km">
						                                   <c:forEach items="${kd.map}" var="entry"> 
														       <c:if test="${entry.key==km.month }">
													                 <td>${entry.value}</td>  
													            </c:if>
													       </c:forEach>
						                                </c:forEach>  
											   </c:when>
											   <c:otherwise> 
						                           <c:forEach items="${kd.map}" var="entry"> 
											             <c:if test="${kh.year==entry.key }">
											                 <td  style="width: 7%;">${entry.value}</td>  
											             </c:if>
						                            </c:forEach>  
											   </c:otherwise>
										   </c:choose>
						         </c:forEach> 
						     </c:if>  
					  </tr>
				  </c:forEach>

				</tbody>
			</table>
		</div>
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
	cal.manageFields("img_date_1", "Start", "%Y-%m-%d");
	cal.manageFields("img_date_2", "End", "%Y-%m-%d");
</script>
</html>
