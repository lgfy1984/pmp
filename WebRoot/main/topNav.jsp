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
<link rel="stylesheet" type="text/css"
	href="main/include/css/index_n.css" />
<title>:::<%=application.getAttribute("security.SYSTEMNAME")%>
	:::
</title>

	<link href="<%=request.getContextPath()%>/style/styles.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath()%>/style/emoji.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath()%>/style/jishixiaoxi.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/demo.css">

<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/ext-3.2.0/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/include/css/multiPage.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/main/include/css/pcpop.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/main/ext-3.2.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/main/ext-3.2.0/ext-all.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/utrim.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery.contextmenu.r2.packed.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery.contentcarousel.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/include/javascript/jquery.easyui.mobile.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/callCenterControls.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/callCenterControls.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/default.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/easyui/themes/default/calendar.css">
<script type="text/javascript"	src="<%=request.getContextPath()%>/style/easyui/locale/easyui-lang-zh_CN.js"></script>		
	<script src="<%=request.getContextPath()%>/js/jishixiaoxi.js"></script>
	<script src="<%=request.getContextPath()%>/js/json2.js"></script>
	<script src="<%=request.getContextPath()%>/js/emoji.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/mainTab.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/mainTab.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpPrescInfo.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/style/easyui/themes/icon.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/electronic.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpExamInfo.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpLabInfo.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/outpBillInfo.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/kbs.css"/>
