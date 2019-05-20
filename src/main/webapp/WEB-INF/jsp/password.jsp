<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户设置</title>
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
        <a><cite>密码管理</cite></a>
        <a><cite>修改密码</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="weadmin-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="oldpassword" class="layui-form-label">初始密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="oldpassword" name="oldpassword" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="newpassword" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="newpassword" name="newpassword" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="repassword" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="repassword" name="repassword" lay-verify="required" class="layui-input">
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
        form.on('submit(update)', function() {

            if($("#repassword").val() != '' && $("#newpassword").val() != '' && $("#repassword").val() != $("#newpassword").val()){
                layer.alert('两次密码不相同', {icon: 5});
                $("#newpassword").val('');
                $("#repassword").val('');

                return false;
            }

            //发异步，把数据提交给后台
            $.ajax({
                type: 'post',
                url: './updatePassword', // ajax请求路径
                //contentType: "application/json; charset=utf-8",
                data: {
                    "oldpassword":$("#oldpassword").val(),
                    "newpassword":$("#newpassword").val()
                },
                dataType: "text", // "text":返回纯文本字符串;"json":返回JSON数据
                async: true,
                success: function(data){
                    if(data.trim() === "ok") {
                        $("#oldpassword").val('');
                        $("#newpassword").val('');
                        $("#repassword").val('');
                        layer.alert("修改密码成功！", {icon: 6});
                    }else{
                        $("#oldpassword").val('');
                        layer.alert("初始密码不正确！", {icon: 5});
                    }
                }
            });

            return false;
        });

    });

</script>
</body>
</html>