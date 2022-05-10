<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="false" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(function(){
      var i;
      for(i=10;i<70;i++){
        $(".age").append("<option value='"+i+"'>"+i+"</option>")
      }
    })
  </script>
  <style type="text/css">
    *{
      margin: 0;
      padding: 0;
    }
    .title {
      width: 80%;
      height: 40px;
      margin: 20px auto;
      text-align: center;
      line-height: 40px;
    }
    .title li {
      list-style: none;
      font-size: 30px;
      color: darkgray;
    }
    .cart {
      width: 80%;
      height: 500px;
      margin: 100px auto;
      background-color: aquamarine;
      position: relative;
    }
    .cart form .info li {
      list-style: none;
      font-size: 20px;
      margin-bottom: 10px;
    }
    .cart form .info  li input,select{
      width: 200px;
      height: 30px;
    }
    .cart form .info  li input,select {
      border: none;
      background-color: #7FFFD4;
      outline: none;
      border-bottom: 1px solid #A9A9A9;
    }
    .cart form .info  li .sex1 {
      width: 30px;
      height: 30px;
    }
    .cart form {
      width: 90%;
      height: 90%;
      position: absolute;
      top: 5%;
      left: 5%;
    }
    .cart form ul {
      margin-bottom: 10px;
    }
    .cart form button {
      position: absolute;
      width: 100px;
      height: 40px;
      border: none;
      left: 50%;
      transform: translate(-50%);
      box-shadow: 2px 2px #A9A9A9;
      outline: none;
      background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%);
    }
  </style>
</head>
<body>
<div class="title">
  <li>完善个人信息</li>
</div>
<div class="cart">
  <form action="afterDao.dealinsert" method="post">
    <ul class="info">
      <li>性别：
        <input value="1" class="sex1"  name="sex" type="radio" checked> 男
        <input value="0" name="sex" class="sex1" type="radio"/> 女
      </li>
      <li>年龄：
        <select class="age" name="age">
        </select>
      </li>
      <li>
        居住地址：
        <input type="text" value="" name="address" placeholder="未填写"/>
      </li>
      <li>学历：
        <select class="education" name="education">
          <option value ="初中">初中</option>
          <option value ="高中">高中</option>
          <option value ="大专">大专</option>
          <option value ="本科">本科</option>
          <option value ="研究生">研究生</option>
        </select>
      </li>
      <li>毕业学校：<input type="text"  value="" name="school" placeholder="未填写"/></li>
      <li>入学年份：<input type="date" name="time_enrollment" value="" /></li>
      <li>公司名称：<input type="text" value="" name="company" placeholder="未填写"/></li>
      <li>职位名称：<input type="text" value="" name="postion" placeholder="未填写"/></li>
      <li>入职年份：<input type="date" name="enterDate" value="" /></li>
    </ul>
    <button type="submit">提交</button>
  </form>
</div>
</body>
</html>

