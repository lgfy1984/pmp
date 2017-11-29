
$(function(){
  		$(":text").bind('keypress',function(event){
             if(event.keyCode == "13")    
             {
                 var e = jQuery.Event("keydown");//模拟一个键盘事件 
                 e.keyCode = 9;
                 jQuery('input').trigger(e);
             }
         });
     });
