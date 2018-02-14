<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/8
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>tips</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<div class="layui-input-inline">
    <button class="layui-btn" onclick="submitCode()">提交代码</button>
</div>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">编写代码</li>
        <li id="showResult">查看效果</li>
        <li>参数详解</li>

    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <textarea class="layui-textarea" rows="28" class="layui-code">

             <button class="layui-btn"  onclick="Tips.tips('自由配置',$(this),2,'#2478f1')">tips吸附</button> </br></br>

             <button class="layui-btn"  onclick="Tips.info('吸附信息',$(this))">tips吸附-提示</button> </br></br>

             <button class="layui-btn"  onclick="Tips.success('操作成功',$(this))">tips吸附-成功</button> </br></br>

             <button class="layui-btn"  onclick="Tips.error('操作失败',$(this))">tips吸附-错误</button> </br></br>

           </textarea>

        </div>

        <div class="layui-tab-item" id="result">

            <button class="layui-btn"  onclick="Tips.tips('自由配置',$(this),2,'#2478f1')">tips吸附</button> </br></br>

            <button class="layui-btn"  onclick="Tips.info('吸附信息',$(this))">tips吸附-提示</button> </br></br>

            <button class="layui-btn"  onclick="Tips.success('操作成功',$(this))">tips吸附-成功</button> </br></br>

            <button class="layui-btn"  onclick="Tips.error('操作失败',$(this))">tips吸附-错误</button> </br></br>
        </div>

        <div class="layui-tab-item">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>类型</th>
                    <th>方法</th>
                    <th>参数</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>自由配置</td>
                    <td>Tips.tips(msg,element,position,color)</td>
                    <td>msg:提示信息 element:元素节点  position:1上 2右 3下 4左  color:背景颜色</td>
                </tr>
                <tr>
                    <td>吸附信息</td>
                    <td>Tips.info(msg,element)</td>
                    <td>msg:提示信息 element:元素节点 </td>
                </tr>
                <tr>
                    <td>操作成功</td>
                    <td>Tips.success(msg,element)</td>
                    <td>msg:提示信息 element:元素节点 </td>
                </tr>
                <tr>
                    <td>操作失败</td>
                    <td>Tips.error(msg,element)</td>
                    <td>msg:提示信息 element:元素节点 </td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
</div>


</body>
<script>
    layui.use('element', function () {
    });

    function submitCode() {
        var code = $("textarea").val();
        $("#result").html(code);
        Msg.success("代码提交成功,请查看效果!");
        Tips.info("点此查看效果",$("#showResult"));
    }
</script>
</html>
