<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<jsp:useBean id="data" scope="request" class="com.tianjian.security.struts.form.SecurityConfigParamClassForm" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%if(request.getServerPort() == 80) {%>
  <base href="http://<%=request.getServerName()%><%=request.getContextPath()%>/">
  <%} else {%>
  <base href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
<%
	}
%>
<title><bean:message key="security.jsp.securityConfigParamClassM.detail.title" bundle="security"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript" src="../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/style/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path}/js/pager.js"></script>
<script type="text/javascript" src="${path}/js/default.js"></script>
<link type="text/css" rev="stylesheet" rel="stylesheet" href="include/css/form.css" />
<link type="text/css" rel="stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/style/default.css">
<link rel="stylesheet" type="text/css" href="${path}/style/easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${path}/style/easyuiUpdate.css">
<script type="text/javascript" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/js/LodopFuncs.js"></script>
<script language="javascript">
		    function QWPrint(){
			     if(document.all.PrintActiveX == undefined || document.all.PrintActiveX ==null){
					document.body.innerHTML="<object id=\"PrintActiveX\" style=\"display: none\" classid=\"clsid:3ede745c-4adb-42a6-ab25-5621edbdfd6b\" codebase=\"<%=request.getContextPath()%>/include/QWPrint.cab#version=1,3,8,2\" ></object>" + document.body.innerHTML;
				}
		        PrintActiveX.pageName = "A4"; //设置纸张类型
	            //设置页眉页脚
	            
				printed = true;
			    document.getElementById("btnSave").style.display="none";
			    PrintActiveX.PrintView();
			    document.getElementById("btnSave").style.display="block";
	   
	  		}
		    function print(){
				 var title=$("table tr td:eq(5) input").val()+"程序包"+"详情";
				 var lodop= getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'),title);
					//document.getElementById("btnSave").style.display="none";
					lodop. ADD_PRINT_table(60,0,"100%","100%",document.documentElement.innerHTML);
					//lodop.print();
					lodop.PREVIEW();
					//document.getElementById("btnSave").style.display="block";
			 }
		</script>
</head>
<body>
<form name="form" method="post">
<input type="hidden" name="verbId" value="detail">
 <div class="crm_edit_panel ">
 <table class="crm_panel_table">
    <tr>
    	<td class="crm_edit_item_name">程序包代码</td>
        <td class="crm_edit_item_content">
        	<input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=data.getClassCode()%>" readonly="readonly" />  
        </td>
		<td class="crm_edit_item_name">工程名称</td>
        <td class="crm_edit_item_content">
        	<input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=data.getProjectName()%>" readonly="readonly" />   
        </td>   
    </tr>
    <tr>
    	<td class="crm_edit_item_name">
            <bean:message key="security.jsp.securityConfigParamClass1.commom2" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">
        	<input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=data.getClassName()%>" readonly="readonly" />    
        </td>
		<td class="crm_edit_item_name">
            <bean:message key="security.jsp.securityConfigParamClass1.commom3" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">            
            <input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=data.getInputCode()%>" readonly="readonly" />    
        </td>
    </tr>
	<tr>     
        <td class="crm_edit_item_name">
            <bean:message key="security.jsp.securityConfigParamClass1.commom4" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">            
             <input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=data.getFunctionDescription()%>" readonly="readonly" />             
        </td>

         <td class="crm_edit_item_name">
            <bean:message key="security.jsp.securityConfigParamClass1.commom5" bundle="security"/>
        </td>
        <td class="crm_edit_item_content">            
            <input type="text" class="text" onblur="fEvent('blur',this)" onmouseover="fEvent('mouseover',this)" 
								onfocus="fEvent('focus',this)" onmouseout="fEvent('mouseout',this)" value="<%=data.getComments()%>" readonly="readonly" />    
        </td>
    </tr>
  </table>
  </div>
  <div class="horizontal_line_10"></div>
  <!-- Sheet operation button area -->
  <div align="center"  id="btnSave">
   <div  class=" download_button_s1 left" onclick="print();" id="downprintarea" style="margin-left: 130px;">
					<img alt="" src="${path }/style/img/print.png" style="margin-top: 5px;margin-left: 10px;">
					<span style="position: fixed;color: #fff;">打印</span>
					</div>
  	<input type="button" class="button_grey1_s0" onmouseout="this.className='button_grey1_s0'" onmousedown="this.className='button_grey1_s1'"  name="btnBack" value="<bean:message key="security.jsp.commom.button2" bundle="security"/>" onClick="history.go(-1)" />

  </div>
</form>
</body>
</html>
