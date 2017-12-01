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
function saveForm(flog){
	if(!$("#form").form('validate')){
		return false;
	}
	$.messager.defaults = { ok: "是", cancel: "否" };
	$.messager.confirm("操作提示", "确认保存记录内容吗？", function (data) {
		
       if (data) {
	   			document.form.verbId.value = "add";  
	   		    document.form.submit(); 
       }
       else {
           return;
       }
   });
}

/**修改 */
function update_Form(){
	
	if(!$("#form").form('validate')){
		return false;
	}
	
	$.messager.defaults = { ok: "是", cancel: "否" };
	$.messager.confirm("操作提示", "确认修改记录内容吗？", function (data) {
		
        if (data) {
            document.form.verbId.value = "update"; 
    		document.form.submit();
        }
        else {
            return;
        }
    });

}

/**页面跳转*/
function paging(page){
	$("#cur_page").val(page);
	document.form.verbId.value = "queryProjectWorkTimeinfo"; 
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
	document.form.verbId.value = "queryProjectWorkTimeinfo"; 
	document.form.message.value = ""; 
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
	document.form.verbId.value = "queryProjectWorkTimeinfo"; 
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
	document.form.verbId.value = "detail"; 
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