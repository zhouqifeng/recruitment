<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>增加个人信息</title>
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
<div class="weadmin-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="xm" class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="xm" name="xm" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="sj" class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                    <input type="text" id="sj" name="sj" lay-verify="required|phone" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="msrq" class="layui-form-label">面试日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="msrq" id="msrq" lay-verify="required|msrq" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="ypgs" class="layui-form-label">应聘公司</label>
                <div class="layui-input-inline">
                    <input type="text" name="ypgs" id="ypgs" class="layui-input"  readonly="readonly" value=${user.company}>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">新增</button>
            </div>
        </div>

    </form>
</div>
<script>
    layui.extend({
        admin: '{/}./static/js/admin'
    });
    layui.use(['form', 'jquery','util','admin', 'layer'], function() {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            isIDCard: [/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,'身份证号不符合格式'],
            phone: [/^((13[0-9])|(17[0-1,6-8])|(15[^4,\\D])|(18[0-9]))\d{8}$/,'手机号码不符合格式'],
            msrq: [/^\d{4}\-\d{2}\-\d{2}$/,'日期不符合格式']
        });

        //监听提交
        form.on('submit(add)', function(data) {
            //console.log(data.field);
            var f = data.field;
            console.log(JSON.stringify(f));
            //console.log(f.sex);
            //var sex = $('input:radio[name="sex"]:checked').val();
            console.log(1);
            //发异步，把数据提交给后台
            $.ajax({
                type: 'post',
                url: './addPerson', // ajax请求路径
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(f),
                dataType: "text", // "text":返回纯文本字符串;"json":返回JSON数据
                async: true,
                success: function(data){
                    console.log(2);
                    if(data.trim() === "ok") {
                        layer.alert("新增成功", {icon: 6}, function() {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            // 关闭当前frame
                            parent.layer.close(index);
                            // 继承条件刷新表格
                            parent.layui.table.reload('articleList');
                        });
                    }else if(data.trim() === "error") {
                        layer.alert('手机号不允许重复', {icon: 5});
                    }
                }
            });

            return false;
        });

        form.render();

    });
</script>
</body>

</html>