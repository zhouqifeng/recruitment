<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>安全设置</title>
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
        <a><cite>安全管理</cite></a>
        <a><cite>安全设置</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="url" class="layui-form-label">URL</label>
                <div class="layui-input-inline">
                    <input type="text" id="url" name="url" lay-verify="required" class="layui-input" value=${security.url}>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="code" class="layui-form-label">提交验证码</label>
                <div class="layui-input-inline">
                    <input type="text" id="code" name="code" lay-verify="required" class="layui-input" value=${security.code}>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="num" class="layui-form-label">可用次数</label>
                <div class="layui-input-inline">
                    <input type="text" id="num" name="num" lay-verify="required" class="layui-input" value=${security.num}>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="update" lay-submit="">修改</button>
            </div>
        </div>
    </form>

</div>
<script>
    layui.extend({
        admin: '{/}./static/js/admin'
    });
    layui.use(['admin','table','jquery','form'], function(){
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;

        //监听提交
        form.on('submit(update)', function(data) {
            var f = data.field;
            //发异步，把数据提交给后台
            $.ajax({
                type: 'post',
                url: './updateSecurity', // ajax请求路径
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(f),
                dataType: "text", // "text":返回纯文本字符串;"json":返回JSON数据
                async: true,
                success: function(data){
                    if(data.trim() === "ok") {
                        layer.alert("修改成功！", {icon: 6});
                    }
                }
            });

            return false;
        });

        $('input[name="code"]').blur(function(){
            if($('input[name="code"]').val() != ''){
                $.ajax({
                    type: 'post',
                    url: './searchCode', // ajax请求路径
                    // contentType: "application/json; charset=utf-8",
                    // 注释掉contentType是因为后台是用参数接受，不是用类接收
                    // 如果写了，那么后端就无法识别参数，产生400错误
                    data: {
                        "code": $('input[name="code"]').val()
                    },
                    dataType: "text",
                    success : function(data) {
                        if (data.trim() === "error") {
                            $('#code').val("");
                            layer.msg('验证码重复', {icon: 5});
                        }
                    }
                });
            }
        });

    });

</script>
</body>
</html>