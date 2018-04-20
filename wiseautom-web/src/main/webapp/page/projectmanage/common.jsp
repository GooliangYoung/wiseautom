<!--
* 公用页面
* @author GooliangYoung
* @email 18551631365@163.com
* @date 2018-02-18 14:08:39
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="layui-form-item">
    <label class="layui-form-label">项目编号<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="projectCode" maxlength="20" value="${model.projectCode}" lay-verify="required"
               placeholder="请输入项目编号" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">项目名称<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="projectName" maxlength="100" value="${model.projectName}" lay-verify="required"
               placeholder="请输入项目名称" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">报价金额<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="projectOffer" maxlength="10,0" value="${model.projectOffer}" lay-verify="required"
               placeholder="请输入项目报价金额" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">计划开始时间<span class="span_must">*</span></label>
    <div class="layui-input-inline">
        <input type="text" name="projectPlanStartTime" id="projectPlanStartTime" value="${projectPlanStartTime}"
               lay-verify="date" placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input"
               onClick="WdatePicker()">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">实际开始时间</label>
    <div class="layui-input-inline">
        <input type="text" name="projectStartTime" id="projectStartTime" value="${projectStartTime}"
               placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input" onClick="WdatePicker()">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">计划结束时间<span class="span_must">*</span></label>
    <div class="layui-input-inline">
        <input type="text" name="projectPlanEndTime" id="projectPlanEndTime" value="${projectPlanEndTime}"
               lay-verify="date" placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input"
               onClick="WdatePicker()">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">实际结束时间</label>
    <div class="layui-input-inline">
        <input type="text" name="projectEndTime" id="projectEndTime" value="${projectEndTime}"
               placeholder="YYYY-MM-DD" autocomplete="off" class="layui-input" onClick="WdatePicker()">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">当前状态<span class="span_must">*</span></label>
    <div class="layui-input-normal">
        <input type="text" name="projectStatus" maxlength="11" value="${model.projectStatus}" lay-verify="required"
               placeholder="请输入项目当前状态" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-normal">
        <input type="text" name="remark" maxlength="20" value="${model.remark}"
               placeholder="请输入备注" class="layui-input">
    </div>
</div>