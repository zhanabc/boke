<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>

    <%
        ArrayList<String>  commect_total = (ArrayList<String>) session.getAttribute("commect_total");
    %>
    <script type="text/javascript">
        var a=new Array(100);
        var i=0;
            <%
                if (commect_total!=(null)){
                for (String s : commect_total) {

            %>
                a[i]='<%=s%>';
                i++;
            <%
                }
                }
            %>
        var i,j,c=0;
        var page=6;  //每页的评论数量
        var result=true
        $(function(){
            if(a.length>page){     //如果评论数量大于每页数量就进行分页
                 for(i=0;i<(a.length/page);i++){
                  for(j=0;j<page;j++){
                   if(a[c]==null){
                        break;
                    }
                                $(".comment .comment_list").last().append("<li>"+a[c]+"</li>");
                                c++;
                            }
                            if (a[c]==null){
                                break;
                            }
                            $(".comment").children().last().after('<ul class="comment_list"></ul>');
                            $(".main .page").append("<li>"+(i+1)+"</li>");
                            $(".comment .comment_list").eq(0).show().siblings().hide();
                        }
                    }else{
                        for(i=0;i<a.length;i++){
                            $(".comment .comment_list").append("<li>"+a[i]+"</li>")
                        }
                    }
                    $(".main .page li").eq(0).addClass("current")
                    $("body").on("click",".page li",function(){
                        $(this).addClass("current").siblings().removeClass("current");
                        var a=$(this).index();
                        $(".comment .comment_list").eq(a).show().siblings().hide();
                    });
        })
    </script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        body {
            background: url("image/ff8e76ed22f996ba0e4a263dec24b2d9.jpeg") no-repeat;
            background-size: cover;
        }
        .main {
            width: 90%;
            height: auto;
            margin: 40px auto;
        }
        .main .title {
            width: 100%;
            height: 40px;
            text-align: center;
            line-height: 40px;
            border-bottom: 1px solid #7CFC00;
        }
        .main .context {
            width: 97%;
            height:auto;
            background-color: #F0F8FF;
            border-top: none;
            padding: 20px;
            overflow: hidden;
        }
        .main .comment {
            width: 100%;
            height: 200px;
        }
        .main .comment ul {
            width: 100%;
            height: 100%;
        }
        .main .comment .comment_list li{
            width: 100%;
            height: auto;
            border-bottom: 1px solid #000000;
            list-style: none;
            font-size: 20px;
            color: white;
        }
        .main textarea {
            width: 100%;
            height: auto;
            height: 110px;
            padding: 20px;
            font-size: 20px;
            resize: none;
            outline: none;
            border: none;
            background-color: #CCCCCC;
        }
        .main button{
            width: 100px;
            height: 40px;
            position: absolute;
            left: 50%;
            outline: none;
            color: white;
            font-size: 20px;
            background: url("image/ff8e76ed22f996ba0e4a263dec24b2d9.jpeg") no-repeat;
            background-size: cover;
        }
        .main .page {
            width: auto;
            height: 40px;
            margin-bottom: 20px;
            display: flex;
            flex-flow: row nowrap;
        }
        .main .page li {
            list-style: none;
            width: 40px;
            height: 40px;
            border: 1px solid #000000;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            cursor: pointer;
            background-color: white;
        }
        .current{
            background-color: #7CFC00;
        }
    </style>
    <script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
    <script>
        L2Dwidget.init({
            "model": { "jsonPath": "https://unpkg.com/live2d-widget-model-hijiki@1.0.5/assets/hijiki.model.json","scale": 1, "hHeadPos":0.5, "vHeadPos":0.618 },
            "display": { "position": "absolute", "width": 200, "height": 300, "hOffset": -10, "vOffset": 3},
            "mobile": { "show": true, "scale": 0.1 },
            "react": { "opacityDefault": 0.7, "opacityOnHover": 0.2 }
        });
    </script>
</head>
<%
    String  title = (String) session.getAttribute("cloose_title");
    String  context = (String) session.getAttribute("cloose_context");
%>
<body>
<div class="main">
    <div class="title">
        <strong><%=title%></strong>
    </div>
    <div class="context">
        <%=context%>
    </div>
    <div class="comment">
        <ul class="comment_list">
        </ul>
    </div>
    <ul class="page">
        <li>1</li>
    </ul>
    <form action="disc" method="post">
        <textarea rows="" value="" name="context" cols="" placeholder="无内容"></textarea>
        <button type="submit">评论</button>
    </form>
</div>
</body>
</html>

