<!--
* 详情页面
* @author chenyi
* @email 228112142@qq.com
* @date 2017-12-13 10:07:04
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
             <div class="layui-form-item">
            <label class="layui-label-left">bucket<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.bucket}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">访问域名<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.url}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">endpoint<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.endpoint}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">accessKeyId<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.accessKeyId}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">accessKeySecret<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.accessKeySecret}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">状态<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.state}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">创建时间<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.createTime}</label>
        </div>
          </form>
</div>
<script>
    $(document).ready(function () {
       var labels=$(".layui-label-right");
       for(var i=0;i<labels.length;i++){
           if($(labels[i]).html()==""){
               $(labels[i]).html("-");
           }
       }
    });
</script>
</body>
</html>
