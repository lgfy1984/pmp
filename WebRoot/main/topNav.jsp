<%@page import="com.tianjian.security.bean.SecurityConfigPublicClass"%>
<%@page import="com.tianjian.security.bean.PublicClassBean"%>
<%@page import="com.tianjian.security.struts.form.LoginSecondForm"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ page import="com.tianjian.security.struts.form.SessionForm"%>
<%@page import="com.tianjian.security.struts.form.LoginMenuForm"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	HttpSession httpSession = request.getSession(true);
	com.tianjian.security.struts.form.SessionForm sessionForm = (com.tianjian.security.struts.form.SessionForm) httpSession.getAttribute("sessionForm");
	
	LoginSecondForm loginSecondForm = (LoginSecondForm)request.getAttribute("loginSecondForm");
	List<SecurityConfigPublicClass> pcList = null;
	Map<String, List<SecurityConfigPublicClass>> childMap = null;
	
	String firstPubicClassId = null;
	String currentPublicClassName = "";
	if(loginSecondForm != null){
		pcList = loginSecondForm.getPcList();
		if(pcList != null && pcList.size() > 0){
	SecurityConfigPublicClass pc = pcList.get(0);
	firstPubicClassId = pc.getId();
	currentPublicClassName = pc.getClassName();
		}
		childMap = loginSecondForm.getChildMap();
		if(childMap != null){
	List<SecurityConfigPublicClass> childList = childMap.get(firstPubicClassId);
	if(childList != null && childList.size() > 0){
		SecurityConfigPublicClass child = childList.get(0);
		firstPubicClassId = child.getId();
		currentPublicClassName += "&nbsp;&nbsp;&gt;&gt;&nbsp;" + child.getClassName();
	}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>::: <%=application.getAttribute("security.SYSTEMNAME")%>
	:::
</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"	href="main/include/css/index_n.css" id="link1"/>
<link href="<%=request.getContextPath()%>/chat/css/chat.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/chat/css/emoji.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/style/styles.css" rel="stylesheet" type="text/css"/>
<!--<link href="<%=request.getContextPath()%>/style/emoji.css" rel="stylesheet" type="text/css"/>-->
<!--<link href="<%=request.getContextPath()%>/style/jishixiaoxi.css" rel="stylesheet" type="text/css"/>-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/demo.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/mainTab.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpPrescInfo.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/easyui/themes/icon.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/electronic.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpExamInfo.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpLabInfo.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpBillInfo.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/kbs.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/easyuiUpdate.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/main/ext-3.2.0/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/callCenterControls.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/default.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/easyui/themes/default/calendar.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/main/include/css/multiPage.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/main/include/css/pcpop.css" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/main/ext-3.2.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/main/ext-3.2.0/ext-all.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/utrim.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery-1.4.2.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery.contextmenu.r2.packed.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery.easing.1.3.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery.mousewheel.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery.contentcarousel.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery.easyui.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/style/easyui/jquery.easyui.min.js"></script>
<!--<script src="<%=request.getContextPath()%>/chat/js/emoji.js"></script>-->
<script type="text/javascript"	src="<%=request.getContextPath()%>/include/javascript/jquery.easyui.mobile.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/callCenterControls.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/style/easyui/locale/easyui-lang-zh_CN.js"></script>		
<script src="<%=request.getContextPath()%>/js/jishixiaoxi.js"></script>
<script src="<%=request.getContextPath()%>/js/json2.js"></script>
<!--<script src="<%=request.getContextPath()%>/js/emoji.js"></script>-->
<script src="${path}/chat/js/CRM/crmEmoji.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/mainTab.js"></script>
	<style type="text/css">
	html{
	    overflow:hidden;
	    height:100%;
	}
	body{
	    height:100%;
	    background-color: rgb(239, 239, 239);
	    overflow-y:scroll;
	   
	}
	.tab_gengduo{
		color: blue;
		float:left;
		border:none;
		margin-top:160px;
	}
	
	.messager-body .messager-button A.l-btn SPAN.l-btn-left{
	width: 70px;
	line-height: 25px;
	text-align: center;
	}
		.toggleDiv{
		   width:243px;
		   float:right;
		   background-image:url(<%=request.getContextPath()%>/main/include/images/toggleBg.jpg);
		   background-repeat:repeat-y;
		   background-color:white;
		   border-top:1px solid #dddddd;
		   position:relative;
		   border-bottom:1px solid #dddddd;
		  
		}
		.installDiv{
		   width:321px;
		   height:256px;
		   float:right;
		    background-image:url(<%=request.getContextPath()%>/main/include/images/mainfullbg.gif);
		  display:none;
		   background-repeat:repeat-y;
		   background-color:white;
		   border-top:1px solid #dddddd;
		  z-index:10000;
		   border-bottom:1px solid #dddddd;
		  
		}
		.displayDiv{
		  margin-right:243px;
		}
		.toggleButton{
		   position:absolute;
		   width:9px;
		   height:71px;
		   left:2px;
		   background-image:url(<%=request.getContextPath()%>/main/include/images/closed.png);
		   top:200px;
		   cursor:pointer;
		}
		.right_black {
			width: 225px;
			height: 700px;
			font-size: 10pt;;
			background-color: #FFFFFF;
			margin-left:14px;
			 overflow:hidden;
		}
		
		.right_history_blank {
			width: 100%;
			border: 1px #DDDDDD solid;
			height: 245px;
			border-top:none;
			border-left:none;
		}
		
		.right_title {
			width: 100%;
			background-color: #F9F9F9;
			height: 33px;
			line-height: 33px;
			color: #3994DA;
		}
		
		.right_title span {
			margin-left: 5px;
		}
		
		.line {
			width: 100%;
			height: 1px;
			background-color: #DDDDDD;
		}
		
		.right_content_blank {
			width: 221px;
			margin: 2px auto;
		}
		
		.calendar_show {
			width: 100%;
			text-align: center;
			margin: 0;
			border-collapse: collapse;
			border-spacing: 0;
			font-family: Arial, Helvetica, sans-serif
		}
		
		.calendar_show td {
			height: 27px;
		}
		
		.calendar_show thead td {
			background-color: #3994DA;
			color: white;
			height: 30px;
		}
		
		.weekday td {
			height: 28px;
			width: 30px
		}
		
		.month_day td {
			background-color: #F9F9F9;
		}
		
		.month_day td.holiday {
			background-color: #EEEEEE
		}
		
		.weekday,.month_day {
			color: #666666
		}
		
		.calendar_show a {
			text-decoration: none;
		}
		
		.current_link a span {
			display: block;
			background-color: white;
			border: 1px #0099FF solid;
			width: 97%;
			height: 25px;
			line-height: 27px;
		}
		
		.month_link a span {
			display: block;
			background-color: #0099FF;
			color: white;
			width: 100%;
			height: 27px;
			line-height: 27px;
		}
		
		.next_month_link a span {
			display: block;
			background-color: #4AB7FF;
			color: white;
			width: 100%;
			height: 27px;
			line-height: 27px;
		}
		
		.line_15 {
			height: 15px;
		}
		
		.log_item {
			height: 32px;
			line-height: 32px;
			width: 100%
		}
		
		.log_item span {
			margin-left: 5px;
		}
		
		.even {
			background-color: #F3F3F3
		}
		
		.phone_button {
			width: 53px;
			height: 35px;
			line-height: 35px;
			display: block;
			float: left;
			margin-left: 5px;
			background-image:
				url('<%=request.getContextPath()%>/include/images/phone_wait.jpg');
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
		}
		
		.phone_button a {
			color: #787878;
		}
		
		.phone_current {
			color: white;
			background-image:
				url('<%=request.getContextPath()%>/include/images/phone_current.jpg')
		}
		
		.phone_disable {
			color: #CCCCCC;
			background-image:
				url('<%=request.getContextPath()%>/include/images/phone_wait.jpg')
		}
		
		.tool_tab {
			width: 75px;
			height: 30px;
			background-image:
				url('<%=request.getContextPath()%>/include/images/footer_tab_normal.jpg');
			background-position: center bottom;
			background-repeat: no-repeat;
			float: left;
			line-height: 38px;
			color: rgb(85, 85, 85);
		}
		
		.tool_tab_active {
			background-image:
				url('<%=request.getContextPath()%>/include/images/footer_tab_active.jpg');
			color: #FFFFFF;
		}
		
		.margin_left {
			width: 10px;
			height: 30px;
			float: left;
		}
		
		.footer_show {
			width: 30px;
			height: 30px;
			float: right;
			background-image:
				url('<%=request.getContextPath()%>/include/images/footer_hidden.jpg');
			background-position: center center;
			background-repeat: no-repeat;
			cursor: pointer;
		}
		
		.footer_hidden {
			width: 30px;
			height: 30px;
			float: right;
			background-image:
				url('<%=request.getContextPath()%>/include/images/footer_show.jpg');
			background-position: center center;
			background-repeat: no-repeat;
			cursor: pointer;
		}
		
		#toolbar_two{
		position: absolute;
		}
	.window{
	background-color: #1ca4e6;
	border: 1px solid #8cd2f1;
	padding: 0px;
	}
	.panel-tool-close{
	width: 20px;
	height: 15px;
	display: block;
	}
	.messager-window .panel-header .panel-tool{
	top:15px;
	}
	.window .panel-header .panel-tool{
	top:15px;
	right:10px;
	}
	#winContent div .datagrid div .datagrid-view .datagrid-view2{
	left:0px;
	}
	#winContent div .datagrid{
	border:0px;
	margin-left: 1px;
	}
	.window .panel-header{
	height:26px;
	}
	.window .window-header{
	padding: 0;
	}
	.remind{
	color:red;
	}
	</style>	
	<script type="text/javascript">
	$(function(){
		 $.ajax( {
				type : "POST",
				url : '${path}/hsp/patientBirthday.do?verbId=findmark',
				dataType : "json",
				success : function(data) {
					var bd = eval(data[0].birthdaySwitch);
					if(bd == 0){
						$("#followUpValuesend").css("display","none");
					}
				}
			});
	});
		var tb;
	 	var currentPublicClassName = "<%=currentPublicClassName%>";
		Ext.onReady(
			function(){
		   		 // 创建工具条
			    tb = new Ext.Toolbar();
			   // tb.render('toolbar');
			    tb.render('toolbar_two');
			    getPublicByClassId("<%=firstPubicClassId%>");
			}
		);
	  	//异步ajax调用
	    /**
	     * 异步调用ajax，成功后返回值，作为回调函数的参数 调用失败会提示
	     * 
	     * @param {}
	     *            urlStr
	     * @param {}
	     *            paramsObj
	     */
	    var url3 = '<%=request.getContextPath()%>/security/security_loginSecond.do?verbId=findMenuByPublicId&';
	    function getMenuTree(urlStr, paramsObj, obj) {
	    	Ext.Ajax.request({
	    				url : urlStr,
	    				params : paramsObj,
	    				method : 'POST',
	    				success : function(response) {
	    						//var result = Ext.util.JSON.decode(response.responseText);
	    						var result = response.responseText;
	    						//alert("menu:" + result);
	    						var str = Ext.util.JSON.decode(result);
	    						//alert("length:" + str.items.length);
	    						var menuFile = new Ext.menu.Menu(str);
	    						obj.menu = menuFile;
	    						obj.showMenu();		
	    				},
	    				failure : function() {
	    					Ext.Msg.alert("提示", "方法调用失败");
	    				}
	    			});
	    }
	    
	    /**获取二级菜单  */
	 function getPublicTwoByClassId(publicClassId){
		 if($.trim(publicClassId).length == 0){
				return;
			}
			$.ajax({
				type: "POST",
	        	processData: false,
	        	dataType: "application/json",
	        	url: "<%=request.getContextPath()%>/security/security_loginSecond.do",
	        	data: "verbId=getPublic&publicClassId="+publicClassId,
	        	success: function(res){
	        		if(res){
	        			var json;
	        			try{
		        			json = eval(res);
	        			}catch(e){
	        				$.messager.alert("提示","获取失败!:"+e.prototype);
	          			  	document.location = "<%=request.getContextPath()%>/home/nologin.jsp";
	        			}
	        			if(json){
		        			tb.removeAll();
		        			tb.add(json);
		        			tb.doLayout();
		        			$(".li_pc_1").removeClass("pc_1_selected");
		        			$(".li_pc_1").removeClass("pc1_active");
		        			$(".li_pc_2").removeClass("pc_2_selected");
		        			$(".li_pc_2").removeClass("pc1_active");
		        			var _pc_li = $(".pc_"+publicClassId);
		        			$(".pc_"+publicClassId+".li_pc_1").addClass("pc1_active");
		        			if(_pc_li.hasClass("li_pc_1")){
		        				_pc_li.addClass("pc_1_selected");
		        			}else{
		        				_pc_li.addClass("pc_2_selected");
		        				_pc_li.parents(".li_pc_1").addClass("pc_1_selected");
		        			}
		        			update_toolbar_two();
	        			}
	        		}
	        	},
	        	error: function(a, b, c){
	        		$.messager.alert("提示","获取失败!:"+a+":"+b+":"+c);
	  			  	document.location = "<%=request.getContextPath()%>/home/nologin.jsp";
	        	}
			});
	    }
