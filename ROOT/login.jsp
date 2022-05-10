<%@ page contentType="text/html;charset=UTF-8"%>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/login.css"/>
	<%
		String parameter=null;
		 parameter = request.getParameter("login");
	%>
	<script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			if (<%=parameter%>!=null){
				if (<%=parameter%>){
					alert("注册成功！");
				}else {
					alert("注册失败！");
				}
			}
			$(".deng").click(function(event){
				var username=$(".usename_logon").val();
				var password=$(".password_logon").val();
				if(password==""){
					event.preventDefault();
					alert("你的密码为空！");
				}else if(username==""){
					event.preventDefault();
					alert("你的密码为空！");
				}
			})
			$(".zhu").click(function(event){
				var username=$(".usename_login").val();
				var password=$(".password_login").val();
				var config_password=$(".config_password").val();
				if(password==""){
					event.preventDefault();
					alert("你的密码为空！");
				}else if(username==""){
					event.preventDefault();
					alert("你的密码为空！");
				}else if(password!=config_password){
					event.preventDefault();
					alert("你的密码不正确！");
				}
			})
		})
	</script>
	<style type="text/css">
		body {
			background-color: #000000;
			height: auto;
			background-image: url("image/dad20a51c0e671c0a2a2bf9abc14ac95.jpeg");
			background-repeat: no-repeat;
			background-size: cover;
		}
	</style>
</head>
<body>
<div class="log_text">
	L O G O
</div>
<div class="big_box">
	<div class="log_on">
		<div class="text2">登录</div>
		<form action="logon" method="post">
			<div class="usename">
				<input type="text" name="username" class="usename_logon" size="12"/>
				<span class="icon" >请输入用户名</span>
			</div>
			<div class="password">
				<input type="password" name="password" value="" class="password_logon" size="12"/>
				<span class="icon">请输入密码</span>
			</div>
			<input type="submit" class="deng" value="登录" />
		</form>
	</div>

	<div class="log_in">
		<div class="text2">注册</div>
		<form action="login" method="post" >
			<div class="usename">
				<input type="text" class="username_login" name="username" size="12"/>
				<span class="icon" >请确定用户名</span>
			</div>
			<div class="password">
				<input type="password" class="password_login" name="password" size="12"/>
				<span class="icon">请输入密码</span>
			</div>
			<div class="confire_password">
				<input type="password" name="config" class="config_password"  size="12"/>
				<span class="icon">请输入密码</span>
			</div>
			<input type="submit" value="注册"  class="zhu"/>
		</form>
	</div>
</div>
</body>
</html>