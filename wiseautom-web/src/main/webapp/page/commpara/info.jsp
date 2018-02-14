<!--
* 详情页面
* @author chenyi
* @email qq228112142@qq.com
* @date 2017-11-06 14:49:28
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
            <label class="layui-label-left">主键<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.paraId}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">参数编码<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.paraCode}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">参数名称<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.paraName}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">参数值<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.paraKey}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">排序<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.sortNo}</label>
        </div>
              <div class="layui-form-item">
            <label class="layui-label-left">状态<span class="label_span">:</span></label>
            <label class="layui-label-right">$ {model.state}</label>
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
