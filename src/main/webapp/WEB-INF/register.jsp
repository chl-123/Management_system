<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta  content="text/html; charset=utf-8">
    <title>注册账号</title>
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/Management_System"/>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript">
        $(function () {
            if("${requestScope.exception.message}".length!=0){
                layer.msg("${requestScope.exception.message}");
            }

        })
    </script>
</head>
<body>
<div class="top_div"></div>
<div CLASS="contain">
    <div class="container">
        <div class="header">
            <h2>注测账号</h2>
        </div>
        <form id="form" class="form" action="/Management_System/admin/do/register/page.html" method="post" onsubmit="return checkInputs()">
            <div class="form-control">
                <label for="loginAccount">登录账号</label>
                <input type="text" placeholder="账号" id="loginAccount" name="loginAccount"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <div class="form-control">
                <label for="username">用户名</label>
                <input type="text" placeholder="用户名" id="userName" name="userName"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <div class="form-control">
                <label for="username">电话号码</label>
                <input type="text" placeholder="电话号码" id="phoneNumber" name="phoneNumber"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <div class="form-control">
                <label for="username">邮箱</label>
                <input type="email" placeholder="请输有效入邮箱" id="email" name="email"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <div class="form-control">
                <label for="username">密码</label>
                <input type="password" placeholder="密码" id="loginPassword" name="loginPassword">
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <button type="submit">提交</button>
        </form>
    </div>
</div>



<div style="text-align:center;">
</div>
</body>
</html>