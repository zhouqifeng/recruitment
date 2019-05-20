<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>查询列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-nav">
    <span class="layui-breadcrumb">
        <a><cite>高级查询</cite></a>
        <a><cite>${user.company}</cite></a>
    </span>
        <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form" onsubmit="return false;">
            <div class="layui-inline">
                <input type="text" id="xm" name="xm" placeholder="姓名" class="layui-input">
            </div>
            <div class="layui-inline">
                <input type="text" id="msrq" name="msrq" placeholder="面试日期" lay-verify="date" class="layui-input">
                <input type="hidden" id="ypgs" name="ypgs" value="${user.company}" class="layui-input">
            </div>
            <button class="layui-btn" id="findButton" data-type="reload" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            <button class="layui-btn" onclick="WeAdminShow('添加应聘人','./addPerson',400,400)"><i class="layui-icon">&#xe61f;</i>添加应聘人</button>
        </form>
    </div>
    <%--表格容器--%>
    <table class="layui-hide" lay-filter="test" id="articleList" ></table>

</div>
<script type="text/html" id="barlist">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">清除</a>
</script>
<script>
    layui.extend({
        admin: '{/}./static/js/admin'
    });
    layui.use(['jquery','admin','table','laydate'], function() {
        var $ = layui.jquery,
            admin = layui.admin,
            laydate = layui.laydate,
            table = layui.table;

        //日期
        laydate.render({
            elem: '#msrq'
        });

        table.render({
            //elem\url\cols表格属性
            //type\field\title 表头属性
            //将数据绑定到这个容器上
            elem: '#articleList',
            //表头
            cols:[[
                //10.30
                {field: 'xm', title: '姓名',sort: true,width: '7%'},
                {field: 'sj', title: '手机',sort: true,width: '10%'},
                {field: 'msrq', title: '面试日期',sort: true },
                {field: 'xb', title: '性别',sort: true,width: '7%'},
                {field: 'sfzh', title: '身份证号',sort: true,width: '17%'},
                {field: 'jg', title: '籍贯',sort: true,width: '7%'},
                {field: 'zgxl', title: '最高学历',sort: true,width: '7%'},
                {field: 'zy', title: '专业',sort: true,width: '10%'},
                {field: 'kksgzrq', title: '可开始工作日期',sort: true,width: '10%'},
                {fixed: 'right',title:'操作',width:160,align:'center',toolbar:"#barlist"}
            ]],
            page: true,
            limits: [15,30,50,100]
        });

        //定义了一个空对象
        var active = {
            reload: function () {
                //带条件重新加载表格
                var xm = $('#xm').val();
                var msrq = $('#msrq').val();
                var ypgs = $('#ypgs').val();

                table.reload('articleList',{

                    //发送这个异步请求到后台,从上面移下来的
                    url:'./find',
                    //where
                    where:{
                        xm:xm,
                        msrq:msrq,
                        ypgs:ypgs
                    },
                    page: {
                        curr: 1
                    }
                });
            }
        };

        //搜索按钮的点击事件，跟上面代码相关联
        $('#findButton').click(function () {
            //获取按钮的data-type的值
            //find
            var type = $(this).data('type');
            //在js存在一个对象，对象叫active
            active[type] ? active[type].call(this) : '';
        });

        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'delete'){
                layer.confirm('确认清除吗?', {icon: 3, title:'提示'}, function(index){
                    $.post(
                        './deletePersonInfo',
                        {
                            'sj' : data.sj
                        },
                        //success:异步请求执行成功之后的回调函数
                        function(data){
                            //至少更新一条记录
                            if (data > 0) {
                                //停留在原来页面刷新,使用的是分页按钮
                                $('.layui-laypage-btn').click();
                                layer.msg("清除成功！", {icon: 6});
                            }
                        }
                    );
                    layer.close(index);
                });
            }else if(layEvent === 'edit'){ //查看
                //do somehing
                //layer.msg('ID：' + data.id + ' 的编辑操作');
                location.href="./editPersonInfo?sj=" + data.sj + "&xm=" + data.xm;
            }
        });
    });

</script>
</body>

</html>