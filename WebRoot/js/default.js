/**
 * 返回按钮事件
 */
function returnBack(){
	window.history.back();
}
/**
 * 删除easyui下拉选择框的值
 */
function clearSelect(){
		var es = $(".easyui-combobox");
	  	es.each(function(){
	  	  var name=$(this).combobox('getText');
	  	if(name.length<=0){
			$(this).combobox('clear');
			$(this).combobox('setValue','');
		}
	  });
}
/**更多，按钮点击事件*/
function more_div(){
	$("#more_one").toggle();
	$("#more_two").toggle();
	
}

/**
 * 复选框样式修改
 */
$(function(){
	  var es = $(".checkbox_label_nocheck");
	  es.each(function(){
			$(this).bind("click",function(){
				$(this).children(":checkbox").each(function(){
				if(this.checked){
					$(this).parents("label").addClass("checkbox_label_checked");
					$(this).parents("label").removeClass("checkbox_label_nocheck");
				}else{
					$(this).parents("label").addClass("checkbox_label_nocheck");
					$(this).parents("label").removeClass("checkbox_label_checked");
				}
				});
			});
		 
	  });
	  input_select();
	//设置text需要验证
	    $('input[type=text]').validatebox();
	    $('textarea').validatebox();
	  });

function fEvent(sType,oInput){
			   switch (sType){
			    case "focus" :
			     oInput.isfocus = true;
			    case "mouseover" :
			     oInput.style.borderColor = '#8cd2f1';
			     break;
			    case "blur" :
			     oInput.isfocus = false;
			    case "mouseout" :
			     if(!oInput.isfocus){
			      oInput.style.borderColor='#dedede';
			     }
			     break;
			   }
}


function showHspMessage(message){
	if(message != ''&& message != null){
		$.messager.alert('提示',message,'info');
		return;
	}
}

$.extend($.fn.validatebox.defaults.rules, {
    //验证数字
    num: {
        validator: function (value) {
            return /^\d+$/.test(value);
        },
        message: '只能输入数字'
    },
    //验证汉字
    CHS: {
        validator: function (value) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: '只能输入汉字'
    },
    //电话号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|7|8|9]\d{9}$/;
            var reg2= /^((0\d{2,3}))?(\d{7,8})(-(\d{3,}))?$/; 
            return (reg.test(value)||reg2.test(value));
        },
        message: '输入电话号码或手机号码格式不准确.'
    },
    //手机号验证
    phone: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|7|8|9]\d{9}$/;
            return (reg.test(value));
        },
        message: '输入手机号码格式不准确.'
    },
    //国内邮编验证
    zipcode: {
        validator: function (value) {
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: '邮编必须是非0开始的6位数字.'
    },
  //身份证
    idno: {
        validator: function (value) {
        	/*var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;*/
        	//var reg=/^([1-9]\d{5}[1-9]\d{3}((0[1-9])|1[0-2])((0[1-9])|((1|2)\d)|(3[0-1]))((\d{4})|(\d{3}x)|(\d{3}X)))|([1-9]\d{14})$/;
            //return reg.test(value);
        	return isIDNum(value);
        },
        message: '身份证格式输入有误或该号码无效，请输入正确的身份证号码。'
    },
    age:{
    	 validator: function (value) {
    		 if(isNaN(value)){
    			 return false;
    		  }else{
    			  return true;
    		  }
         },
         message: '年龄请输入正确的数字.'
    },
    date: {// 验证姓名，可以是中文或英文
	                validator: function (value) {
	                    //格式yyyy-MM-dd或yyyy-M-d
	                    return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
	                },  
	    message: '请输入合适的日期格式'
    },
    integer: {// 验证整数 可正负数
    	                validator: function (value) {
    	                    //return /^[+]?[1-9]+\d*$/i.test(value);
    	                    return /^([+]?[0-9])|([-]?[0-9])+\d*$/i.test(value);
    	                },
    	                message: '请输入整数'
    },
    VerifyMoney: {
        validator: function (value, param) {
            var reg = /^(|[+-]?(0|([1-9]\d*)|((0|([1-9]\d*))?\.\d{1,2})){1,1})$/;
            value = $.trim(value);
            if (reg.test(value)) {
                var maxVal = param[0]['maxVal'];
                var minVal = param[0]['minVal'];
                if (maxVal != null) {
                    if (reg.test(maxVal)) {
                        if (value > maxVal) {
                            $.fn.validatebox.defaults.rules.VerifyMoney.message = "超出范围";
                            return false;
                        }
                    }
                }
                if (minVal != null) {
                    if (reg.test(minVal)) {
                        if (value < minVal) {
                            $.fn.validatebox.defaults.rules.VerifyMoney.message = "超出范围";
                            return false;
                        }
                    }
                }
                return true;
            } else {
                $.fn.validatebox.defaults.rules.VerifyMoney.message = param[1];
                return false;
            }
        },
        message: ''
    },
    eqPassword:{ 
    	 validator : function(value, param) { 
    		return value == $(param[0]).val(); 
    	 }, 
    	message : '两次输入的密码不一致！' }
});
/*验证textarea，超过长度不输入*/
function checkValid(id,leng){
	
	  if($("#"+id).text().length>leng)
		  {
		  $.messager.alert('提示',"输入长度不能超过"+leng+"个字符","info");
		  $("#"+id).text($("#"+id).text().substr(0,leng));
		   return false;
		  }
}

