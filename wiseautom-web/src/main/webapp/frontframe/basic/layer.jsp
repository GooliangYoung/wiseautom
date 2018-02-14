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
    <title>工具类</title>
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
               ------------------------- 弹窗 ---------------------------------
             <button class="layui-btn" onclick="Msg.confirm('确认',function(){Msg.msg('操作成功')})">确认（是/否）</button> </br></br>

             <button class="layui-btn" onclick="Msg.alert('确认')">重写alert</button> </br></br>
               ------------------------- 短信息 msg ---------------------------------
              类型 默认灰色 1绿色√ 2红色x 3黄色？  4灰色锁  5红色委屈脸  6绿色开心脸  7黄色！
             <button class="layui-btn" onclick="Msg.msg('提示信息',1)">短信息提示 1-7</button> </br></br>

             <button class="layui-btn" onclick="Msg.info('普通信息')">普通信息(灰色)</button> </br></br>

             <button class="layui-btn" onclick="Msg.success('操作成功')">操作成功(灰色)</button> </br></br>

             <button class="layui-btn" onclick="Msg.warn('警告信息')">警告提示</button> </br></br>

             <button class="layui-btn" onclick="Msg.error('错误信息')">错误提示</button> </br></br>
              ------------------------- tips吸附 ---------------------------------
             <button class="layui-btn"  onclick="Tips.tips('吸附信息',$(this),2,'#009688')">tips吸附</button> </br></br>

             <button class="layui-btn"  onclick="Tips.info('吸附信息',$(this))">tips吸附-提示</button> </br></br>

             <button class="layui-btn"  onclick="Tips.success('操作成功',$(this))">tips吸附-成功</button> </br></br>

             <button class="layui-btn"  onclick="Tips.error('操作失败',$(this))">tips吸附-错误</button> </br></br>
                ------------------------- prompt ---------------------------------
                类型 1文本框 2文本域 3文本域+文件上传
              <button class="layui-btn"  onclick="cyPrompt.prompt('prompt框','3',function(value) {Msg.success(value)})">prompt框</button> </br></br>
           </textarea>

        </div>

        <div class="layui-tab-item" id="result">
            <button class="layui-btn" onclick="Msg.confirm('确认',function(){Msg.msg('操作成功')})">确认（是/否）</button>  </br></br>
            <button class="layui-btn" onclick="Msg.alert('确认')">重写alert</button> </br></br>
            <button class="layui-btn" onclick="Msg.msg('提示信息',1)">短信息提示 1-7</button> </br></br>
            <button class="layui-btn" onclick="Msg.info('普通信息')">普通信息(灰色)</button> </br></br>
            <button class="layui-btn" onclick="Msg.success('操作成功')">操作成功(灰色)</button> </br></br>
            <button class="layui-btn" onclick="Msg.warn('警告信息')">警告提示</button> </br></br>
            <button class="layui-btn" onclick="Msg.error('错误信息')">错误提示</button> </br></br>
            <button class="layui-btn" onclick="Tips.tips('吸附信息',$('#tips'),2,'#009688')">tips吸附</button> </br></br>
            <button class="layui-btn" onclick="Tips.info('吸附信息',$(this))">tips吸附-提示</button> </br></br>
            <button class="layui-btn" onclick="Tips.success('操作成功',$(this))">tips吸附-成功</button> </br></br>
            <button class="layui-btn" onclick="Tips.error('操作失败',$(this))">tips吸附-错误</button> </br></br>
            <button class="layui-btn"  onclick="cyPrompt.prompt('prompt框','3',function(value) {Msg.success(value)})">prompt框</button> </br></br>
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
                    <td>msg短信息</td>
                    <td>Msg.msg(msg,type)</td>
                    <td>type: 不填灰色 1绿色√ 2红色x 3黄色？  4灰色锁  5红色委屈脸  6绿色开心脸  7黄色！</td>
                </tr>
                <tr>
                    <td>tips吸附</td>
                    <td>Tips.tips(msg,element,position,color)</td>
                    <td>position: 1上 2右 3下 4左 </td>
                </tr>
                <tr>
                    <td>prompt</td>
                    <td>cyPrompt.prompt(msg,type,callback)</td>
                    <td>type:1文本框 2文本域 3文本域+文件上传</td>
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
        Tips.success("点此查看效果",$("#showResult"));
    }
</script>
</html>
