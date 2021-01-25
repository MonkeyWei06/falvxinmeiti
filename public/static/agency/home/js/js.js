//tips
 $(function(){
 var tipsi;
 $(".tips").hover(function(){
	  var msg = $(this).attr("data-tips");
    tipsi = layer.tips(msg,this,{time:0,
 area: ['auto', '40px'],
  tips: [2, '#017cf9']
 }
 );
  },function(){
	layer.close(tipsi);
});
    })
 //导航
   $(function(){
	    $(".nav_menu").click(function(){
			   $(".nav").animate({right:'0px'});
          })
	    $(".close").click(function(e) {
		   $('.nav').animate({right:'-100%'});
	   });
  })
function collectFun(Url,ID,Obj)
{
    var JQObj=$(Obj);
    $.ajax({
        type: 'post',
        url: Url,
        data: {"id":ID},
        dataType: 'json',
        cache: false,
        success: function (Result) {
            if(Result.code=='0'){
                layer.msg(Result.msg);
                return false;
            }else if(Result.code==1){
                JQObj.addClass('layui-icon-rate');
                JQObj.removeClass('layui-icon-rate-solid');
                layer.msg(Result.msg);
            }else{
                JQObj.removeClass('layui-icon-rate');
                JQObj.addClass('layui-icon-rate-solid');
                layer.msg(Result.msg);
            }
        }
    });
}