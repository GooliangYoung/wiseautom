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
            <label class="layui-label-left">项目编号<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectCode}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目名称<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectName}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目报价金额<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectOffer}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目报价金额大写<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectOfferCn}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目回款金额<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectPayments}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目回款金额大写<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectPaymentsCn}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目计划开始时间<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectPlanStartTime}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目实际开始时间<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectStartTime}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目计划结束时间<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectPlanEndTime}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目实际结束时间<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectEndTime}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目当前状态<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.projectStatus}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">项目创建时间<span class="label_span">:</span></label>
            <label class="layui-label-right">${model.createTime}</label>
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
