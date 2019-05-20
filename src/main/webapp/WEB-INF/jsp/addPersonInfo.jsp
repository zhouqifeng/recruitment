<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人信息录入</title>
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
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a>欢迎您！${person.xm}</a>
    </div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a>
                    <i class="layui-icon layui-icon-home"></i>
                    <cite>应聘人员申请表</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content"  style="overflow:auto">
    <form class="layui-form" lay-filter="formtest">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>个人信息</legend>
        </fieldset>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="xm" class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="xm" name="xm" lay-verify="required" class="layui-input" value=${person.xm} readonly="readonly">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生年月日</label>
                <div class="layui-input-inline">
                    <input type="text" name="csnyr" id="csnyr" lay-verify="date|required" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select name="xb" id="xb" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="sg" class="layui-form-label">身高</label>
                <div class="layui-input-inline">
                    <input type="text" id="sg" name="sg" placeholder="米" lay-verify="sg|required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="tz" class="layui-form-label">体重</label>
                <div class="layui-input-inline">
                    <input type="text" id="tz" name="tz" placeholder="KG" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="xqah" class="layui-form-label">兴趣爱好</label>
                <div class="layui-input-inline">
                    <input type="text" id="xqah" name="xqah" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="sj" class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                    <input type="text" id="sj" name="sj" lay-verify="required|phone" class="layui-input" value=${person.sj} readonly="readonly">
                </div>
            </div>
            <div class="layui-inline">
                <label for="yx" class="layui-form-label">Email</label>
                <div class="layui-input-inline">
                    <input type="text" id="yx" name="yx" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="hy" class="layui-form-label">婚育</label>
                <div class="layui-input-inline">
                    <input type="text" id="hy" name="hy" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="jg" class="layui-form-label">籍贯</label>
                <div class="layui-input-inline">
                    <input type="text" id="jg" name="jg" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="hj" class="layui-form-label">户籍</label>
                <div class="layui-input-inline">
                    <input type="text" id="hj" name="hj" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="bysgwzw" class="layui-form-label">毕业时职务</label>
                <div class="layui-input-inline">
                    <input type="text" id="bysgwzw" name="bysgwzw" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">最高学历</label>
                <div class="layui-input-inline">
                    <select name="zgxl" id="zgxl" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="小学">小学</option>
                        <option value="初中">初中</option>
                        <option value="中专/高中">中专/高中</option>
                        <option value="专科">专科</option>
                        <option value="本科">本科</option>
                        <option value="研究生">研究生</option>
                        <option value="博士">博士</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label for="byyx" class="layui-form-label">毕业院校</label>
                <div class="layui-input-inline">
                    <input type="text" id="byyx" name="byyx" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="zy" class="layui-form-label">专业</label>
                <div class="layui-input-inline">
                    <input type="text" id="zy" name="zy" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="xz" class="layui-form-label">学制</label>
                <div class="layui-input-inline">
                    <input type="text" id="xz" name="xz" placeholder="例：4年全日制本科" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">学位</label>
                <div class="layui-input-inline">
                    <select name="xw" id="xw" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="无">无</option>
                        <option value="学士学位">学士学位</option>
                        <option value="硕士学位">硕士学位</option>
                        <option value="博士学位">博士学位</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label for="bynyr" class="layui-form-label">毕业年月日</label>
                <div class="layui-input-inline">
                    <input type="text" name="bynyr" id="bynyr" lay-verify="date|required" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">政治面貌</label>
                <div class="layui-input-inline">
                    <select name="zzmm" id="zzmm" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="中共党员">中共党员</option>
                        <option value="中共预备党员">中共预备党员</option>
                        <option value="共青团员">共青团员</option>
                        <option value="民革党员">民革党员</option>
                        <option value="民盟盟员">民盟盟员</option>
                        <option value="民建会员">民建会员</option>
                        <option value="民进会员">民进会员</option>
                        <option value="农工党党员">农工党党员</option>
                        <option value="致公党党员">致公党党员</option>
                        <option value="九三学社社员">九三学社社员</option>
                        <option value="台盟盟员">台盟盟员</option>
                        <option value="无党派人士 ">无党派人士</option>
                        <option value="群众">群众</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label for="rdnyr" class="layui-form-label">入党年月日</label>
                <div class="layui-input-inline">
                    <input type="text" name="rdnyr" id="rdnyr" placeholder="yyyy-MM-dd" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="jszc" class="layui-form-label">技术职称</label>
                <div class="layui-input-inline">
                    <input type="text" id="jszc" name="jszc" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="sfzh" class="layui-form-label">身份证号</label>
                <div class="layui-input-inline">
                    <input type="text" id="sfzh" name="sfzh" lay-verify="required|isIDCard" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="mz" class="layui-form-label">民族</label>
                <div class="layui-input-inline">
                    <input type="text" id="mz" name="mz" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="dywyjb" class="layui-form-label">外语级别</label>
                <div class="layui-input-inline">
                    <input type="text" id="dywyjb" name="dywyjb" placeholder="第一外语级别" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="jsjsp" class="layui-form-label">计算机水平</label>
                <div class="layui-input-inline">
                    <input type="text" id="jsjsp" name="jsjsp" placeholder="应届生必填" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="pm" class="layui-form-label">成绩排名</label>
                <div class="layui-input-inline">
                    <input type="text" id="pm" name="pm" placeholder="班级/年级" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="lxdz" class="layui-form-label">联系地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="lxdz" name="lxdz" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="jtdz" class="layui-form-label">家庭地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="jtdz" name="jtdz" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="jwbs" class="layui-form-label">既往病史</label>
            <div class="layui-input-block">
                <input type="text" id="jwbs" name="jwbs" class="layui-input">
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>家庭成员基本情况</legend>
        </fieldset>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="fq" class="layui-form-label">父亲</label>
                <div class="layui-input-inline">
                    <input type="text" id="fq" name="fq" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzdw1" class="layui-form-label">工作单位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzdw1" name="gzdw1" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="lxfs3" class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="lxfs3" name="lxfs3" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="mq" class="layui-form-label">母亲</label>
                <div class="layui-input-inline">
                    <input type="text" id="mq" name="mq" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzdw2" class="layui-form-label">工作单位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzdw2" name="gzdw2" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="lxfs4" class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="lxfs4" name="lxfs4" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="xmpo" class="layui-form-label">兄妹/配偶</label>
                <div class="layui-input-inline">
                    <input type="text" id="xmpo" name="xmpo" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzdw3" class="layui-form-label">工作单位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzdw3" name="gzdw3" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="lxfs5" class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="lxfs5" name="lxfs5" class="layui-input">
                </div>
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>工作简历（社会实践）</legend>
        </fieldset>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj1" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj1" name="qzsj1" placeholder="2019.01.01-2019.12.12" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzjl1" class="layui-form-label">单位、岗位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzjl1" name="gzjl1" placeholder="XXXX" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj2" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj2" name="qzsj2" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzjl2" class="layui-form-label">单位、岗位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzjl2" name="gzjl2" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj3" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj3" name="qzsj3" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzjl3" class="layui-form-label">单位、岗位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzjl3" name="gzjl3" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj4" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj4" name="qzsj4" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzjl4" class="layui-form-label">单位、岗位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzjl4" name="gzjl4" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj5" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj5" name="qzsj5" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="gzjl5" class="layui-form-label">单位、岗位</label>
                <div class="layui-input-inline">
                    <input type="text" id="gzjl5" name="gzjl5" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="zmr1" class="layui-form-label">证明人</label>
                <div class="layui-input-inline">
                    <input type="text" id="zmr1" name="zmr1" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="lxfs1" class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="lxfs1" name="lxfs1" class="layui-input">
                </div>
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>学习简历（从高中开始）</legend>
        </fieldset>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj6" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj6" name="qzsj6" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="xxjl6" class="layui-form-label">学校及专业</label>
                <div class="layui-input-inline">
                    <input type="text" id="xxjl6" name="xxjl6" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj7" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj7" name="qzsj7" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="xxjl7" class="layui-form-label">学校及专业</label>
                <div class="layui-input-inline">
                    <input type="text" id="xxjl7" name="xxjl7" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="qzsj8" class="layui-form-label">起止时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="qzsj8" name="qzsj8" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="xxjl8" class="layui-form-label">学校及专业</label>
                <div class="layui-input-inline">
                    <input type="text" id="xxjl8" name="xxjl8" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="zmr2" class="layui-form-label">证明人</label>
                <div class="layui-input-inline">
                    <input type="text" id="zmr2" name="zmr2" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="lxfs2" class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="lxfs2" name="lxfs2" class="layui-input">
                </div>
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>求职意向</legend>
        </fieldset>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="sqzw1" class="layui-form-label">所求职位1</label>
                <div class="layui-input-inline">
                    <input type="text" id="sqzw1" name="sqzw1" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="sqzw2" class="layui-form-label">所求职位2</label>
                <div class="layui-input-inline">
                    <input type="text" id="sqzw2" name="sqzw2" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">求职理由</label>
            <div class="layui-input-block">
                <input type="text" name="ly" style="display: none">
                <input type="checkbox" lay-filter="ly" value="发展空间" title="发展空间">
                <input type="checkbox" lay-filter="ly" value="薪水待遇" title="薪水待遇">
                <input type="checkbox" lay-filter="ly" value="企业规模" title="企业规模">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="srqw" class="layui-form-label">收入期望</label>
                <div class="layui-input-inline">
                    <input type="text" id="srqw" name="srqw" placeholder="税前   万元/年" lay-verify="sr|required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label for="kksgzrq" class="layui-form-label">可工作日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="kksgzrq" id="kksgzrq" lay-verify="date|required" placeholder="或可实习日期" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="jsqw" class="layui-form-label">晋升期望</label>
                <div class="layui-input-inline">
                    <input type="text" id="jsqw" name="jsqw" lay-verify="required" placeholder="职位、时间" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="pxqw" class="layui-form-label">培训期望</label>
                <div class="layui-input-inline">
                    <input type="text" id="pxqw" name="pxqw" lay-verify="required" placeholder="职位、时间" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">考公情况</label>
                <div class="layui-input-inline">
                    <select name="kgqk" id="kgqk" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="准备中">准备中</option>
                        <option value="未考虑">未考虑</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">考研情况</label>
                <div class="layui-input-inline">
                    <select name="kyqk" id="kyqk" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="准备中">准备中</option>
                        <option value="未考虑">未考虑</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">公司内亲属</label>
                <div class="layui-input-inline" id="IsPurchased" >
                    <input type="radio"  name="zxqs" value="有" title="有" lay-filter="zxqs"/>
                    <input type="radio"  name="zxqs" value="无" title="无" lay-filter="zxqs" checked/>
                </div>
                <div class="layui-input-inline">
                    <input type="text" id="zxqsxm" style="display:none" name="zxqsxm" placeholder="亲属姓名" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="sm1" class="layui-form-label">列举三本书</label>
                <div class="layui-input-inline">
                    <input type="text" id="sm1" name="sm1" lay-verify="required" placeholder="最近您看的书名1" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="text" id="sm2" name="sm2" lay-verify="required" placeholder="最近您看的书名2" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="text" id="sm3" name="sm3" lay-verify="required" placeholder="最近您看的书名3" class="layui-input">
                </div>
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>应聘信息</legend>
        </fieldset>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">应聘公司</label>
                <div class="layui-input-inline">
                    <input type="text" name="ypgs" id="ypgs" class="layui-input" readonly="readonly" value=${person.ypgs} >
                </div>
            </div>
            <div class="layui-inline">
                <label for="msrq" class="layui-form-label">面试日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="msrq" id="msrq" class="layui-input" readonly="readonly" value=${person.msrq} >
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label for="code" class="layui-form-label">提交码</label>
                <div class="layui-input-inline">
                    <input type="text" id="code" name="code" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">提交</button>
            </div>
        </div>

    </form>
