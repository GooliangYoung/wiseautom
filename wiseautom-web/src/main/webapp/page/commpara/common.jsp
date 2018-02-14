<!--
* 公用页面
* @author chenyi
* @email qq228112142@qq.com
* @date 2017-11-06 14:49:28
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="layui-form-item">
    <label class="layui-form-label">参数编码<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="paraCode" value="${model.paraCode}" lay-verify="required"
               placeholder="请输入参数编码" maxlength="50" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">参数名称<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="paraName" value="${model.paraName}" lay-verify="required"
               placeholder="请输入参数名称" maxlength="8" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">参数值<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="paraKey" value="${model.paraKey}" lay-verify="required"
               placeholder="请输入参数值" maxlength="8" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">排序<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="sortNo" value="${model.sortNo}" lay-verify="number" placeholder="请输入排序"
               maxlength="8" class="layui-input">
    </div>
</div>


<div class="layui-form-item">
    <label class="layui-form-label">状态<span class="span_must">*</span></label>
    <div cyType="selectTool" cyProps="codeName:'state',search:'true',required:'true'"
         name="state" value="${model.state}" class="layui-input-normal">
    </div>
</div>