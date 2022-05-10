<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/use_info.css"/>
		<%
			String address = (String) session.getAttribute("address");
			int age = (Integer)session.getAttribute("age");
			String username = (String)session.getAttribute("username");
			int id = (Integer)session.getAttribute("id");
			String company = (String) session.getAttribute("company");
			String education = (String)session.getAttribute("education");
			String position = (String)session.getAttribute("position");
			String school = (String)session.getAttribute("school");
			String address1 = (String)session.getAttribute("address");
			int sexs = (int) session.getAttribute("sex");
			Date time_enrollment = (Date) session.getAttribute("Time_enrollment");
			Date enterDate = (Date)session.getAttribute("enterDate");
			String sex;
			if (sexs==0){
				sex="女";
			}else {
				sex="男";
			}
		%>
		<script type="text/javascript">
			$(function(){
				var i;
				for(i=10;i<70;i++){
					if (i==<%=age%>){
						$(".age").append("<option selected='selected' value='"+i+"'>"+i+"</option>")
					}
					$(".age").append("<option value='"+i+"'>"+i+"</option>")
				}
				$(" input").focus(function(){
					$(this).addClass("current").siblings().removeClass("current");
				})
			})
		</script>
	</head>
	<body>
	<form action="changeinfo" method="post">
		<div class="box">
			<div class="first_box">
				<div class="usename">
					<%=username%>
				</div>
			</div>
			<div class="second_box">
				<div class="title1">
					基础信息：
				</div>
				<ul>
					<li>姓名：<input type="text" value="<%=username%>" name="name"/></li>
					<li>性别：
						<input class="sex" value="1"  name="sex" type="radio" checked> 男
						<input class="sex" value="0" name="sex" type="radio"/> 女
					</li>
					<li>年龄：<select class="age" name="age">

					</select></li>
					<li>所在地：<input type="text" value="<%=address%>" name="address"/></li>
				</ul>
			</div>
			<div class="third_box">
				<div class="title">
					教育信息：
				</div>
				<ul>
					<li>学历：<select class="education" name="education">
						<option value ="初中">初中</option>
						<option value ="高中">高中</option>
						<option value ="大专">大专</option>
						<option value ="本科">本科</option>
						<option value ="研究生">研究生</option>
					</select></li>
					<li>毕业学校：<input type="text"  value="<%=school%>" name="school" placeholder="未填写"/></li>
					<li>入学年份：<input type="date" name="time_enrollment" value="<%=time_enrollment%>" /></li>
				</ul>
			</div>
			<div class="four_box">
				<div class="title">
					工作信息：
				</div>
				<ul>
					<li>公司名称：<input type="text" value="<%=company%>" name="company" placeholder="未填写"/></li>
					<li>职位名称：<input type="text" value="<%=position%>" name="postion" placeholder="未填写"/></li>
					<li>入职年份：<input type="date" name="enterDate" value="<%=enterDate%>" /></li>
				</ul>
			</div>
		</div>
				<div class="sumbit">
					<input type="submit"  name="" value="提交修改" />
				</div>
			</form>
	</body>
</html>
