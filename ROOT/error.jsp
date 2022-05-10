<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<style type="text/css">
		body {
			background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
		}
		.error {
			width: 45%;
			height: 500px;
			position: absolute;
			left: 50%;
			top: 20%;
			transform: translate(-50%);
			/* display: flex;
            flex-flow: column; */
		}
		.error .error_font {
			font-size: 200px;
			text-align: center;
			line-height: 300px;
			height: 60%;
			color: #FFFFFF;
			transform: rotateZ(20deg);
			animation: name 2s infinite;
		}
		@keyframes name{
			0%{
				transform: rotateZ(20deg);
			}
			50%{
				transform: rotateZ(-20deg);
			}
			100%{
				transform: rotateZ(20deg);
			}
		}
		.error .error_image {
			position: absolute;
			width: 100px;
			height: 20%;
			left: 50%;
			transform: translate(-50%);
			top: 55%;
			border-radius: 100px;
			border: 1px solid black;
			box-shadow: 2px 2px #cccc;
			background: url("./image/error.jpeg") no-repeat;
			background-size: cover;
		}
		.error .error_info {
			position: absolute;
			width: 100%;
			height: 20%;
			bottom: 10px;
			text-align: center;
			font-size: 50px;
		}
	</style>
</head>
<body>
<div class="error">
	<div class="error_font">
		404
	</div>
	<div class="error_image">

	</div>
	<div class="error_info">
		页面丢失!!!
	</div>
</div>
</body>
</html>

