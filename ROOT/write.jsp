<%@ page contentType="text/html;charset=UTF-8"%>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/write.css"/>
		<script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$(".sub-title .submit").click(function(){
						do_fun();
				})
			})
			/*function subTest(){
				var $title=$(".write-title textarea").val();
				var $context=$(".text").text();
				$.post($("form").action, { title:$title,context:$context},
						function(data){
							$("#test").html(data);
						});
			}*/
			function do_fun() {
				var $title=$(".write-title textarea").val();
				var $context=$(".text").text();
				//序列化表单参数
				var params=$('#edit_form').serialize();
				//ajax请求
				$.ajax({
					type:'POST',//post提交
					url:"Write",   //提交的地址，直接调用你得servlet
					data:{"title":$title,"context":$context},//传递到servlet的参
					dataType:'json',  //返回值是一个对象
					error:function(XMLHttpRequest, textStatus, errorThrown){
						alert("发表成功！");
						$(".write-title textarea").val("");
						$(".text").text("");
					},
					success:function(data){
						//data是后台返回的数据，根据自己的需求处

					}
				});
			}
		</script>
	</head>
	<body>
		<div class="CREATE">
			<ul>
				<li onclick="Inset()">插入图片</li>
				<li onclick="change()">字体颜色</li>
				<li>字体加粗</li>
				<li onclick="change_back()">更换背景</li>
			</ul>
		</div>
		<div class="image3" id="iamge3">
			<input type="file" name=""  class="add" onchange="Onloadbac(this)"/>
		</div>
		<script src="./js/write.js" type="text/javascript" charset="utf-8"></script>
		<script src="./js/write2.js" type="text/javascript" charset="utf-8"></script>
		<div class="image" id="iamge1">
			<input type="file" name=""  class="add" onchange="OnloadImage(this)"/>
		</div>
		<script src="./js/write3.js" type="text/javascript" charset="utf-8"></script>
		<form action="Write">
			<div class="write-blank">
				<div class="write-title">
					<textarea rows=""  cols="" value="title"  placeholder="无内容">
					</textarea>
				</div>
				<div class="title">
					<div class="text"  contenteditable="true" id="text">
					</div>
				</div>
			</div>
			<div class="sub-title" id="sub">
				<div class="save">
					<a href="">保存草稿</a>
				</div>
				<div class="submit">
					发布博客
				</div>
			</div>
		</form>
	</body>
</html>
