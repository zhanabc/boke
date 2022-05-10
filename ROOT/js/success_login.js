$(function(){
	var username="nan";  //用户名
	var $a;
	var flag=true;  //判断用户登录后的显示用户消息
	var change="<span class='name'>"+username+"</span>";
	if(username!=""){
		$a=$(".log a");
		//将.log标签中的a标签删除
		$(".log").empty();
		//添加用户名
		$(".log").append(change);
		$(".userinfo").show();
	}else{  //用户退出登录
		$(".log").append($a);
		/* $(".log a").text("未登录"); */
	}
	$("body").on("click",".name",function(){  //实现登录后用户信息栏
		if(flag){
			$(".userinfo").show();
			flag=!flag;
		}else{
			$(".userinfo").hide();
			flag=!flag;
		}
	})
	//点击上导航栏
	$(".nave .before").children(":not(.seach)").click(function(){
		$(this).addClass("point").siblings().removeClass("point");
	})
})
