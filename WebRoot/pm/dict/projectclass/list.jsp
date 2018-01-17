<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta name="Author" content="" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<title>项目类别</title>
		<link type="text/css" rel="stylesheet" href="../style/default.css" />
		<link type="text/css" rel="stylesheet" href="../style/message.css" />
		<link rel="stylesheet" type="text/css" href="../style/jscal2.css" />
		<link rel="stylesheet" type="text/css"
			href="../style/border-radius.css" />
		<link rel="stylesheet" type="text/css" href="../style/gold/gold.css" />
		<link rel="stylesheet" type="text/css" href="../style/steel/steel.css" />
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
			<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">

		<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script type="text/javascript" src="${path}/js/msg_patientGroup.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script type="text/javascript" src="../js/jscal2.js"></script>
		<script type="text/javascript" src="../js/lang/cn.js"></script>

	</head>
	<body onload="showHspMessage('${data.message}')">
		<form name="form" method="post" action="projectclass.do">
			<input type="hidden" name="verbId" value="query" />
			<input type="hidden" name="itemCodeHidden" id="itemCodeHidden" value="" />
			<input type="hidden" name="message" id="message" value="" />
			<div class='crm_content_div'>
				<div class='crm_search_div' style='overflow: hidden'>
					<div class="crm_input_item">
						<span>代码</span>
						<input type="text" id="itemCodeCase" name="itemCodeCase"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							class="crm_search_input_text" value="${data.itemCodeCase}" />
					</div>
					<div class="crm_input_item">
						<span>名称</span>
						<input type="text" id="itemNameCase" name="itemNameCase"
							onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
							onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
							class="crm_search_input_text" value="${data.itemNameCase}" />
					</div>
					<div class="crm_input_item">
						<input type="button" value="查询" class="button_blue1_s0" 
							onmouseout="this.className='button_blue1_s0'" 
							onmousedown="this.className='button_blue1_s1'"
							onclick="queryList()" />
						<input type="button" value="新增" class="button_blue1_s0" 
							onmouseout="this.className='button_blue1_s0'" 
							onmousedown="this.className='button_blue1_s1'"
							onclick="toAddpage()" />
					</div>
					<div style="clear: both"></div>
				</div>
				<div class="horizontal_line_2"></div>

				<div class='crm_table_out'>
					<table class='crm_table_content'>
						<thead>
							<tr>
								<td>
									代码
								</td>
								<td>
									名称
								</td>
								<td colspan="3" style="width:20%">
									操作
								</td>

							</tr>
						</thead>
						<tbody id="interval_row_id">
						   <c:if test="${pb.count<=0}">
						<tr>
							<td colspan="7">
								<div>
									<img alt="" src="${path }/style/img/nodate.png">
									<p>主人，没有找到相关数据哦！</p>
								</div>
							</td>
						</tr>
					</c:if>
							<c:forEach items="${data.pdvl}" var="pdvl" begin="0" step="1"
								varStatus="status">
								
								<td>${pdvl.itemCode}</td>
								<td>${pdvl.itemName}</td>
								<td id="detail${status.index}">
									<button class="button_grey2_s0" 
										onmouseout="this.className='button_grey2_s0'"
										onmousedown="this.className='button_grey2_s1'"
										onclick="detail('${pdvl.itemCode}')">
										详细
									</button>
								</td>
								<td id="update${status.index}">
									<button class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'"
										onclick="update('${pdvl.itemCode}')">
										修改
									</button>
								</td>
								<td id="deletes${status.index}">
									<input type="button"  class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'"
										onclick="deleteRow('${pdvl.itemCode}')" value="删除">
										
									
									<input type="hidden" id="id${status.index}"
										value="${list.itemCode}">
								</td>
							</tr>
							</c:forEach>
						</tbody>
						<tfoot <c:if test="${pb.count<=0}">style="display:none"</c:if>>
							<tr>
								<td colspan="7">
									<input type="hidden" title="当前第几页" name="page_index"
										id="page_index" value="${pb.page}" />
									<input type="hidden" title="一共多少页" name="page_count"
										id="page_count" value="${pb.pageCount}" />
									<input type="hidden" title="一共多少条记录" name="count" id="count"
										value="${pb.count}" />
									<input type="hidden" title="每页显示多少条记录" name="page_size"
										id="page_size" value="${pb.pageSize}" />
									<input type="hidden" name="cur_page" id="cur_page"
										value="${pb.page}" />
									<div class="pager_num"></div>
									<div class="pager_text"></div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<!-- date show -->
			<script language="javascript" type="text/javascript">
			function paging(page){
				$("#cur_page").val(page);
				document.form.verbId.value = "query"; 
				document.form.submit();
			}
			function detail(value){
				//var value=$("#itemCode"+index).val();
				document.form.itemCodeHidden.value=value;
				document.form.verbId.value = "detail";
				document.form.message.value = "";
				document.form.submit();
				
			}
			
			function update(value){
				document.form.itemCodeHidden.value=value;
				document.form.verbId.value = "updateInit";
				document.form.message.value = "";
				document.form.submit();
			}
	function queryList() {
		document.form.verbId.value = "query";
		document.form.message.value = "";
		document.form.submit();
	}
	function deleteRow(value) {
			$.messager.defaults = { ok: "是", cancel: "否" };
			$.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
    		if (r){
					document.form.itemCodeHidden.value=value;
					document.form.verbId.value = "delete";
					document.form.message.value = "";
					document.form.submit();
				}
			});
	}
	function resend(id) {
		document.form.idHidden.value=id;
		document.form.verbId.value = "resend";
		document.form.message.value = "";
		document.form.submit();
	}
	function toAddpage(){
		window.location.href="${path}/pm/projectclass.do"+"?verbId="+"addInit";
	}
</script>
			<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
		</form>
	</body>
</html>