</div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright" style="text-align:center;"></div>
</div>
<!-- 底部结束 -->
<script>
    layui.extend({
        admin: '{/}./static/js/admin'
    });
    layui.use(['form', 'jquery', 'layer', 'laydate'], function() {
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate,
            layer = layui.layer;

        //日期
        laydate.render({
            elem: '#csnyr'
        });
        laydate.render({
            elem: '#bynyr'
        });
        laydate.render({
            elem: '#rdnyr'
        });
        laydate.render({
            elem: '#kksgzrq'
        });
        laydate.render({
            elem: '#sqrq'
        });

        //自定义验证规则
        form.verify({
            sg:[/^[1-2]\.\d{1,2}$/,'填写数字即可，单位为米，请核对'],
            sr:[/^\d{1,3}$/,'填写数字即可，单位为万元/年，请核对'],
            phone: [/^((13[0-9])|(17[0-1,6-8])|(15[^4,\\D])|(18[0-9]))\d{8}$/,'手机号码不符合格式'],
            isIDCard: [/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,'身份证号不符合格式']
        });

        //监听复选框
        form.on('checkbox(ly)', function (data) {
            var ly = $('input[name="ly"]'),
                value = data.value,
                array = ly.val().split("/");

            if (data.elem.checked) {
                ly.val(ly.val() + value + "/");
            } else {
                var newly = "";
                for (var i = 0; i < array.length; i++) {
                    var str = array[i];
                    newly += (str !== value && str !== "" && str !== null) ? str + "/" : "";
                }
                ly.val(newly);
            }
        });

        form.on('radio(zxqs)', function(){

            if($('#IsPurchased input[name="zxqs"]:checked').val() === "无"){
                $("#zxqsxm").hide();
            }else{
                $("#zxqsxm").show();
            }

        });

        $('input[name="sfzh"]').blur(function(){
            if($('input[name="sfzh"]').val() !== ''){
                $.ajax({
                    type: 'post',
                    url: './searchSfzh', // ajax请求路径
                    // contentType: "application/json; charset=utf-8",
                    // 注释掉contentType是因为后台是用参数接受，不是用类接收
                    // 如果写了，那么后端就无法识别参数，产生400错误
                    data: {
                        "sfzh": $('input[name="sfzh"]').val()
                    },
                    dataType: "text",
                    success : function(data) {
                        if (data.trim() === "error") {
                            $('#sfzh').val("");
                            layer.msg('该身份证号已存在', {icon: 5});
                        }
                    }
                });
            }
        });

        // $('input[name="sj"]').blur(function(){
        //     if($('input[name="sj"]').val() !== ''){
        //         $.ajax({
        //             type: 'post',
        //             url: './searchSj', // ajax请求路径
        //             // contentType: "application/json; charset=utf-8",
        //             data: {
        //                 "sj": $('input[name="sj"]').val()
        //             },
        //             dataType: "text",
        //             success : function(data) {
        //                 if (data.trim() === "error") {
        //                     $('#sj').val("");
        //                     layer.msg('该手机号已存在', {icon: 5});
        //                 }
        //             }
        //         });
        //     }
        // });

        // 失去焦点时判断值为空不验证，一旦填写必须验证
        $('input[name="rdnyr"]').blur(function(){
            //这里是失去焦点时的事件
            if($('input[name="rdnyr"]').val()){
                $('input[name="rdnyr"]').attr('lay-verify','date');
            }else{
                $('input[name="rdnyr"]').removeAttr('lay-verify');
            }
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
                url: './addPersonInfo', // ajax请求路径
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(f),
                dataType: "text", // "text":返回纯文本字符串;"json":返回JSON数据
                async: true,
                success: function(data){
                    console.log(2);
                    if(data.trim() === "ok") {
                        layer.alert("增加成功", {icon: 6});
                    }else if(data.trim() === "modify") {
                        layer.alert('修改成功', {icon: 6});
                    }else if(data.trim() === "useOff") {
                        layer.alert('提交码无效', {icon: 5});
                    }else{
                        layer.alert('提交码错误', {icon: 5});
                    }
                }
            });

            return false;
        });

        form.render();

        $('#csnyr').val('2019-04-18');
        $('#bynyr').val('2019-04-18');
        $('#rdnyr').val('2019-04-18');
        $('#kksgzrq').val('2019-04-18');
        $('#sqrq').val('2019-04-18');
        $('#sqzw1').val('所求职位1');$('#sqzw2').val('所求职位2');
        $('#mz').val('汉族');

        $('#yx').val('1767520914@qq.com');$('#hy').val('未婚未育');
        $('#jg').val('萧山');$('#hj').val('萧山');$('#bysgwzw').val('IT部长');
        $('#byyx').val('浙江工业大学');$('#zy').val('信息管理');
        $('#xz').val('4年全日制');
        $('#jszc').val('无');
        $('#dywyjb').val('英语四级');$('#jsjsp').val('二级');$('#pm').val('10/100');
        $('#lxdz').val('萧山');$('#jtdz').val('萧山');
        $('#sg').val('1.73');$('#tz').val('70');$('#xqah').val('广泛');
        $('#jwbs').val('无');
        $('#qzsj1').val('2019.01.01-2019.12.12');$('#gzjl1').val('杭州公司或者学校');
        $('#qzsj2').val('2019.01.01-2019.12.12');$('#gzjl2').val('杭州公司或者学校');
        $('#qzsj3').val('2019.01.01-2019.12.12');$('#gzjl3').val('杭州公司或者学校');
        $('#qzsj4').val('2019.01.01-2019.12.12');$('#gzjl4').val('杭州公司或者学校');
        $('#qzsj5').val('2019.01.01-2019.12.12');$('#gzjl5').val('杭州公司或者学校');
        $('#qzsj6').val('2019.01.01-2019.12.12');$('#xxjl6').val('杭州公司或者学校');
        $('#qzsj7').val('2019.01.01-2019.12.12');$('#xxjl7').val('杭州公司或者学校');
        $('#qzsj8').val('2019.01.01-2019.12.12');$('#xxjl8').val('杭州公司或者学校');
        $('#zmr1').val('证明人1');$('#lxfs1').val('17816874933');
        $('#zmr2').val('证明人2');$('#lxfs2').val('17816874933');
        $('#srqw').val('10');
        $('#jsqw').val('五年经理');
        $('#pxqw').val('一周一次');
        $('#fq').val('父亲');$('#gzdw1').val('萧山');$('#lxfs3').val('17816874933');
        $('#mq').val('母亲');$('#gzdw2').val('萧山');$('#lxfs4').val('17816874933');
        $('#xmpo').val('妹妹');$('#gzdw3').val('萧山');$('#lxfs5').val('17816874933');

        $('#sm1').val('书名1');$('#sm2').val('书名2');$('#sm3').val('书名3');

        $("select[name=xb]").val('男');
        $("#zgxl").val("本科");
        $("#xw").val("学士学位");
        $("#zzmm").val("中共党员");
        $("#kgqk").val("未考虑");
        $("#kyqk").val("未考虑");

        form.render('select');

    });
</script>
</body>

</html>