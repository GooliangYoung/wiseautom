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
            <label class="layui-label-left">项目<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectId}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">回款金额<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.paymentMoney}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">回款金额大写<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.paymentMoneyCn}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">余款<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.surplusMoney}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">回款日期<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.paymentDate}</label>
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