function isIDNum(strIDno)  
{   
    var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};  
   
    var iSum = 0;  
    var info = "";  
    var idCardLength = strIDno.length;    
    if(!/^\d{17}(\d|x)$/i.test(strIDno)&&!/^\d{15}$/i.test(strIDno))   
    {
        return false;  
    }  
    //在后面的运算中x相当于数字10,所以转换成a  
    strIDno = strIDno.replace(/x$/i,"a");  
    if(aCity[parseInt(strIDno.substr(0,2))]==null)  
    {  
        return false;  
    }  
      
    if (idCardLength==18)  
    {  
        sBirthday=strIDno.substr(6,4)+"-"+Number(strIDno.substr(10,2))+"-"+Number(strIDno.substr(12,2));  
        var d = new Date(sBirthday.replace(/-/g,"/"))  
        if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))  
        {         
            return false;  
        }  
  
        for(var i = 17;i>=0;i --)  
            iSum += (Math.pow(2,i) % 11) * parseInt(strIDno.charAt(17 - i),11);  
        if(iSum%11!=1)  
        {  
            return false;  
        }  
    }  
    else if (idCardLength==15)  
    {  
        sBirthday = "19" + strIDno.substr(6,2) + "-" + Number(strIDno.substr(8,2)) + "-" + Number(strIDno.substr(10,2));  
        var d = new Date(sBirthday.replace(/-/g,"/"))  
        var dd = d.getFullYear().toString() + "-" + (d.getMonth()+1) + "-" + d.getDate();     
        if(sBirthday != dd)  
        {  
            return false;  
        }  
    }  
    return true;
}
/*文本框、下拉框选中事件样式修改*/
function input_select(){
	var lujing=$('#serverPath', parent.document).val() ;
	 $("input[type=text]").blur(function(){
		  $(this)[0].style.border="1px solid #dedede";
	  });
	  $("input[type=text]").focus(function(){
		$(this)[0].style.border="1px solid #8cd2f1";
	  });
	 /* $(".calendarspan input[type=text]").blur(function(){
		  $(this)[0].style.border="none";
	  });
	  $(".calendarspan input[type=text]").focus(function(){
		  $(this)[0].style.border="none";
	  });*/
	  $("textarea").blur(function(){
		  $(this)[0].style.border="1px solid #dedede";
	  });
	  $("textarea").focus(function(){
		  $(this)[0].style.border="1px solid #8cd2f1";
	  });
	  $("._textarea").blur(function(){
		  $(this)[0].style.border="1px solid #dedede";
	  });
	  $("._textarea").focus(function(){
		  $(this)[0].style.border="1px solid #8cd2f1";
	  });
	  $(".combo input").focus(function(){
		  $(this)[0].style.borderLeft="0px";
		  $(this)[0].style.borderRight="0px";
		  $(this)[0].style.borderTop="0px";
		  $(this).parent()[0].style.border="1px solid #8cd2f1";
		  var parent=$(this).parent(".combo");
		  $(parent)[0].style.border="1px solid #8cd2f1"; 
		  lujing=lujing+"/style/img/button_down.png"
		  $(this).parent().find("span .combo-arrow").css("background-image","url(../style/img/button_down.png)");
	  });
	  $(".combo input").blur(function(){
		  $(this)[0].style.borderLeft="0px";
		  $(this)[0].style.borderRight="0px";
		  $(this)[0].style.borderTop="0px";
		  $(this).parent()[0].style.border="1px solid #dedede";
//		  $(this).parent().find("span .combo-arrow")[0].style.backgroundImage="";
		  $(this).parent().find("span .combo-arrow").css("background-image","");
	  });
}
//比较日前大小  
function compareDate(checkStartDate, checkEndDate) {      
    var arys1= new Array();      
    var arys2= new Array();      
    arys1=checkStartDate.split('-');      
      var sdate=new Date(arys1[0],parseInt(arys1[1]-1),arys1[2]);      
    arys2=checkEndDate.split('-');      
    var edate=new Date(arys2[0],parseInt(arys2[1]-1),arys2[2]);      
	if(sdate > edate) {      
	    return false;         
	}  else {   
	    return true;      
    }      
}     

