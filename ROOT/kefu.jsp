<%@ page language="java" pageEncoding="UTF-8" %>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript">
        var websocket = null;
        //判断当前浏览器是否支持WebSocket
        if ('WebSocket' in window) {
            websocket = new WebSocket("ws://localhost:8080/websocket");
        }
        else {
            alert('当前浏览器 Not support websocket')
        }
        var sendMessage = function(){
            /*console.log("ddd")*/
            var message=document.getElementById('message');
            websocket.send(message.value);   //发送消息
            message.value="";   //清空输入栏
        }
        var send = function(event){
            if(event.keyCode == 13){
                sendMessage();
            }
        };
        websocket.onopen=function () {
            websocket.onmessage=function(event){
                var show = document.getElementById('Cart');
                show.innerHTML += event.data+"<br/>";
                show.scrollTop = show.scrollHeight;
            };
            document.getElementById('message').onkeydown=send;
            document.getElementById('song').onclick=sendMessage;
        };
        websocket.onclose=function(){
            document.getElementById('message').onkeydown=null;
            document.getElementById('song').onclick=null;
            Console.log("连接已关闭！");
        };
    </script>
</head>
<body>
<div style="width: 600px;height: 240px;overflow-y:auto ;border: 1px solid #000000; " id="Cart"></div>
<input type="text" id="message" size="80" name="message" placeholder="输入聊天内容" />
<input type="button" name="song" id="song" value="发送" />
</body>
</html>