/**子菜单菜单*/
	function getPublicByClassId(publicClassId){
		if($.trim(publicClassId).length == 0){
			return;
		}
		$.ajax({
			type: "POST",
        	processData: false,
        	dataType: "application/json",
        	url: "<%=request.getContextPath()%>/security/security_loginSecond.do",
        	data: "verbId=getPublic&publicClassId="+publicClassId,
        	success: function(res){
        		if(res){
        			var json;
        			try{
	        			json = eval(res);
        			}catch(e){
        				$.messager.alert("提示","获取失败!");
          			  	document.location = "<%=request.getContextPath()%>/home/nologin.jsp";
        			}
        			if(json){
	        			tb.removeAll();
	        			tb.add(json);
	        			tb.doLayout();
	        			$(".li_pc_1").removeClass("pc_1_selected");
	        			$(".li_pc_1").removeClass("pc1_active");
	        			$(".li_pc_2").removeClass("pc_2_selected");
	        			$(".li_pc_2").removeClass("pc1_active");
	        			var _pc_li = $(".pc_"+publicClassId);
	        			$(".pc_"+publicClassId+".li_pc_1").addClass("pc1_active");
	        			if(_pc_li.hasClass("li_pc_1")){
	        				_pc_li.addClass("pc_1_selected");
	        			}else{
	        				_pc_li.addClass("pc_2_selected");
	        				_pc_li.parents(".li_pc_1").addClass("pc_1_selected");
	        				_pc_li.parents(".li_pc_1").addClass("pc1_active");
	        				$(".bg_wrapper2").hide();
	        				$(".bg_wrapper").show();
	        			}
	        			update_toolbar_two();
        			}
        		}
        	},
        	error: function(a, b, c){
        		$.messager.alert("提示","获取失败!"+a+":"+b+":"+c);
  			  	document.location = "<%=request.getContextPath()%>/home/nologin.jsp";
        	}
		});
	}	
	//更改二级菜单的位置
		function update_toolbar_two(){
			var i=$(".pc_1_selected").parent("ul").parent().parent().offset().left;
			var window_wid=$(window).width();
			$("#toolbar_two").removeAttr("style");
			  var top=-$(this).scrollTop()+97;
			   $("#toolbar_two").css('top',top);
			if(i+$("#toolbar_two").width()>window_wid){
				//从右向左
				//$("#toolbar_two").css("right","35");
				$("#toolbar_two").css("right","35");
			}else{
				var left_i=i-($("#toolbar_two").width()-$(".ca-item").width())/2;
				$("#toolbar_two").css("left",left_i+"px");
			}
		}
	function goDiv(url){
		if(url != null && trim(url) != ''){
			if(url.substring(0,4)!='http'){
				document.getElementById("iframemain").src = "<%=request.getContextPath()%>/" + url;
			}else{
				document.getElementById("iframemain").src = url;
			}
		}
	}
	
	function handleDaohang(obj){
		var textall = obj.text;
		var daohang = getDaohangAll(obj,textall);
		document.getElementById("daohang").innerHTML= daohang;
		document.getElementById("daohang").style.color="#0683CB";
		document.getElementById("daohang").style.fontSize="12px";
	}

	function getDaohangAll(obj,textall){
		textall = obj.text;
	    if(obj.ownerCt != null && obj.ownerCt.ownerCt != null && obj.ownerCt.ownerCt.text != 'undefined'){
	    	textall = getDaohangAll(obj.ownerCt.ownerCt,textall) + '&nbsp;&nbsp;&gt;&gt;&nbsp;' + textall;
		}
		return textall;
	}
	
	$(document).ready(
			function(){
				$(".tab").live("click", 
					function(){
						var id = $(this).attr("id");
						id = id.substr(4);
						focusOnePage(id);
					}
				);
				$(".tabs > li > .close").live("click",
					function(){
						var id = $(this).parent().attr("id");
						id = id.substr(4);
						closeOnePage(id);
						return false;
					}
				);
				
				var prev_move_tabs = function(){
					if($(".tabs").offset().left < 0){
						$(".tabs").animate({"margin-left": "+=10"}, 1, prev_move_tabs);
					}
					if($(".tabs").offset().left > 0){
						$(".tabs").animate({"margin-left": 0}, "fast");
					}
				}
				$(".tabs_tool_btn .prev_tab_btn").bind("mousedown",
					function(e){
						if(e.which == 1){
							prev_move_tabs();
							return false;
						}
					}		
				);
				var next_move_tabs = function(){
					var _last_tab = $(".tab").last()
					if($(window).width() < (_last_tab.offset().left + _last_tab.width() + 40)){
						$(".tabs").animate({"margin-left":"-=10"}, 1, next_move_tabs);
					}
					if($(window).width() > (_last_tab.offset().left + _last_tab.width() + 40)){
						var temp = $(window).width() - _last_tab.offset().left - _last_tab.width() - 40;
						$(".tabs").animate({"margin-left":"+="+temp}, "fast");
					}
				}
				$(".tabs_tool_btn .next_tab_btn").bind("mousedown",
						function(e){
							if(e.which == 1){
								next_move_tabs();
								return false;
							}
						}		
					);
				$(".tabs_tool_btn div").bind("mouseup",
						function(e){
							if(e.which == 1){
								$(".tabs").stop();
								return false;
							}
						}		
					);
			
			}
		);
		
		var addPage = function(obj, id, name, src){
			clickTextSubText(id);
			var daohang = "";
			if(obj != null){
				var textall = obj.text;
				daohang = getDaohangAll(obj,textall);
				if(currentPublicClassName){
					daohang = currentPublicClassName + '&nbsp;&nbsp;&gt;&gt;&nbsp;' + daohang;
				}
				daohang = "当前位置：" + daohang;
			}
			if(src.substring(0,4).toUpperCase() !='HTTP'){
				if(src.substring(0, 1) == '/'){
					src = src.substring(1, src.length);
				}
				src = "<%=request.getContextPath()%>/" + src;
	     	}

		if ($("#page_" + id).length == 0) {
			var page_div = document.createElement("div");
			$(page_div).attr("id", "page_" + id);
			$(page_div).addClass("one_page");

			var leader = document.createElement("div");
			$(leader).addClass("leader");
			$(leader).html(daohang);
			$(page_div).append(leader);
			var iframe_div = document.createElement("div");
			$(iframe_div).addClass("iframe_div");
			var iframe = document.createElement("iframe");
			
			iframe.src = src;
			$(iframe).attr("frameborder", "0");
			$(iframe).bind("activate", function() {
				Ext.menu.MenuMgr.hideAll();
				$.contextMenu.hidden();
			});
			$(iframe_div).append(iframe);
			$(page_div).append(iframe_div);
			$(".page_container").append(page_div);
			/*2015.03.17*/
			$(iframe_div).attr("ifid_"+id);
			$(iframe).attr("name","_"+id);
			$(iframe).attr("id","_"+id);
			var ee = document.getElementById("_"+id);
			var ed = ee.window;
			
			var li = document.createElement("li");
			$(li).attr("id", "tab_" + id);
			$(li).addClass("tab");
			$(li).addClass("tab_active");

			var name_span = document.createElement("span");
			$(name_span).addClass("page_name");
			$(name_span).append(document.createTextNode(name));
			$(name_span).attr("title", name);
			$(li).append(name_span);

			var close_span = document.createElement("span");
			$(close_span).addClass("close");
			$(close_span).attr("title", "关闭");
			$(li).append(close_span);
			$(li).contextMenu("right_key_menu", {
				bindings : {
					'refresh_page_btn' : function(x) {
						iframe.src = src;
					},
					'close_page_btn' : function(x) {
						closeOnePage(id);
					},
					'close_other_page_btn' : function(x) {
						var arr = $(".tab");
						for (var i = 0; i < arr.length; i++) {
							var temp = $(arr[i]);
							var temp_id = temp.attr("id");
							temp_id = temp_id.substr(4);
							if (temp_id != id) {
								$("#page_" + temp_id).remove();
								temp.remove();
							}
						}
						focusOnePage(id);
						slideTabs();
					},
					'single_window_btn' : function(x) {
						window.open(src, "_blank", null);
					}
				}
			});
			$(".tabs").append(li);
			var height = pageHeight;
			$(iframe).height(height);
		}
		focusOnePage(id);
	}

	var focusOnePage = function(id) {
		clickTextSubText(id);
		var page_id = "page_" + id;
		var tab_id = "tab_" + id;
		var _page = $("#page_" + id);
		$(".page_container").children().hide();
		$("#" + page_id).show();
		$(".tab").removeClass("tab_active");
		var _tab = $("#" + tab_id);
		_tab.addClass("tab_active");
		slideTabs();
	}

	var closeOnePage = function(id) {
		var _tab = $("#tab_" + id);
		var focus_li = _tab.next("li");
		if (focus_li.length == 0) {
			focus_li = _tab.prev("li");
		}
		_tab.remove();
		$("#page_" + id).remove();
		if ($(".tab_active").length > 0) {
			focus_li = $(".tab_active");
		}
		if (focus_li.length > 0) {
			var focus_id = focus_li.attr("id");
			focus_id = focus_id.substr(4);
			focusOnePage(focus_id);
		}
		closeCrmSubWindow(id);
	}
	var slideTabs = function() {
		var _tab = $(".tab_active");
		//当活动标签在屏幕右边时，向左滑动
		if ((_tab.offset().left + _tab.width()) > $(window).width()) {
			$(".tabs_tool_btn").show();
			var _margin_left = $(window).width() - _tab.offset().left
					- _tab.width() + $(".tabs").offset().left;
			_margin_left -= 40;//滑动按钮的宽度+边距
			$(".tabs").animate({
				"margin-left" : _margin_left
			});
		}
		//当活动标签在屏幕左边时，向右滑动
		if (_tab.offset().left < 0) {
			$(".tabs_tool_btn").show();
			var _margin_left = $(".tabs").offset().left - _tab.offset().left;
			$(".tabs").animate({
				"margin-left" : _margin_left
			});
		}

		var _last_tab = $(".tab").last();
		//当最后一个标签不在屏幕最右边时,向右滑动
		if ($(".tabs").offset().left < 0
				&& (_last_tab.offset().left + _last_tab.width()) < $(window)
						.width()) {
			var _margin_left = $(".tabs").offset().left
					+ ($(window).width() - _last_tab.offset().left - _last_tab
							.width());
			_margin_left -= 40;
			if (_margin_left >= 0) {
				_margin_left = 0;
				$(".tabs_tool_btn").hide();
				$(".tabs").animate({
					"margin-left" : _margin_left
				});
			} else if (_tab.offset().left >= 0) {
				$(".tabs").animate({
					"margin-left" : _margin_left
				});
			}

		}
	}
	var showPC2 = function(_li) {
		var jq_li = $(_li);
		var jq_ul = jq_li.children("ul");
		jq_li.children(".bg_wrapper").hide();
		jq_li.children(".bg_wrapper2").show();
		jq_ul.show();
		 if (jq_ul.offset().left + jq_ul.width() > $(document).width()) {
			var _left = jq_li.offset().left - jq_ul.width() + jq_li.width();
			jq_ul.css({
				"left" : _left
			});
		} 
		jq_li.addClass("pc1_active");
	}
	var hidePC2 = function(_li) {
		var jq_li = $(_li);
		jq_li.children("ul").hide();
		jq_li.children(".bg_wrapper").show();
		if(jq_li.hasClass("pc_1_selected")){
			jq_li.children(".bg_wrapper2").hide();
		}else{
			jq_li.removeClass("pc1_active");
		}
		
		 /*  */
	}
	
	var resizeSlide = function() {
		var hideHeight=0;
		//查询随访方式和满意度方式
		$.post("${path}//followexcuteAction.do",{"verbId":"findfollowType"},
				function(data){
					if(data!=null){
						if(data.followType==1){
							$("#follow_log_item").hide();
							hideHeight++;
						}else{
							$("#follow_log_item").show();
						}
						if(data.satisfType==1){
							hideHeight++;
							$("#satisf_log_item").hide();
						}else{
							$("#satisf_log_item").show();
						}
						//alert($(".iframe_div:visible").length)
						if ($(".iframe_div:visible").length > 0) {
							var height = pageHeight-170-45-55;
							$(".iframe_div > iframe").css("height", height);
						}
						
						var div_height =pageHeight;
						$(".multi_pages").css("height", div_height);
						$(".toggleDiv").css("height",div_height);
						$(".right_black").css("height",div_height);
						var number=$(".log_item").length;
						var h=parseInt((div_height-260-30)/number);
						$("#gzrz").css("height",div_height-260);
						$(".log_item").css("height",h+"px");
						$(".log_item").css("line-height",h+"px");
						var logNum=$(".log_item:visible").length;
						for(var i=0;i<logNum;i++){
							if(i==0 && hideHeight>0){
								$(".log_item:visible").eq(i).css("margin-top","5px");
							}
							if((i)%2==0){
								$(".log_item:visible").eq(i).addClass("old");	
							}else{
								$(".log_item:visible").eq(i).addClass("even");
							}
						}
					}
				},'json');
		
	}
	var resizeContainer = function() {
		var _width = $(document).width() - $("#header > img").width() - 100;
		var _item_width = $(".ca-item").width();
		var _item_count = $(".ca-item").length;
		_width = parseInt(_width / _item_width) * _item_width; //得到整数倍的item长度
		var _all_item_width = _item_width * _item_count;
		_width = _width < _all_item_width ? _width : _all_item_width
		$('#ca-container').css("width", _width);
	}
	window.onresize = function() {
		//resizeSlide();
		resizeContainer();
	};
	var pageHeight;
	$(function() {
		//判断文档高度
		//alert($(document).height()+":"+window.screen.availHeight);
		//pageHeight=$(document).height()<window.screen.availHeight?window.screen.availHeight:$(document).height();
		//pageHeight=window.screen.availHeight;
		pageHeight=document.body.clientHeight;
		resizeSlide();
		resizeContainer();
		$('#noticeWindow').window('move',{   
			  left:document.body.clientWidth-250,   
			  top:pageHeight-170  
			}); 
		/*头部导航栏*/
		$('#ca-container').contentcarousel();
		/*页面滚动时显示导航栏下级菜单*/
		var bg_wrapper=$('#ca-container .bg_wrapper');
		var bg_wrapper2=$('#ca-container .bg_wrapper2');
		var ul_pc_2=$('#ca-container .ul_pc_2');
		$('body').scroll(function(){
			   var top=-$(this).scrollTop()+83;
			   bg_wrapper.css('top',top+7);
			   bg_wrapper2.css('top',top);
			   $("#toolbar_two").css('top',top+14);
			   ul_pc_2.css('top',top);
               $("#jqContextMenu").css('top',top+116);
			});
		getWorkLog();
		/**鼠标滑动弹出框响应事件*/
			/* $("#footer").mouseenter(function(){
				$("#fbody").slideToggle();
				$("#f_button").attr('class', 'footer_hidden');
			});
		$("#footer").mouseleave(function(){
			$("#fbody").slideToggle();
			$("#f_button").attr('class', 'footer_show');
		}); */
		//setInterval(remind,60000);
	});
	
	function remind(){
			$.ajax({
	        type: "post",
	        url: "iframe.do?verbId=getComplaintsTODo",
	        dataType: "text",
	        success: function(data){
	        	var val = $('#complaintsValue').html();
	        	if(data!=val){
	        		  $('#complaintsValueRe').addClass('remind');
	        	}
	        	$('#complaintsValue').html(data);
	           }
		    });
			$.ajax({
		        type: "post",
		        url: "iframe.do?verbId=getConsultationTODo",
		        dataType: "text",
		        success: function(data){
		        	var val = $('#consultationValue').html();
		        	if(data!=val){
		        		$('#consultationValueRe').addClass('remind');
		        	}
		        	$('#consultationValue').html(data);
		           }
		    });
			
			$.ajax({
		        type: "post",
		        url: "<%=request.getContextPath()%>/followUp/followUpPlan.do?verbId=personNum",
		        dataType: "text",
		        success: function(data){
		        	var val = $('#followUpValue').html();
		        	if(data!=val){
		        		$('#followUpValueRe').addClass('remind');
		        	}
		        	$('#followUpValue').html(data);
		           }
		    });
			openNoticeWindow(noticeType);
		}
	function removeRemind(obj){
		$(obj).children("span").removeClass('remind');
	}
	function toggle_footer(id) {
		$("#" + id).toggle('normal', function() {
			if ($("#" + id).is(":hidden")) {
				$("#f_button").attr('class', 'footer_hidden');
			} else{
				$("#f_button").attr('class', 'footer_show');
				//ocxwaibo();
			}
		});
	}
	function show_footer(id) {
		$("#fbody").show();
		$("#f_button").attr('class', 'footer_show');
		
	}
	
	function resetIframeSize(e,w,h)
	{
		
	}

	function openOtherWindow( id, name, src){
		if(src.substring(0,4).toUpperCase() !='HTTP'){
			if(src.substring(0, 1) == '/'){
				src = src.substring(1, src.length);
			}
			src = "<%=request.getContextPath()%>/" + src;
	}
		

	if ($("#page_" + id).length == 0) {
		var page_div = document.createElement("div");
		$(page_div).attr("id", "page_" + id);
		$(page_div).addClass("one_page");

		var leader = document.createElement("div");
		$(leader).addClass("leader");
		$(page_div).append(leader);
		var iframe_div = document.createElement("div");
		$(iframe_div).addClass("iframe_div");
		var iframe = document.createElement("iframe");
		
		iframe.src = src;
		$(iframe).attr("frameborder", "0");
		$(iframe).bind("activate", function() {
			Ext.menu.MenuMgr.hideAll();
			$.contextMenu.hidden();
		});
		$(iframe_div).append(iframe);
		$(page_div).append(iframe_div);
		$(".page_container").append(page_div);
		/*2015.03.17*/
		$(iframe_div).attr("ifid_"+id);
		$(iframe).attr("name","_"+id);
		$(iframe).attr("id","_"+id);
		var ee = document.getElementById("_"+id);
		var ed = ee.window;
		
		var li = document.createElement("li");
		$(li).attr("id", "tab_" + id);
		$(li).addClass("tab");
		$(li).addClass("tab_active");

		var name_span = document.createElement("span");
		$(name_span).addClass("page_name");
		$(name_span).append(document.createTextNode(name));
		$(name_span).attr("title", name);
		$(li).append(name_span);

		var close_span = document.createElement("span");
		$(close_span).addClass("close");
		$(close_span).attr("title", "关闭");
		$(li).append(close_span);
		$(li).contextMenu("right_key_menu", {
			bindings : {
				'refresh_page_btn' : function(x) {
					iframe.src = src;
				},
				'close_page_btn' : function(x) {
					closeOnePage(id);
				},
				'close_other_page_btn' : function(x) {
					var arr = $(".tab");
					for (var i = 0; i < arr.length; i++) {
						var temp = $(arr[i]);
						var temp_id = temp.attr("id");
						temp_id = temp_id.substr(4);
						if (temp_id != id) {
							$("#page_" + temp_id).remove();
							temp.remove();
						}
					}
					focusOnePage(id);
					slideTabs();
				},
				'single_window_btn' : function(x) {
					window.open(src, "_blank", null);
				}
			}
		});
		$(".tabs").append(li);
		var height = pageHeight-170-45-55;
		$(iframe).height(height);
	//	$(".toggleDiv").height(height);
		//var h=height/10;
		//$(".log_item").height('10%');
	}
	focusOnePage(id);
	}
	
	
	function mainSearch(){
		var message=$("#mainSearchText").val();
		var mes = message.replace(/(^\s*)|(\s*$)/g, '');
		var reg=new RegExp("[%{}()（）【】‘’'\"]","g");//正则表达式
		var sc=mes.replace(reg,"");
		if(message!=null && sc!=""){
			closeOnePage('1256289171');
			openOtherWindow('1256289171',"查询","search/synthesisSearch.do?keyWord="+encodeURIComponent(message)+"&langue=1");
		}else{
			$.messager.alert("提示","请输入查询内容！");
		}
	}
	function getIfreamHeight(){
		var h=0;
		var length=$(".one_page").length;
		for(var i=0;i<length;i++){
			if($(".one_page:eq("+i+")").css("display") == 'block'){  
	            h= $("iframe:eq("+i+")").height();
	            return h;
	 		} 
		}
		return h;
	}
	/**获取工作日志*/
	var noticeType="0";
	function getWorkLog(){
		hideHistoryData();
		//投诉
		$.ajax({
	        type: "post",
	        url: "iframe.do?verbId=getComplaintsTODo",
	        dataType: "text",
	        success: function(data){
	        	$('#complaintsValue').html(data);
	           }
	    });
		//咨询
		$.ajax({
	        type: "post",
	        url: "iframe.do?verbId=getConsultationTODo",
	        dataType: "text",
	        success: function(data){
	        	$('#consultationValue').html(data);
	           }
	    });
		//随访
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/followUp/followUpPlan.do?verbId=personNum",
	        dataType: "text",
	        success: function(data){
	        	$('#followUpValue').html(data);
	           }
	    });
		//满意度
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/satisfied/satisfiedPlan.do?verbId=personNum",
	        dataType: "text",
	        success: function(data){
	        	$('#satisfedValue').html(data);
	           }
	    });
		
		//生日
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/hsp/patientBirthday.do?verbId=personNum",
	        dataType: "text",
	        success: function(data){
	        	$('#birthdayValue').html(data);
	           }
	    });
		//投诉预警
		openNoticeWindow(noticeType);
		
	}
	/**投诉预警*/
	function openNoticeWindow(type){
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/complaints.do?verbId=complintsNotices",
	        dataType: "json",
	        success: function(data){
	        	if(data.status==true){
	        	$('#noticeValue').html("本月："+data.complePersonNum+";本周："+data.compleZNum);
	        	if(type=="0" ){
	        	$("#notice1").text(data.num);
	        	$("#notice2").text(data.compleZNum);
	        	$("#notice3").text(data.personNum);
	        	$("#notice4").text(data.complePersonNum);
	        	$("#notice5").text(data.deptNum);
	        	$("#notice6").text(data.compleZDeptNum);
	        	$("#notice7").text(data.personDeptNum);
	        	$("#notice8").text(data.complePersonDeptNum);
					$("#noticeWindow").window('open');
	        	}
	        	}
	           }
	    });
	}
	function getHistoryData(data,type){
		eval("var json = "+data);
		var tableData;
		if(type=="0"){
			tableData = "<table style='width:100%;'><tr><td style='width:20%;' >记录人</td><td style='width:30%;'>状态</td><td style='width:50%;'>记录时间</td></tr>";
		}
		for(var i=0;i<json.length;i++){
			tableData=tableData+"<tr><td>"+json[i].name+"</td>"+"<td>"+json[i].flag+"</td>"+"<td><a href=\"javascript:showComplaintsData('"+json[i].cid+"')\">"+json[i].time+"</a></td></tr>";
		}
		tableData = tableData+"</table>";
		$('#complaintsHistoryDetail').html(tableData);
		showHistoryData();
	}
	
	function getHistoryFollowUp(json,type){
		var tableData;
		if(type=="0"){
			tableData = "<table style='width:100%;'><tr  style=\"font-weight: bold;text-align: center;\" ><td style='width:40%;' >随访时间</td><td style='width:30%;'>状态</td><td style='width:30%;'>随访人</td></tr>";
		}
		for(var i=0;i<json.length;i++){
			tableData=tableData+"<tr style=\"text-align: center;\"  onmouseover=\"this.style.background='#EAF2FF'\" onmouseout=\"this.style.background='#ffffff'\"><td title=\"随访内容： \"><label style=\"cursor: pointer;\" onclick=\"showFollowUpDetal('"+json[i].taskId+"','"+json[i].planId+"','"+json[i].personId+"','"+json[i].authorId+"')\">"+json[i].followUpTime+"</label></td>"+"<td>"+json[i].resultStatus+":"+json[i].followStatus+"</td>"+"<td>"+json[i].followName+"</td></tr>";
		}
		tableData = tableData+"</table>";
		$('#complaintsHistoryDetail').html(tableData);
		showHistoryData();
	}
	
	function getHistoryConsultation(json,type){
		var tableData;
		if(type=="0"){
			tableData = "<table style='width:100%;'><tr  style=\"font-weight: bold;text-align: center;\" ><td style='width:40%;' >咨询时间</td><td style='width:30%;'>状态</td><td style='width:30%;'>记录人</td></tr>";
		}
		for(var i=0;i<json.length;i++){
			tableData=tableData+"<tr style=\"text-align: center;\"  onmouseover=\"this.style.background='#EAF2FF'\" onmouseout=\"this.style.background='#ffffff'\"><td title=\"咨询内容："+json[i].consultationComments+" \"><label style=\"cursor: pointer;\" onclick=\"showConsultationDetal('"+json[i].id+"')\">"+json[i].consultationTime+"</label></td>"+"<td>"+json[i].executedFlagId+"</td>"+"<td>"+json[i].executedOperateHuman+"</td></tr>";
		}
		tableData = tableData+"</table>";
		$('#complaintsHistoryDetail').html(tableData);
		showHistoryData();
	}
	function showComplaintsData(id){
		openOtherWindow('129128917','投诉信息查看','complaints.do?verbId=showData&type=1'+'&id='+id);
	}
	function showFollowUpDetal(taskId,planId,pid,authorId){
		openOtherWindow(Math.floor(Math.random()*1000000),'随访历史查看','followUp/historicalFollowUp.do?verbId=detailHistory&taskId='+taskId+'&planId='+planId+'&pid='+pid+'&authorId='+authorId);
	}
	function showConsultationDetal(id){
		openOtherWindow(Math.floor(Math.random()*1000000),'咨询信息查看','crm/crmConsultation.do?verbId=detail&type=1&id='+id);
	}
	function hideHistoryData(){
		$('#complaintsHistoryDetail').hide();
		$('#timeControl').show();
	}
	function showHistoryData(){
		$('#complaintsHistoryDetail').show();
		$('#timeControl').hide();
	}
	function clearnHistorydate(){
		$('#complaintsHistoryDetail').html("");
	}
	
	function clickTextSubText(id){
		var textcomp = $('#complaintsHistoryDetail').html();
		if(id=="140100" && textcomp!=null && textcomp!=""){
			showHistoryData();
		}else if(id=="402880f94c112879014c1142e7d7005b" && textcomp!=null && textcomp!=""){ 
			showHistoryData();
		}else{
			hideHistoryData();
		}
	}
	function closeCrmSubWindow(id){
		var textcomp = $('#complaintsHistoryDetail').html();
		if(id=="140100"){
			clearnHistorydate();
			hideHistoryData();
		}else if(id=="402880f94c112879014c1142e7d7005b"){
			clearnHistorydate();
			hideHistoryData();
		}else if(textcomp!=null && textcomp!=""){
			showHistoryData();
		}
		
	}
	function addBg(value){
		$(value).addClass("liActive");
		
	}
	function deleteBg(value){
		$(value).removeClass("liActive");
	}
	/**关闭投诉预警弹出框，如果type=1，表示不再提示*/
	function closeNoticeWin(type){
		noticeType=type;
		$("#noticeWindow").window('close');
	}

