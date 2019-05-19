<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>登录页面</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
LoginByForm:<<br>
<form action="user/loginByForm" method="post">
    用户名<input type="text" id="inputname" name="username"><p>
    密码<input type="text" id="inputpassword" name="password"></p>
    <input type="button" id="regbtn" value="注册">
    <input type="submit" id="loginbtn" value="登录">
    ${msg}
</form>
<br>
LoginByAjax:<br>
用户名：<input id="username" type="text" name="username"/><p/>
密码：<input id="password" type="password" name="password"/></p>
<button id="btn" type="button">登录</button><p/>
<span id="info"></span>
<script type="text/javascript">
    $(document).ready(function(){
        $("#btn").click(function(){
            $.ajax({
                //提交数据的类型 POST GET
                type:"POST",
                //提交的网址
                url:"user/loginByAjax",
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
