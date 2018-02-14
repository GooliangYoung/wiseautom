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
    <title>静态表格</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<table class="layui-table">
    <thead>
    <tr>
        <th>表头</th>
        <th>表头</th>
        <th>表头</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    <tr>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
    <tr>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
    </tbody>
</table>

<pre class="layui-code" >
<table class="layui-table">
    <thead>
    <tr>
        <th>表头</th>
        <th>表头</th>
        <th>表头</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    <tr>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
    <tr>
        <td>内容</td>
        <td>内容</td>
        <td>内容</td>
    </tr>
    </tbody>
</table>
</pre>

</body>
<script>
    layui.use('code', function(){ //加载code模块
        layui.code({encode: true}); //引用code方法
    });

</script>
</html>
