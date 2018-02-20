<!--
* 公用页面
* @author GooliangYoung
* @email 18551631365@163.com
* @date 2018-02-18 14:08:39
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-form-item">
    <label class="layui-form-label">项目<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="projectId" maxlength="36" value="${model.projectId}" lay-verify="required"
               placeholder="请输入所属项目id" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">回款金额<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="paymentMoney" maxlength="10,0" value="${model.paymentMoney}" lay-verify="required"
               placeholder="请输入回款金额" class="layui-input">
    </div>
</div>