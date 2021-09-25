<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理端</title>
    <link rel="shortcut icon" href="../images/R215b7f60c1369de919b0592ead85b4bb.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/toastr.min.css" type="text/css">
    <style>
        .body-div {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
        }

        .logo-div {
            width: 20%;
            float: left;
            text-align: center;
        }

        .title-div {
            width: 60%;
            height: 160px;
            float: left;
            text-align: center;
        }

        .count {
            overflow: hidden;
        }

        .time-div {
            width: 20%;
            float: left;
            margin-top: 80px;
        }

        li {
            width: 25%;
            font-size: 20px;
            text-align: center;
        }

        td, th {
            text-align: center;
        }

        .table tbody tr td {
            vertical-align: middle;
        }

        .modal.fade.in {
            top: 30%;
        }

        .modal-content {
            text-align: center;
        }

        #div4 {
            margin-top: 100px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="body-div">
    <div class="count">
        <div class="logo-div">
            <img src="../images/R215b7f60c1369de919b0592ead85b4bb.png" alt="logo">
        </div>
        <div class="title-div">
            <h1 style="font-size: 70px;line-height: 160px">管理端</h1>
        </div>
        <div class="time-div">
            <p>欢迎你，${name}</p>
            <p id="ymd"></p>
        </div>
    </div>
    <div class="nav-div">
        <ul class="nav nav-tabs" id="test">
            <li><a href="#" onclick="getUser()">用户管理</a></li>
            <li><a href="#" onclick="getData()">数据管理</a></li>
            <li><a href="#">用户添加</a></li>
            <li><a href="#" onclick="getFe()">反馈及其他</a></li>
        </ul>
    </div>
    <div class="frame-div">
        <div id="div0" style="display: none">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                                教师管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>教师姓名</th>
                                    <th>账号</th>
                                    <th>学院</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="teacher">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                                领导管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>领导姓名</th>
                                    <th>账号</th>
                                    <th>学院</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="leadership">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div1" style="display: none;">
            <div class="panel-group" id="accordion1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion1"
                               href="#collapseOne1">
                                调课信息管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne1" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>教师姓名</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名称</th>
                                    <th>调整至日期</th>
                                    <th>课节</th>
                                    <th>教室</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="adjust">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion1"
                               href="#collapseTwo1">
                                补课信息管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>教师姓名</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名称</th>
                                    <th>上课日期</th>
                                    <th>课节</th>
                                    <th>教室</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="supplement">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div2" style="display: none">
            <div class="panel-group" id="accordion3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion3"
                               href="#collapseOne3">
                                教师添加
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne3" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <form>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputTAccount">教师教工号</label>
                                        <input type="text" class="form-control" id="inputTAccount" placeholder="教师教工号">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputTName">教师姓名</label>
                                        <input type="text" class="form-control" id="inputTName" placeholder="教师姓名">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputTCollege">学院</label>
                                        <input type="text" class="form-control" id="inputTCollege" placeholder="所属学院">
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-md-push-3">
                                    <input class="form-control btn btn-success" type="button" value="提交" onclick="insertTeacher()">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion3"
                               href="#collapseTwo3">
                                领导添加
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo3" class="panel-collapse collapse">
                        <div class="panel-body">
                            <form>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputAccount">领导工号</label>
                                        <input type="text" class="form-control" id="inputAccount" placeholder="领导工号">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputName">领导姓名</label>
                                        <input type="text" class="form-control" id="inputName" placeholder="领导姓名">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputCollege">学院</label>
                                        <input type="text" class="form-control" id="inputCollege" placeholder="所属学院">
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-md-push-3">
                                    <input class="form-control btn btn-success" type="button" value="提交" onclick="insertLeadership()">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div3" style="display: none">
            <div class="panel-group" id="accordion2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion2"
                               href="#collapseOne2">
                                意见与反馈
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>用户账号</th>
                                    <th>反馈意见</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody id="feedback">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion2"
                               href="#collapseTwo2">
                                密码修改
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo2" class="panel-collapse collapse">
                        <div class="panel-body">
                            <form>
                            <div class="form-row col-md-12">
                                <div class="form-group col-md-6 col-md-push-3">
                                    <label for="inputOld">原密码</label>
                                    <input type="text" class="form-control" id="inputOld" placeholder="原密码">
                                </div>
                            </div>
                            <div class="form-row col-md-12">
                                <div class="form-group col-md-6 col-md-push-3">
                                    <label for="inputNew">新密码</label>
                                    <input type="text" class="form-control" id="inputNew" placeholder="新密码">
                                </div>
                            </div>
                            <div class="form-row col-md-12">
                                <div class="form-group col-md-6 col-md-push-3">
                                    <label for="inputNewTwo">确认密码</label>
                                    <input type="text" class="form-control" id="inputNewTwo" placeholder="确认密码">
                                </div>
                            </div>
                            <div class="form-group col-md-6 col-md-push-3">
                                <input class="form-control btn btn-success" type="button" value="提交更改" onclick="updatePW()">
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion2"
                               href="#collapseThree3">
                                邮箱添加
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree3" class="panel-collapse collapse">
                        <div class="panel-body">
                            <form>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputEmail">邮箱</label>
                                        <input type="email" class="form-control" id="inputEmail" placeholder="邮箱">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputPro">专业</label>
                                        <input type="text" class="form-control" id="inputPro" placeholder="专业">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputGrade">确认密码</label>
                                        <input type="text" class="form-control" id="inputGrade" placeholder="班级">
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-md-push-3">
                                    <input class="form-control btn btn-success" type="button" value="添加" onclick="insertEmail()">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div4"><h1>你好啊，${name}</h1></div>
    </div>
    <%--    模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        提示
                    </h4>
                </div>
                <div class="modal-body">
                    确认删除?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-danger" id="ok">
                        删除
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>