<style type="text/css">
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
.displayDiv{
  height:800px;
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
	height: 500px;
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
	height: 42px;
	line-height: 42px;
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
</style>
	<script type="text/javascript">
	
	/* 获取OCX控件对象 */
	/*聊天记录点击次数*/
	var display=0;
	/*聊天记录框是否显示*/	
	function chatMessage(){
		if (display==1){
			var v=	document.getElementById('chats');
			var r=	document.getElementById('records');
			v.style.display="inline";
			r.style.display="none";
			display=0;
		}else {
			var v=	document.getElementById('chats');
			var r=	document.getElementById('records');
			v.style.display="none";
			r.style.display="inline";
			display=1;
			var pageNo = $("#chatsNum").val();
			getMsg(pageNo,"2");
		}
	}
	/* 关闭聊天记录框 */
	function closeChats(){
		var v=	document.getElementById('chats');
		v.style.display="none";
	}
	
	/*-------------------------------表情------------------------------------------*/
	
	
	//标记表情面板是否已经打开
	var emojiflag=false;
	/* 加载表情 */
	function loadBiaoQing(){
		//如果表情面板没打开
		if(!emojiflag){
			var str="";
			var json=jEmoji.EMOJI_MAP;
			for(var key in json){
					str+=key;
			}
			 var message=jEmoji.unifiedToHTML(str);
			$(".wrap_bq").html(message);
			//显示表情弹出框
			$(".wrap_bq").show();
			
			$(".biaoqing").css("background","url(<%=request.getContextPath()%>/include/images/biaoqing_down.png) 0 3px no-repeat");
			//打开表情面板
			emojiflag=true;
		}else{
			 //隐藏表情弹出框
			 $(".wrap_bq").hide();
			 $(".biaoqing").css("background","url(<%=request.getContextPath()%>/include/images/biaoqing.png) 0 3px no-repeat");
			//关闭表情面板
		     emojiflag=false;
		}
	}
	

	function loadfujian(){
			 $(".fujian").css("background","url(<%=request.getContextPath()%>/include/images/fujian_down.png) 0 3px no-repeat");
			 document.getElementById("file1").click();
			 $(".fujian").css("background","url(<%=request.getContextPath()%>/include/images/fujian.png) 0 3px no-repeat");		
	}
	
	function dealVoice(){
			$('#dlg').dialog('open') ;
			makeVoice();
 		}

	function emojitohtml(value){
		var text = jEmoji.softbankToUnified(value);
		 var message=jEmoji.unifiedToHTML(text);
		 fn_insertPos(message+" ");
		 //隐藏表情弹出框
		 $(".wrap_bq").hide();
	}
	//在光标处插入内容
	function fn_insertPos(textValue)
	{     
		//var msg=document.getElementById("msg");
	    if(pos!=null)
	    {
	       // pos.text="插入文字内容";
	        pos.pasteHTML(textValue);
	        //设置光标位置函数
	        
	        //释放位置
	        pos=null;
	    }else{
	    	$("#msg").append(textValue);
	    }  
	} 
 	function stop(){ 
		return false; 
		} 
		document.oncontextmenu=stop; 
		
		document.onkeydown = function(){
			if(window.event && window.event.keyCode == 123) {
			    return false;   
		    }
		}
	</script>
  <script type="text/javascript">
  
 		function pageLoad(){
			/* 判断是否已经安装OCX控件 */
			if (CallCenter.callid == undefined) {// 检查是否安装OCX控件
				alert("您还没有安装OCX控件,请先下载安装！");// 您还没有安装OCX控件

				window.location.href='http://docs.cloopen.com/images/a/ac/CCP_PC_OCX_WINDOWS_v2.5.7r.zip';
			}
			/* 初始化SDK，在调用其他接口之前调用。 */
			var initParm=CallCenter.CCPinit();
			if(initParm!="0"&&initParm!="-1000"){
				alert("初始化失败!");
				//return;
			}
			
  			var RESTIP = $("#RESTIP").val();
			var RESTPOST =$("#RESTPOST").val();
			var accountSid =$("#accountSid").val();
			var authToken = $("#authToken").val();
			var subaccount = $("#subaccount").val();
			var subaccounttoken = $("#subaccounttoken").val();
			var voip =$("#voip").val();
			var voiptoken = $("#voiptoken").val(); 
			
			 var v=CallCenter.CCPlogin(RESTIP,RESTPOST,accountSid,authToken
					,subaccount,subaccounttoken
					,voip,voiptoken); 
				//alert(v);
			if(v!='0'){
				alert("未登陆成功!");
			} 
		}
 		
 		//-------------语音-------------//
 		 var time = 60;
 		 var timeOut = 0;//0 超时 1，未超时
 		function uuid() {
		    var s = [];
		    var hexDigits = "0123456789abcdef";
		    for (var i = 0; i < 36; i++) {
		        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
		    }
		    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
		    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
		    s[8] = s[13] = s[18] = s[23] = "-";
		    var uuid = s.join("");
		    return uuid;
		}
 		
 		var filepath="";
 		function makeVoice(){
 			
 			//获取当前准备发送的voip
 			var voip=$("#currentVoipIp").val();
 			if(voip==""){
 				alert("请选择VoIP!");
 				return false;
 			}
 			$(".voice").css("background","url(<%=request.getContextPath()%>/include/images/yuyin_down.png) 0 3px no-repeat");//设置鼠标按下控件的样式
 			$(".voice").attr("disabled",true);   //设置控件的属性
 			//颜色置灰
 			$(".voice").css("color","gray");
 			$("#graph").show();	
 			time = 60;
 			go();
 			//生成js uuid
 			 filepath=fileDownPath+"\\"+uuid()+".amr";
 			var v = CallCenter.CCPstartVoiceRecording(filepath,voip);
 			timeOut = 0 ;
 		}
 		/* 语音时间条 */
		
 		function go() {
 			var bar=$("#bar");
 			if ( time > 0) {
 				bar.width(bar.width() + 4.5 + "px");
 				time--;
 				bar.text(time);
 				setTimeout(function(){go();},1000);
 			} else if(time == 0){//当time==0 时，发送语音消息
 				time = -1;
 				if(timeOut==0){
 					alert("录音超时，请重试！");
 				}
 				$(".voice").attr("disabled",false);	
 				//bar.width(0);	
 				$(".graph").hide();	
 				cancelVoice();
 				timeOut = 1;//设置为未超时
 		     }
 		}
 		//如果sendflag=true,则点击的是"取消";sendflag=false,则点击的是"发送"
 		var sendflag=false;
 		function sendVoice1(){
 			sendflag=false;	
 			time=0;
 			$(".voice").attr("disabled",false);
 			$(".voice").css("background","url(<%=request.getContextPath()%>/include/images/yuyin.png) 0 3px no-repeat");
 			//停止录音
 			CallCenter.CCPstopVoiceRecording();
 			scro();
 		}
 		//发送语音
 		function sendvoice(){
 			var voip=$("#currentVoipIp").val();
 			var v=CallCenter.CCPsendInstanceMessage(voip,"",filepath,"");
 			//保存聊天记录
 			sendMsgSaveServer(filepath,"2",$("#voip").val(),$("#fromVoip").val(),"1","语音",false,true,$("#hspName").val(),$("#userName").val(),$("#hspConfigBaseinfoId").val(),$("#idHidden").val());
 			var json=eval('('+v+')');
 			$("#msg").text("");

 			if(json.msgId!="" && json.result=='0'){
 				var timeLoong = CallCenter.CCPgetVoiceDuration(filepath);
 				var lastIndex = filepath.lastIndexOf("\\");
 				var fileName = filepath.substring(lastIndex+1, filepath.length);
 				$("#send_get").append("<div class='replyer'><img class='pic2' src='<%=request.getContextPath()%>/include/images/s_touxiang.jpg' alt=''/><span><a href='javascript:void(0)' onclick='palyVoice(\""+fileName+"\")'>语音</a></span>"+(timeLoong/1000)+"秒</div>");
 			}else{
 				alert("发送失败");
 			}
 		}
 		
  		//文件存放目录
 		var fileDownPath="";
 		$(function(){
 			setTimeout(function(){
 				fileDownPath=CallCenter.appDataDir;
 		   		/* 消息到达事件
 		 		function CallCenter::OnReceiveInstanceMessage(msg){
 		 			acceptmsg(msg);
 		 		} */
 		 		//语音停止录制
 		 		function CallCenter::OnRecordingTimeOut(msg){
 		 			OnRecordingTimeOut(msg);
 		 		}
 		 		function OnRecordingTimeOut(msg){
 		 			if(!sendflag){
 		 				//发送语音	
 		 				sendvoice();
 		 				deleteVoice();
 		 			}	
 		 			
 		 		}
 		 		/* 接收到语音文件和附件时，回调事假 -- 多媒体消息事件 */
 		 		function CallCenter::OnReceiveInstanceMessageMedia(msg){
 		 			OnReceiveInstanceMessageMedia(msg);
 		 		}
 				
 				
 			}, 10000); 
 		
 		});
 			
 		function OnReceiveInstanceMessageMedia(msg){
 			var json=eval('('+msg+')');
 			if(json.fileExt=="amr"){
 				acceptvoiceFile(json);/* 接收语音文件 */
 			}else{
 				acceptFile(json);/* 接收附件文件 */
 			}
 			scro();
 		}
 		function acceptvoiceFile(json){
 			var voip=$("#currentVoipIp").val();
 			var  filename=json.fileUrl.split('=')[1];
 			var path=fileDownPath+"\\"+filename;
 			//获取语音文件目录
 				//下载附件 
 			var param = new Array();
 			param[0] = new Object();
 			param[0]["fileName"]=path;
 			param[0]["fileUrl"]=json.fileUrl;
 			param[0]["msgId"]=json.msgId;
 			param[0]["sender"]=json.sender;

 			var strjson = JSON.stringify(param);
 				var v=CallCenter.CCPdownloadAttached(strjson,"");
 				if(v!=0){
 					alert("语音文件下载失败!");
 					return false;
 				}
 				var sender="";
 				var fun="";
 				var index=json.receiver.indexOf("g");
 				if(index==-1){
 					sender=json.sender;	
 					fun="showMsg(this)";
 				}else if(index!=-1){//消息来自群组
 					sender=json.receiver;	
 					//fun="showMsg(this,\"group\")";
 					fun="showMsg(this)";
 				}
 	 			//保存聊天记录
 	 			//sendMsgSaveServer(path,"2",json.sender,json.receiver,"1","语音",true,false,$("#userName").val(),$("#hspName").val(),$("#hspConfigBaseinfoId").val(),$("#idHidden").val());
 				var timeLoong = CallCenter.CCPgetVoiceDuration(path);
 				if(sender==voip){
 						$("#send_get").append("<div class='sender'><img class='pic1' src='<%=request.getContextPath()%>/include/images/s_touxiang.jpg'/><img class='pic1' src='<%=request.getContextPath()%>/include/images/tag2.png' alt='' onclick='palyVoice(\""+filename+"\");'/><span></span>"+(timeLoong/1000)+"秒</div>");	
 				}else{
 					$("#huihua").append("<li class='clearfix' style='cursor:hand' onclick='"+fun+"'>"+
 							"<img class='touxiang' src='<%=request.getContextPath()%>/include/images/b_touxiang.jpg' alt=''/>"+
 							"<div class='info'>"+
 							"<span>"+sender+"</span>"+
 							"<em style='display: none;'><div class='sender'><img class='pic1' src='<%=request.getContextPath()%>/include/images/tag2.png' alt='' onclick='palyVoice(\""+filename+"\");'/><span></span>"+(timeLoong/1000)+"秒</div></em>"+
 							"<em>[语音]</em>"+
 							"</div>"+
 							"<i class='dotted'></i>"+
 							"</li>");
 							$(".tablist").find("i").attr("class","dotted");
 				}
 		}

/*  		function acceptFile(json){
 			var voip=$("#currentVoipIp").val();
 			var filename=json.userData;
 			var fileurl=json.fileUrl;
 			var msgId=json.msgId;
 			var sender=json.sender;
 				var sender="";
 				var fun="";
 				var index=json.receiver.indexOf("g");
 				if(index==-1){
 					sender=json.sender;	
 					fun="showMsg(this)";
 				}else if(index!=-1){//消息来自群组
 					sender=json.receiver;	
 					//fun="showMsg(this,\"group\")";
 					fun="showMsg(this)";
 				}
 				if(sender==voip){
 					$("#send_get").append("<div class='sender'><span><a href=\"javascript:savefile('"+filename+"','"+fileurl+"','"+msgId+"','"+sender+"')\">"+filename+"->接收</a></span></div>");
 				}else{
 					$("#huihua").append("<li class='clearfix' style='cursor:hand' onclick='"+fun+"'>"+
 							"<img class='touxiang' src='<%=request.getContextPath()%>/include/images/b_touxiang.jpg' alt=''/>"+
 							"<div class='info'>"+
 							"<span>"+sender+"</span>"+
 							"<em style='display: none;'><div class='sender'><span><a href=\"javascript:savefile('"+filename+"','"+fileurl+"','"+msgId+"','"+sender+"')\">"+filename+"->接收</a></span></div></em>"+
 							"<em>[附件]</em>"+
 							"</div>"+
 							"<i class='dotted'></i>"+
 							"</li>");
 							$(".tablist").find("i").attr("class","dotted");
 				}
 		} */
 		/* 播放语音 */
 		function palyVoice(filename){
 			var path=fileDownPath+"\\"+filename;
 			var v=CallCenter.CCPplayVoiceMsg(path,"");
 			if(v!='0'){
 				alert("播放失败!");
 				return;
 			}
 		}
 		//取消
 		function cancelVoice(){
 			sendflag=true;
 			CallCenter.CCPstopVoiceRecording();
 			deleteVoice();
 		}
 		function deleteVoice(){	
			var bar=$("#bar");
			bar.width(0); 
			timeOut = 1;
			time = 0;
 			$('#dlg').dialog('close');
 			$(".voice").attr("disabled",false);
 			$(".voice").css("background","url(<%=request.getContextPath()%>/include/images/yuyin.png) 0 3px no-repeat");
 		}
 	 	//保存聊天记录
 	   	function sendMsgSaveServer(msg,type,fromVoipId,toVoip,isFile,fileName,isHospital,isUser,hspName,userName,hspId,userId){
 	 	   		$.ajax( {
 	   			type : "post",
 	   			url : '${path}/msg/crmChatMessageRecord.do?verbId=saveMsgToServer',
 	   			data:{"fromVoip":fromVoipId,"toVoip":toVoip,"content":msg,
 	   				"isFile":isFile,"fileName":fileName,"type":type,
 	   				"isHospital":isHospital,"isUser":isUser,
 	   				"toUserBaseinfoName":hspName,"fromUserBaseinfoName":userName,
 	   				"toUserBaseinfoId":hspId,"fromUserBaseinfoId":userId
 	   				},
 	   			dataType : "json",
 	   			success : function(data) {
 	   				var pg = eval(data);
 	   				try {

 	   				} catch (e) {
 	   					alert(e);
 	   				}
 	   			}
 	   		});
 	   	}
 	 //获取聊天记录
 	   function getMsg(pageIndex,type){
 	   	$.ajax({
 	   		url : '${path}/msg/crmChatMessageRecord.do?verbId=getChatRecord',
 	   		type:"post",
 	   		data:{"fromVoip":$("#fromVoip").val(),"toVoip":$("#currentVoipIp").val(),"type":type,"pageIndex":pageIndex},
 	   		dataType:"json",
 	   		success:function(msg){
 	   			if(msg.count==undefined){
 	   				$("#countPage").text("/0");
 	   			}else{
 	   				$("#countPage").text("/"+msg.count);
 	   				$("#countPage1").val(msg.count);
 	   			}
 	   			var msgContent = $("#msgContent");
 	   			msgContent.empty();
 	   			for(var i=0;i<msg.list.length;i++){
 	   				var ss = msg.list[i].content;
 	   				var pos = ss.lastIndexOf(".");
 	   				var ty = ss.substring(pos+1,ss.length);
 	   				var color = "";
 	   				if(msg.list[i].fromVoip==$("#fromVoip").val()){
 	   					color = "green";
 	   				}else{
 	   					color = "blue";
 	   				}
 	   				if(msg.list[i].isFile!=""){
 	   					if(ty=="amr"){
 	   						var timeLoong = CallCenter.CCPgetVoiceDuration(ss);
 	   		 				var lastIndex = ss.lastIndexOf("\\");
 	   		 				var fileName = ss.substring(lastIndex+1, ss.length);
 	   						var m = "<font color=\""+color+"\" style='margin-left:10px;'>"+msg.list[i].fromUserBaseinfoName+"("+msg.list[i].createTime+")</font><br/>" +
 	   								"<div class='sender'><span><a href='javascript:void(0)' onclick='palyVoice(\""+fileName+"\")'>语音</a></span>"+(timeLoong/1000)+"秒</div>";
 	   						msgContent.append(m);
 	   					}else if(ty=="jpg" || ty == "bmp"||ty=="gif" || ty=="jpeg"){
 	   						var m = "<font color=\""+color+"\" style='margin-left:10px;'>"+msg.list[i].fromUserBaseinfoName+"("+msg.list[i].createTime+")</font><br/>" +
 	   						"<div>&nbsp;&nbsp;&nbsp;<img src='"+msg.list[i].content+"' onload=\"javascript:if(this.height>this.width){this.height=150}else{this.width=150}\"/></div>";
 	   						msgContent.append(m);
 	   					}else{
 	   						var lastIndex = ss.lastIndexOf("\\");
 	   		 				var fileName = ss.substring(lastIndex+1, ss.length);
 	   						var m = "<font color=\""+color+"\" style='margin-left:10px;'>"+msg.list[i].fromUserBaseinfoName+"("+msg.list[i].createTime+")</font><br/>" +
 	   						"<div class='sender'><span><a href=\"javascript:savefile('"+msg.list[i].content+"','"+fileName+"','"+""+"','"+""+"')\">附件</span>"+msg.list[i].fileName+"</div>";
 	   						msgContent.append(m);
 	   					}
 	   				}else{
 	   					var m = "<font color=\""+color+"\" style='margin-left:10px;'>"+msg.list[i].fromUserBaseinfoName+"("+msg.list[i].createTime+")</font><br/><div>&nbsp;&nbsp;&nbsp;"+msg.list[i].content+"</div>";
 	   					msgContent.append(m);
 	   				}
 	   			}
 	   		},
 	   		error:function(msg){
 	   			//alert(msg);
 	   		}
 	   		
 	   	});
 	   }
  </script>
<script type="text/javascript">
		var tb;
	 	var currentPublicClassName = "<%=currentPublicClassName%>";
		Ext.onReady(
			function(){
		   		 // 创建工具条
			    tb = new Ext.Toolbar();
			    tb.render('toolbar');
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
        				alert("获取失败!");
          			  	document.location = "<%=request.getContextPath()%>/home/nologin.jsp";
        			}
        			if(json){
	        			tb.removeAll();
	        			tb.add(json);
	        			tb.doLayout();
	        			$(".li_pc_1").removeClass("pc_1_selected");
	        			$(".li_pc_2").removeClass("pc_2_selected");
	        			var _pc_li = $(".pc_"+publicClassId);
	        			if(_pc_li.hasClass("li_pc_1")){
	        				_pc_li.addClass("pc_1_selected");
	        			}else{
	        				_pc_li.addClass("pc_2_selected");
	        				_pc_li.parents(".li_pc_1").addClass("pc_1_selected");
	        			}
        			}
        		}
        	},
        	error: function(a, b, c){
        		alert("获取失败!");
  			  	document.location = "<%=request.getContextPath()%>/home/nologin.jsp";
        	}
		});
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
			var height = pageHeight-300-60;
			$(iframe).height(800);
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
		jq_li.removeClass("pc1_active");
	}
	var resizeSlide = function() {
		
		if ($(".iframe_div:visible").length > 0) {
			var height = pageHeight-300-60;
			$(".iframe_div > iframe").css("height", height);
		}
		var div_height =pageHeight-300;
		$(".multi_pages").css("height", div_height);

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
		pageHeight=$(document).height()<window.screen.availHeight?window.screen.availHeight:$(document).height();
		resizeSlide();
		resizeContainer();
		/*头部导航栏*/
		$('#ca-container').contentcarousel();
		/*页面滚动时显示导航栏下级菜单*/
		var bg_wrapper=$('#ca-container .bg_wrapper');
		var ul_pc_2=$('#ca-container .ul_pc_2');
		$('body').scroll(function(){
			   var top=-$(this).scrollTop()+83;
			   bg_wrapper.css('top',top);
			   ul_pc_2.css('top',top);
               
			})
	});
	function toggle_footer(id) {

		$("#" + id).toggle('normal', function() {
			if ($("#" + id).is(":hidden")) {
				$("#f_button").attr('class', 'footer_hidden');
			} else
				$("#f_button").attr('class', 'footer_show');
		});
	}
	function resetIframeSize(e,w,h)
	{
		
	}

	
	
	
	$(function(){
		$.ajax({
	        type: "GET",
	        url: "iframe.do?verbId=getComplaintsTODo",
	        dataType: "text",
	        success: function(data){
	        	$('#complaintsValue').html(data);
	           }
	    });
		
	});
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
		var height = pageHeight-300-60;
		$(iframe).height(height);
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
			alert("请输入查询内容！");
		}
	}
	$(function(){
		hideHistoryData();
		$.ajax({
	        type: "post",
	        url: "iframe.do?verbId=getComplaintsTODo",
	        dataType: "text",
	        success: function(data){
	        	$('#complaintsValue').html(data);
	           }
	    });
		$.ajax({
	        type: "post",
	        url: "iframe.do?verbId=getConsultationTODo",
	        dataType: "text",
	        success: function(data){
	        	$('#consultationValue').html(data);
	           }
	    });
		
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/followUp/followUpPlan.do?verbId=personNum",
	        dataType: "text",
	        success: function(data){
	        	$('#followUpValue').html(data);
	           }
	    });
		$.ajax({
	        type: "post",
	        url: "<%=request.getContextPath()%>/satisfied/satisfiedPlan.do?verbId=personNum",
	        dataType: "text",
	        success: function(data){
	        	$('#satisfedValue').html(data);
	           }
	    });
		
		
	});
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
</script>
<style>
html{
    overflow:hidden;
    height:100%;
}
body{
    height:100%;
    background-color: rgb(239, 239, 239);
    overflow-y:scroll;
   
}
 #footer table{
 padding-top:5px;
 }
 #footer table td{
   color:black;
   padding:0px;
   height:20px;
   margin:0px;
}
#footer table td div{
   margin-left:10px;
   position:relative;
   background-color:#fafafa;
   border:1px solid #dedede;
   width:100%;
   padding-left:10px;
   margin-left:-10px;
   line-height:20px;
}
#footer #jbxx .tab_table {
	width:90%;
	border:none;
	margin-top:10px;
	margin-left:20px;
}
#footer #jbxx .tab_table td{
   text-align:right;
}
#footer .tab_table{
	border-collapse:collapse;
	margin-top:10px;
	margin-left:90px;
	float:left;
	margin-right:30px;
}
#footer .tab_table td{
   padding-right:10px;
   text-align:left;
}
.tab_gengduo{
	color: blue;
	float:left;
	border:none;
	margin-top:160px;
}
#footer #tj .tab_table td{
   width:auto;
}
 
