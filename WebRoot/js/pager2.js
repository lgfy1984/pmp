  if(typeof jQuery == 'undefined')
  {
  	//document.write("<script type='text/javascript' src='js/jquery-2.1.1.min.js'></s"+"cript>");
  }
  $(function(){
  	createPager2(parseInt($("#count2").val()),parseInt($("#page_index2").val()),parseInt($("#page_count2").val()),parseInt($("#page_size2").val()));
  });
  function updatePager2(){
	  createPager2(parseInt($("#count2").val()),parseInt($("#page_index2").val()),parseInt($("#page_count2").val()),parseInt($("#page_size2").val()));
  }
  function toPage2(){
	  var pageCount=$("#page_count2").val();
	  var inputPageIndex = $("#toPageIndex2").val();
	    if (!isMadeOf(inputPageIndex,'1234567890')) {
			alert('错误的整数!');
	      return;
	    }
	    if (inputPageIndex<=0){
			alert('页数必须大于0!');
			return;
	    }
	  if(parseInt(pageCount)<parseInt(inputPageIndex)){
		 
		  alert("跳转页不能大于总页数");
		  return;
	  }
	  paging2(inputPageIndex);
  }
  function isMadeOf(val,str)
  {
  	var jj;
  	var chr;
  	for (jj=0;jj<val.length;++jj){
  		chr=val.charAt(jj);
  		if (str.indexOf(chr,0)==-1)
  			return false;
  	}

  	return true;
  }
  function createPager2(count,pageindex,pagecount,pagesize)
  {
  	var page_str = "<div class='horizontal_line_10'></div><div class='pager_bar'>";
  	if(pagecount <= 9)
  	{
  		for(var i = 1;i < pagecount+1;i++)
  		{
  			if(i == pageindex)
  			{
  				page_str += "<input type='button' class='cur' value='"+i+"'>";
  			}
  			else
  			{
  				page_str += "<input type='button' onclick='paging2("+i+")' value='"+i+"'>";
  			}
  		}
  		}
  	else if(pagecount > 9)
  	{
  	if(pageindex <= 4)
  	{
  		for(var i = 1;i <= 4;i++)
  		{
  			if(i == pageindex)
  			{
  				page_str += "<input type='button' class='cur' value='"+i+"'>";
  			}
  			else
  			{
  				page_str += "<input type='button' onclick='paging2("+i+")' value='"+i+"'>";
  			}
  		}
   		var midd = parseInt(pagecount / 2);
 		page_str += "<input type='button' onclick='paging2("+parseInt((midd - 4) / 2+4)+")' value='...'>";
  		page_str += "<input type='button' onclick='paging2("+midd+")' value='"+midd+"'>";
  		page_str += "<input type='button' onclick='paging2("+parseInt((pagecount - midd) / 2+midd)+")' value='...'>";
  		page_str += "<input type='button' onclick='paging2("+(pagecount - 1)+")' value='"+(pagecount - 1)+"'>";
  		page_str += "<input type='button' onclick='paging2("+pagecount+")' value='"+pagecount+"'>";
  	}
  	else if(pageindex > pagecount - 4)
  	{
  		page_str += "<input type='button' onclick='paging2(1)' value='1'>";
  		page_str += "<input type='button' onclick='paging2(2)' value='2'>";
   		var midd = parseInt(pagecount / 2);
 		page_str += "<input type='button' onclick='paging2("+parseInt((midd - 4) / 2+4)+")' value='...'>";
  		page_str += "<input type='button' onclick='paging2("+midd+")' value='"+midd+"'>";
  		page_str += "<input type='button' onclick='paging2("+parseInt((pagecount - midd) / 2+midd)+")' value='...'>";
 		for(var i = pagecount - 3;i <= pagecount;i++)
  		{
  			if(i == pageindex)
  			{
  				page_str += "<input type='button' class='cur' value='"+i+"'>";
  			}
  			else
  			{
  				page_str += "<input type='button' onclick='paging2("+i+")' value='"+i+"'>";
  			}
  		}
  	}
  	else
  	{
  		page_str += "<input type='button' onclick='paging2(1)' value='1'>";
  		page_str += "<input type='button' onclick='paging2(2)' value='2'>";
  		page_str += "<input type='button' onclick='paging2("+ parseInt((pageindex - 2) / 2+2)+")' value='...'>";
  		page_str += "<input type='button' onclick='paging2("+(pageindex - 1)+")' value='"+(pageindex - 1)+"'>";
  		page_str += "<input type='button' class='cur' value='"+pageindex+"'>";
  		page_str += "<input type='button' onclick='paging2("+(pageindex + 1)+")' value='"+(pageindex + 1)+"'>";
   		page_str += "<input type='button' onclick='paging2("+parseInt(pageindex + (pagecount - pageindex) / 2)+")' value='...'>";
  		page_str += "<input type='button' onclick='paging2("+(pagecount - 1)+")' value='"+(pagecount - 1)+"'>";
  		page_str += "<input type='button' onclick='paging2("+pagecount+")' value='"+pagecount+"'>";
 	}
  	}
  	if(pageindex != 1)
  	{
  		page_str += "<span style='margin-left:10px'><a href='javascript:paging2("+(pageindex - 1)+")'>上一页</a></span>";
  	}
  	if(pageindex != pagecount&&pagecount!=0)
  	{
  		page_str += "<span style='margin-left:10px'><a href='javascript:paging2("+(pageindex + 1)+")'>下一页</a></span>";
  	}
  	else
  	{
  		page_str += "<span style='margin-left:10px'>下一页</span>";
  	}
  	page_str += "<span style='margin-left:10px'>共"+pagecount+"页,"+count+"条数据,到第</span>";
  	page_str +="<input type='text' id='toPageIndex2' name='toPageIndex2' value='' onblur='setpage2(this)' style='border:1px solid rgb(218,218,218);width:45px;height:20px;color:#666666;vertical-align:middle;' />页&nbsp;";
  	page_str +="<input type='button' class='button_grey2_s0' " +
  				"onmousedown=\"this.className='button_grey2_s1'\""+
  				"onmouseout=\"this.className='button_grey2_s0'\""+
  				"onclick='toPage2()'   style='vertical-align:middle;' value='跳转' />";

  	


  	page_str += "<div class='clear'></div>";
  	page_str += "</div>";
  	
  	$(".pager_num2").html(page_str);
  	 $("#toPageIndex2").val(pageindex);
  	 $("input[name='toPageIndex2']").each(function(){
  		 this.value = pageindex;
  	 });
  }
function setpage2(obj){
	 $("#toPageIndex").val(obj.value);
}