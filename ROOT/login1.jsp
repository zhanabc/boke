<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="database.*" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<style type="text/css">
			body {
				background: url("./image/5608f66df28089c441ed46e3d26b4241.gif") no-repeat;
				background-size: cover;
			}
			.log_text{
				width: 400px;
				height: 30px;
				text-align: center;
				line-height: 30px;
				margin: 30px auto;
				color:#fddb92;
				font-size: 50px;
				font-weight: 700;
			}
			.big_box {
				width: 500px;
				height: 500px;
				position: relative;
				margin: 100px auto;
				border-radius: 20px;
				overflow: hidden;
			}
			.log_in{
				position: absolute;
				width: 50%;
				height: 100%;
				float: left;
				transition: width 2s; 
				text-align: center;
				background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);
			}
			.log_on{
				position: absolute;
				width: 50%;
				height: 100%;
				margin-left: 250px;
				float: left;
				text-align: center;
				
				background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
			}
			.text1{
				width: 100%;
				height: 20%;
				text-align: center;
				line-height: 80px;
				font-size: large;
				font-weight: 700;
				color: darkgray;
				}
			.log_in:hover{
				width: 100%;
			}
			.text2{
				width: 100%;
				height: 20%;
				text-align: center;
				line-height: 80px;
				font-size: large;
				font-weight: 700;
				color: darkgray;
				}
			.log_on:hover{
				width: 100%;
				margin: 0 auto;
				z-index: 100;
			}
			.log_in form .usename {
				margin-top: 40px;
				margin-bottom: 20px;
			}
			.log_in form .usename input {
				width: 120px;
				height: 20px;
				border:0px solid;
				outline: none;			
				border-bottom: 1px solid black;
			}
			.log_on form .usename{
				margin-top: 40px;
				margin-bottom: 20px;
			}
			.log_on form .usename input{
				width: 120px;
				height: 20px;
				border: 0px solid;
				outline: none;			
				border-bottom: 1px solid black;
			}
			.big_box form .icon{
				font-size: 10px;
			}
			.big_box form .password {
				margin-bottom: 10px;
			}
			.big_box form .password input {
				width: 120px;
				height: 20px;
				border: 0px solid;
				outline: none;			
				border-bottom: 1px solid black;
			}
			.big_box .log_in form .confire_password input {
				width: 120px;
				height: 20px;
				border: 0px solid;
				outline: none;			
				border-bottom: 1px solid black;
			}
			.big_box .log_in form .confire_password {
				margin-bottom: 10px;
			}
			.big_box .log_on form .deng {
				width: 70px;
				height: 30px;
				background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);
			}
			.big_box .log_in form .zhu {
				width: 70px;
				height: 30px;
				background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);
			}
		</style>
	</head>
	<body>
		<audio src="f2b52b0085c11278b204579c66b2fc87%20(1).mp3" autoplay="autoplay" loop="loop" >
			当前浏览器不支持audio
		</audio>
		<div class="log_text">
			L O G O
		</div>
		<div class="big_box">
			<div class="log_on">
				<div class="text1">登录</div>
				<form action="logon" method="post">
					<div class="usename">
						<input type="text" name="use" id="usenam" size="12" style="border-bottom: 1px solid black"/>
						<span class="icon">请输入用户名</span>
					</div>
					<div class="password">
						<input type="password" name="pass" id="passwor" size="12"/>
					    <span class="icon">请输入密码</span>
					</div>
					<input class="deng" type="button"   value="登录" onclick="CheckPost()" />
					<input type="submit" style="display: none"  id="submit" />
				</form>
				<script type="text/javascript">
					function CheckPost() {
							var usename = document.getElementById("usenam").value;
							var password = document.getElementById("passwor").value;
					        var submit=document.getElementById("submit");
								if (usename == "" || password == "") {
									alert("你的用户名或密码为空");
									location="login.jsp";
								}else {
					                submit.click();
								}
					}
				/*var result="";
				if (result){
					alert("你的密码错误");
				}*/
				</script>
			</div>
			<div class="log_in">
				<div class="text2">注册</div> 
				<form action="login" method="post" >
					<div class="usename">
							<input type="text" name="username" id="use" size="12"/>
							<span class="icon">请确定用户名</span>
						</div>
							<div class="password">
								<input type="password" name="password" id="pas" size="12"/>
							    <span class="icon">请输入密码</span>
							</div>
							<div class="confire_password">
								<input type="password" name="config" id="config" size="12"/>
							    <span class="icon">请输入密码</span>
							</div>
					   <input type="submit" style="display: none"  id="submi" />
						<input type="button" id=" " name="" value="注册"  class="zhu" onclick="CheckPost1()"/>
				</form>
					<script type="text/javascript">
						function CheckPost1() {
							var usename = document.getElementById("use").value;
							var pass = document.getElementById("pas").value;
							var config_pass = document.getElementById("config").value;
							var submi=document.getElementById("submi");
							if (usename == "" || pass == "") {
								alert("你的用户名或密码为空");
								location="login.jsp";
							}else if(pass!=config_pass){
								alert("你的密码不正确！")
							}
							else {
								submi.click();
						}
				}
					</script>
			</div>
		</div>
	</body>
</html>
