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
	/**列表 */
function query_List(){
		window.location.href='${path}/pm/projectbaseinfo.do?verbId=statProjectBaseinfo';
}
	$(function() {
		$("#loadlayer").hide();
		
	});
function query(){
   var  projectBaseinfoIdCase = $('#projectBaseinfoIdCase').val();
   if(projectBaseinfoIdCase==""){
      $.messager.alert('提示',"必须选择项目","info");
		return false;
   }
    $('#verbId').val('stat');
    document.form.submit(); 
    $('#loadlayer').show();
}
	
var selectUsersData = new Array(); 	 
function findProjectList(page){// open a window  	
	$win = $('#win').window({
	    title: '选择项目',
	    width: 820,
	    height: 300,
	    top: ($(window).height()-500) * 0.5,
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
			projectNameCase:projectNameCase,
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
	        var currentRow = $("#dg").datagrid("getSelected");
	        //alert(rowData.id);
	        //alert(rowData.projectCode);
	        $('#projectBaseinfoIdCase').val(rowData.id);
	        //alert($('#projectBaseinfoIdCase').val());
	        $('#staffName').val(rowData.staffName);
	        $('#projectCode').val(rowData.projectCode);
	        $('#projectName').val(rowData.projectName);
	        $('#projectClassName').val(rowData.projectClassName);
	        $('#projectTime').val(rowData.startTime+"-"+rowData.endTime);
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
	$('#count').val(count);
	$('#page_index').val(pageIndex);
	$('#page_count').val(pageCount);
	$('#page_size').val(pageSize);
	updatePager();
	$('#pageshow').show();
	activePage="pageshow";
}
function paging(page) {
	$("#cur_page").val(page);
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
	<form action="projectstat.do" id="form" name="form" method="post"  >
	<input type="hidden"  id="projectBaseinfoIdCase" name="projectBaseinfoIdCase" value='${data.projectBaseinfoIdCase}'/>
	<input type="hidden"  id="flag" name="flag" value='${data.flag}'/>
	<input type="hidden"  id="verbId" name="verbId" value=''/>
	<div class='crm_content_div'>
	<div class="crm_search_div">
		<input type="hidden" id="page" name="page">
	<div class="crm_content_div">
	
	  <div class="crm_search_div">
		<div  class="crm_input_item" style="">
			<span class="">项目编号：</span>
			<input type="text" name="projectCode" id="projectCode" class="stat_text" value='${data.projectCode}' />
		</div>
	
		<div  class="crm_input_item" style="">
			<span class="">项目名称：</span>
			<input type="text" name="projectName" id="projectName" class="stat_text" value='${data.projectName}'  />
		</div>
	
		<div  class="crm_input_item" style="">
			<span class="">项目类别：</span>
			<input type="text" name="projectClassName" id="projectClassName" class="stat_text"   value='${data.projectClassName}' />
		</div>
		<c:if test="${data.flag!=1}">
		<div class="crm_input_item">
			<input type="button" value="选择项目" class="button_grey1_s0"
							style="vertical-align: top;"
							onmousedown="this.className='button_grey1_s1'"
							onmouseout="this.className='button_grey1_s0'"
							onclick="findProjectList('1')" />
		    <input type="button" class="button_blue1_s0" onmousedown="this.className='button_blue1_s1'" onmouseout="this.className='button_blue1_s0'" value="查询" onclick="query();" />
		</div>
		</c:if>
		  <div style="clear:both"></div>
		<div  class="crm_input_item" style="">
			<span class="">项目经理：</span>
			<input type="text" name="staffName" id="staffName" class="stat_text"    value='${data.staffName}' />
		</div>
		
		<div  class="crm_input_item" >
			<span class="">项目计划总周期：</span>
			<input type="text" name="projectTime" id="projectTime" class="stat_text"    value='${data.projectTime}' />
		</div>
		<%-- <div>
		<span>统计方式</span>
			 <select name="termCode" id="type"	class="easyui-combobox  crm_width_3 "
							style='HEIGHT: 25px; width:100px; DISPLAY: none; padding:0px;'
							panelHeight="60px"	editable='false'>
								<option value="1"
									<c:if test="${hisform.termCode=='1'}">selected="selected"</c:if>>按月</option>
								<option value="2"
									<c:if test="${hisform.termCode==('2')}">selected="selected"</c:if>>时间段</option>
				</select>
		</div> --%>
		<div  class="crm_input_item" style="">
			
		</div>
		  <div style="clear:both"></div>
	  </div>
		</div>
			</form>
			<div style="clear:both"></div>
		</div>
		<div class="horizontal_line_2"></div>
		<div class='crm_table_out'>
			<table class='crm_table_content' style="table-layout: fixed;border: 1px solid;">
			   <c:if test='${data.psv == null }'>
						<tr>
							<td colspan="6">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
				</c:if>
				<thead>
					<tr>
						<td style="width:50px;" rowspan="3">序号</td>
						<td style="width:50px;" rowspan="3">姓名</td>
						<td style="width:50px;" rowspan="3">类别</td>
						<td  style="width:50px;" rowspan="3">工作任务</td>
						 <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear}">  
									   <td colspan="${fn:length(data.head3)+13}"  style="width:2000px;">${kd.year}年</td>
							   </c:when>
							   <c:otherwise> 
						          <td  rowspan="5" style="width:50px;">${kd.year}年</td>
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
						<%--  <c:forEach items='${data.head1}' var="kd">
						          <c:if test="${kd.year!=data.curYear}">
						          <td rowspan="5" >${kd.year}年</td>
						          </c:if>
						 </c:forEach> --%>
						<td rowspan="6"  style="width:50px;">合计工时</td>
						<td rowspan="6"  style="width:50px;">合计成本</td>
					</tr>
					<c:if test="${data.head2 != null && fn:length(data.head2) != 0}">
					  <tr>
					      
					      <c:forEach items='${data.head1}' var="kd">
						    <c:choose>
							   <c:when test="${kd.year eq data.curYear}">  
									   <c:forEach  items='${data.head2}' var="km">
									   <c:choose>
									   <c:when test="${km.month eq data.curMonth}">  
											      <td colspan="${fn:length(data.head3)+2}">${km.month}月</td>
									   </c:when>
									   <c:otherwise> 
									      <td>${km.month}月</td>
									   </c:otherwise>
							           </c:choose>
									   </c:forEach>
							   </c:when>
							   <c:otherwise> 
						          
							   </c:otherwise>
							</c:choose>
						 </c:forEach>
					  </tr>
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
											      <td  style="width: 2%;white-space:nowrap;">${km.day}</td>
											   </c:forEach>
											   <td style="width: 2%">本月合计</td>
											   <td style="width: 2%">本年合计</td>
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
						  <td style="width: 3%;">${kd.seqNo}</td>
						  <td style="width: 5%;">${kd.createUserName}</td>
						  <td style="width: 5%;">${kd.chargeTypeName}</td>
						  <td>${kd.projectTaskName}</td>
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
											                 <td  style="width: 7%;">${entry.value}</td>  
											             </c:if>
						                            </c:forEach>  
											   </c:otherwise>
										   </c:choose>
						         </c:forEach> 
						     </c:if>  
						   <%-- <c:forEach items='${data.head1}' var="ky">
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
											${fn:length(data.head3)+fn:length(data.head1)+18}
											</c:if>
					                        <c:if test="${data.head1!=null && (fn:length(data.head3) eq 0)}">
											${fn:length(data.head1)+6}
											</c:if>
											<c:if test="${data.head1 == null}">
											  6
											</c:if>
											" class='crm_edit_item_content' style="">
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
						<input type="hidden" title="当前第几页" name="page_index"
							id="page_index" value="" />
						<input type="hidden" title="一共多少页" name="page_count"
							id="page_count" value="" />
						<input type="hidden" title="一共多少条记录" name="count" id="count"
							value="" />
						<input type="hidden" title="每页显示多少条记录" name="page_size"
							id="page_size" value="" />
						<div class="pager_num"></div>
						<div class="pager_text"></div>
					</div>
				</tfoot>
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
