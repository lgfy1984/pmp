function showMore(){        //更多隐藏切换
		$('#crm_write_table_more').toggle();
			if($('#more').html()=="更多"){
				$('#more').html("隐藏");
			}else{
				$('#more').html("更多");
			}
}
/**项目窗口 */
function openWin(){
	var iWidth = window.screen.availWidth*0.8; //弹出窗口的宽度; 
	var iHeight = window.screen.availHeight*0.7; //弹出窗口的高度;
	var iTop = window.screen.availHeight/2-iHeight/2; //获得窗口的垂直位置;
	var iLeft = window.screen.availWidth/2-iWidth/2; //获得窗口的水平位置; 
	search=$("#searchContent").val();
	window.open("crmConsultation.do?verbId=queryKnowledge&search="+encodeURIComponent(search),"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft+", scrollbars=yes, resizable=yes, location=no"); 
}

/**添加保存 */
var saved = true;
function saveForm(path,flag,lockflag){
	if(!$("#form").form('validate')){
		return false;
	}
	if($("#projectBaseinfoId").val()==""){
		$.messager.alert('提示',"请选择项目","info");
		return false;
	}
	if($("#workDate").val()==""){
		$.messager.alert('提示',"必须填写工作时间","info");
		return false;
	}
	var projectBaseinfoId=$("#projectBaseinfoId").val()
	var workDate=$("#workDate").val();
	var mondaystr = window.util_date.getMonday().pattern("yyyy-MM-dd");
	var previousMonday = window.util_date.getPreviousMonday(window.util_date.getMonday()).pattern("yyyy-MM-dd");
	var idHidden=$("#idHidden").val();
	var nowdate = dateFtt("yyyy-MM-dd",new Date()) ;
	var start = $('#longTimeCode').combobox('getValue');
	$.ajax({
		type : "post",
		url : path+'/pm/projectwork.do?verbId=checkLock',
		data : {
			projectBaseinfoId:projectBaseinfoId
		},
		dataType : "json",
		success : function(data) {
			//alert(data.result);
			//alert(mondaystr);
			if(data.result==""){
				if(workDate<mondaystr || workDate>nowdate){
					$.messager.alert('提示',"不能录入超出周一至今天的时间","info"); 
					return false;
				}else{
					$.ajax({
						type : "post",
						url : path+'/pm/projectwork.do?verbId=checkTime',
						data : {
							idHidden:idHidden,
							longTimeCode:start,
							workDate:workDate
						},
						dataType : "json",
						success : function(data) {
							if(data.result!=""){
								$.messager.alert('提示',"当天填写工时超过24小时,请检查！","info"); 
								return false;
							}else{

								if(start>8){
									$.messager.defaults = { ok: "是", cancel: "否" };
									$.messager.confirm("操作提示", "工时超过8小时，确认保存记录内容吗？", function (data) {
								       if (data) {
										        	document.form.idHidden.value=idHidden;
									   			document.form.verbId.value = "add";  
									   		    document.form.submit(); 
								       }
								       else {
								           return;
								       }
								   });
								}else{
									$.messager.defaults = { ok: "是", cancel: "否" };
									$.messager.confirm("操作提示", "确认保存记录内容吗？", function (data) {
										
								       if (data) {
								        	    document.form.idHidden.value=idHidden;
									   			document.form.verbId.value = "add";  
									   		    document.form.submit(); 
								       }
								       else {
								           return;
								       }
								   });
								}
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
				             alert(XMLHttpRequest.status);
				             alert(XMLHttpRequest.readyState);
				             alert(textStatus);
				     }
					});
				}
			}else{
				if(workDate<previousMonday || workDate>nowdate){
					$.messager.alert('提示',"不能录入超出上周一至今天的时间","info"); 
					return false;
				}else{
					$.ajax({
						type : "post",
						url : path+'/pm/projectwork.do?verbId=checkTime',
						data : {
							idHidden:idHidden,
							longTimeCode:start,
							workDate:workDate
						},
						dataType : "json",
						success : function(data) {
							if(data.result!=""){
								$.messager.alert('提示',"当天填写工时超过24小时,请检查！","info"); 
								return false;
							}else{
	
								if(start>8){
									$.messager.defaults = { ok: "是", cancel: "否" };
									$.messager.confirm("操作提示", "工时超过8小时，确认保存记录内容吗？", function (data) {
								       if (data) {
										        	document.form.idHidden.value=idHidden;
									   			document.form.verbId.value = "add";  
									   		    document.form.submit(); 
								       }
								       else {
								           return;
								       }
								   });
								}else{
									$.messager.defaults = { ok: "是", cancel: "否" };
									$.messager.confirm("操作提示", "确认保存记录内容吗？", function (data) {
										
								       if (data) {
								        	    document.form.idHidden.value=idHidden;
									   			document.form.verbId.value = "add";  
									   		    document.form.submit(); 
								       }
								       else {
								           return;
								       }
								   });
								}
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
				             alert(XMLHttpRequest.status);
				             alert(XMLHttpRequest.readyState);
				             alert(textStatus);
				     }
					});
			  }
		   }
		},
		error: function (XMLHttpRequest, textStatus, errorThrown) {
             alert(XMLHttpRequest.status);
             alert(XMLHttpRequest.readyState);
             alert(textStatus);
     }
	});
	
//	var count= daysBetween($("#workDate").val(),datstr);
//	if(lockflag==""){
//		if(count>7){
//			$.messager.alert('提示',"不能录入超过7天时间的记录","info"); 
//			return false;
//		}
//	}
	//alert(start);
	
	
	
}
function saveFormNoCheck(path,flag,lockflag){
	if(!$("#form").form('validate')){
		return false;
	}
	if($("#projectBaseinfoId").val()==""){
		$.messager.alert('提示',"请选择项目","info");
		return false;
	}
	if($("#workDate").val()==""){
		$.messager.alert('提示',"必须填写工作时间","info");
		return false;
	}
	var projectBaseinfoId=$("#projectBaseinfoId").val()
	var workDate=$("#workDate").val();
	var mondaystr = window.util_date.getMonday().pattern("yyyy-MM-dd");
	var idHidden=$("#idHidden").val();
	var nowdate = dateFtt("yyyy-MM-dd",new Date()) ;
	var start = $('#longTimeCode').combobox('getValue');
	
				$.ajax({
					type : "post",
					url : path+'/pm/projectwork.do?verbId=checkTime',
					data : {
						idHidden:idHidden,
						longTimeCode:start,
						workDate:workDate
					},
					dataType : "json",
					success : function(data) {
						if(data.result!=""){
							$.messager.alert('提示',"当天填写工时超过24小时,请检查！","info"); 
							return false;
						}else{

							if(start>8){
								$.messager.defaults = { ok: "是", cancel: "否" };
								$.messager.confirm("操作提示", "工时超过8小时，确认保存记录内容吗？", function (data) {
							       if (data) {
									        	document.form.idHidden.value=idHidden;
								   			document.form.verbId.value = "addNoCheck";  
								   		    document.form.submit(); 
							       }
							       else {
							           return;
							       }
							   });
							}else{
								$.messager.defaults = { ok: "是", cancel: "否" };
								$.messager.confirm("操作提示", "确认保存记录内容吗？", function (data) {
									
							       if (data) {
							        	    document.form.idHidden.value=idHidden;
								   			document.form.verbId.value = "addNoCheck";  
								   		    document.form.submit(); 
							       }
							       else {
							           return;
							       }
							   });
							}
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
			             alert(XMLHttpRequest.status);
			             alert(XMLHttpRequest.readyState);
			             alert(textStatus);
			     }
				});
			
	
}
function compareDate(checkStartDate, checkEndDate) {      
    var arys1= new Array();      
    var arys2= new Array();      
	if(checkStartDate != null && checkEndDate != null) {      
	    arys1=checkStartDate.split('-');      
	      var sdate=new Date(arys1[0],parseInt(arys1[1]-1),arys1[2]);      
	    arys2=checkEndDate.split('-');      
	    var edate=new Date(arys2[0],parseInt(arys2[1]-1),arys2[2]);      
		if(sdate > edate) {      
		    //alert("日期开始时间大于结束时间");         
		    return false;         
		}  else {   
		    //alert("通过");   
		    return true;      
		    }   
	}      
}     
function daysBetween(DateOne,DateTwo)  
{   
	
    var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));  
    var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);  
    var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));  
    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000); 
    return Math.abs(cha);  
}  
function dateFtt(fmt,date)   
{ //author: meizz   
  var o = {   
    "M+" : date.getMonth()+1,                 //月份   
    "d+" : date.getDate(),                    //日   
    "h+" : date.getHours(),                   //小时   
    "m+" : date.getMinutes(),                 //分   
    "s+" : date.getSeconds(),                 //秒   
    "q+" : Math.floor((date.getMonth()+3)/3), //季度   
    "S"  : date.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 
/**修改 */
function update_Form(){
	
	if(!$("#form").form('validate')){
		return false;
	}
	var start = $('#longTime').val();
	if(start>8){
		$.messager.defaults = { ok: "是", cancel: "否" };
		$.messager.confirm("操作提示", "工时超过8小时，确认保存记录内容吗？", function (data) {
	       if (data) {
		   			document.form.verbId.value = "update";  
		   		    document.form.submit(); 
	       }
	       else {
	           return;
	       }
	   });
	}else{
		$.messager.defaults = { ok: "是", cancel: "否" };
		$.messager.confirm("操作提示", "确认保存记录内容吗？", function (data) {
			
	       if (data) {
		   			document.form.verbId.value = "update";  
		   		    document.form.submit(); 
	       }
	       else {
	           return;
	       }
	   });
	}

}

/**列表 */
function query_List(){
	var start = $('#f_date1').val();
	var end = $('#f_date2').val();
	if(start!=''&&end!=''&&end<=start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "queryProjectWorkTimeinfo"; 
	document.form.message.value = ""; 
	document.form.submit();
}
/**锁定解锁列表 */
function lock_button(){
	var start = $('#f_date1').val();
	var end = $('#f_date2').val();
	if(start!=''&&end!=''&&end<start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "queryLock"; 
	document.form.message.value = ""; 
	document.form.cur_page.value="1";
	document.form.submit();
}

/**删除*/
function deletepm(idHidden){
	$.messager.defaults = { ok: "是", cancel: "否" };
	$.messager.confirm("操作提示", "确认删除记录内容吗？", function (data) {
		
        if (data) {
        	document.form.verbId.value = "delete"; 
    		document.form.idHidden.value = idHidden; 
    		document.form.submit();
        }
        else {
            return;
        }
    });
	
}
/**显示提示信息 */
function showHspMessage(message){
	if(message != ''&& message != null){
		$.messager.alert('提示',message,'info');
		//alert(message);
		return;
	}
}
/**详细*/
function showDetail(idHidden){
	
	document.form.flag.value = "1"; 
	document.form.verbId.value = "queryProjectWorkTimeinfo"; 
	document.form.idHidden.value = idHidden; 
	document.form.submit();
}
/**详细*/
function showDetail2(idHidden){
	
	document.form.flag.value = "1"; 
	document.form.verbId.value = "queryLock"; 
	document.form.idHidden.value = idHidden; 
	document.form.submit();
}

function showDetail3(idHidden){
	
	document.form.flag.value = "1"; 
	document.form.verbId.value = "querynocheck"; 
	document.form.idHidden.value = idHidden; 
	document.form.submit();
}
/**审核*/
function checkcc(idHidden){

	$.messager.defaults = { ok: "通过", cancel: "不通过" };
	$.messager.confirm("操作提示", "审核选择", function (data) {
        if (data) {
        	document.form.status.value = "1"; 
        	document.form.verbId.value = "check"; 
        	document.form.idHidden.value = idHidden; 
        	document.form.submit();
        }
        else {
        	document.form.status.value = "0"; 
        	document.form.verbId.value = "check"; 
        	document.form.idHidden.value = idHidden; 
        	document.form.submit();
        }
    });

}
/**锁定解锁*/
function lock(idHidden,lockstatus){

	        document.form.lockStatus.value = lockstatus; 
        	document.form.idHidden.value = idHidden; 
        	document.form.verbId.value = "lock"; 
        	document.form.submit();
       
}
/**修改页面 */
function updatepm(idHidden){
	document.form.verbId.value = "updateInit"; 
	document.form.idHidden.value = idHidden; 
	document.form.submit();
}

/**打印页面 */
function printpreview(){
	   document.getElementById("crm_button_sub").style.display = "none";// 隐藏打印及其打印预览页面
	   wb.execwb(7,1);
	   document.getElementById("crm_button_sub").style.display = "block";
}

(function() {
  function util_date() {
    var _today=new Date();
    this.today=_today;
    this.year=_today.getYear();//当前年份
    this.Month_a=_today.getMonth();
    this.Month=this.Month_a+1;//当前月份
    this.day=_today.getDate();//当前日期
    this.date=_today.getDay()==0?7:_today.getDay();//本周第几天 因系统会把周日作为第0天
    this.Monday="";
    this.Sunday="";
    this.day_one="";
  }
  Date.prototype.pattern=function(fmt) {
    var o = {
    "M+" : this.getMonth()+1, //月份
    "d+" : this.getDate(), //日
    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
    "H+" : this.getHours(), //小时
    "m+" : this.getMinutes(), //分
    "s+" : this.getSeconds(), //秒
    "q+" : Math.floor((this.getMonth()+3)/3), //季度
    "S" : this.getMilliseconds() //毫秒
    };
    var week = {
    "0" : "/u65e5",
    "1" : "/u4e00",
    "2" : "/u4e8c",
    "3" : "/u4e09",
    "4" : "/u56db",
    "5" : "/u4e94",
    "6" : "/u516d"
    };
    if(/(y+)/.test(fmt)){
      fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    if(/(E+)/.test(fmt)){
      fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);
    }
    for(var k in o){
      if(new RegExp("("+ k +")").test(fmt)){
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
      }
    }
    return fmt;
  },
  util_date.prototype = {
      newToday : function(_today){
        this.today=_today;
        this.year=_today.getYear();//当前年份
        this.Month_a=_today.getMonth();
        this.Month=this.Month_a+1;//当前月份
        this.day=_today.getDate();//当前日期
        this.date=_today.getDay()==0?7:_today.getDay();//本周第几天 因系统会把周日作为第0天
        this.Monday="";
        this.Sunday="";
        this.day_one="";
      },
      getMonday:function(){
        if(this.Monday.length!=0){
          return this.Monday;
        }else{
          var _monday = new Date(this.year,this.Month_a,this.day-this.date+1);
          this.Monday = _monday;
          return _monday;
        }
      },
      getSunday:function(){
        if(this.Sunday.length!=0){
          return this.Sunday;
        }else{
          var _Sunday = new Date(this.year,this.Month_a,this.day-this.date+7);
          this.Sunday = _Sunday;
          return _Sunday;
        }
      },
      getPreviousMonday:function(Monday){
          var _monday = new Date(Monday.getYear(),Monday.getMonth(),Monday.getDate()-7);
          return _monday;
      },
      getPreviousSunday:function(Monday){
          var _Sunday = new Date(Monday.getYear(),Monday.getMonth(),Monday.getDate()-1);
          this.Sunday = _Sunday;
          return _Sunday;
      },
      getNextMonday:function(Monday){
        var _monday = new Date(Monday.getYear(),Monday.getMonth(),Monday.getDate()+7);
        return _monday;
      },
      getNextSunday:function(Monday){
        var _Sunday = new Date(Monday.getYear(),Monday.getMonth(),Monday.getDate()+13);
        this.Sunday = _Sunday;
        return _Sunday;
      }
  };
  window.util_date = new util_date();
})();