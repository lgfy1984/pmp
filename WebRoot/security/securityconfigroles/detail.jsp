<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%>
<html>
<head>
<%if(request.getServerPort() == 80) {%>
  <base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
  <%} else {%>
  <base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
<%}%>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<link type="text/css" rel="stylesheet" href="${path}/style/default.css"/>
		<link rel="stylesheet" type="text/css"
			href="${path}/style/easyui/themes/default/easyui.css" />
		<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
		<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
  <script type="text/javascript" src="${path}/js/default.js"></script>
		
		<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="${path}/style/easyui/locale/easyui-lang-zh_CN.js"></script>		
		
		<script language="javascript" src="${path}/js/LodopFuncs.js"></script>
		<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
			<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
		</object>
		<script language="javascript">
		    function QWPrint(){
		    	var detailName=document.getElementById("detail").value+"详细信息";
		    	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),detailName);
		    	if(LODOP!=undefined){		    		
		    		//table表格信息
		    		LODOP.ADD_PRINT_TABLE(60,0,"100%","100%",document.documentElement.innerHTML);
		    		
		    		document.getElementById("btnSave").style.display="none";
		    		//执行打印
		    		LODOP.PREVIEW();
		    		//LODOP.PRINT();
		    		document.getElementById("btnSave").style.display="block";
		    	}else{
		    		$.messager.alert("操作提示", "打印环境异常,请稍后!","error");
		    	}
	   
	  		}
		</script>
</head>
<body>
<form name="form" method="post">
<input type="hidden" name="verbId" value="detail">
 <div class='crm_edit_panel' style="text-align:center;margin-left: 20%;">
 <table class='crm_panel_table'>
     <tr>      
        <td class='crm_edit_item_name'>
            <bean:message key="security.jsp.commmom.classCode" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">
        <input id="detail" type="text" class="text readonly" readonly="readonly" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="${dataForm.data.roleDetail}"/>
        </td>
 	    <td class="crm_edit_item_name">
            <bean:message key="security.jsp.commom.menuCode" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">
        <input type="text" class="text readonly" readonly="readonly" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="${dataForm.data.roleCode}"/>
        </td>
     </tr>
    <tr>
     	<td class="crm_edit_item_name">
            <bean:message key="security.jsp.commom.serialNo" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">
        <input type="text" class="text readonly" readonly="readonly" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="${dataForm.data.serialNo}"/>            
        </td>
        <td class="crm_edit_item_name">
            <bean:message key="security.jsp.commom.inputcode" bundle="security"/>
        </td>
        <td class="crm_edit_item_content"> 
        <input type="text" class="text readonly" readonly="readonly" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="${dataForm.data.inputCode}"/>           
        </td>
    </tr>
    <tr>
        <td class="crm_edit_item_name">
            <bean:message key="security.jsp.commmom.comments" bundle="security"/>
        </td>
       <td class="crm_edit_item_content" colspan="3">
       	<input type="text" class="text readonly" readonly="readonly" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="${dataForm.data.comments}"/>
        </td>   
    </tr>
   
  </table>
  </div>
  <div class="horizontal_line_2"></div>
 	<div class='crm_button_sub'  id="btnSave" align="center">       
 	        <input type="button" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'" name="btnBack" value="返回" onClick="history.go(-1);" />
    </div>
</form>
</body>
</html>
