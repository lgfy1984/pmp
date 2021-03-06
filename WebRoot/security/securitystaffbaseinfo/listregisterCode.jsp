<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="com.tianjian.util.comm.TJInit" %>
<jsp:useBean id="securityStaffBaseinfo" 
	scope="request" type="com.tianjian.security.struts.form.SecurityStaffBaseinfoForm" />
<jsp:useBean id="pb" scope="request" class="com.tianjian.util.comm.PageBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%
		if (request.getServerPort() == 80) {
		%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%
		} else {
		%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%
		}
		%>
		<title><bean:message key="security.jsp.securitystaffbaseinfo.list.title" bundle="security"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="include.js.TJMessage.path" bundle="security" />"></script>
		<script type="text/javascript" src="${path}/js/pager.js"></script>
		<script src="<%=request.getContextPath()%>/include/javascript/searchsuggest.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/include/css/searchsuggest.css" />
		<script type="text/javascript" src="${path}/js/default.js"></script>
 		<script type="text/javascript" src="<%=request.getContextPath()%>/include/javascript/searchwindow.js"></script>	
 		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
 		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/border-radius.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/steel/steel.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  		<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
		<script language="javascript">
		function huiche(){
				if(event.keyCode==13){
						event.keyCode=9
					}
				}
		function selectAll(){
		var checkbox = document.getElementsByName('checkbx');
		if(form.checkB.checked){
			for(i=0; i<checkbox.length; i++){
				checkbox[i].checked = true;
			}
		}else{
			for(i=0; i<checkbox.length; i++){
				checkbox[i].checked = false;
			}
		}
	}		

		
	function cmdAdd(){
		addInitForm();
	}		
	//新增初始化工作，转到新增页面
	function addInitForm(){
		document.form.verbId.value = "addInit";
		document.form.submit();
	}
	//删除时候用
	function deleteForm(id){
		var array =id;
		var len = 0;
		if(id!=null && id!=""){ 
					len ++; 
		}
		if(len > 0){
			 
			 //删除
			 $.messager.confirm('确认', '确定要删除该条记录吗？', function(r){
		    	if (r){   
				    document.form.id.value = id;  
				    document.form.verbId.value = "delete";    
				    document.form.submit(); 
			    }  
			  }); 
		}else{
			$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn15" bundle="security"/>!");
			return false;
		}
	}
	//查询时候用
	function queryForm(){
		document.form.page.value = 1; 
	  	document.form.orderNo.value = ""; 
	 	document.form.asc.value = ""; 
	  	document.form.method = "POST";
	  	document.form.verbId.value = "registerCode";
	  	document.form.submit();
	}
	//查看详细时候用
	function viewForm(id){
		var array = id;
		var idHidden = id;
		var len = 0;
		if(id!=null && id!=""){ 
					len ++; 
		}
		if(len == 1){
			document.form.id.value = idHidden;
			document.form.verbId.value = "detail";
			document.form.submit();
		}else if(len <= 0){
			$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn15" bundle="security"/>!");
			return false;
		}else if(len > 1){
			$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn16" bundle="security"/>!");
			return false;
		}
	}
	//更新准备时候用
	function updateInitForm(id){
		var array = id;
		var idHidden = id;
		var len = 0;
		if(id!=null&&id!=""){
			len ++;					 
		}
		if(len == 1){
			document.form.id.value = idHidden;
			document.form.verbId.value = "updateInit";
			document.form.submit();
		}else if(len <= 0){
			$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn15" bundle="security"/>!");
			return false;
		}else if(len > 1){
			$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn17" bundle="security"/>!");
			return false;
		}
	}	
	function commandOrderBy(order, asc) { 
	  	document.form.orderNo.value = order; 
	  	document.form.asc.value = asc; 
	  	document.form.method = "POST";
	  	document.form.verbId.value = "registerCode";
	  	document.form.submit();
	}
	function paging(page) {  
	   document.form.page.value = page;
	   document.form.verbId.value = "registerCode";    
	   document.form.submit();
	}			
	function goPage2() {		
	  var _tp=document.getElementById('_tp');
  	  var _total=document.getElementById('_total'); 
	    if (!isMadeOf(_tp.value,'1234567890')) {
	      $.messager.alert('提示',"<bean:message key="security.jsp.commom.warn" bundle="security"/>!");
	      return;
	    }
	    if (_tp.value<=0){
	    	$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn1" bundle="security"/>!");
			return;
	    }
	    if(parseInt(_tp.value)>parseInt(_total.value)){
	     	$.messager.alert('提示',"<bean:message key="security.jsp.commom.warn2" bundle="security"/>!");
	     	 return;
	    } 
	  
	  document.form.verbId.value = "registerCode";    
	  document.form.submit();
	}			
	function isMadeOf(val,str){
		var jj;
		var chr;
		for (jj=0;jj<val.length;++jj){
			chr=val.charAt(jj);
			if (str.indexOf(chr,0)==-1)
				return false;
		}			
		return true;
	}
	function handler(tp){
		if(tp =='ok'){
			okFn();
  		}
	}
	function showHspMessage(message){
				if(message != ''&& message != null){
					$.messager.alert('提示',message);
					return;
				}
			}
	 function cmdExcelExport(){				
				$.messager.confirm('确认',"请精确查询条件避免无用的数据被导出,是否继续？", function(r){
    				if (r){
				  	document.form.method = "POST";
				  	document.form.verbId.value = "elsExport";
				  	document.form.submit();
			  	}
			  	});
			}
