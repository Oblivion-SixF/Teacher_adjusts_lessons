<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教师端</title>
    <link rel="shortcut icon" href="../images/R215b7f60c1369de919b0592ead85b4bb.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css" type="text/css">
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css">
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
            width: 20%;
            font-size: 20px;
            text-align: center;
        }

        th, td {
            text-align: center;
        }

        .table tbody tr td {
            vertical-align: middle;
        }

        #div1, #div2 {
            border-bottom: 1px solid #ddd;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            padding-top: 15px;
        }

        #div5 {
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
            <h1 style="font-size: 70px;line-height: 160px">教师调课补课管理</h1>
        </div>
        <div class="time-div">
            <%String account = request.getParameter("account");%>
            <p>欢迎你，${name}</p>
            <p id="ymd"></p>
        </div>
    </div>
    <div class="nav-div">
        <ul class="nav nav-tabs" id="test">
            <li><a href="#" onclick="getTeacherData()">个人中心</a></li>
            <li><a href="#">调课申请</a></li>
            <li><a href="#">补课证明</a></li>
            <li><a href="#" onclick="getNoT()">邮件通知</a></li>
            <li><a href="#">其他</a></li>
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
                                我的调课记录
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名</th>
                                    <th>调整至日期</th>
                                    <th>调整课节</th>
                                    <th>上课地点</th>
                                    <th>申请状态</th>
                                    <th>通知状态</th>
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
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                                我的补课记录
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名</th>
                                    <th>上课日期</th>
                                    <th>上课课节</th>
                                    <th>上课地点</th>
                                    <th>通知状态</th>
                                    <th>确认状态</th>
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
        <div id="div1" class="container-fluid" style="display: none;">
            <form>
                <div class="form-row" id="adjust_form">
                    <div class="form-group col-md-6">
                        <label for="inputName">教师姓名</label>
                        <input type="text" class="form-control" id="inputName" value="${name}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCollege">学院</label>
                        <input type="text" class="form-control" id="inputCollege" value="${college}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputProfession">专业</label>
                        <input type="text" class="form-control" id="inputProfession" placeholder="专业">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputGrade">班级</label>
                        <input type="text" class="form-control" id="inputGrade" placeholder="班级">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputLesson">课程名称</label>
                        <input type="text" class="form-control" id="inputLesson" placeholder="课程名称">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="date">调整日期</label>
                        <input type="text" class="form-control" id="date" name="datetimepicker">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputTime">课节</label>
                        <input type="text" class="form-control" id="inputTime" placeholder="12/34/56/78">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputClassroom">地点</label>
                        <input type="text" class="form-control" id="inputClassroom" placeholder="教室地点">
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label for="inputReason">调课原因</label>
                    <textarea class="form-control" rows="3" id="inputReason"></textarea>
                </div>
                <div class="form-group col-md-6 col-md-push-3">
                    <input class="form-control btn btn-success" type="button" value="提交申请" onclick="insertAd()">
                </div>
            </form>
        </div>
        <div id="div2" class="container-fluid" style="display: none">
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName1">教师姓名</label>
                        <input type="text" class="form-control" id="inputName1" value="${name}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCollege1">学院</label>
                        <input type="text" class="form-control" id="inputCollege1" value="${college}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputProfession1">专业</label>
                        <input type="text" class="form-control" id="inputProfession1" placeholder="专业">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputGrade1">班级</label>
                        <input type="text" class="form-control" id="inputGrade1" placeholder="班级">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputLesson1">课程名称</label>
                        <input type="text" class="form-control" id="inputLesson1" placeholder="课程名称">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="date1">上课日期</label>
                        <input type="text" class="form-control" id="date1" name="datetimepicker">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputTime1">课节</label>
                        <input type="text" class="form-control" id="inputTime1" placeholder="12/34/56/78">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputClassroom1">地点</label>
                        <input type="text" class="form-control" id="inputClassroom1" placeholder="教室地点">
                    </div>
                </div>
                <div class="form-group col-md-6 col-md-push-3">
                    <input class="form-control btn btn-success" type="button" value="提交证明" onclick="insertSu()">
                </div>
            </form>
        </div>
        <div id="div3" style="display: none">
            <div class="panel-group" id="accordion1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion1"
                               href="#collapseOne1">
                                待通知调课申请
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne1" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名</th>
                                    <th>调整至日期</th>
                                    <th>调整课节</th>
                                    <th>上课地点</th>
                                    <th>通知</th>
                                </tr>
                                </thead>
                                <tbody id="SqTz">
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
                                待通知补课证明
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名</th>
                                    <th>调整至日期</th>
                                    <th>调整课节</th>
                                    <th>上课地点</th>
                                    <th>通知</th>
                                </tr>
                                </thead>
                                <tbody id="BkTz">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div4" style="display: none">
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
                            <form>
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" id="feedback"></textarea>
                                </div>
                                <div class="form-group col-md-6 col-md-push-3">
                                    <input class="form-control btn btn-success" type="button" value="提交"
                                           onclick="insertFe()">
                                </div>
                            </form>
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
                                        <input type="password" class="form-control" id="inputOld" placeholder="原密码">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputNew">新密码</label>
                                        <input type="password" class="form-control" id="inputNew" placeholder="新密码">
                                    </div>
                                </div>
                                <div class="form-row col-md-12">
                                    <div class="form-group col-md-6 col-md-push-3">
                                        <label for="inputNewTwo">确认密码</label>
                                        <input type="password" class="form-control" id="inputNewTwo" placeholder="确认密码">
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-md-push-3">
                                    <input class="form-control btn btn-success" type="button" value="提交更改"
                                           onclick="updatePW()">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div5"><h1>你好啊，${name}</h1></div>
    </div>
