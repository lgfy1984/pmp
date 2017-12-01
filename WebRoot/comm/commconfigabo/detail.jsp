<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="commConfigAbo" scope="request" class="com.tianjian.comm.struts.form.CommConfigAboForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%if(request.getServerPort() == 80) {%>
  <base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/"/>
  <%} else {%>
  <base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"/>
<%}%>
<title><bean:message  bundle="comm.commLocale" key="comm.jsp.commom.text1"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<script type="text/javascript" src="${path}/js/default.js"></script>
<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
<script language="javascript" src="${path}/js/LodopFuncs.js"></script>
<script type="text/javascript" src="${path}/js/jquery-1.4.4.min.js"></script>
	<script language="javascript">
	    function QWPrint(){
	    	var detailName=document.getElementById("itemName").value+"血型字典详细信息";
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
	height:24px;
	line-height:24px;
	border:1px #E0E0E0 solid;
	overflow-y:hidden;
}
</style>
</head>
<body>
<form name="form" method="post">
<input type="hidden" name="verbId" value="detail" />
<!--zyc--add--b-->
	  <div style="height:4px;"></div>
      <div class='crm_edit_panel'>
      	  <table class='crm_panel_table'>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>代码</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigAbo.getItemCode() %>" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>名称</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigAbo.getItemName() %>" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" class="text" readonly="readonly"  id="itemName"/>
			    </td>
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>序号</td>
      	  		<td class='crm_edit_item_content'>
      	  		  <input value="<%=commConfigAbo.getSeqNo() %> " onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" class="text" readonly="readonly"/>
      	  		</td>
      	  		<td class='crm_edit_item_name'>输入码</td>
      	  		<td class='crm_edit_item_content'>
			      <input value="<%=commConfigAbo.getInputCode() %>" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" type="text" class="text" readonly="readonly"/>
			    </td>       	  		
      	  	</tr>
      	  	<tr>
      	  		<td class='crm_edit_item_name'>备注</td>
      	  		<td class='textArea' colspan="3">
      	  			<textarea class="crm_textarea_style" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" readonly="readonly"><%=commConfigAbo.getComments() %></textarea>
			    </td>       	  		
      	  	</tr>
      	  </table>
      </div>
      <div class='crm_button_sub' id='crm_button_sub'>
      <div class=" download_button_s1 left" onclick="QWPrint();" id="downprintarea" style="margin-left: 30px;">
					<img alt="" src="${path }/style/img/print.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="position: fixed;color: #fff;">打印</span>
				</div>
		<input type="button" id="btnBack" name="btnBack" value="返回" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" onclick="history.go(-1);"/>
		
	  </div>
	 </form>
</body>
</html>
