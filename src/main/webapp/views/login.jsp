<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>教师调课补课管理系统</title>
    <link rel="shortcut icon" href="../images/R215b7f60c1369de919b0592ead85b4bb.png" type="image/x-icon">
    <!-- 引入 Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css">

    <style>
        body {
            background-image: url("../images/屏幕截图 2021-02-22 192139.png");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .login-form {
            text-align: center; /*让div内部文字居中*/
            background-color: rgba(0, 0, 0, 0);
            border-radius: 0;
            width: 800px;
            height: 700px;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        .form-control {
            width: 400px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        form {
            margin: auto;
            width: 400px;
        }
        .btn-default{
            width: 133px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="login-form">
        <label class="form-inline">
            <img src="../images/R215b7f60c1369de919b0592ead85b4bb.png" alt="背景">
            <h1>教师调课补课管理系统</h1>
        </label>
        <div class="login">
            <c:if test="${not empty ok}">
                <div class="alert alert-danger" style="width: 400px;margin: auto">
                    <a href="#" class="close" data-dismiss="alert">
                        &times;
                    </a>
                    <strong>登录失败，账号或密码错误！</strong>。
                </div>
            </c:if>
            <form class="my-form" method="post" action="${pageContext.request.contextPath}/login/teacher">
                <div class="form-group">
                    <input class="form-control" type="text" name="account" placeholder="账号">
                </div>
                <div class="form-group">
                    <input class="form-control" type="password" name="password" placeholder="密码">
                </div>
                <div class="bs-example">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default active">
                            <input type="radio" name="user_type" id="option1" value="0"> 教师
                        </label>
                        <label class="btn btn-default">
                            <input type="radio" name="user_type" id="option2" value="1"> 领导
                        </label>
                        <label class="btn btn-default">
                            <input type="radio" name="user_type" id="option3" value="2"> 管理员
                        </label>
                    </div>
                </div>
                <input class="form-control btn btn-success" type="submit" value="登  录">
            </form>
        </div>
    </div>
</div>


<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="../js/jquery-3.5.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrapValidator.min.js"></script>
<script>

    $(function () {
        $('form').bootstrapValidator({

            fields: {
                account: {
                    validators: {
                        notEmpty: {
                            message: '账号不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            }
        });
    });


    $(function () {

        $(".btn-default").change(function () {
            let val = $(".active input").val();
            if(val==0){
                $(".my-form").attr("action","${pageContext.request.contextPath}/login/teacher");
                console.log(val)
            }else if (val==1){
                $(".my-form").attr("action","${pageContext.request.contextPath}/login/leadership");
                console.log(val)
            }else if (val==2) {
                $(".my-form").attr("action","${pageContext.request.contextPath}/login/admin");
                console.log(val)
            }
        });
    });

</script>
</body>
</html>
