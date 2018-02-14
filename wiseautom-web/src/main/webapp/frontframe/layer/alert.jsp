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
    <title>alert</title>
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


             <button class="layui-btn" onclick="Alert.confirm('确认',function(){ Msg.msg('操作成功') } )">确认（是/否）</button> </br></br>

             <button class="layui-btn" onclick="Alert.alert('确认')">alert</button> </br></br>

             <button class="layui-btn"  onclick="Alert.prompt('文本框','1',function(value) {  Msg.success(value) })">prompt文本框</button>   <br> <br>

              <button class="layui-btn"  onclick="Alert.prompt('文本域','2',function(value) {    Msg.success(value)   })">prompt文本域</button>   <br> <br>

              <button class="layui-btn"  onclick="Alert.prompt('文件上传','3',function(value) {      Msg.success(value)     })">prompt文件上传</button>   <br> <br>

           </textarea>

        </div>

        <div class="layui-tab-item" id="result">

            <button class="layui-btn" onclick="Alert.confirm('确认',function(){Msg.msg('操作成功')})">确认（是/否）</button> </br></br>

            <button class="layui-btn" onclick="Alert.alert('确认')">重写alert</button> </br></br>

            <button class="layui-btn"  onclick="Alert.prompt('文本框','1',function(value) {
                  Msg.success(value)
              })">prompt文本框</button>   <br> <br>

            <button class="layui-btn"  onclick="Alert.prompt('文本域','2',function(value) {
                  Msg.success(value)
              })">prompt文本域</button>   <br> <br>

            <button class="layui-btn"  onclick="Alert.prompt('文件上传','3',function(value) {
                  Msg.success(value)
              })">prompt文件上传</button>   <br> <br>

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
                    <td>alert</td>
                    <td>Alert.alert(msg)</td>
                    <td>msg: 提示信息</td>
                </tr>
                <tr>
                    <td>confirm</td>
                    <td>Alert.confirm(msg,callback)</td>
                    <td> msg: 提示信息  callback 回调函数 </td>
                </tr>
                <tr>
                    <td>prompt</td>
                    <td>Alert.prompt(msg,type,callback)</td>
                    <td>msg:提示信息  type:  1文本框 2文本域 3文本域+文件上传   callback：回调函数</td>
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
