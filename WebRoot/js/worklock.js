
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

/**页面跳转*/
function paging(page){
	$("#cur_page").val(page);
	document.form.verbId.value = "queryLock"; 
	document.form.submit();
}
/**列表 */
function query_List(){
	var start = $('#f_date1').val();
	var end = $('#f_date2').val();
	if(start!=''&&end!=''&&end<=start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "queryLock"; 
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
/**列表 */
function query_button(){
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
}/**列表 */
function check_button(){
	var start = $('#f_date1').val();
	var end = $('#f_date2').val();
	if(start!=''&&end!=''&&end<start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "checkList"; 
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
function lock(projectBaseinfoId,createUserId,lockstatus){
            //alert(lockstatus);
            document.form.lockStatus.value = lockstatus; 
	        document.form.createUserIdHidden.value = createUserId; 
        	document.form.projectBaseinfoIdHidden.value = projectBaseinfoId; 
        	//alert(2);
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