</script>
		
	</head>
	<body onload="showHspMessage('<%=securityStaffBaseinfo.getMessage()%>')">
	<%
		 				int curPage = 0;
						int totalNum = 0;
						int pageSize = 0;
			
						curPage = pb.getPage();
						totalNum = pb.getCount();
						pageSize = pb.getPageSize();
			
						int totalPage = totalNum / pageSize;
						if (totalNum % pageSize > 0)
							totalPage += 1;
						if (totalPage == 0) {
							curPage = 0;
						}
					%>
		<!-- Form中的action项的值必须设置-->
		<form name="form" method="post" action="security/securityStaffBaseinfo.do">
			<!-- Head line -->
			<input type="hidden" name="verbId" value="<%=securityStaffBaseinfo.getVerbId()%>" />
			<input type="hidden" name="orderNo" value="<%=securityStaffBaseinfo.getOrderNo()%>" />
			<input type="hidden" name="asc" value="<%=securityStaffBaseinfo.getAsc()%>" />
			<input type="hidden" name="id" value="<%=securityStaffBaseinfo.getId()%>" />
			<!--查询条件-->
			<div class='crm_content_div'>
				<div class='crm_search_div'>
					<div class="crm_input_item">
						<span><bean:message key="security.jsp.commom.staffCode" bundle="security"/>：</span>
						<input name="staffCode" id="staffCode" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="crm_search_input_text" onKeyDown="huiche()"  value="<%=securityStaffBaseinfo.getStaffCode()%>" />
					</div>	
					<div class="crm_input_item">
						<span><bean:message key="security.jsp.commom.name" bundle="security"/>：</span>
						<input id="name" name="name" type="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=securityStaffBaseinfo.getName()%>" 
							class="crm_search_input_text"  onkeyup="GiveOptions(event, '<%=request.getContextPath()%>/searchSuggest.do', 'getStaffName_0000000001')" 
							onkeydown="huanhang(event)" />
						<span id="spanOutput" class="spanTextDropdown" style="display: none;"></span>
						<!--<bean:message key="security.jsp.commom.inputcode" bundle="security"/>：
						<input name="inputCode" type="text"  onkeydown="if(event.keyCode==13){event.keyCode=9;document.getElementById('queryImg').className='queryImg_down'}" onkeypress="eventOnKeyPress('hspConfigBaseinfoName')" value="<%=securityStaffBaseinfo.getInputCode()%>" />-->
					</div>
					<div class="crm_input_item">
						<span><bean:message key="security.jsp.commom.hspConfigBaseinfoName" bundle="security"/>：</span>
						<input type="text" id="hspConfigBaseinfoName" name="hspConfigBaseinfoName" value="<%=securityStaffBaseinfo.getHspConfigBaseinfoName()%>"
							onkeyup="GiveOptions(event, '<%=request.getContextPath()%>/searchSuggest.do', 'getHspName_00000000004', 'hspConfigBaseinfoId')"
							onkeydown="huanhang(event)" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" class="crm_search_input_text"/>
					    <input type="hidden" name="hspConfigBaseinfoId" id="hspConfigBaseinfoId" value="<%=securityStaffBaseinfo.getHspConfigBaseinfoId()%>" />
					 </div>
					  <div class="crm_input_item">
						<input type="button" value="查询" class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" onmousedown="this.className='button_blue1_s1'"
							onclick="queryForm()" />
					</div>
					<div class="crm_input_item download_button_s1 " onclick="cmdExcelExport();" id="downprintarea" >
					<img alt="" src="${path }/style/img/down.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="position: fixed;color: #fff;">导出</span>
					</div>
					<div style="clear: both"></div>
				</div>
			 <!--列表标题-->
			 <div class="horizontal_line_2"></div>
			 	<div class='crm_table_out'>
					<table class='crm_table_content'>
   				 		<thead>
   				 			<tr>
								<td>
									序号
								</td>
								<td>
									卫生机构
								</td>
								<td>
									姓名
								</td>
								<td>
									用户名
								</td>
								<td>
									注册码
								</td>
								<td colspan="3" style="width:20%">
									操作
								</td>

							</tr>
   				 </thead>
   				 <tbody id="interval_row_id">
   				    <%
	   				 if (securityStaffBaseinfo.getIdList() != null && securityStaffBaseinfo.getIdList().length > 0) {
							for (int i = 0; i < securityStaffBaseinfo.getIdList().length; i++) {
					 %>
					 <tr>
					 	<td style="text-align:center;"><%=(curPage-1)*pageSize+i+1%></td>		 
					 	<td ><%=securityStaffBaseinfo.getHspConfigBaseinfoNameList()[i]%></td>
					 	<td ><%=securityStaffBaseinfo.getNameList()[i]%></td>
	            		<td ><%=securityStaffBaseinfo.getStaffCodeList()[i]%></td>
	            		<td ><%=securityStaffBaseinfo.getRegistCodeList()[i]%></td>
	            		<td style="cursor: pointer;">
								<input type="button" class="button_grey2_s0" onmouseout="this.className='button_grey2_s0'" onmousedown="this.className='button_grey2_s1'" value="详细"
										onclick="viewForm('<%=securityStaffBaseinfo.getIdList()[i]%>')" />
						</td>
	   				</tr>
	   				<%
	   					}
					}
					%>
				</tbody>
				<tfoot>
			  <tr>
			  <td colspan="6">
			  	<input type="hidden" title="当前第几页" name="page_index" id="page_index" value="${pb.page}"/>
			    <input type="hidden" title="一共多少页" name="page_count" id="page_count" value="${pb.pageCount}"/>
			    <input type="hidden" title="一共多少条记录" name="count" id="count" value="${pb.count}"/>
			    <input type="hidden" title="每页显示多少条记录" name="page_size" id="page_size" value="${pb.pageSize}"/>
			  	<input type="hidden" name="cur_page" id="cur_page" value="${pb.page}"/>
			  	<input type="hidden" name="page" id="page" value="${pb.page}"/>
			  	<div class="pager_num"></div>
			  	<div class="pager_text"></div>
			  </td>
			  </tr>
		  </tfoot>
			</table>
		</div>
			
		</form>
		<script language="javascript" src="include/javascript/interval_row_color.js"></script>
	</body>
</html>
