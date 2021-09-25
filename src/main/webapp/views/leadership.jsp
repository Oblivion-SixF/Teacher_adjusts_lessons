<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>领导端</title>
    <link rel="shortcut icon" href="../images/R215b7f60c1369de919b0592ead85b4bb.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css" type="text/css">
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

        th, td {
            text-align: center;
        }

        #div1, #div2 {
            border-bottom: 1px solid #ddd;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            padding-top: 15px;
        }

        #div4 {
            margin-top: 100px;
            text-align: center;
        }

        .item > div > p {
            word-wrap: break-word;
            word-break: break-all;
            margin-left: 5em;
            margin-right: 5em;
            margin-bottom: 1.5em;
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
            <p>欢迎你，${name}</p>
            <p id="ymd"></p>
        </div>
    </div>
    <div class="nav-div">
        <ul class="nav nav-tabs" id="test">
            <li><a href="#" onclick="getLeadershipDate()">个人中心</a></li>
            <li><a href="#" onclick="getAdjust()">调课申批</a></li>
            <li><a href="#" onclick="getSupplement()">补课确认</a></li>
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
                                已审批调课记录
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
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名</th>
                                    <th>调整至日期</th>
                                    <th>调整课节</th>
                                    <th>上课地点</th>
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
                                已确认证明记录
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>教师</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>课程名</th>
                                    <th>上课日期</th>
                                    <th>上课课节</th>
                                    <th>上课地点</th>
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
        <div id="div1" class="container-fluid" style="display: none">
            <div id="carousel-example-generic" class="carousel slide">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox" id="SQ">
                    <div class="item active" id="adjust_no">
                        <div class="col-md-8 col-md-push-2" style="text-align: center;height: 600px">
                            <span><h1 style="line-height: 500px">无待同意申请</h1></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <input class="form-control btn btn-success" type="button"
                           href="#carousel-example-generic" data-slide="next" onclick="setTimeout(nextSQC,1000)"
                           value="同意">
                </div>
                <div class="form-group col-md-6">
                    <input class="form-control btn btn-danger" type="button"
                           href="#carousel-example-generic" data-slide="next" onclick="setTimeout(nextSQE,1000)"
                           value="不同意">
                </div>
            </div>
        </div>
        <div id="div2" class="container-fluid" style="display: none">
            <div id="carousel-example-generic1" class="carousel slide">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox" id="ZM">
                    <div class="item active" id="supplement_no">
                        <div class="col-md-8 col-md-push-2" style="text-align: center;height: 600px">
                            <span><h1 style="line-height: 500px">无待确定证明</h1></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6 col-lg-offset-3">
                    <input class="form-control btn btn-success" type="button"
                           href="#carousel-example-generic1" data-slide="next" onclick="setTimeout(nextZM,1000)"
                           value="同意">
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
                            <form>
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" id="feedback"></textarea>
                                </div>
                                <div class="form-group col-md-6 col-md-push-3">
                                    <input class="form-control btn btn-success" type="button" value="提交更改"
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
        <div id="div4"><h1>你好啊，${name}!</h1></div>
    </div>
</div>


<script src="../js/jquery-3.5.1.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/toastr.min.js"></script>
<script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script>
    window.onload = function () {
        window.requestAnimationFrame(getDate)
    };

    //表格选中
    $("tbody").delegate("tr","click",function () {
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

    //获取记录
    function getLeadershipDate() {
        $.ajax({
                url: "${pageContext.request.contextPath}/leadership/me",
                type: "post",
                dataType: "json",
                data: {college: "${college}"},
                success: function table(data) {
                    let adjust = "";
                    let supplement = "";
                    for (let i = 0; i < data["adjust"].length; i++) {
                        adjust += "<tr><td>" + (i + 1) + "</td>" +
                            "<td>" + data["adjust"][i].teacher_name + "</td>" +
                            "<td>" + data["adjust"][i].profession + "</td>" +
                            "<td>" + data["adjust"][i].grade + "</td>" +
                            "<td>" + data["adjust"][i].lesson + "</td>" +
                            "<td>" + data["adjust"][i].date + "</td>" +
                            "<td>" + data["adjust"][i].time + "</td>" +
                            "<td>" + data["adjust"][i].classroom + "</td>" +
                            "</tr>";
                    }
                    for (let i = 0; i < data["supplement"].length; i++) {
                        supplement += "<tr><td>" + (i + 1) + "</td>" +
                            "<td>" + data["supplement"][i].teacher_name + "</td>" +
                            "<td>" + data["supplement"][i].profession + "</td>" +
                            "<td>" + data["supplement"][i].grade + "</td>" +
                            "<td>" + data["supplement"][i].lesson + "</td>" +
                            "<td>" + data["supplement"][i].date + "</td>" +
                            "<td>" + data["supplement"][i].time + "</td>" +
                            "<td>" + data["supplement"][i].classroom + "</td>" +
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

    //轮播禁止
    $('.carousel').carousel({
        interval: 0
    });

    //获取待办申请
    function getAdjust() {
        $("#adjust_no").prevAll().remove();
        $("#adjust_no").addClass("active");
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/adjust",
            type: "post",
            dataType: "json",
            data: {college: "${college}"},
            success: function (data) {
                if (data.length === 0) {
                    $("#carousel-example-generic").next().css("display", "none")
                } else {
                    $("#adjust_no").removeClass("active");
                    $("#carousel-example-generic").next().css("display", "block")
                    for (let i = 0; i < data.length; i++) {
                        if (i === 0) {
                            $("#adjust_no").before("<div class='active item'>" +
                                "<div style='text-align: center;border-bottom: 1px solid #ddd;margin-right: 8em;margin-left: 8em'>" +
                                "<h1 style='font-size: 70px'>调课申请表(" + (i + 1) + "/" + data.length + ")</h1>" +
                                "</div><div style='font-size: 25px;margin-top: 40px'>" +
                                "<p>姓名：<u>" + data[i].teacher_name + "</u></p>" +
                                "<p class='adjust_id' style='display: none'>" + data[i].id + "</p>" +
                                "<p>申请将<u>" + data[i].profession + "</u>专业" +
                                "<u>" + data[i].grade + "</u>班" +
                                "<u>" + data[i].lesson + "</u>课程进行调整！</p>" +
                                "<p>调整至<u>" + data[i].date + "</u>在" +
                                "<u>" + data[i].classroom + "</u>教室" +
                                "<u>" + data[i].time + "</u>课节上课</p>" +
                                "<p>申请原因：<u>" + data[i].reason + "</u></p>" +
                                "</div></div>")
                        } else {
                            $("#adjust_no").before("<div class='item'>" +
                                "<div style='text-align: center;border-bottom: 1px solid #ddd;margin-right: 8em;margin-left: 8em'>" +
                                "<h1 style='font-size: 70px'>调课申请表(" + (i + 1) + "/" + data.length + ")</h1>" +
                                "</div><div style='font-size: 25px;margin-top: 40px'>" +
                                "<p>姓名：<u>" + data[i].teacher_name + "</u></p>" +
                                "<p class='adjust_id' style='display: none'>" + data[i].id + "</p>" +
                                "<p>申请将<u>" + data[i].profession + "</u>专业" +
                                "<u>" + data[i].grade + "</u>班" +
                                "<u>" + data[i].lesson + "</u>课程进行调整！</p>" +
                                "<p>调整至<u>" + data[i].date + "</u>在" +
                                "<u>" + data[i].classroom + "</u>教室" +
                                "<u>" + data[i].time + "</u>课节上课</p>" +
                                "<p>申请原因：<u>" + data[i].reason + "</u></p>" +
                                "</div></div>")
                        }
                    }
                }
            }
        })
    }

    //获取待办证明
    function getSupplement() {
        $("#supplement_no").prevAll().remove();
        $("#supplement_no").addClass("active");
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/supplement",
            type: "post",
            dataType: "json",
            data: {college: "${college}"},
            success: function (data) {
                if (data.length === 0) {
                    $("#carousel-example-generic1").next().css("display", "none")
                } else {
                    $("#supplement_no").removeClass("active");
                    $("#carousel-example-generic1").next().css("display", "block")
                    for (let i = 0; i < data.length; i++) {
                        if (i === 0) {
                            $("#supplement_no").before("<div class='item active'>" +
                                "<div style='text-align: center;border-bottom: 1px solid #ddd;margin-right: 8em;margin-left: 8em'>" +
                                "<h1 style='font-size: 70px'>补课证明表(" + (i + 1) + "/" + data.length + ")</h1>" +
                                "</div><div style='font-size: 25px;margin-top: 40px'>" +
                                "<p>姓名：<u>" + data[i].teacher_name + "</u></p>" +
                                "<p class='adjust_id' style='display: none'>" + data[i].id + "</p>" +
                                "<p>已经对<u>" + data[i].profession + "</u>专业" +
                                "<u>" + data[i].grade + "</u>班" +
                                "<u>" + data[i].lesson + "</u>课程完成补课！</p>" +
                                "<p>补课于<u>" + data[i].date + "</u>在" +
                                "<u>" + data[i].classroom + "</u>教室" +
                                "<u>" + data[i].time + "</u>课节上课</p>" +
                                "<p>班长已确认</p>" +
                                "</div></div>")
                        } else {
                            $("#supplement_no").before("<div class='item'>" +
                                "<div style='text-align: center;border-bottom: 1px solid #ddd;margin-right: 8em;margin-left: 8em'>" +
                                "<h1 style='font-size: 70px'>补课证明表</h1>" +
                                "</div><div style='font-size: 25px;margin-top: 40px'>" +
                                "<p>姓名：<u>" + data[i].teacher_name + "</u></p>" +
                                "<p class='adjust_id' style='display: none'>" + data[i].id + "</p>" +
                                "<p>已经对<u>" + data[i].profession + "</u>专业" +
                                "<u>" + data[i].grade + "</u>班" +
                                "<u>" + data[i].lesson + "</u>课程完成补课！</p>" +
                                "<p>补课于<u>" + data[i].date + "</u>在" +
                                "<u>" + data[i].classroom + "</u>教室" +
                                "<u>" + data[i].time + "</u>课节上课</p>" +
                                "<p>班长已确认</p>" +
                                "</div></div>")
                        }
                    }
                }
            }
        })
    }

    //提交申请完成(yes) 删除上一个
    function nextSQC() {
        let modify = $("#SQ .active").prev().find(".adjust_id").text();
        $("#SQ .active").prev().remove();
        if ($("#SQ").children(".item").length === 1) {
            $("#carousel-example-generic").next().css("display", "none")
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/yes",
            type: "post",
            dataType: "json",
            data: {id: modify},
            success: function (data) {
                if (data === 1) {
                    toastr.success("同意申请！")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    //提交申请完成(no) 删除上一个
    function nextSQE() {
        let modify = $("#SQ .active").prev().find(".adjust_id").text();
        $("#SQ .active").prev().remove();
        if ($("#SQ").children(".item").length === 1) {
            $("#carousel-example-generic").next().css("display", "none")
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/no",
            type: "post",
            dataType: "json",
            data: {id: modify},
            success: function (data) {
                if (data === 1) {
                    toastr.success("未同意申请！")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    //提交证明完成 删除上一个
    function nextZM() {
        let modify = $("#ZM .active").prev().find(".adjust_id").text();
        $("#ZM .active").prev().remove();
        if ($("#ZM").children(".item").length === 1) {
            $("#carousel-example-generic1").next().css("display", "none")
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/by",
            type: "post",
            dataType: "json",
            data: {id: modify},
            success: function (data) {
                if (data === 1) {
                    toastr.success("确认成功")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    <%String account=request.getParameter("account");%>
    //意见反馈
    function insertFe() {
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/feedback",
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                "account": "<%=account%>",
                "feedback": $("#feedback").val()
            }),
            success: function x(data) {
                if (data === 1) {
                    $("form")[0].reset();
                    toastr.success("反馈提交成功！")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }

    //修改密码
    function updatePW() {
        $.ajax({
            url: "${pageContext.request.contextPath}/leadership/password",
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
                    $("form")[1].reset();
                    toastr.success("密码更改成功！下次登录生效。")
                } else {
                    toastr.warning("bug.......")
                }
            }
        })
    }
</script>
</body>
</html>