<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- saved from url=(0064)http://www.17sucai.com/preview/137615/2015-01-15/demo/index.html -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><HTML
xmlns="http://www.w3.org/1999/xhtml">
<HEAD><META content="IE=11.0000"
http-equiv="X-UA-Compatible">

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>登录页面</TITLE>
<base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
 <link rel="stylesheet" href="css/login.css">
<SCRIPT type="text/javascript">
    $(function () {
        //用来显示后台登录出错的信息
        if("${requestScope.exception.message}".length!=0){
            layer.msg("${requestScope.exception.message}");
        }
        //得到焦点
        $("#loginPassword").focus(function () {
            $("#left_hand").animate({
                left: "150",
                top: " -38"
            }, {
                step: function () {
                    if (parseInt($("#left_hand").css("left")) > 140) {
                        $("#left_hand").attr("class", "left_hand");
                    }
                }
            }, 2000);
            $("#right_hand").animate({
                right: "-64",
                top: "-38px"
            }, {
                step: function () {
                    if (parseInt($("#right_hand").css("right")) > -70) {
                        $("#right_hand").attr("class", "right_hand");
                    }
                }
            }, 2000);
        });
        //失去焦点
        $("#password").blur(function () {
            $("#left_hand").attr("class", "initial_left_hand");
            $("#left_hand").attr("style", "left:100px;top:-12px;");
            $("#right_hand").attr("class", "initial_right_hand");
            $("#right_hand").attr("style", "right:-112px;top:-12px");
        });
    });
    function check(){
        //得到name输入框对象
        var name = document.getElementById("loginAccount");
        //判断输入框是否有内容
        if(name.value.length==0){

            layer.msg("用户名不能为空")
            //提交停止
            return false;
        }
        var pass = document.getElementById("loginPassword");
        if(pass.value.length==0){
            layer.msg("密码不能为空")
            return false;
        }
        return true;
    }


</SCRIPT>

<META name="GENERATOR" content="MSHTML 11.00.9600.17496">
</HEAD>
<BODY>
<DIV class="top_div"></DIV>
<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
    <DIV style="width: 165px; height: 96px; position: absolute;">
        <DIV class="tou"></DIV>
        <DIV class="initial_left_hand" id="left_hand"></DIV>
        <DIV class="initial_right_hand" id="right_hand"></DIV>
    </DIV>
    <form action="http://localhost:8081/Management_System/admin/do/login/page.html" method="post" id="form" onsubmit="return check()">

        <div style="padding: 30px 0px 10px; position: relative;">
            <SPAN class="u_logo"></SPAN>
            <INPUT name="loginAccount" id="loginAccount" class="ipt" type="text" placeholder="请输入用户名或邮箱" value="">
            <small></small>
        </div>
        <div style="position: relative;">
            <SPAN class="p_logo"></SPAN>
            <INPUT name="loginPassword" class="ipt" id="loginPassword" type="password" placeholder="请输入密码" value="">
        </div>
        <DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
            <P style="margin: 0px 35px 20px 45px;">
            <SPAN style="float: left;">
                <A style="color: rgb(204, 204, 204);" href="#">忘记密码?</A>
            </SPAN>
                <SPAN style="float: right;">
                <A style="color: rgb(204, 204, 204); margin-right: 10px;" href="http://localhost:8081/Management_System/admin/to/register/page.html">注册</A>
              <button style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
                 type="submit">登录</button>
           </SPAN>
            </P>
        </DIV>
    </form>

</DIV>
<div style="text-align:center;">

</div>
</BODY>
</HTML>
