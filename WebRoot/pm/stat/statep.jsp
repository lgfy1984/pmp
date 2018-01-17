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
	function query_List(){
		window.location.href='${path}/security/securityStaffBaseinfo.do?verbId=statInit';
}
	$(function() {
		$("#loadlayer").hide();
		
	});
</script>
<style> 
.crm_table_content thead tr{
	font-weight: bolder;
	border: 1px solid;
}
.crm_table_content thead td{
	font-weight: bolder;
	border: 1px solid;
}
.crm_table_content tbody td{
	height:38px;
	color:#666666;
	padding:0;
	text-align:center;
	border: 1px solid;

/* 	text-align:left; */
}

.crm_table_out{
	overflow-x:scroll;
}
</style> 
</head>

<body>
	<div class='crm_content_div'>
	<input type="hidden" readonly="readonly" id="projectBaseinfoIdCase" value=""/>
	<div class="crm_search_div">
	<form action="${path }/pm/projectstat.do?verbId=statep" name="form"
				method="post" id="historicalForm">
		<input type="hidden" id="page" name="page">
	<div class="crm_content_div">
	
	  <div class="crm_search_div">
		<div  class="crm_input_item" style="margin:6px 0px 0px 400px;height:22px;text-align: center;vertical-align: center">
			<span class="">员工工时统计</span>
		</div>
	
		
		<c:if test="${data.flag!=1}">
			<div class="crm_input_item" style="margin-left: 400px;">
			    <input type="submit" class="button_blue1_s0"  onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="$('#loadlayer').show();" />
			</div>
		 </c:if>
		  <div style="clear:both"></div>
	  </div>
		</div>
			</form>
			<div style="clear:both"></div>
		</div>
		<div class="horizontal_line_2"></div>
		<div class='crm_table_out'>
			<table class='crm_table_content'>
			
			    <c:if test='${data.psv == null }'>
						<tr>
							<td colspan="7">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
				</c:if>
				<thead>
					<tr>
						<td rowspan="5"   style="white-space:nowrap;">&nbsp;序号&nbsp;</td>
						<td rowspan="5"   style="white-space:nowrap;">&nbsp;姓名&nbsp;</td>
						<td rowspan="5"   style="white-space:nowrap;">&nbsp;项目名称&nbsp;</td>
						<td rowspan="5"   style="white-space:nowrap;">&nbsp;项目类别&nbsp;</td>
						<td rowspan="5"   style="white-space:nowrap;">&nbsp;工作任务&nbsp;</td>
						 <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear}">  
									   <td colspan="${fn:length(data.head3)+13}" style="width: 2500px;">${kd.year}年</td>
							   </c:when>
							   <c:otherwise> 
						          <td rowspan="5"  style="white-space:nowrap;">&nbsp;${kd.year}年&nbsp;</td>
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
						  <%-- <c:forEach items='${data.head1}' var="kd">
						          <c:if test="${kd.year!=data.curYear}">
						          <td rowspan="5">${kd.year}年</td>
						          </c:if>
						 </c:forEach> --%>
						<td rowspan="5" style="white-space:nowrap;">合计工时</td>
						<td rowspan="5" style="white-space:nowrap;">合计成本</td>
					<tr>
					<c:if test="${data.head2 != null && fn:length(data.head2) != 0}">
					  <tr>
					      
					      <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear }">  
									   <c:forEach  items='${data.head2}' var="km">
									   <c:choose>
									   <c:when test="${km.month eq data.curMonth}">  
											      <td colspan="${fn:length(data.head3)+2}"   style="white-space:nowrap;">&nbsp;${km.month}月&nbsp;</td>
									   </c:when>
									   <c:otherwise> 
									      <td style="white-space:nowrap;">&nbsp;${km.month}月&nbsp;</td>
									   </c:otherwise>
							           </c:choose>
									   </c:forEach>
							   </c:when>
							   <c:otherwise> 
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
						
					  <tr>
					</c:if>
					<c:if test="${data.head3 != null && fn:length(data.head3) != 0}">
					  <tr>
					      <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear}">  
									   <c:forEach  items='${data.head2}' var="km">
									   <c:choose>
									   <c:when test="${km.month eq data.curMonth}">  
											   <c:forEach  items='${data.head3}' var="km">
											      <td  style="white-space:nowrap;"> &nbsp;${km.day}&nbsp; </td>
											   </c:forEach>
											   <td style="width: 50px;white-space:nowrap;">本月合计</td>
											   <td style="width: 50px;white-space:nowrap;">本年合计</td>
									   </c:when>
									   <c:otherwise> 
									      <td ></td>
									   </c:otherwise>
							           </c:choose>
									   </c:forEach>
							   </c:when>
							   <c:otherwise> 
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
					  <tr>
					</c:if>
				</thead>
				<tbody >
					 <c:forEach items='${data.psv}' var="kd">
					    <tr>
						  <td style="width: 50px;">${kd.seqNo}</td>
						  <td style="width: 50px;">${kd.createUserName}</td>
						  <td style="width: 50px;">${kd.projectName}</td>
						  <td style="width: 50px;">${kd.projectClassName}</td>
						  <td style="width: 50px;">${kd.projectTaskName}</td>
						     <c:if test="${data.head1 != null && fn:length(data.head1) != 0 }">
						         <c:forEach  items='${data.head1}' var="kh">
						                   <c:choose>
							                   <c:when test="${kh.year eq data.curYear}">  
													   <c:forEach  items='${data.head2}' var="km">
													              <c:choose>
														             <c:when test="${data.curMonth==km.month}">
														                
													   <c:forEach  items='${data.head3}' var="kmd">
													         
												            <c:forEach items="${kd.map}" var="entryday"> 
												                <c:if test="${kmd.day==entryday.key }">
														                   <td>${entryday.value}</td>
														        </c:if>
														    </c:forEach> 
													   </c:forEach> 
													   
														      <td>${kd.sumCurMonth}</td>
													        <c:forEach items="${kd.totalmap}" var="tm"> 
												                <c:if test="${data.curYear==tm.key }">
														                   <td>${tm.value}</td>
														        </c:if>
														    </c:forEach> 
											                          </c:when>  
												                       <c:otherwise> 
												                          <c:forEach items="${kd.map}" var="entry"> 
																	             <c:if test="${km.month==entry.key }">
																	                 <td>${entry.value}</td>  
																	             </c:if>
												                            </c:forEach>  
														                </c:otherwise>
											                      </c:choose>
													     </c:forEach>
											   </c:when>
											   <c:otherwise> 
											    <c:forEach items="${kd.map}" var="entry"> 
											             <c:if test="${kh.year==entry.key }">
											                 <td >${entry.value}</td>  
											             </c:if>
						                            </c:forEach>  
											   </c:otherwise>
										   </c:choose>
						         </c:forEach> 
						     </c:if>  
						 
						<%--  <c:forEach items='${data.head1}' var="ky">
						          <c:if test="${ky.year!=data.curYear}">
							          <c:forEach items="${kd.totalmap}" var="entryday"> 
						                  <c:if test="${ky.year==entryday.key }">
									         <td>${entryday.value}</td>
								           </c:if>
								    </c:forEach> 
							    </c:if>
						 </c:forEach> --%>
						  <td>${kd.totalCount}</td>
						  <td>${kd.totalProjectValue}</td>
					  </tr>
				  </c:forEach>

				</tbody>
				 <c:if test="${data.flag eq 1 }">
								<tfoot>
										<tr>
											<td colspan="
					                       <c:if test="${data.head3 != null && fn:length(data.head3) != 0}">
											${fn:length(data.head3)+fn:length(data.head1)+19}
											</c:if>
					                        <c:if test="${data.head1!=null && (fn:length(data.head3) eq 0)}">
											${fn:length(data.head1)+8}
											</c:if>
											<c:if test="${fn:length(data.head1) eq 0}">
											  7
											</c:if>
											" class='crm_edit_item_content'>
												<div class='crm_button_sub' id="crm_button_sub">
													<input type="button" value="返回" class="button_grey1_s0"
														onmousedown="this.className='button_grey1_s1'"
														onmouseout="this.className='button_grey1_s0'"
														onclick="query_List();" />
												</div>
											</td>
										</tr>
									</tfoot>
						     </c:if>  
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
