<!--
* 公用页面
* @author GooliangYoung
* @email 18551631365@163.com
* @date 2018-02-18 14:08:39
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-form-item">
    <label class="layui-form-label">姓名<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="friendName" maxlength="50" value="${model.friendName}" lay-verify="required"
               placeholder="请输入姓名" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">电话<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="friendPhone" maxlength="15" value="${model.friendPhone}" lay-verify="required"
               placeholder="请输入电话" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">邮箱<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="friendEmail" maxlength="100" value="${model.friendEmail}" lay-verify="required"
               placeholder="请输入邮箱" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">地址<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="friendAddress" maxlength="150" value="${model.friendAddress}" lay-verify="required"
               placeholder="请输入地址" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">公司<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="friendCompany" maxlength="50" value="${model.friendCompany}" lay-verify="required"
               placeholder="请输入公司" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-normal">
        <input type="text" name="remark" maxlength="20" value="${model.remark}"
               placeholder="请输入备注" class="layui-input">
    </div>
</div>
      