function fnInit(){
// 访问 styleSheet 中的一条规则, 将其 backgroundColor 改为蓝色。
var oStyleSheet=document.styleSheets[20];
var l = oStyleSheet.rules.length;
var oRule=oStyleSheet.rules[0];
oRule.style.fontSize=$("#fontSize").combobox('getText');
oRule.style.fontFamily=$("#fontFamily").combobox('getText');
}
$(function(){
	$("#fontFamily").combobox({
		 valueField:'val',   
		    	textField:'text',
		    	data:[{val:'0',text:'宋体'
		    		  },{val:'1',text:'黑体'
		    		  },{val:'2',text:'楷体'}
		    	],
		onSelect:function(rec){			
			fnInit();
		},
		onLoadSuccess:function(){
			$("#fontFamily").combobox('setValue','0');
		}
	});
	$("#fontSize").combobox({
		 valueField:'val',   
		    	textField:'text',
		    	data:[{val:'0',text:'12px'
		    		  },{val:'1',text:'14px'
		    		  },{val:'2',text:'16px'}
		    	],
		onSelect:function(rec){			
			fnInit();
		},
		onLoadSuccess:function(){
			$("#fontSize").combobox('setValue','0');
		}
	});
});
var inShow = false;
function installCss(obj){
	if(inShow){
		inShow = false;
		$("#installDiv").hide();
	}else{
		inShow = true;
		var X = $(obj).offset().top;
		var Y = $(obj).offset().left;
		$("#installDiv").css({position:'absolute','left':Y-290,'top':X+20});
		$("#installDiv").show();
	}
}
function installClose(){
	$("#installDiv").hide();
	inShow = false;
}
function changeRadio1(){
	 $("#redc").attr("checked","checked");
	 $("#bg1").addClass("label_checked");
	 $("#bg1").removeClass("label_nocheck");
	 $("#bg2").addClass("label_nocheck");
	 $("#bg2").removeClass("label_checked");
	 $("#link1").attr('href','main/newClass/css/index_n.css');
 }
