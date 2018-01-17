function showMore(){        //更多隐藏切换
		$('#crm_write_table_more').toggle();
			if($('#more').html()=="更多"){
				$('#more').html("隐藏");
			}else{
				$('#more').html("更多");
			}
}


/**执行状态 完成 */
function changeRadio1(){
	 $("#pick_true").attr("checked","checked");
	 $("#label1").addClass("label_checked");
	 $("#label1").removeClass("label_nocheck");
	 $("#label2").addClass("label_nocheck");
	 $("#label2").removeClass("label_checked");
 }
/**执行状态 待回复 */
function changeRadio2(){
	 $("#pick_false").attr("checked","checked");
	 $("#label2").addClass("label_checked");
	 $("#label2").removeClass("label_nocheck");
	 $("#label1").addClass("label_nocheck");
	 $("#label1").removeClass("label_checked");
 }

/**添加保存 */
var saved = true;
function saveForm(flag){
	if(!$("#form").form('validate')){
		return false;
	}
	if($('#projectName').val()==""){
		$.messager.alert('提示',"必须选择项目","info"); 
		return;
	}
	if($('#workStaffName').val()==""){
		$.messager.alert('提示',"必须选择员工","info"); 
		return;
	}
	if($('#costs').val()==""){
		$.messager.alert('提示',"必须录入费用","info"); 
		return;
	}
	var idHidden = $('#idHidden').val();
	//alert(idHidden);
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
	document.form.verbId.value = "queryFinanceRecordinfo"; 
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
	document.form.verbId.value = "queryFinanceRecordinfo"; 
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
	var timeSelect = $('#timeSelect').combobox('getValue');
	if(timeSelect=='1'){
		if($('#timeCase').val()==""){
			$.messager.alert('提示',"选择周必须选择当周任意时间","info"); 
			return;
		}
	}else{
		if($('#timeCase').val()==""){
			$.messager.alert('提示',"必须选择时间","info"); 
			return;
		}
	}
	document.form.verbId.value = "queryFinanceRecordinfo"; 
	document.form.message.value = ""; 
	document.form.cur_page.value="1";
	document.form.submit();
}
function queryqs_button(){
	var start = $('#startTimeHidden').val();
	var end = $('#endTimeHidden').val();
	if(start!=''&&end!=''&&end<start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	
	document.form.verbId.value = "queryqs"; 
	document.form.message.value = ""; 
	document.form.cur_page.value="1";
	document.form.submit();
}
/**列表 */
function queryf_button(){
	var start = $('#f_date1').val();
	var end = $('#f_date2').val();
	if(start!=''&&end!=''&&end<start){
		$.messager.alert('提示',"结束时间必须晚于开始时间。","info"); 
		return;
	}
	document.form.verbId.value = "queryFinanceRecordinfo"; 
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
	document.form.verbId.value = "queryFinanceRecordinfo"; 
	document.form.idHidden.value = idHidden; 
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