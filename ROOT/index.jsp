<%@ page contentType="text/html;charset=UTF-8"%>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="font_ruzcjjcsidp/iconfont.css" type="text/css">
	<link rel="stylesheet" href="font_ruzcjjcsidp/demo.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
	<link rel="stylesheet" type="text/css" href="css/font.css"/>
	<%
		String username=null;
		username=(String) session.getAttribute("username");
	%>
	<script>
		$(function(){
			var username=null;
			username="<%=username%>";  //用户名
			var $a;
			var flag=true;  //判断用户登录后的显示用户消息
			var change="<div class='hear'></div>";
			if(username!="null"){
				$a=$(".log a");
				//将.log标签中的a标签删除
				$(".log").empty();
				//添加用户名
				$(".log").append(change);
			}else{  //用户退出登录
				$(".log").append($a);
				/* $(".log a").text("未登录"); */
			}
			$(".after .writer a").click(function(event){
				if(username=="null"){
					event.preventDefault();
					alert("你没有登录！请登录后查看!");
				}
			})
			$("body").on("mouseover",".hear",function(){  //实现登录后用户信息栏
				$(".userinfo").show();
				$(".hear").css({"top":"10px","width":"50px","height":"50px" });
			})
			$("body").on("mouseleave",".gg",function(){  //实现登录后用户信息栏
				$(".userinfo").hide();
				$(".hear").css({"top":"0px","width":"40px","height":"40px" });
			})
			//点击上导航栏
			$(".nave .before").children(":not(.seach)").click(function(){
				$(this).addClass("point").siblings().removeClass("point");
			})
		})

	</script>
	<style type="text/css">
		@font-face {
			font-family: "iconfont"; /* Project id  */
		//src: url('iconfont.ttf?t=1646474371866') format('truetype');
		}
		.iconfont {
			font-family: "iconfont" !important;
			font-size: 16px;
			font-style: normal;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}
		.nave .seach::before{
			position: absolute;
			content: '';
			display: block;
			width: 40px;
			height: 30px;
			left: 100%;
			border-top-right-radius: 15px;
			border-bottom-right-radius: 15px;
			background: url("./image/搜索.png") no-repeat;
			background-position: center;
			background-color:red;
			background-size: contain;
			cursor: pointer;
		}
		.hear {
			position: absolute;
			width: 40px;
			height: 40px;
			border-radius: 50%;
			border: 1px solid #000000;
			background: url("image/dad20a51c0e671c0a2a2bf9abc14ac95.jpeg") no-repeat;
			background-size: cover;
			cursor: pointer;
			z-index: 101;
		}
	</style>
	<!-- L2Dwidget.js L2D网页动画人物 -->
	<script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
	<script>
		var a=[
				" https://unpkg.com/live2d-widget-model-chitose@1.0.5/assets/chitose.model.json",
				"https://unpkg.com/live2d-widget-model-shizuku@1.0.5/assets/shizuku.model.json",
				"https://unpkg.com/live2d-widget-model-tororo@1.0.5/assets/tororo.model.json",
				"https://unpkg.com/live2d-widget-model-hijiki@1.0.5/assets/hijiki.model.json",
				"https://unpkg.com/live2d-widget-model-koharu@1.0.5/assets/koharu.model.json",
				"https://unpkg.com/live2d-widget-model-haruto@1.0.5/assets/haruto.model.json",
				"https://unpkg.com/live2d-widget-model-miku@1.0.5/assets/miku.model.json",
				"https://unpkg.com/live2d-widget-model-z16@1.0.5/assets/z16.model.json",
				"https://cdn.jsdelivr.net/npm/live2d-widget-model-wanko@1.0.5/assets/wanko.model.json",
				"https://unpkg.com/live2d-widget-model-nico@1.0.5/assets/nico.model.json"

		];
		var i=Math.floor(Math.random()*10);

		L2Dwidget.init({
			"model": { "jsonPath": a[i],"scale": 1, "hHeadPos":0.5, "vHeadPos":0.618 },
			"display": { "position": "absolute", "width": 200, "height": 300, "hOffset": -10, "vOffset": 3},
			"mobile": { "show": true, "scale": 0.1 },
			"react": { "opacityDefault": 0.7, "opacityOnHover": 0.2 }
		});
	</script>
	<!--
      其他可选的模型：
        小帅哥： https://unpkg.com/live2d-widget-model-chitose@1.0.5/assets/chitose.model.json
        萌娘：https://unpkg.com/live2d-widget-model-shizuku@1.0.5/assets/shizuku.model.json
        白猫：https://unpkg.com/live2d-widget-model-tororo@1.0.5/assets/tororo.model.json
        黑猫： https://unpkg.com/live2d-widget-model-hijiki@1.0.5/assets/hijiki.model.json
        小可爱（女）：https://unpkg.com/live2d-widget-model-koharu@1.0.5/assets/koharu.model.json
        小可爱（男）：https://unpkg.com/live2d-widget-model-haruto@1.0.5/assets/haruto.model.json
        初音：https://unpkg.com/live2d-widget-model-miku@1.0.5/assets/miku.model.json
        圣职者妹妹：https://unpkg.com/live2d-widget-model-z16@1.0.5/assets/z16.model.json
        茶杯犬：https://cdn.jsdelivr.net/npm/live2d-widget-model-wanko@1.0.5/assets/wanko.model.json
        绿毛妹妹：https://unpkg.com/live2d-widget-model-tsumiki@1.0.5/assets/tsumiki.model.json
        金龟子妹妹：https://unpkg.com/live2d-widget-model-unitychan@1.0.5/assets/unitychan.model.json
        https://unpkg.com/live2d-widget-model-nito@1.0.5/assets/nito.model.json
        https://unpkg.com/live2d-widget-model-ni-j@1.0.5/assets/ni-j.model.json
        小阿狸： https://unpkg.com/live2d-widget-model-nico@1.0.5/assets/nico.model.json
        https://unpkg.com/live2d-widget-model-nietzche@1.0.5/assets/nietzche.model.json
        https://unpkg.com/live2d-widget-model-nipsilon@1.0.5/assets/nipsilon.model.json
        女学生： https://unpkg.com/live2d-widget-model-hibiki@1.0.5/assets/hibiki.model.json
    -->
</head>
<body>
<div class="nave">
	<ul class="before">
		<li class="point">博客</li>
		<li>课程</li>
		<li>文库</li>
		<li>问答</li>
		<li class="seach"><input type="search" class="mui-input-clear" placeholder="">
		</li>
	</ul>
	<ul class="after">
		<div class="gg">
			<li class="log"><a href="login.jsp">未登录</a></li>
			<div class="userinfo">
				<div class="name">
					<%=username%>
				</div>
				<ul>
					<li><i class="iconfont">&#xe612;</i><a href="info.jsp">个人信息</a></li>
					<li><i class="iconfont">&#xe636;</i><a href="">加入会员</a></li>
					<li><i class="iconfont">&#xe86d;</i><a href="">我的收藏</a></li>
					<li class="exit"><i class="iconfont">&#xe616;</i><a href="exit">退出</a></li>
				</ul>
			</div>
		</div>
		<li class="writer"><a href="getCreator">创作</a></li>
	</ul>
</div>
<jsp:include page="page1.jsp" flush="false"></jsp:include>
</body>
</html>