<script src="../js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/toastr.min.js" type="text/javascript"></script>
<script>
    window.onload = function () {
        window.requestAnimationFrame(getDate)
    };

    //导航
    $(function () {
        $("#test li").click(function () {
            $(this).siblings('li').removeClass('active');  // 删除其他兄弟元素的样式
            $(this).addClass('active');
        });
    });

    //弹窗状态设定
    toastr.options = {
        "closeButton": false, //是否显示关闭按钮
        "debug": false, //是否使用debug模式
        "positionClass": "toast-center-center",//弹出窗的位置
        "showDuration": "300",//显示的动画时间
        "hideDuration": "1000",//消失的动画时间
        "timeOut": "3000", //展现时间
        "extendedTimeOut": "1000",//加长展示时间
        "showEasing": "swing",//显示时的动画缓冲方式
        "hideEasing": "linear",//消失时的动画缓冲方式
        "showMethod": "fadeIn",//显示时的动画方式
        "hideMethod": "fadeOut" //消失时的动画方式
    };

    //跟随导航
    $(function () {
        $("#test li").click(function () {
            console.log($(this).index());
            if ($(this).index() === 0) {
                $("#div0").css("display", "block");
                $("#div0").siblings("div").css("display", "none")
            }
            if ($(this).index() === 1) {
                $("#div1").css("display", "block");
                $("#div1").siblings("div").css("display", "none")
            }
            if ($(this).index() === 2) {
                $("#div2").css("display", "block");
                $("#div2").siblings("div").css("display", "none")
            }
            if ($(this).index() === 3) {
                $("#div3").css("display", "block");
                $("#div3").siblings("div").css("display", "none")
            }
        })
    });

    //获取日期
    function getDate() {
        window.setTimeout(function () {
            window.requestAnimationFrame(getDate)
        }, 1000 / 2);
        let d = new Date();
        let year = d.getFullYear(); //获取年
        let month = d.getMonth() + 1;  //获取月，从 Date 对象返回月份 (0 ~ 11)，故在此处+1
        let day = d.getDay();    //获取日
        let days = d.getDate(); //获取日期

        if (month < 10) month = "0" + month;
        if (days < 10) days = "0" + days;

        const week = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
        const Tools = document.getElementById("ymd");
        const da = year + " 年 " + month + " 月 " + days + " 日 " + week[day];
        Tools.innerHTML = da
    }

    //表格选中
    $("tbody").delegate("tr","click",function () {
        if (!$(this).hasClass("success")) {
            $(this).attr("class", "success");
            $(this).siblings().removeClass("success")
        }
    });

    function getUser() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/user",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function tab(data) {
                let teacher = "";
                let leadership = "";
                for (let i = 0; i < data["teacher"].length; i++) {
                    teacher += "<tr><td>" + (i + 1) + "</td>" +
                        "<td>" + data["teacher"][i].teacher_name + "</td>" +
                        "<td class='name'>" + data["teacher"][i].teacher_account + "</td>" +
                        "<td>" + data["teacher"][i].teacher_college + "</td>" +
                        "<td><input type='button' value='重置密码' class='btn btn-success upDate'>" +
                        "<input type='button' value='删除' class='btn btn-danger delete'></td>" +
                        "</tr>";
                }
                for (let i = 0; i < data["leadership"].length; i++) {
                    leadership += "<tr><td>" + (i + 1) + "</td>" +
                        "<td>" + data["leadership"][i].leadership_name + "</td>" +
                        "<td class='name'>" + data["leadership"][i].leadership_account + "</td>" +
                        "<td>" + data["leadership"][i].leadership_college + "</td>" +
                        "<td><input type='button' value='重置密码' class='btn btn-success upDate'>" +
                        "<input type='button' value='删除' class='btn btn-danger delete'></td>" +
                        "</tr>";
                }
                $("#teacher").empty();
                $("#teacher").append(teacher);
                $("#leadership").empty();
                $("#leadership").append(leadership);
            }
        })
    }

    function getData() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/data",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function tab1(data) {
                let adjust = "";
                let supplement = "";
                for (let i = 0; i < data["adjust"].length; i++) {
                    adjust += "<tr id='" + data["adjust"][i].id + "'><td>" + (i + 1) + "</td>" +
                        "<td>" + data["adjust"][i].teacher_name + "</td>" +
                        "<td>" + data["adjust"][i].profession + "</td>" +
                        "<td>" + data["adjust"][i].grade + "</td>" +
                        "<td>" + data["adjust"][i].lesson + "</td>" +
                        "<td>" + data["adjust"][i].date + "</td>" +
                        "<td>" + data["adjust"][i].time + "</td>" +
                        "<td>" + data["adjust"][i].classroom + "</td>" +
                        "<td><input type='button' value='删除' class='btn btn-danger delete'></td>" +
                        "</tr>";
                }
                for (let i = 0; i < data["supplement"].length; i++) {
                    supplement += "<tr id='" + data["supplement"][i].id + "'><td>" + (i + 1) + "</td>" +
                        "<td>" + data["supplement"][i].teacher_name + "</td>" +
                        "<td>" + data["supplement"][i].profession + "</td>" +
                        "<td>" + data["supplement"][i].grade + "</td>" +
                        "<td>" + data["supplement"][i].lesson + "</td>" +
                        "<td>" + data["supplement"][i].date + "</td>" +
                        "<td>" + data["supplement"][i].time + "</td>" +
                        "<td>" + data["supplement"][i].classroom + "</td>" +
                        "<td><input type='button' value='删除' class='btn btn-danger delete'></td>" +
                        "</tr>";
                }
                $("#adjust").empty();
                $("#adjust").append(adjust);
                $("#supplement").empty();
                $("#supplement").append(supplement);
            }
        })
    }

    //修改按钮
    $("tbody").delegate(".upDate","click",function () {
        let attr = $(this).parents("tbody").attr("id");
        let id = $(this).parent().prevAll(".name").text();
        console.log(id);
        $('#myModal').modal('handleUpdate');
        $(".modal-body").text("确认重置？");
        $("#ok").text("重置");
        $("#myModal").modal();
        $("#ok").click(function () {
            $("#myModal").modal("hide");
            $('#myModal').modal('handleUpdate');
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/update",
                type: "post",
                data: JSON.stringify({
                    id: id,
                    table: attr
                }),
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                success: function (data) {
                    if (data === 1) {
                        toastr.success("重置成功，初始密码123456！")
                    } else {
                        toastr.warning("bug......")
                    }
                }
            })
        })
    });


    //delete
    $("tbody").delegate(".delete","click",function () {
        let attr = $(this).parents("tbody").attr("id");
        let id = $(this).parents("tr").attr("id");
        if ("undefined" === typeof id){
            id = $(this).parent().prevAll(".name").text();
        }
        $('#myModal').modal('handleUpdate');
        $(".modal-body").text("确认删除？");
        $("#ok").text("删除");
        $("#myModal").modal();
        $("#ok").click(function () {
            $("#myModal").modal("hide");
            $('#myModal').modal('handleUpdate');
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/delete",
                type: "post",
                data: JSON.stringify({
                    id: id,
                    table: attr
                }),
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                success: function (data) {
                    if (data === 1) {
                        getData();
                        getUser();
                        toastr.success("删除成功！")
                    } else {
                        toastr.warning("bug......")
                    }
                }
            })
        })
    });

    $('#myModal').on('hidden.bs.modal', function (e) {
        $("#ok").unbind();
    });

    //添加用户
    function insertTeacher() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/insertT",
            type: "post",
            data: JSON.stringify({
                teacher_account: $("#inputTAccount").val(),
                teacher_password: "123456",
                teacher_name: $("#inputTName").val(),
                teacher_college: $("#inputTCollege").val()
            }),
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function (data) {
                if (data === 1) {
                    $("form")[0].reset();
                    toastr.success("添加成功！")
                } else {
                    toastr.warning("bug......")
                }
            }
        })
    }
    function insertLeadership() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/insertL",
            type: "post",
            data: JSON.stringify({
                leadership_account: $("#inputAccount").val(),
                leadership_password: "123456",
                leadership_name: $("#inputName").val(),
                leadership_college: $("#inputCollege").val()
            }),
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function (data) {
                if (data === 1) {
                    $("form")[1].reset();
                    toastr.success("添加成功！")
                } else {
                    toastr.warning("bug......")
                }
            }
        })
    }

    //意见反馈查看
    function getFe() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/feedback",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function tab(data) {
                let feedbackD = "";
                for (let i = 0; i < data.length; i++) {
                    feedbackD += "<tr><td>" + (i + 1) + "</td>" +
                        "<td>" + data[i].account + "</td>" +
                        "<td>" + data[i].feedback + "</td>" +
                        "<td>" + data[i].date + "</td>" +
                        "</tr>";
                }
                $("#feedback").empty();
                $("#feedback").append(feedbackD);
            }
        })
    }

    //修改密码
    <%String account = request.getParameter("account");%>
    function updatePW() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/password",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "account": "<%=account%>",
                "password": $("#inputOld").val(),
                "passwordNew": $("#inputNew").val()
            }),
            success: function (data) {
                if (data === 1) {
                    $("form")[2].reset();
                    toastr.success("密码更改成功！下次登录生效。")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    //邮箱添加
    function insertEmail() {
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/email",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "email": $("#inputEmail").val(),
                "profession": $("#inputPro").val(),
                "grade": $("#inputClass").val()
            }),
            success: function (data) {
                if (data === 1) {
                    $("form")[3].reset();
                    toastr.success("添加成功！")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }
</script>
</body>
</html>