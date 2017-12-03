<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>详细</title>
		<meta http-equiv="keywords" content="" />
		<meta http-equiv="description" content="" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css" />
		<link type="text/css" rel="stylesheet" href="${path}/style/pm.css" />
		<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="${path}/js/charge.js"></script>
		<script language="javascript" src="${path}/js/LodopFuncs.js"></script>
		<script language="javascript">
	    function QWPrint(){
	    	var detailName="详细信息";
	    	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),detailName);
	    	if(LODOP!=undefined){
	    		//table表格信息
	    		LODOP.ADD_PRINT_TABLE(60,0,"100%","100%",document.documentElement.innerHTML);		    		
	    		
	    		document.getElementById("crm_button_sub").style.display="none";
	    		//执行打印
	    		LODOP.PREVIEW();
	    		//LODOP.PRINT();
	    		document.getElementById("crm_button_sub").style.display="block";
	    	}else{
	    		$.messager.alert("操作提示", "打印环境异常!","error");
	    	}
	    	
   }
	</script>
	</head>
	<body>
		<form id="form" name="form" method="post" action="projectfinancew.do">
			<input type="hidden" name="verbId" value="queryFinanceRecordinfo" />
			<input type="hidden" name="message" id="messageId" value="" />
			<div class='crm_edit_panel'>
				<table class='crm_panel_table'>
					<tr>
						<td class='crm_edit_item_name'>
							项目编号
						</td>

						<td colspan="3" class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.projectCode}" />

						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name'>
							项目名称
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.projectName}" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							项目类别
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.projectClassName}"  />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 项目经理
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.staffName}"  />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							工作任务
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.taskName}" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							工时
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.longTime}" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 费用
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text"  class="text readonly" readonly
								value="${data.costs}"/>
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							费用发生月份
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text"  class="text readonly" readonly
								value="${data.workDate}" />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 员工姓名
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.createUserName}"  />
						</td>
					</tr>
					<tr>
						<td class='crm_edit_item_name' >
							 序号
						</td>
						<td colspan="3"  class='crm_edit_item_content'>
							<input type="text" class="text readonly" readonly
								value="${data.seqNo}"  />
						</td>
					</tr>
					<tfoot>
						<tr>
							<td class="crm_edit_item_name"></td>
							<td colspan="3" class='crm_edit_item_content'>
								<div class='crm_button_sub' id="crm_button_sub">
								  <input type="button" value="返回" class="button_grey1_s0"
										onmousedown="this.className='button_grey1_s1'"
										onmouseout="this.className='button_grey1_s0'"
										onclick="query_List();" />
									<div class=" download_button_s1 left" onclick="QWPrint();"
										id="downprintarea" style="margin-left: 130px;">
										<img alt="" src="${path }/style/img/print.png"
											style="margin-top: 5px; margin-left: 10px;">
											<span style="position: absolute; color: #fff;">打印</span>
									</div>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>

		</form>
	</body>
</html>
