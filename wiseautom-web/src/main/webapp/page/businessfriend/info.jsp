<!--
* 详情页面
* @author GooliangYoung
* @email 18551631365@163.com
* @date 2018-02-18 14:08:39
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<div class="layui-field-box">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-label-left">姓名<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.friendName}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">电话<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.friendPhone}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">邮箱<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.friendEmail}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">地址<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.friendAddress}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">公司<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.friendCompany}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">备注<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.remark}</label>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {
        var labels = $(".layui-label-right");
        for (var i = 0; i < labels.length; i++) {
            if ($(labels[i]).html() == "") {
                $(labels[i]).html("-");
            }
        }
    });
</script>
</body>
</html>
