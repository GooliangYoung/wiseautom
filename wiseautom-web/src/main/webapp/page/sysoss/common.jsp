<!--
* 公用页面
* @author chenyi
* @email 228112142@qq.com
* @date 2017-12-13 10:07:04
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="layui-form-item">
    <label class="label-120">bucket<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="bucket" maxlength="50" value="${model.bucket}" lay-verify="required"
               placeholder="请输入bucket" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="label-120">访问域名<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="url" maxlength="100" value="${model.url}" lay-verify="required" placeholder="请输入访问域名"
               class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="label-120">endpoint<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="endpoint" maxlength="100" value="${model.endpoint}" lay-verify="required"
               placeholder="请输入endpoint" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="label-120">accessKeyId<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="accessKeyId" maxlength="50" value="${model.accessKeyId}" lay-verify="required"
               placeholder="请输入accessKeyId" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="label-120">accessKeySecret<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="accessKeySecret" maxlength="50" value="${model.accessKeySecret}" lay-verify="required"
               placeholder="请输入accessKeySecret" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="label-120">状态<span class="span_must">*</span></label>
    <div cyType="selectTool" cyProps="codeName:'state',search:'true'"
         name="state" value="${model.state}" class="layui-input-normal"></div>
</div>

      