</style>
</head>
<body>
<input id="zycPath" type="hidden" value="<%=request.getContextPath()%>"/>
	<form id="form" name="form" method="post"
		action="security/security_loginSecond.do" style='overflow:hidden;margin-bottom:25px'>
		<input type="hidden" name="verbId" value="" /> <input type="hidden"
			name="publicClassId" value="" />
		<div id="header">
			<img src="main/include/images/login_03.jpg" height="85"
				style="float: left" />
			<ul class="nav">
				<li class="user">欢迎您！<%=sessionForm.getStaffName()%></li>
				<li><a
					href="<%=request.getContextPath()%>/security/security_login.do?verbId=reLogin">返回首页</a></li>
				<li><a
					href="<%=request.getContextPath()%>/index.jsp?agree=true" onclick="zuoXiOffWork();">退出系统</a></li>
			</ul>
			<div id="topNav" style='margin-left:0px;margin-right:0px;float:right'>
				<div id="ca-container" class="ca-container">
					<div class="ca-wrapper" >
						<%
							if (pcList != null) {
								for (SecurityConfigPublicClass pc : pcList) {
									List<SecurityConfigPublicClass> childList = null;
									if (childMap != null) {
										childList = childMap.get(pc.getId());
									}
						%>
						<div class="ca-item">
							<div class="ca-item-main">
								<ul class="ul_pc_1" title="<%=pc.getClassName()%>">
									<%
										if (childList != null) {
									%>
									<li class="li_pc_1 pc_<%=pc.getId()%>"
										onmouseover="showPC2(this)" onmouseout="hidePC2(this)">
										<div style="cursor: pointer;width:70px;height:40px;position:relative;margin:0 auto;background-image: url(main/include/images/<%=pc.getPicPath() %>);"></div>
										<h3><%=pc.getClassName()%></h3>
										<div class='bg_wrapper'></div>
										<ul class="ul_pc_2">
											<%
												for (SecurityConfigPublicClass child : childList) {
											%>
											<li class="li_pc_2 pc_<%=child.getId()%>"
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
									<li class="li_pc_1 pc_<%=pc.getId()%>" onmouseover="addBg(this)" onmouseout="deleteBg(this)"
										onclick="currentPublicClassName='<%=pc.getClassName()%>';getPublicByClassId('<%=pc.getId()%>');"
										title="<%=pc.getClassName()%>">
										<div style="cursor: pointer;width:70px;height:40px;position:relative;margin:0 auto;background-image: url(main/include/images/<%=pc.getPicPath() %>);"></div>
										<h3><%=pc.getClassName()%></h3>
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
		<div id="toolbar"></div>
		

<div id="call_pan" style="width:350px;height:400px;z-index:1002;background-image:url('<%=request.getContextPath()%>/images/phone/call_background.png');display:none">
  <div style="height: 30px;text-align:right;padding-right: 12px;padding-top: 12px;">
  	<img src="<%=request.getContextPath()%>/images/phone/call_close.png" onclick="$('#call_pan').hide();">
  </div>
  <div style="height: 100px;margin-top: 10px;text-align:center;">
  	<img id="callingState1" src="<%=request.getContextPath()%>/images/phone/call_incoming.png">
  </div>
  <div id="calledno" style="text-align:center;font-size:40px;color:white;height:50px;line-height:50px;font-family:Arial;margin-top: 20px;">
  13368098310
  </div>
  <div id="timeCount" style="text-align:center;font-size:12px;;color:white;height:30px;line-height:30px;font-family:Arial;">
  <span id="hSpan"></span><span id="xsSpan"></span><span id="mSpan"></span><span id="fzSpan"></span><span id="sSpan"></span>
  </div>
  <div id="incomingCall" style="height: 45px;margin-top: 50px;text-align:center;">
  	<input type="button" onclick="acceptCall();" style="width:90px;height:45px;background-image:url('<%=request.getContextPath()%>/images/phone/call_call.png');border:0;border:none;"/>
  	<input type="button" onclick="rejectCall();" style="width:90px;height:45px;background-image:url('<%=request.getContextPath()%>/images/phone/call_hangup.png');border:0;border:none;margin-left:50px;"/>
  </div>
  <div id="callingState2" style="height: 45px;margin-top: 50px;text-align:center;display: none;">
  	<input type="button" onclick="zhuanyuyue();" style="width:90px;height:45px;background-image:url('<%=request.getContextPath()%>/images/phone/order.png');border:0;border:none;"/>
  	<input type="button" onclick="zhuanzixun();" style="width:90px;height:45px;background-image:url('<%=request.getContextPath()%>/images/phone/consult.png');border:0;border:none;margin-left:10px"/>
  	<input type="button" onclick="zhuantousu();" style="width:90px;height:45px;background-image:url('<%=request.getContextPath()%>/images/phone/complaint.png');border:0;border:none;margin-left:10px"/>
  </div>
</div>		<!--
			<div
				style="float: right; height: 27px; line-height: 27px; padding: 0px; margin-top: 5px; margin-right: 5px">
				<input type="text" id="mainSearchText"
					style="width:133px;height:27px;line-height:27px;border:none;+border:0;padding-left:30px;background-image:url('<%=request.getContextPath()%>/include/images/search_box.jpg')"><input
					type="button" value="搜索" onclick="mainSearch()"
					style="margin:0;margin-left:-3px;width:44px;text-align:center;height:27px;line-height:27px;border:none;background-color:rgb(131,204,86);color:white;background-image:url('<%=request.getContextPath()%>/include/images/search_box.jpg');background-position:center right">
			</div>
			</div>
		</div>
			  -->	
			
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
					<div class="line_15"></div>
					<div class="right_history_blank" style='border-top:1px solid #dddddd'>
						<div class="right_title">
							<span>工作日志</span>
						</div>
						<div class="line"></div>
						<div class="log_item odd">
							<a href="javascript:openOtherWindow('129128917','随访信息处理','followUp/followUpPlan.do?verbId=list');"><span>随访提醒（<label id="followUpValue"></label>）</span></a>
						</div>
						<div class="log_item even">
							<a href="javascript:openOtherWindow('129128918','投诉信息处理','complaints.do?verbId=list&type=2');"><span>投诉提醒（<label id="complaintsValue"></label>）</span></a>
						</div>
						<div class="log_item odd">
							<a href="javascript:openOtherWindow('129128919','咨询信息处理','crm/crmConsultation.do?verbId=queryConsultation&executedFlag=1');"><span>咨询提醒（<label id="consultationValue"></label>）</span></a>
						</div>
						<div class="log_item even">
							<a href="javascript:openOtherWindow('129128920','满意度信息处理','satisfied/satisfiedPlan.do?verbId=list');"><span>满意度提醒（<label id="satisfedValue"></label>）</span></a>
						</div>
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
	
<div id="win" class="easyui-window" title="聊天对话窗口" style="width:800px;height:500px;display:none;" data-options="iconCls:'icon-save',modal:false,onOpen:function(){openTalk();},onClose:function(){closeTalk();},closed:true">
  <input type="hidden" value="${RESTIP}" id="RESTIP">
  <input type="hidden" value="${RESTPOST}" id="RESTPOST">
  <input type="hidden" value="${accountSid}" id="accountSid">
  <input type="hidden" value="${authToken}" id="authToken">
  <input type="hidden" value="${subaccount}" id="subaccount">
  <input type="hidden" value="${subaccounttoken}" id="subaccounttoken">
  <input type="hidden" value="${voip}" id="voip">
  <input type="hidden" value="${voiptoken}" id="voiptoken">
  <input type="hidden" value="0" id="talk_status">


			<div
				style="width: 90%; height: 500px; margin: 0 auto; margin-top: 20px;">
				<div id="middleConversation"
					style="width: 68%; height: 500px; border: red 0px solid; float: left; padding: 0px; margin-right: 0px"
					class="personal_words">
					<div class="title" style='width: 100%'>
						<input type="hidden" id="currentVoipIp" value="87365300000080">
						<input type="hidden" id="hspName" value="${hspName }">
						<input type="hidden" id="userName" value="${userName}">
						<input type="hidden" id="fromVoip" >
						<span id="currentVoip">当前对话：87365300000080</span>
					</div>
					<div class="infobox" style="width: 100%; padding: 0px;">
						<div class="info_get" id="send_get" style="width: 100%">
							<!--  聊天信息  -->
						</div>
						<div style="display: none;">
							<div id="dlg" class="easyui-dialog" title="录音" closed="true"
								data-options="iconCls:'icon-save',modal:true,closable:false,buttons:'#yuyinButton'"
								style="width:266px;height:240px;padding:0px;overflow:hidden;background-color:RGB(50,192,202);background-image:url('<%=request.getContextPath()%>/include/images/huatong.png');background-repeat:no-repeat;background-position:50% 50%;">
								<div class='graph' id='graph' align='center'
									style='width: 100%; top: 140px; display: none;'>
									<div id='bar' style='width: 0px; text-align: left;'>
									</div>
								</div>
							</div>
							<div id="yuyinButton" style="text-align: center;">
								<a class="easyui-linkbutton" onclick="sendVoice1()"
									onmouseover="this.style.color='white'"
									onmouseout="this.style.color='black'"
									style="width: 80px; height: 25px; line-height: 36px; text-align: center; background: RGB(50, 192, 202); color: RGB(0, 0, 0); font-size: 16px; margin-top: 2px; text-decoration: none; cursor: pointer">发送</a>
								<a class="easyui-linkbutton" onclick="cancelVoice()"
									onmouseover="this.style.color='white'"
									onmouseout="this.style.color='black'"
									style="width: 80px; height: 25px; line-height: 36px; text-align: center; background: RGB(255, 0, 0); color: RGB(0, 0, 0); font-size: 16px; margin-top: 2px; text-decoration: none; cursor: pointer">取消</a>
							</div>
						</div>
						<div class="info_choose" style='width: 100%;'>
							<a style="cursor: pointer" onclick="loadBiaoQing();"
								class="biaoqing" title="表情"></a>
							<!-- <a href="javascript:void(0);"  class="screenshot" title="截图"></a> -->
							<a style="cursor: pointer" onclick="loadfujian();" class="fujian"
								title="附件"></a>
							<input class="file" type="file" style="display: none;" id="file1"
								name="file1" size=".01" onchange="uploadfile();" />
							<a style="cursor: pointer" onclick="dealVoice()" class="voice"
								title="语音"></a>
							<a style="cursor: pointer" onclick="chatMessage();"
								class="chatmessages" title="聊天记录"></a>
							<!-- 表情框 -->
							<div class="wrap_bq" style="display: none"></div>
						</div>
						<div class="info_send" style="margin: 0px">
							<div class="area" onclick="getPos();" onkeydown="getHuiche();"
								contenteditable="true" id="msg"
								style="width: auto; padding: 0px; margin: 0px; color: black; text-align: left; padding-left: 3px">
							</div>
							<div style="display: none" id="sendValue"></div>
							<div class="btnbox"
								style="padding: 0px; margin: 0px; width: 100%">
								<a id="send" class="send_btn" style="cursor: pointer;">发 送</a>
							</div>
						</div>
					</div>
				</div>
				<div class="commonright"
					style="margin-top: 0px; height: 500px; background-color: #f4f4f4; width: 30%; float: right; margin-left: 0px">
					<div id="chats"
						style="width: 100%; height: 500px; border: #999999 0px solid; float: left; overflow: auto; margin-left: 2px;"
						class="chats">
						<ul class="tablist" style="width: 100%; padding: 0px">
							<li class="li1 active">
								会话
								<i></i>
							</li>
						</ul>
						<div class="ulbox" style="display: block; width: 100%">
							<ul class="ul2 child" id="contact"
								style="display: block; width: 100%">
								<!-- 联系人 -->
							</ul>
						</div>
					</div>
					<div id="records"
						style="width: 100%; height: 500px; border: #999999 0px solid; float: left; display: none; overflow: auto; margin-left: 2px;"
						class="chats">
						<ul class="tablist" style="width: 100%; padding: 0px">
							<li class="li1 active">
								聊天记录
								<i></i>
							</li>
						</ul>
						<div class="message" id="msgContent" style="overflow: auto;">
							<!--  聊天记录  -->
						</div>
						<div class="bottom">
							<a href="javascript:void(0);" class="upOn" id="upOn">上一页</a>
							<input type="text" style="width: 50px" id="chatsNum" value="1" />
							<input type="hidden" id="countPage1" disabled="disabled">
							<span id="countPage">/0</span>
							<a href="javascript:void(0);" class="next" id="nextOn">下一页</a>
						</div>
					</div>
				</div>
			</div>



		</div>

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
</html>

