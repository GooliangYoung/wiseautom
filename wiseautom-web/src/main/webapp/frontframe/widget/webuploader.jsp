<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/4
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <%@ include file="/common/jsp/resource.jsp" %>
    <!-- 全局js -->
    <script src="/statics/libs/jquery.min.js"></script>
    <!-- Web Uploader -->
    <script type="text/javascript">
    // 添加全局站点信息
    var BASE_URL = '/statics/plugins/webuploader';
    </script>
    <script src="/statics/plugins/webuploader/webuploader.js"></script>

    <script src="/statics/plugins/webuploader/webuploader-demo.js"></script>
    <link rel="stylesheet" type="text/css" href="/statics/plugins/webuploader/webuploader.css">
    <link rel="stylesheet" type="text/css" href="/statics/plugins/webuploader/webuploader-demo.css">


</head>

<body>
<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
    <legend>百度上传控件</legend>
    <div id="uploader" class="wu-example">
        <div class="queueList">
            <div id="dndArea" class="placeholder">
                <div id="filePicker"></div>
                <p>或将照片拖到这里，单次最多可选300张</p>
            </div>
        </div>
        <div class="statusBar" style="display:none;">
            <div class="progress">
                <span class="text">0%</span>
                <span class="percentage"></span>
            </div>
            <div class="info"></div>
            <div class="btns">
                <div id="filePicker2"></div>
                <div class="uploadBtn">开始上传</div>
            </div>
        </div>
    </div>
</fieldset>
<pre class="layui-code" >
   <!-- 全局js -->
    <script src="/statics/libs/jquery.min.js"></script>
    <!-- Web Uploader -->
    <script type="text/javascript">
    // 添加全局站点信息
    var BASE_URL = '/statics/plugins/webuploader';
    </script>
    <script src="/statics/plugins/webuploader/webuploader.js"></script>

    <script src="/statics/plugins/webuploader/webuploader-demo.js"></script>
    <link rel="stylesheet" type="text/css" href="/statics/plugins/webuploader/webuploader.css">
    <link rel="stylesheet" type="text/css" href="/statics/plugins/webuploader/webuploader-demo.css">

     <div class="statusBar" style="display:none;">
            <div class="progress">
                <span class="text">0%</span>
                <span class="percentage"></span>
            </div>
            <div class="info"></div>
            <div class="btns">
                <div id="filePicker2"></div>
                <div class="uploadBtn">开始上传</div>
            </div>
        </div>
</pre>

</body>
<script>
    layui.use('code', function(){ //加载code模块
        layui.code({encode: true}); //引用code方法
    });

</script>
</html>
