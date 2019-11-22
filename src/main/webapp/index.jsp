<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/plugins/bootstraptable/dist/bootstrap-table.min.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 20px">
        <label>产品名称：</label>
        <input type="text" id="search-keyword" style="margin-right: 20px"/>
        <input type="date" id="begin_time" style="margin-right: 20px">
        <input type="date" id="end_time" style="margin-right: 20px">
        <select id="search_type" style="margin-right: 40px">

        </select>
        <input type="button" id="search-button" class="btn btn-success" placeholder="搜索" value="查询">
    </div>
    <hr>
    <div class="row">
        <button data-toggle="modal" id="add" data-target="#myModal1" class="btn btn-primary">增加</button>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel-well text-center">
                <h2>产品列表</h2>
            </div>
            <table id="table"></table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/plugins/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/plugins/popper/popper.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/plugins/bootstraptable/dist/bootstrap-table.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/plugins/bootstraptable/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">

    $(function () {
        initTable();
    });

    function initTable() {
        $('#table').bootstrapTable({
            url: "${pageContext.request.contextPath }/pro/list",
            method: 'get',//请求方式
            contentType: "application/x-www-form-urlencoded",
            sortOrder: "desc",
            uniqueId: "pid", // 每一行的唯一标识，一般为主键列
            striped: true, //是否显示行间隔色
            pagination: true, // 是否分页
            sidePagination: "server",//分页方式：client客户端分页，server服务端分页（*）
            striped: true, // 是否显示行间隔色t
            pagination: true, // 是否分页
            pageSize: 5,
            pageList: [5, 10, 20],
            queryParams: function (params) {//自定义参数，这里的参数是传给后台的，分页用的
                return {//params是table提供的
                    offset: params.offset,//从数据库第几条记录开始
                    limit: params.limit,//找多少条
                    name: $('#search-keyword').val()//搜索的关键词
                };
            },
            responseHandler: function (data) {
                //响应处理器 ->让结果和需要匹配
                console.log(data);
                return {
                    "rows": data.result.list,
                    'total': data.result.total
                }
            },
            columns: [{
                field: 'pid',
                title: '产品编号'
            }, {
                field: 'pname',
                title: '产品名称'
            }, {
                field: 'price',
                title: '价格'
            }, {
                field: 'unit',
                title: '单位'
            }, {
                field: 'pdate',
                title: '生产日期',
                //——修改——获取日期列的值进行转换
                formatter: function (value, row, index) {
                    return changeDateFormat(value)
                }
            }, {
                field: 'taxrate',
                title: '税率'
            },{
                field: 'pid',
                title: '操作',
                formatter: operation
            }]
        });
    }




    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        var dateVal = cellval + "";
        if (cellval != null) {
            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

            return date.getFullYear() + "-" + month + "-" + currentDate;
        }
    }

    //增加修改，删除按钮
    function operation(value, row, index) {
        var htm = "<button class='btn btn-info'>修改</button>" +
            "<button class='btn btn-danger'>删除</button>"
        return htm;
    }



    //模糊查询
    $("#search-button").click(function () {
        $('#table').bootstrapTable(('refresh')); // 很重要的一步，刷新url！
        $('#search-keyword').val()
    })

</script>
</html>