/**执行状态 待回复 */
function changeRadio2(){
	 $("#blues").attr("checked","checked");
	 $("#bg2").addClass("label_checked");
	 $("#bg2").removeClass("label_nocheck");
	 $("#bg1").addClass("label_nocheck");
	 $("#bg1").removeClass("label_checked");
	 $("#link1").attr('href','main/include/css/index_n.css');
 }
 function sendSMS(){
	 var phone = null;
	 var username = null;
	 $.ajax( {
			type : "POST",
			url : '${path}/hsp/patientBirthday.do?verbId=manualSend',
			data : {
				"phone" : phone,
				"username" : username,
			},
			dataType : "json",
			success : function(data) {
				var pg = eval(data);
				if(pg[0].statusCode!="000000"){
					var mes = pg[0].statusMsg;
					$.messager.alert('提示', mes, "info");
				}else{
					$.messager.alert('提示', "发送成功！", "info");
				}
			}
		});
 }
	</script>
</head>
<body>
<input id="zycPath" type="hidden" value="<%=request.getContextPath()%>"/>
	<form id="form" name="form" method="post"
		action="security/security_loginSecond.do" style='overflow:hidden;margin-bottom:25px'>
		<input type="hidden" name="verbId" value="" /> <input type="hidden"
			name="publicClassId" value="" />
		<div id="header">
			<img src="main/include/images/login_03.png"
				style="float: left;"/>
			<ul class="nav">
			
			<li class="user">当前用户：<%=sessionForm.getStaffName()%></li>
				<li><a
					href="<%=request.getContextPath()%>/security/security_login.do?verbId=reLogin">
					<img src="main/include/images/main_top.gif" 
				style="float: left;margin-top: -2px;margin-right: 2px;" />首页</a></li>
				<li><a
					href="<%=request.getContextPath()%>/index.jsp?agree=true" onclick="zuoXiOffWork();"><img src="main/include/images/main_close.gif" 
				style="float: left;margin-right: 2px;" />退出</a></li>
			</ul>
			
			<div id="topNav" style='margin-left:0px;margin-right:0px;float:right'>
				<div id="ca-container" class="ca-container">
					<div class="ca-wrapper" >
						<%
							if (pcList != null) {
								int i=0;
								for (SecurityConfigPublicClass pc : pcList) {
									List<SecurityConfigPublicClass> childList = null;
									i++;
									if (childMap != null) {
										childList = childMap.get(pc.getId());
									}
						%>
						<div class="ca-item" id="ca-item-div-<%=i%>">
							<div class="ca-item-main">
								<ul class="ul_pc_1" title="<%=pc.getClassName()%>">
									<%
										if (childList != null) {
									%>
									<li class="li_pc_1 pc_<%=pc.getId()%>" 
										onmouseover="showPC2(this)" onmouseout="hidePC2(this)">
										<div style="cursor: pointer;width:70px;height:40px;position:relative;margin:0 auto;background-image: url(main/include/images/<%=pc.getPicPath() %>);"></div>
										<h3><%=pc.getClassName()%></h3>
										<div class='bg_wrapper' ></div>
										<div class='bg_wrapper2'></div>
										<ul class="ul_pc_2">
											<%
												for (SecurityConfigPublicClass child : childList) {
											%>
											<li class="li_pc_2 pc_<%=child.getId()%>" id="<%=child.getId()%>"
												onclick="currentPublicClassName='<%=pc.getClassName()%>&nbsp;&nbsp;&gt;&gt;&nbsp;<%=child.getClassName()%>';getPublicByClassId('<%=child.getId()%>');"
												title="<%=child.getClassName()%>">
												<h4><%=child.getClassName()%></h4>
											</li>
											<%
												}
											%>
										</ul>
										
									</li>
									<%
										} else {
									%>
									<li class="li_pc_1 pc_<%=pc.getId()%>" id="<%=pc.getId()%>"
									onmouseover="addBg(this);" onmouseout="deleteBg(this)"
										onclick="currentPublicClassName='<%=pc.getClassName()%>';getPublicByClassId('<%=pc.getId()%>');"
										title="<%=pc.getClassName()%>">
										<div style="cursor: pointer;width:70px;height:40px;position:relative;margin:0 auto;background-image: url(main/include/images/<%=pc.getPicPath() %>);"></div>
										<h3><%=pc.getClassName()%></h3>
											<div class='bg_wrapper' ></div>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>

						<%
							}
							}
						%>
					</div>

				</div>
			</div>
		</div>
		<div id="toolbar" style="border-top: 1px #49acfd solid;background-color: #0173c4;height: 35px;line-height: 35px;text-align: center; ">
		<div id="toolbar_two" ></div>
		</div>
		<!-- phone bar -->
		<div
			style="width: 100%; background-color: rgb(209, 209, 209); height: 1px;"></div>
<div
			style="width:100%;background-image: url('<%=request.getContextPath()%>/include/images/v.jpg');height:11px;"></div>

		<div style="width: 100%; background-color: rgb(239, 239, 239);overflow:hidden;">
			<div class='toggleDiv'>
                <div class='toggleButton'></div>
				<div class="right_black">
					<div class="right_history_blank">
						<div class="right_title">
							<span>历史信息</span>
						</div>
						<div class="line"></div>
						<div class="right_content_blank" >
							<div style="width:221px; height:200px;  overflow:auto;" id="complaintsHistoryDetail" ></div>
							<div style="width:221px; height:200px;" class="easyui-calendar" id="timeControl" ></div>
						</div>
					</div>
					<div class="line_10"></div>
					<div class="right_history_blank" style='border-top:1px solid #dddddd;' id="gzrz">
						<div class="right_title">
							<span>工作日志</span>
						</div>
						<div class="line"></div>
						<div class="log_item " id="follow_log_item">
							<a href="javascript:openOtherWindow('129128917','随访信息处理','followUp/followUpPlan.do?verbId=list');" onclick="removeRemind(this)"><span id="followUpValueRe">随访提醒（<label id="followUpValue"></label>）</span></a>
						</div>
						<div class="log_item " id="satisf_log_item">
							<a href="javascript:openOtherWindow('129128920','满意度信息处理','satisfied/satisfiedPlan.do?verbId=list');"><span>满意度提醒（<label id="satisfedValue"></label>）</span></a>
						</div>
						<div class="log_item ">
							<a href="javascript:openOtherWindow('129128918','投诉信息处理','complaints.do?verbId=list&type=2');" onclick="removeRemind(this)"><span id="complaintsValueRe">投诉提醒（<label id="complaintsValue"></label>）</span></a>
						</div>
						<div class="log_item ">
							<a href="javascript:openOtherWindow('129128919','咨询信息处理','crm/crmConsultation.do?verbId=queryConsultation&executedFlag=1');" onclick="removeRemind(this)"><span id="consultationValueRe">咨询提醒（<label id="consultationValue"></label>）</span></a>
						</div>
					  
<!-- <div class="log_item even">
							<span>院内通知（1）</span>
						</div> -->
					</div>

				</div>
			</div>
		     <div class='displayDiv'>
				<div
					style="margin: 0 auto; margin-left: 10px; margin-right: 10px; border: 1px rgb(210, 210, 210) solid; background-color: #FFFFFF">
					<div class="multi_pages">
						<ul class="tabs">
						</ul>
						<div class="tabs_tool_btn">
							<div class="prev_tab_btn" title="按住向前滑动"></div>
							<div class="next_tab_btn" title="按住向后滑动"></div>
						</div>
						<div class="page_container"></div>
						<div class="contextMenu" id="right_key_menu">
							<ul>
								<li id="refresh_page_btn">刷新</li>
								<li id="close_page_btn">关闭</li>
								<li id="close_other_page_btn">关闭其他</li>
								<li id="single_window_btn">独立窗口显示</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
<object id="ecsdkobject" class="noDisplay"></object>
 <div id="win" class="easyui-window"style="width:840px;height:526px;" data-options="modal:false,closed:true,collapsible: false,resizable: false">
     	
  <input type="hidden" value="" id="RESTIP">
  <input type="hidden" value="" id="RESTPOST">
  <input type="hidden" value="" id="accountSid">
  <input type="hidden" value="" id="authToken">
  <input type="hidden" value="" id="subaccount">
  <input type="hidden" value="" id="subaccounttoken">
  <input type="hidden" value="" id="appId">
 <input type="hidden" value="" id="appPwd">
  <input type="hidden" value="" id="voip">
  <input type="hidden" value="" id="voiptoken">
  <input type="hidden" value="" id=fromVoip name="fromVoip">
  <input type="hidden" value="" id="userVoip" name="userVoip">
  <input type="hidden" name="hspName" id="hspName" value="">
	<input type="hidden" id="hspId" value="<%=sessionForm.getStaffHospitalId()%>">
	<input type="hidden" value="" id = "toVoip" />
	<input type="hidden" value="<%=sessionForm.getTenantId()%>" id = "tenantId" />
  <input type="hidden" id="userName" value="<%=sessionForm.getStaffName()%>">
  <input type="hidden" name="userId" id="userId" value="<%= sessionForm.getStaffId()%>"/>	
  <input type="hidden" value="" id = "flagHspOrSecurity" />
  <input type="hidden" value="" id = "toFlagHspOrSecurity" />
  <input type="hidden" value="0" id="talk_status">
	<div class="chatMain">
		<div class="leftMain">
	     <div class="content">
	          <div class="nav">
	              <div class="message messageSelected"><div class="unReadMsgCount noDisplay" >0</div></div>
	              <div class='contacts'></div>
	          </div>
	          <div class="info">
	              <div class="messageList">
	                  <ul id="huihuaList"><%--
                      	 <li class="openTrigger doctor"><img src="${path}/chat/images/touxiang1.png" /><span>医生1</span></li>
	                     <li class="openTrigger doctor"><img src="${path}/chat/images/touxiang2.png" /><span>医生2</span></li>
	                                
	                  --%></ul>
	              </div>
	              <div class="contactsList noDisplay">
	                   <ul>
	                      <li>
	                          <div class="title">医生组</div>
	                          <ul class="noDisplay" id="doctorDeptList">
	                           	<%--<li>
	                                <div class="title">儿科</div>
	                                <ul class="noDisplay">
	                                    <li class="openTrigger doctor"><img src="${path}/chat/images/touxiang1.png" /><span>医生1</span></li>
	                                    <li class="openTrigger doctor"><img src="${path}/chat/images/touxiang2.png" /><span>医生2</span></li>
	                                </ul>
	                            </li>
	                            <li>
	                                 <div class="title">骨科</div>
	                                      <ul class="noDisplay">
	                                          <li class="openTrigger doctor"><img src="${path}/chat/images/touxiang1.png" /><span>医生1</span></li>
	                                          <li class="openTrigger doctor"><img src="${path}/chat/images/touxiang2.png" /><span>医生2</span></li>
	                                      </ul>
	                             </li>
	                         --%></ul>
	                      </li>
	                      <li>
	                           <div class="title">患者组</div>
	                           <ul class="noDisplay" id="patientList">
	                           </ul>
	                      </li>
	                      <li>
	                           <div class="title">客服组</div>
	                           <ul class="noDisplay" id="crmList">
	                           		<!--<li class="openTrigger doctor"><img src="${path}/chat/images/discuss_group_head1.png" /><span>医生1</span></li>
	                                <li class="openTrigger doctor"><img src="${path}/chat/images/discuss_group_head1.png" /><span>医生2</span></li>
	                                      
	                           --></ul>
	                      </li>
	                  </ul>
	              </div>
	          </div>
	     </div>
	  </div>
	  <div class="openBox">
	        <div class="head">
            	<span id="toVoipName"></span>
            	<a href="javascript:closeChatBox();"  class="closeImg"></a>
<%--                <a href="#" onclick="closeChatBox();" class="closeImg"></a>--%>
            </div>
	        <div class="content">
	            <div class="infoK" id="infoK">
	                  <div class="more"><span>查看更多消息</span></div>
	                  <div class="info_get" id="send_get">
	                  <!--<div class="self">
	                    <img class="touxiang" alt="" src="${path}/chat/images/touxiang1.png">
                     	<span class="chatContent">
                     		<span class="msgContent">最近身体好些了吗</span>
                     	 </span>  
	                   </div>
	                   <div class="other">
	                     <img class="touxiang" alt="" src="${path}/chat/images/touxiang2.png">
	                    	<span class="chatContent">
	                    		<span class="msgContent">好些了</span> 
	                         </span> 
	                    </div>
	                    <div class="self">
	                    <img class="touxiang" alt="" src="${path}/chat/images/touxiang1.png">
	                     	<span class="chatContent">
	                     		<img class="picture" alt="" src="${path}/chat/images/chat_tu_down.png">
	                     	 </span>  
	                    </div>
	                    <div class="other">
	                     <img class="touxiang" alt="" src="${path}/chat/images/touxiang2.png">
	                    	<span class="chatContent">
	                    		<img class="picture" alt="" src="${path}/chat/images/chat_tu_down.png">
	                         </span> 
	                    </div>
	                   
	                   <div class="self">
	                     <img class="touxiang" alt="" src="${path}/chat/images/touxiang1.png">
	                     	  <span class="chatContent" > 
	                     	  		<span class="voiceTime" >3"</span>
									<img class="voiceImg"alt="" src="${path}/chat/images/yuyin_normal.png">
									
	                     	 </span> 
	                    </div>
	                    
	                    <div class="other">
	                     <img class="touxiang" alt="" src="${path}/chat/images/touxiang2.png">
	                    	<span class="chatContent"> 
	                    		<img class="voiceImg"alt="" src="${path}/chat/images/yuyin_form_normal.png">
	                    		<span class="voiceTime">3"</span><img class="voiceUnRead" alt="" src="${path}/chat/images/dotted.png">
	                          </span> 
	                    </div>
	                 --></div>
                     
	            </div>
	            
                <!--录音-->
                 <div class="wrap_record noDisplay" > 
                 	<div id='bar' class="recordBar">
                    	
					</div>
                    <div class="recoerdBtns">
                    	<img src="${path}/chat/images/dotted.png"/>
                    	<span class="recordTime">正在录音中...</span>
                   		<input type="submit" value="发送" class="recordSend" onclick="sendRecord();"/>
                    	<input type="submit" value="取消" class="recordCancel" onclick="cancelRecord();" />
                    </div>
                 	
                 </div>
	             <div class="emoticon">
	             	<a  onclick="loadBiaoQing();"class="biaoqing" title="表情"></a>
					<a  onclick="loadfujian();"  class="fujian" title="附件"></a>       		
		            <input class="file" type="file"  style="width: 0px;" id="file1" name="file1" onchange="uploadfile(this);"/>  	 
		            <a  onclick="dealRecord()" class="record" title="录音"></a>
		            <a  class="voice" onclick="loadVoiceVideo('0');" title="语音呼叫"></a>
					<a class="video" onclick="loadVoiceVideo('1');" title="视频"></a>
	              	
	               <!-- 表情框 -->
					<div class="wrap_bq" ></div>
	            </div>
	            <div class="writeMessage">
	               <!--<div>
	                  <textarea></textarea>
	               </div>-->
	               <div class="area" contenteditable="true" id="chatMsg" onkeydown="sendMessage();">
					</div>
					<pre id="im_send_content_copy" ></pre>
                    <div class="sendBtn">
                    	<a class="send" id="send" href="javascript:btnSendMessage();">发送</a>
                    </div>
                    
	               
	            </div>
	      </div>
	      
	    </div>

</div>
</div>
	<input type="hidden" id="caller_callid" value=""/>
	<input type="hidden" id="caller_callType" />
	<input type="hidden" id="caller_name" />
	<input type="hidden" id="caller_voip" />
    <!-- 视频呼叫 -->
<div id="videoCall" class="easyui-window"
	data-options="modal:false,closed:true"
	style="width:526px;height:368px;overflow: hidden;">
    <div class="videoHead">
    	<span class="videoTabel">与XXX进行视频通话中</span>
    </div>
    <div class="videoContent">
        <div class="replayer_img">
            <OBJECT ID="remoteView" style="width: 100%;height: 100%;background:#fff;" CLASSID="CLSID:4CB3537E-EF5A-4493-A3FC-EC14C16C0760"></OBJECT>
       </div>
        <div class="sender_img">
            <OBJECT ID="localView" style="width:200px;height: 200px;background:#fff; margin-left: 1px;" CLASSID="CLSID:4CB3537E-EF5A-4493-A3FC-EC14C16C0760"></OBJECT>
       		<div class="videoAccept noDisplay">
       			<span class="videoTime">00:00:34</span>
	       		<div class="videoHangUpBtn">
	       			 <a class="vedioCallButton hangup" onclick="hangup();"> </a>
	       		</div>
       		</div>
       		<div class="videoNoAccept ">
	       		<div class="joinUpCall noDisplay">
	       			<a class="vedioCallButton answer" onclick="answer();"> </a>
	       			
    				<a class="vedioCallButton reject"  onclick="reject();"> </a>
	       		</div>
	       		<div class="dialOutCall ">
	       			 <a class="vedioCallButton hangup" onclick="hangup();"> </a>
	       		</div>
       		</div>
       </div>
   </div>
</div>
  	  <!-- 语音视频呼叫 -->
<div id="voiceVideoCall" class="easyui-window"  
	data-options="modal:false,closed:true,collapsible: false,resizable: false"
	style="width:265px;height:255px;overflow: hidden;">
    
	<div class="callVoice">
		<div class="voiceTouxiangImg">
			<img class="touxiang" alt="" src="<%=request.getContextPath()%>/chat/images/touxiang2.png">
            
		</div>
		<div >
			<div id="voiceToVoipName" style="font-size: 20px;color:white;"></div>
			<div id="stateDescribe" style="font-size: 12px;color:white;padding-top: 10px;"></div>
		</div>
	</div>
    <div class="joinUpCall noDisplay">
   	 	<a class="voiceCallButton answer" onclick="answer();"> </a>
    	<a class="voiceCallButton reject"  onclick="reject();"> </a>
    </div>
    <div class="dialOutCall">
        <a class="voiceCallButton hangup" onclick="hangup();"> </a>
    </div>
	
</div>

	<input type="hidden" id="serverPath" value="<%=request.getContextPath()%>"/>
	<input type="hidden" id="imServerPath" value="http://localhost:8003/ChartPatientWebhttp://localhost:8003/ChatPatientWeb/">
	<OBJECT ID="CallCenter" CLASSID="CLSID:F20C5A15-A3E3-4375-9A8B-8275489017B8" style="width: 0px;height: 0px;"></OBJECT>
<script>

      //右边伸缩
     
           var footerWidth=$('#footer').width();
           $('#footer').width(footerWidth-260+'px')
           var divOpen=true;
           $('.toggleButton').click(function(){
        	
        	   if(divOpen==true){
        		   divOpen=false;
        		   $(this).css({
        			   'backgroundImage':'url(<%=request.getContextPath()%>/main/include/images/open.png)'
        		   })
        		   $('.toggleDiv').animate({
        			   'marginRight':'-229px'
        		   }) 
        		   $('.displayDiv').animate({
        			   'margin-right':'10px'
        		   })
        	   }
        	   else{
        		   divOpen=true;
        		   $(this).css({
        			   'backgroundImage':'url(<%=request.getContextPath()%>/main/include/images/closed.png)'
        		   })
        		   $('.toggleDiv').animate({
        			   'marginRight':'0px'
        		   }) 
        		   $('.displayDiv').animate({
        			   'margin-right':'243px'
        		   })
        	   }
        	   
           })
           
         
</script>

</body>
	<script src="<%=request.getContextPath()%>/chat/js/CRM/chatCRMPublic.js"></script>
	<script src="<%=request.getContextPath()%>/chat/js/CRM/crmBaseData.js"></script>
	<script src="<%=request.getContextPath()%>/chat/js/CRM/chatCRMOCX-1.1.7.13.js"></script>

	<!--<script src="<%=request.getContextPath()%>/chat/js/chat.js"></script>
	<script src="<%=request.getContextPath()%>/chat/js/chatPort.js"></script>
	<script src="<%=request.getContextPath()%>/chat/js/chatPublic.js"></script>
	<script src="<%=request.getContextPath()%>/chat/js/baseData.js"></script>
	<script src="<%=request.getContextPath()%>/chat/js/voiceAndvideoCall.js"></script>
--></html>