//判断日期，时间大小  
function compareTime(startDate, endDate) {   
    var endDateTemp = endDate.split(" ");   

    var arrStartDate = startDateTemp[0].split("-");   
    var arrEndDate = endDateTemp[0].split("-");   

    var arrStartTime = startDateTemp[1].split(":");   
    var arrEndTime = endDateTemp[1].split(":");   

	var allStartDate = new Date(arrStartDate[0], arrStartDate[1], arrStartDate[2], arrStartTime[0], arrStartTime[1], arrStartTime[2]);   
	var allEndDate = new Date(arrEndDate[0], arrEndDate[1], arrEndDate[2], arrEndTime[0], arrEndTime[1], arrEndTime[2]);   
	
	if (allStartDate.getTime() >= allEndDate.getTime()) {   
	      return false;   
	} else {   
	    return true;   
	}   
}
//比较日期，时间大小  
function compareCalendar(startDate, endDate) {   
	if (startDate.indexOf(" ") != -1 && endDate.indexOf(" ") != -1 ) {   
	    //包含时间，日期  
	    compareTime(startDate, endDate);               
	} else {   
	    //不包含时间，只包含日期  
	    compareDate(startDate, endDate);   
	}   
} 
//判断附件类型
function attachmentType(fileUrl){
	var index = fileUrl.lastIndexOf('.');
	var suffix = fileUrl.substr(index,fileUrl.length);//后缀
	var type="5";
	if(suffix==".bmp"||suffix==".jpg"||suffix==".png"||suffix==".tiff"||
		suffix==".gif"||suffix==".pcx"||suffix==".tga"||suffix==".exif"||
		suffix==".fpx"||suffix==".svg"||suffix==".psd"||suffix==".cdr"||
		suffix==".pcd"||suffix==".dxf"||suffix==".ufo"||suffix==".eps"||
		suffix==".ai"||suffix==".raw"||suffix==".WMF"||suffix==".jpeg"||
		suffix==".hdri"||suffix==".lic"||suffix==".emf"){
		type="1"; 
	}else if(suffix==".cda"||suffix==".wav"||suffix==".mp3"||suffix==".wma"||
		suffix==".ra"||suffix==".mid"||suffix==".ogg"||suffix==".ape"||
		suffix==".flac"||suffix==".aac"){
		type="2"; 
	}else if(suffix==".mpg"||suffix==".mpeg"||suffix==".avi"||suffix==".rm"||
		suffix==".rmvb"||suffix==".mov"||suffix==".wmv"||suffix==".asf"||
		suffix==".dat"||suffix==".asx"||suffix==".wvx"||suffix==".mpe"||
		suffix==".mpa"||suffix==".divx"||suffix==".mp4"||suffix==".mkv"||
		suffix==".vob"){
		type="3"; 
	}else if(suffix==".txt"||suffix==".rtf"||suffix==".doc"||suffix==".xls"||
		suffix==".ppt"||suffix==".htm"||suffix==".html"||suffix==".wpd"||
		suffix==".pdf"||suffix==".xlsx"){
		type="4"; 
	}
	return type;
}

//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外   
function banBackSpace(e){   
	var ev = e || window.event;//获取event对象   
	var obj = ev.target || ev.srcElement;//获取事件源   
	var t = obj.type || obj.getAttribute('type');//获取事件源类型   
	//获取作为判断条件的事件类型   
	var vReadOnly = obj.getAttribute('readonly');   
	var vEnabled = obj.getAttribute('enabled');   
	//处理null值情况   
	vReadOnly = (vReadOnly == null) ? false : vReadOnly;   
	vEnabled = (vEnabled == null) ? true : vEnabled;   
	
	//当敲Backspace键时，事件源类型为密码或单行、多行文本的，   
	//并且readonly属性为true或enabled属性为false的，则退格键失效   
	var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")   
	&& (vReadOnly==true || vEnabled!=true))?true:false;   
	
	//当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效   
	var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")   
	?true:false;   
	//判断   
	if(flag2){   
	return false;   
	}   
	if(flag1){   
	return false;   
	}   
}   
