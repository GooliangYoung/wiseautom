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
    <title>字体样式</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<%--字体颜色--%>
<table class="layui-table">
    <thead>
    <tr>
        <th>字体颜色</th>
        <th>class</th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span class="ft-blue">蓝色</span></td>
        <td>class="ft-blue"</td>
    </tr>
    <tr>
        <td><span class="ft-warm">警告</span></td>
        <td>class="ft-warm"</td>
    </tr>
    <tr>
        <td><span class="ft-red">强调</span></td>
        <td>class="ft-red"</td>
    </tr>
    <tr>
        <td><span class="ft-green">绿色</span></td>
        <td>class="ft-green"</td>
    </tr>
    <tr>
        <td><span class="ft-gray">灰色</span></td>
        <td>class="ft-gray"</td>
    </tr>
    </tbody>
</table>
<%--字体大小--%>
<table class="layui-table">
    <thead>
    <tr>
        <th>字体大小</th>
        <th>class</th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span class="ft-10">字体</span></td>
        <td>class="ft-10"</td>
    </tr>
    <tr>
        <td><span class="ft-12">字体</span></td>
        <td>class="ft-12"</td>
    </tr>
    <tr>
        <td><span class="ft-14">字体</span></td>
        <td>class="ft-14"</td>
    </tr>
    <tr>
        <td><span class="ft-14">...</span></td>
        <td>...</td>
    </tr>
    <tr>
        <td><span class="ft-28">字体</span></td>
        <td>class="ft-28"</td>
    </tr>
    <tr>
        <td><span class="ft-30">字体</span></td>
        <td>class="ft-30"</td>
    </tr>

    </tbody>
</table>
<%--字体链接--%>
<table class="layui-table">
    <thead>
    <tr>
        <th>字体链接</th>
        <th>class</th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span class="a-link">默认链接颜色</span></td>
        <td>class="a-link"</td>
    </tr>
    <tr>
        <td><span class="click-span">可点击样式</span></td>
        <td>class="click-span"</td>
    </tr>
    </tbody>
</table>
<%--字体加粗--%>
<table class="layui-table">
    <thead>
    <tr>
        <th>字体加粗</th>
        <th>class</th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span class="ft-normal">字体正常</span></td>
        <td>class="ft-normal"</td>
    </tr>
    <tr>
        <td><span class="ft-bold">字体加粗</span></td>
        <td>class="ft-bold"</td>
    </tr>
    </tbody>
</table>
</body>
</html>
