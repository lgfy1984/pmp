<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<jsp:useBean id="commConfigNormal" scope="request" class="com.tianjian.comm.struts.form.CommConfigNormalForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%if(request.getServerPort() == 80) {%>
		<base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/" />
		<%} else {%>
		<base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/" />
		<%}%>
		<title><bean:message key="comm.jsp.common.alterZycMessage" bundle="conf.comm.Comm"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<script type="text/javascript" src="${path }/style/easyui/jquery.min.js"></script>
<script type="text/javascript"	src="${path }/style/easyui/jquery.easyui.min.js"></script>
		<script language="javascript" src="<bean:message key="comm.js.comm.message" bundle="conf.comm.Comm"/>"></script>
		<script language="javascript" src="<bean:message  key="Comm.js.TJMessagepath"  bundle="conf.comm.CommMessage"/>"></script>
		<script language="javascript" src="include/javascript/TJMessage.js"></script>
		<script language="javascript" src="include/javascript/eventOnKeyPress.js"></script>
		<script type="text/javascript"
			src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${path}/js/default.js"></script>
		<script language="javascript">
		function saveForm(){
		    if(!$("#form").form('validate')){
				return false;
			}
			
			//修改
			    
		    	document.form.verbId.value = "update";    
		    	document.form.submit(); 
		       
		}
		function trim(str){  //删除左右两端的空格
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
		function showHspMessage(message){
						if(message != ''&& message != null){
							$.messager.alert('提示',message);
							return;
						}
					}
		</script>
		<!-- <link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" /> -->
		<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/style/jscal2.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css"	href="${path}/style/easyui/themes/icon.css"/>
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>	
	  	<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">

		<style type="text/css">
		.redlable{
			color:#FF0000;
			font-size:16px;
		}
		.crm_button_sub{
			margin-top: 10px;
			margin-left: 40%;
		}
		.crm_textarea_style{
			width:87%;
			height:80px;
			border:1px #E0E0E0 solid;
			overflow-y:hidden;
		}
		</style>
	</head>
  <body onload="showHspMessage('${data.message}')" >
		<form name="form" id="form" method="post" action= "comm/commConfigStaffCharge.do" >
		
			<input type="hidden" name="verbId" value="update" />
 
  	 <input type="hidden" name="itemCodeHidden" id="itemCodeHidden" value="${data.itemCodeHidden}" />
  	  
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>代码</td>
      	  		<td class='crm_edit_item_content'>
					<input type="text" name="itemCode" id="itemCode"
						value="${data.itemCode }" readonly="readonly" required="true"
						onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
						class="text" required="true" validtype="length[1,8]"
						invalidMessage="有效长度1-8" />
				</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="itemName" id="itemName"  required="true"
      	  				value="${data.itemName }" class="text" required="true"  
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				validtype="length[1,40]" invalidMessage="有效长度1-40"/>
      	  		</td> 		
      	  	</tr>  
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>成本</td>
      	  		<td class='crm_edit_item_content'>
					<input  onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"  required="true"
							type="text"  name="itemCost" id="itemCost" value="${data.itemCost }"
							 class="easyui-numberbox"  style="width:206px;height:30px;line-height:26px;padding-left:5px;padding-right:5px;border:1px solid #dedede;font-size:12px;"
								 precision="2" validType ="VerifyMoney[{'maxVal':9999999999 ,'minVal':0},'只能输入数字']" required="true" missingMessage="必须填大于0的数字 " 
							 onkeypress="eventOnKeyPress('itemUnit')" />
				</td>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>单位</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="itemUnit" id="itemUnit" 
      	  				value="${data.itemUnit }" class="text" required="true"  
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				validtype="length[1,40]" invalidMessage="有效长度1-40"/>
      	  		</td> 		
      	  	</tr>     	  	   	  
      	  	<tr>
      	  		<td class='crm_edit_item_name'><label class="redlable">*</label>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="seqNo" id="seqNo" 
      	  				value="${data.seqNo }" class="text" 
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				validtype="length[0,25]" invalidMessage="有效长度0-25"/></td>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='crm_edit_item_content'>
      	  			<input type="text" name="comments" id="comments" 
      	  				value="${data.comments }"  class="text" 
      	  				onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
						onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)"
      	  				validtype="length[0,25]" invalidMessage="有效长度0-25"/></td>     	  		
      	  	</tr>
      	  </table>
      </div>
     <div class='crm_button_sub'>
				<input type="button" name="btnSaveForm" value="修改"
					class="button_blue1_s0" onmouseout="this.className='button_blue1_s0'" 
					onmousedown="this.className='button_blue1_s1'" onclick="saveForm();" /> 
				<input type="button" name="btnBack" value="返回" class="button_grey1_s0" 
					onmouseout="this.className='button_grey1_s0'" 
					onmousedown="this.className='button_grey1_s1'"
					onclick="history.go(-1);" />
			</div>

<script type="text/javascript" src="${path}/js/interval_row_color.js"></script>
	  </form>
  </body>
</html>