</div>


<script src="../js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js"></script>
<script src="../js/toastr.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        window.requestAnimationFrame(getDate);
    };

    //时间选择
    $('#date,#date1').datetimepicker({
        forceParse: 0,//设置为0，时间不会跳转1899，会显示当前时间。
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd',//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true//显示今日按钮
    });
    $("#date,#date1").datetimepicker("setDate", new Date());  //设置显示默认当天的时间

    //导航
    $(function () {
        $("#test li").click(function () {
            $(this).siblings('li').removeClass('active');  // 删除其他兄弟元素的样式
            $(this).addClass('active');
        });
    });

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
            if ($(this).index() === 4) {
                $("#div4").css("display", "block");
                $("#div4").siblings("div").css("display", "none")
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
    $("tbody").delegate("tr", "click", function () {
        if (!$(this).hasClass("success")) {
            $(this).attr("class", "success");
            $(this).siblings().removeClass("success")
        }
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

    //获取记录
    function getTeacherData() {
        $.ajax({
                url: "${pageContext.request.contextPath}/teacher/me",
                type: "post",
                dataType: "json",
                data: {account: "<%=account%>"},
                success: function table(data) {
                    let adjust = "";
                    let supplement = "";
                    for (let i = 0; i < data["adjust"].length; i++) {
                        if (data["adjust"][i].status === 0) {
                            data["adjust"][i].status = "未处理"
                        } else if (data["adjust"][i].status === 1) {
                            data["adjust"][i].status = "同意"
                        } else {
                            data["adjust"][i].status = "未同意"
                        }
                        if (data["adjust"][i].notice === 0) {
                            data["adjust"][i].notice = "未通知"
                        } else {
                            data["adjust"][i].notice = "已通知"
                        }
                        adjust += "<tr><td>" + (i + 1) + "</td>" +
                            "<td>" + data["adjust"][i].profession + "</td>" +
                            "<td>" + data["adjust"][i].grade + "</td>" +
                            "<td>" + data["adjust"][i].lesson + "</td>" +
                            "<td>" + data["adjust"][i].date + "</td>" +
                            "<td>" + data["adjust"][i].time + "</td>" +
                            "<td>" + data["adjust"][i].classroom + "</td>" +
                            "<td>" + data["adjust"][i].status + "</td>" +
                            "<td>" + data["adjust"][i].notice + "</td>" +
                            "</tr>";
                    }
                    for (let i = 0; i < data["supplement"].length; i++) {
                        if (data["supplement"][i].status === 0) {
                            data["supplement"][i].status = "未处理"
                        } else {
                            data["supplement"][i].status = "已处理"
                        }
                        if (data["supplement"][i].notice === 0) {
                            data["supplement"][i].notice = "未通知"
                        } else {
                            data["supplement"][i].notice = "已通知"
                        }
                        supplement += "<tr><td>" + (i + 1) + "</td>" +
                            "<td>" + data["supplement"][i].profession + "</td>" +
                            "<td>" + data["supplement"][i].grade + "</td>" +
                            "<td>" + data["supplement"][i].lesson + "</td>" +
                            "<td>" + data["supplement"][i].date + "</td>" +
                            "<td>" + data["supplement"][i].time + "</td>" +
                            "<td>" + data["supplement"][i].classroom + "</td>" +
                            "<td>" + data["supplement"][i].notice + "</td>" +
                            "<td>" + data["supplement"][i].status + "</td>" +
                            "</tr>";
                    }
                    $("#adjust").empty();
                    $("#adjust").append(adjust);
                    $("#supplement").empty();
                    $("#supplement").append(supplement);
                }
            }
        )
    }

    //插入申请
    function insertAd() {
        $.ajax({
                url: "${pageContext.request.contextPath}/teacher/adjust",
                type: "post",
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify({
                    "teacher_account": "<%=account%>",
                    "profession": $("#inputProfession").val(),
                    "grade": $("#inputGrade").val(),
                    "lesson": $("#inputLesson").val(),
                    "date": $("#date").val(),
                    "classroom": $("#inputClassroom").val(),
                    "time": $("#inputTime").val(),
                    "reason": $("#inputReason").val()
                }),
                success: function x(data) {
                    if (data === 1) {
                        $("form")[0].reset();
                        toastr.success("申请已提交！")
                    } else {
                        toastr.warning("bug.......")
                    }
                }

            }
        )
    }

    //插入证明
    function insertSu() {
        $.ajax({
                url: "${pageContext.request.contextPath}/teacher/supplement",
                type: "post",
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify({
                    "teacher_account": "<%=account%>",
                    "profession": $("#inputProfession1").val(),
                    "grade": $("#inputGrade1").val(),
                    "lesson": $("#inputLesson1").val(),
                    "date": $("#date1").val(),
                    "classroom": $("#inputClassroom1").val(),
                    "time": $("#inputTime1").val()
                }),
                success: function x(data) {
                    if (data === 1) {
                        $("form")[1].reset();
                        toastr.success("证明已提交！")
                    } else {
                        toastr.warning("bug.......")
                    }
                }

            }
        )
    }

    //意见反馈
    function insertFe() {
        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/feedback",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "account": "<%=account%>",
                "feedback": $("#feedback").val()
            }),
            success: function x(data) {
                if (data === 1) {
                    $("form")[2].reset();
                    toastr.success("反馈已提交！")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    //修改密码
    function updatePW() {
        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/password",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "account": "<%=account%>",
                "password": $("#inputOld").val(),
                "passwordNew": $("#inputNew").val()
            }),
            success: function x(data) {
                if (data === 1) {
                    $("form")[3].reset();
                    toastr.success("密码更改成功！下次登录生效。")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    //通知
    function getNoT() {
        $.ajax({
                url: "${pageContext.request.contextPath}/teacher/advice",
                type: "post",
                dataType: "json",
                data: {account: "<%=account%>"},
                success: function table(data) {
                    let SqTz = "";
                    let BkTz = "";
                    for (let i = 0; i < data["adjust"].length; i++) {
                        SqTz += "<tr id='" + data["adjust"][i].id + "'>><td>" + (i + 1) + "</td>" +
                            "<td>" + data["adjust"][i].profession + "</td>" +
                            "<td>" + data["adjust"][i].grade + "</td>" +
                            "<td>" + data["adjust"][i].lesson + "</td>" +
                            "<td>" + data["adjust"][i].date + "</td>" +
                            "<td>" + data["adjust"][i].time + "</td>" +
                            "<td>" + data["adjust"][i].classroom + "</td>" +
                            "<td><input type='button' value='通知' class='btn btn-success notice'></td>" +
                            "</tr>";
                    }
                    for (let i = 0; i < data["supplement"].length; i++) {
                        BkTz += "<tr id='" + data["supplement"][i].id + "'>><td>" + (i + 1) + "</td>" +
                            "<td>" + data["supplement"][i].profession + "</td>" +
                            "<td>" + data["supplement"][i].grade + "</td>" +
                            "<td>" + data["supplement"][i].lesson + "</td>" +
                            "<td>" + data["supplement"][i].date + "</td>" +
                            "<td>" + data["supplement"][i].time + "</td>" +
                            "<td>" + data["supplement"][i].classroom + "</td>" +
                            "<td><input type='button' value='通知' class='btn btn-success notice'></td>" +
                            "</tr>";
                    }
                    $("#SqTz").empty();
                    $("#SqTz").append(SqTz);
                    $("#BkTz").empty();
                    $("#BkTz").append(BkTz);
                }
            }
        )
    }

    //邮件通知按钮
    $("#BkTz,#SqTz").delegate(".notice", "click", function () {
        let attr = $(this).parents("tbody").attr("id");
        let id = $(this).parents("tr").attr("id");
        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/notice",
            type: "post",
            data: JSON.stringify({
                type: attr,
                id: id,
                profession: $(this).parent().siblings().eq(1).text(),
                grade: $(this).parent().siblings().eq(2).text(),
                lesson: $(this).parent().siblings().eq(3).text(),
                date: $(this).parent().siblings().eq(4).text(),
                time: $(this).parent().siblings().eq(5).text(),
                classroom: $(this).parent().siblings().eq(6).text(),
            }),
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function (data) {
                if (data === 1) {
                    getNoT();
                    toastr.success("通知成功！")
                } else {
                    toastr.warning("bug......")
                }
            }
        })
    });
</script>
</body>
</html>