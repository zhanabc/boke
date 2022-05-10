<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.zip.DataFormatException" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.PrintStream" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script>
			$(function (){
				setInterval(function () {
					$.ajax({
								type: 'get',
								url: 'getCreator',
								success: function (res) {
									console.log(res);
								}
							})
					}, 1000);
				});
				if ($(".article .special_column ul").children().length == 0) {
					$(".article").hide();
					$(".empty").show();
				} else {
					$(".article").show();
					$(".empty").hide();
				}
			})
		</script>

		<%
			ArrayList<String> title = (ArrayList<String>) session.getAttribute("title");
			ArrayList<String> context = (ArrayList<String>) session.getAttribute("context");
		%>
		<%
			String  address = (String) session.getAttribute("address");
			int age = (Integer)session.getAttribute("age");
			String username = (String)session.getAttribute("username");
			String company = (String) session.getAttribute("company");
			String education = (String)session.getAttribute("education");
			String position = (String)session.getAttribute("position");
			String school = (String)session.getAttribute("school");
			String address1 = (String)session.getAttribute("address");
			int sexs = (Integer)session.getAttribute("sex");
			Date time_enrollment = (Date) session.getAttribute("Time_enrollment");
			Date enterDate = (Date)session.getAttribute("enterDate");
			String sex;
			if (sexs==0){
				sex="女";
			}else {
				sex="男";
			}
			/*HashMap<String, Object> HashMap = new HashMap<>();
			Set<String> strings = HashMap.keySet();*/
			ArrayList<Object> objects = new ArrayList<>();
			objects.add(username);
			objects.add(age);
			objects.add(sex);
			objects.add(education);
			objects.add(school);
			objects.add(time_enrollment);
			objects.add(company);
			objects.add(position);
			objects.add(address1);
			objects.add(enterDate);
		%>
		<style>
			.hear {
				width: 100%;
				height: 100px;
				background: url("image/d7457c198d3b75e2c1c74ca9fbd2aa76.jpeg") no-repeat;
				background-size: cover;
			}
			.useinfo .empty {
				width: 100%;
				height: 500px;
				background: url("image/4f71224db9acec0473ff229bb3f2da87.jpeg") no-repeat;
				background-size: 100% 500px;
				display: none;
			}
			*{
				margin: 0;
				padding: 0;
			}

			.useinfo {
				width: 100%;
				height: 700px;
				background-color: aqua;
				margin-top: 20px;
				background-color: #F0F8FF;

			}
			.useinfo_hear{
				width: 100%;
				height: 160px;
				background-color: wheat;
				position: relative;
			}
			.useinfo_hear::before {
				content: '';
				display: block;
				position: absolute;
				width: 100px;
				height: 100px;
				border-radius: 50px;
				background-color: aliceblue;
				top:-50px;
			}
			.useinfo_hear .name {
				width: 90px;
				height: 30px;
				left: 10px;
				position: absolute;
				top: 70px;
			}
			.useinfo_hear .use_name ul {
				width: 100%;
				height: 100%;
				display: flex;
				flex-flow:row wrap;
				justify-content: space-between;
			}
			.useinfo_hear .use_name ul li {
				list-style: none;
				width: 17%;
				height: 50px;
				text-align: center;
				line-height: 50px;
			}
			.useinfo_hear .use_name{
				position: absolute;
				top: 10px;
				left: 150px;
				width: 60%;
				height: 100px;
				text-align: center;
				line-height: 40px;
			}
			.useinfo_hear .use_writenum{
				position: absolute;
				top: 10px;
				left: 250px;
				width: 100px;
				height: 40px;
				text-align: center;
				line-height: 40px;
				border-right: 1px solid black;
			}
			.useinfo_hear .use_tup{
				position: absolute;
				top: 10px;
				left: 360px;
				width: 100px;
				height: 40px;
				text-align: center;
				line-height: 40px;
			}
			.useinfo_hear .Create {
				position: absolute;
				width: 40px;
				height: 40px;
				border: 1px solid #000000;
				border-radius: 50%;
				right: 40px;
				bottom: 30px;
			}
			.useinfo_hear .Create:active{
				background-color: #969896;
			}
			.useinfo_hear .Create::before{
				position: absolute;
				content: '';
				display: block;
				width: 40px;
				height: 0px;
				top: 50%;
				border: 1px solid #000000;
			}
			.useinfo_hear .Create::after{
				position: absolute;
				content: '';
				display: block;
				width: 0px;
				height: 40px;
				left: 50%;
				border: 1px solid #000000;
			}
			.useinfo_hear span{
				position: absolute;
				width: 70px;
				height: 30px;
				text-align: center;
				line-height: 30px;
				right: 20px;
				bottom: 2px;
			}
			.useinfo_hear .edit{
				position: absolute;
				top: 40px;
				right: 10px;
				width: 100px;
				height: 40px;
				text-align: center;
				line-height: 40px;
				background-color: #00FFFF;
			}
			.useinfo .article{
				width: 100%;
				height: 500px;
				display: flex;
				flex-flow: row nowrap;
				overflow-y: auto;
			}
			.useinfo .article .special_column{
				width: 20%;
				height: 100%;
				background-color: white;
				display: flex;
				flex-flow: column;
				border-right: 1px solid black;
				justify-content: space-around;
			}
			.useinfo .article .char {
				width: 80%;
				height: 100%;
				background-color:white;
				display: flex;
				flex-flow: column;
				justify-content: space-around;
			}
			.useinfo .article .special_column ul li:first-child {
				border-top: 1px solid #000000;
			}
			.useinfo .article .special_column ul li{
				display: block;
				width: 100%;
				height: 125px;
				list-style: none;
				text-align: center;
				line-height: 125px;
				border-bottom: 1px solid #A9A9A9;
			}
			.useinfo .article .char ul li:first-child {
				border-top: 1px solid #000000;
			}
			.useinfo .article .char ul li{
				display: block;
				width: 100%;
				height: 125px;
				list-style: none;
				border-bottom: 1px solid #A9A9A9;
				overflow: hidden;
			}
			.useinfo .useinfo_hear .column_name {
				width: 90px;
				height: 20px;
				font-size: 20px;
				color: black;
				position: absolute;
				font-weight: 700;
				bottom: 15px;
			}
			.useinfo .useinfo_hear .char_name {
				width: 70px;
				height: 20px;
				left: 20%;
				font-size: 20px;
				color: black;
				position: absolute;
				font-weight: 700;
				bottom: 15px;
			}
			.other_info {
				margin-top: 20px;
				width: 100%;
				height: 100px;
				background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
			}
			.other_info ul {
				width: 70%;
				height: 50px;
				display: flex;
				flex-flow: row nowrap;
				justify-content: space-around;
				margin: 0 auto;
			}
			.other_info ul li {
				display: block;
				float: left;
				list-style: none;
				text-align: center;
				line-height: 50px;
				font-size: large;
				font-weight: 700;
			}
			.big_box {
				width: 100%;
				height: 500px;
				border: 1px solid #000000;
				position: relative;
			}
			.big_box .naver {
				position: absolute;
				width: 100%;
				height: 5%;
				border-top: 1px solid #000000;
				bottom: 20px;
			}
			.big_box .naver ul {
				width: 100%;
				height: 100%;
				padding-left: 20px;
			}
			.big_box .naver ul li {
				width: 30px;
				height: 30px;
				border-radius: 50%;
				border: 1px solid #000000;
				list-style: none;
				margin-top: 5px;
				margin-right:10px;
				float: left;
				text-align: center;
				line-height: 30px;
				cursor: default;
			}
			.change {
				background-color: #7CFC00;
			}
			.big_box .context {
				width: 100%;
				height: 90%;
				border-bottom: 1px solid #000000;
			}
			.big_box .context ul {
				width: 100%;
				height: 100%;
				display: flex;
				flex-flow: column;
				justify-content:space-around;
			}
			.big_box .context ul li {
				width: 100%;
				height: 110px;
				border-bottom: 1px solid #000000;
				overflow: auto;
			}
		</style>
	</head>
	<body>
	<div class="hear">
	</div>
	<div class="useinfo">
		<div class="useinfo_hear">
			<div class="name">
				<%=username%>
			</div>
			<div class="use_name">
				<ul>
					<%
						for (Object object : objects) {
							if (object!=null){
								out.println("<li>"+object+"</li>");
							}
						}
					%>
				</ul>
			</div>
			<div class="edit">
				<a href="use_info.jsp">编辑信息</a>
			</div>
			<a href="write.jsp">
				<div class="Create">
				</div>
			</a>
			<span>创建文章</span>
			<div class="column_name">
				<font size="" color="">专题栏:</font>
			</div>
			<div class="char_name">
				<font size="" color="">文章栏:</font>
			</div>
		</div>
		<div class="article">
			<div class="special_column">
				<ul>
					<%
						for (String s : title) {
							out.println("<li>"+s+"</li>");
						}
					%>
				</ul>
			</div>
			<div class="char">
				<ul>
					<%
						for (String s : context) {
							out.println("<li>"+s+"</li>");
						}
					%>
				</ul>
			</div>
		</div>
		<div class="empty">
		</div>
	</div>
	<div class="other_info">
		<ul>
			<li><a href="./ee.html">关于我们</a></li>
			<li> <a href="">
				<svg t="1646459599600" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2094" width="30" height="30"><path d="M713.3 266c-32.2 5.6-104.1-18.3-104.1-18.3-14.6-8.6-68.8-11.7-68.8-11.7-41.6-3-96.8 29.5-96.8 29.5H309.3l-19.5 42.1h88.9c-23 29.5-24.9 64-24.9 64 1.4 48.1-15.2 71-15.2 71-13.2 38.6 43.5 43.1 43.5 43.1 83.1-14.2 87.9-91.8 87.9-91.8 27.4-47.7 73.3-24.9 73.3-24.9l247 223.8c20.1 19.8 5.1 43.9 5.1 43.9-11.7 22.4-38.2 13.7-38.2 13.7L582.6 521.3c-31.7-8-21.5 22.8-21.5 22.8l169.3 128.3c12.4 17.4 0 34.2 0 34.2-9.2 16.8-30.9 7.9-30.9 7.9L546.1 601.7c-29.3-2.1-17.9 25.1-17.9 25.1l129.3 97c16.6 18.3 4.9 35.2 4.9 35.2-12 19.6-31.9 10.8-31.9 10.8L509 680.9c-29.9-4-20.3 22-20.3 22l81.5 64.5c-1.9 36.1-36.7 21.8-36.7 21.8l-21.7-16.7c-3.6-18.3-26.2-20.3-26.2-20.3l-24.2-18.4c1.1-17.6-14.3-32.6-14.3-32.6-12.7-15.8-38.7-9.1-38.7-9.1-2.2-6.5-12.7-11.2-12.7-11.2 1.7-23.7-13-35.8-13-35.8-16-19.6-42.5-12.9-42.5-12.9-0.6-3.8-8.6-9.8-8.6-9.8 5.6-28.7-7.2-44-7.2-44-13.5-25.1-52.1-15.9-52.1-15.9L213 484.7 195.9 522l50.1 66.7-37.1 52.7c-9.3 34.3 6.8 49.7 6.8 49.7 38.4 38.6 71.3-1.9 71.3-1.9-19.3 38.2 4.9 58.7 4.9 58.7 35.5 34.5 67.7-3.6 67.7-3.6-20.8 36.8 1.7 54.3 1.7 54.3 40.6 42.1 74.7-13.9 74.7-13.9-17.8 30.9 7.6 52.7 7.6 52.7 40.1 31 68.2-24 68.2-24 15.6 15.7 42.5 11.4 42.5 11.4 36.8-6.2 44.2-36.8 44.2-36.8 46.1 32.5 76 5.8 76 5.8 25.1-18 22.9-45.2 22.9-45.2 37.9 6.1 53.5-16.1 53.5-16.1 21.3-17.3 16.6-48 16.6-48 30.3-1.4 48.9-16.2 56.1-31.5 26-45.5-9.2-83.1-9.2-83.1l19.1-45.2L713.3 266z" fill="#010D1E" p-id="2095"></path><path d="M276.1 207.1l-54.7-27.7s-17-9.8-28 10.9C193 198.5 66 464.9 66 464.9s-8.1 21.8 8.5 30.6l50.1 26.8s22.8 13.6 34.8-11.8l124.1-269.6c0.1 0 11.8-23-7.4-33.8zM956.8 462.6L829.1 194.9s-10.2-23.7-30.3-14.8l-54.7 27.6s-17.9 7.8-9.1 29.6c6.1 5.5 129.6 273.8 129.6 273.8s11.5 20.1 28.4 12l51.2-24.5c-0.1-0.2 24.4-10.5 12.6-36z" fill="#2972E9" p-id="2096"></path></svg>商务合作</a></li>
			<li><svg t="1646459792270" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2915" width="20" height="20"><path d="M944.626667 731.686667a149.82 149.82 0 0 0-31.713334-66.313334L758.766667 480.4A148.926667 148.926667 0 0 0 644.046667 426.666667H379.953333a148.926667 148.926667 0 0 0-114.72 53.733333L111.086667 665.373333a149.82 149.82 0 0 0-31.713334 66.313334L58.393333 836.6A85.333333 85.333333 0 0 0 142.066667 938.666667h739.866666a85.333333 85.333333 0 0 0 83.673334-102.066667z m-29.7 148.666666a42.513333 42.513333 0 0 1-32.993334 15.646667H142.066667a42.666667 42.666667 0 0 1-41.84-51.033333l20.986666-104.913334a107.013333 107.013333 0 0 1 22.666667-47.333333L298 507.713333A106.38 106.38 0 0 1 379.953333 469.333333h264.093334A106.38 106.38 0 0 1 726 507.713333L880.14 692.666667a107.013333 107.013333 0 0 1 22.666667 47.333333l20.986666 104.913333a42.52 42.52 0 0 1-8.866666 35.473334zM630 547.213333C598.2 524.506667 556.3 512 512 512s-86.2 12.506667-118 35.213333c-16.146667 11.533333-28.92 25.126667-37.96 40.4C346.28 604.1 341.333333 621.72 341.333333 640s4.946667 35.9 14.713334 52.386667c9.04 15.273333 21.813333 28.866667 37.96 40.4C425.8 755.493333 467.7 768 512 768s86.2-12.506667 118-35.213333c16.146667-11.533333 28.92-25.126667 37.96-40.4 9.766667-16.486667 14.713333-34.106667 14.713333-52.386667s-4.946667-35.9-14.713333-52.386667c-9.046667-15.273333-21.82-28.866667-37.96-40.4z m-24.8 150.853334c-24.62 17.58-57.72 27.266667-93.2 27.266666s-68.58-9.686667-93.193333-27.266666c-22.446667-16-34.806667-36.666667-34.806667-58.066667s12.36-42 34.806667-58.066667C443.42 564.353333 476.52 554.666667 512 554.666667s68.58 9.686667 93.193333 27.266666C627.64 598 640 618.586667 640 640s-12.36 42.033333-34.806667 58.066667z m232.76-548.18C750.533333 108.26 634.773333 85.333333 512 85.333333s-238.533333 22.926667-325.953333 64.553334C93.586667 193.92 42.666667 254.333333 42.666667 320v53.333333a53.393333 53.393333 0 0 0 53.333333 53.333334h192a53.393333 53.393333 0 0 0 53.333333-53.333334v-53.333333c0-13.253333 16.666667-28.9 43.566667-40.846667C418.493333 264.22 463.633333 256 512 256s93.506667 8.22 127.1 23.153333C666 291.1 682.666667 306.746667 682.666667 320v53.333333a53.393333 53.393333 0 0 0 53.333333 53.333334h192a53.393333 53.393333 0 0 0 53.333333-53.333334v-53.333333c0-65.666667-50.92-126.08-143.38-170.113333zM938.666667 373.333333a10.666667 10.666667 0 0 1-10.666667 10.666667h-192a10.666667 10.666667 0 0 1-10.666667-10.666667v-53.333333c0-31.733333-24.473333-60.086667-68.906666-79.833333C617.5 222.86 566.206667 213.333333 512 213.333333s-105.5 9.526667-144.426667 26.833334C323.14 259.913333 298.666667 288.266667 298.666667 320v53.333333a10.666667 10.666667 0 0 1-10.666667 10.666667H96a10.666667 10.666667 0 0 1-10.666667-10.666667v-53.333333c0-23.42 10.033333-46.593333 29.82-68.873333 20.666667-23.253333 50.666667-44.36 89.233334-62.713334C286.2 149.453333 395.446667 128 512 128s225.8 21.453333 307.613333 60.413333c38.553333 18.353333 68.573333 39.46 89.233334 62.713334C928.666667 273.406667 938.666667 296.58 938.666667 320z" fill="#5C5C66" p-id="2916"></path></svg>400-600-0187</li>
			<li><a href="kefu.jsp"><svg t="1646459861092" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3761" width="20" height="20"><path d="M448 917.376C448 917.333333 576 917.333333 576 917.333333c0.085333 0 0-42.709333 0-42.709333C576 874.666667 448 874.666667 448 874.666667c-0.085333 0 0 42.709333 0 42.709333z m371.349333-173.034667C809.6 745.877333 799.573333 746.666667 789.333333 746.666667a21.333333 21.333333 0 0 1-21.333333-21.333334V384a21.333333 21.333333 0 0 1 21.333333-21.333333 191.146667 191.146667 0 0 1 92.373334 23.637333C828.202667 234.517333 681.045333 128 511.296 128 341.290667 128 193.749333 234.816 140.458667 387.328A191.125333 191.125333 0 0 1 234.666667 362.666667a21.333333 21.333333 0 0 1 21.333333 21.333333v341.333333a21.333333 21.333333 0 0 1-21.333333 21.333334 192 192 0 0 1-148.906667-313.216 21.269333 21.269333 0 0 1 0.042667-8.682667C127.36 228.288 304.469333 85.333333 511.274667 85.333333c209.706667 0 388.544 146.944 427.008 347.093334l0.213333 1.344A191.210667 191.210667 0 0 1 981.333333 554.666667c0 70.4-37.909333 131.968-94.421333 165.397333-57.642667 100.693333-154.752 174.762667-268.778667 204.074667A42.517333 42.517333 0 0 1 576 960h-128c-23.573333 0-42.666667-19.157333-42.666667-42.624v-42.752c0-23.552 18.922667-42.624 42.666667-42.624h128c23.573333 0 42.666667 19.157333 42.666667 42.624v5.141333a392.810667 392.810667 0 0 0 200.682666-135.424zM85.333333 554.666667c0.298667 133.589333 128 148.949333 128 148.949333V406.144s-128.298667 14.933333-128 148.522667z m853.333334 0c0.298667-133.589333-128-148.522667-128-148.522667v297.472s127.701333-15.36 128-148.949333z" fill="#3D3D3D" p-id="3762"></path></svg>在线客服</a></li>
		</ul>
	</div>
	</body>
	<script>

	</script>
</html>
