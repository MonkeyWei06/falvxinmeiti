 

   $(function(){

	    $(".nav_menu").click(function(){

			   $(".nav").animate({right:'0px'});

          })

	    $(".close").click(function(e) {

		   $('.nav').animate({right:'-100%'});

	   });

  })





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

	



//微信弹窗



$(function(){



   $('#wechat').on('click', function(){

   var imgUrl = $(this).attr('data-src');

   var html = "<img class='jiuye-tu-img' src='"+imgUrl+"' />"

   $str=$(this).attr('alt');

   layer.open({

    type: 1,    

    title: "微信二维码", 

    closeBtn: 1,    

    shadeClose: true, 

    area: ['300px', '330px'],

    content: html

   });

  });



})



//首页banner 

/*

 var swiper = new Swiper('.banner-list',{

   navigation: {

	       nextEl: '.swiper-button-next',

	        prevEl: '.swiper-button-prev',

	      },

		  pagination: {

	        el: '.swiper-pagination',

	        clickable :true,

	      },

		   autoplay:true,

	      loop : true,

	      effect : 'left', 

          });







 var swiper = new Swiper('.case-list', {

		slidesPerView: 1,

		  spaceBetween: 40,

      navigation: {

        nextEl: '.swiper-button-next',

        prevEl: '.swiper-button-prev',

      },

    });

	*/

  

 //导航



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