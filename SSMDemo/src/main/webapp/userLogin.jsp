<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
</head>
<body>
<h1 align="center">登录页面</h1>
用户名：<input id="username" type="text" name="username"/><p/>
密码：<input id="password" type="password" name="password"/></p>
<button id="btn" type="button">登录</button><p/>
<span id="info"></span>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#btn").click(function(){
            $.ajax({
                //提交数据的类型 POST GET
                type:"POST",
                //提交的网址
                url:"user/login",
                //提交的数据
                data: JSON.stringify({userName:$("#username").val(),userPassword:$("#password").val()}),
                //返回数据的格式
                datatype: "json",
                contentType:"application/json",
                //成功返回之后调用的函数
                success:function (data){
                	alert(JSON.stringify(data));
                    $("#info").html(JSON.stringify(data));
                },
                //调用出错执行的函数
                error: function(error){
                   alert("ajax error : "+error);
                }
            });
        });
    });
</script>
</body>
</html>