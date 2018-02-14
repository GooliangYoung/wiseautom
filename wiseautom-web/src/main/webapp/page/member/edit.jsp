<!--
* 修改页面
* @author chenyi
* @email qq228112142@qq.com
* @date 2017-09-02 19:14:23
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
        <input type="hidden" name="id" value="${model.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">账号<span class="span_must">*</span></label>
            <div class="layui-input-normal">
                <label class="layui-label-right">${model.account}</label>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名<span class="span_must">*</span></label>
            <div class="layui-input-normal">
                <input type="text" name="name" value="${model.name}"  lay-verify="required" placeholder="请输入姓名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话<span class="span_must">*</span></label>
            <div class="layui-input-normal">
                <input type="text" name="phone"  value="${model.phone}" lay-verify="phone" placeholder="请输入电话" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱<span class="span_must">*</span></label>
            <div class="layui-input-normal">
                <input type="text" name="email" value="${model.email}" lay-verify="email" placeholder="请输入邮箱" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">会员等级<span class="span_must">*</span></label>
            <div cyType="selectTool" cyProps="codeName:'memberLevel',search:'true'" lay-verify="required"
                 name="level" value="${model.level}" class="layui-input-normal">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">余额<span class="span_must">*</span></label>
            <div class="layui-input-normal">
                <input type="text" name="amount" maxlength="10" value="${model.amount}" lay-verify="money" placeholder="请输入余额" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态<span class="span_must">*</span></label>
            <div cyType="radioTool" cyProps="codeName:'state'" name="state"
                 value="${model.state}" class="layui-input-normal"></div>
        </div>
        <%--<div class="layui-form-item">--%>
            <%--<label class="layui-form-label">上级账号<span class="label_span">:</span></label>--%>
            <%--<div class="layui-input-normal">--%>
                <%--<label class="layui-label-right">${model.parentAccount}</label>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="submit">保存</button>
                <button class="layui-btn" onclick="closeWindow()"> 返回</button>
            </div>
        </div>
    </form>
</div>
<script>
    layui.use(['form'], function () {
        var form = layui.form();
        //监听提交
        form.on('submit(submit)', function (data) {
            $.ajax({
                url: "/member/update",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify(data.field),
                async: false,
                dataType: "json",
                success: function (R) {
                    closeWindow();
                    if (R.code === 0) {
                        parent.layer.msg('操作成功 !', {icon: 1});
                    } else {
                        parent.layer.msg(R.msg, {icon: 5});
                    }
                },
                error: function () {
                    closeWindow();
                    parent.layer.msg("系统繁忙", {icon: 5});
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
