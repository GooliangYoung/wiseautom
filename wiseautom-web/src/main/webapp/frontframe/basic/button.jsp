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
    <title>按钮样式</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<table class="layui-table">
    <thead>
    <tr>
        <th>主题</th>
        <th>组合</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <button class="layui-btn layui-btn-primary">原始按钮</button>
        </td>
        <td>class="layui-btn layui-btn-primary"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn">默认按钮</button>
        </td>
        <td>class="layui-btn"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-normal">百搭按钮</button>
        </td>
        <td>class="layui-btn layui-btn-normal"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-warm">暖色按钮</button>
        </td>
        <td>class="layui-btn layui-btn-warm"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-danger">警告按钮</button>
        </td>
        <td>class="layui-btn layui-btn-danger"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-disabled">禁用按钮</button>
        </td>
        <td>class="layui-btn layui-btn-disabled"</td>
    </tr>
    </tbody>
</table>


<table class="layui-table">
    <thead>
    <tr>
        <th>尺寸</th>
        <th>组合</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <button class="layui-btn layui-btn-big">大型按钮</button>
        </td>
        <td>class="layui-btn layui-btn-big"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn">默认按钮</button>
        </td>
        <td>class="layui-btn"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-small">小型按钮</button>
        </td>
        <td>class="layui-btn layui-btn-small"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-mini">迷你按钮</button>
        </td>
        <td>class="layui-btn layui-btn-mini"</td>
    </tr>
    </tbody>
</table>

<table class="layui-table">
    <thead>
    <tr>
        <th>尺寸</th>
        <th>组合</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <button class="layui-btn layui-btn-big layui-btn-normal">大型百搭</button>
        </td>
        <td>class="layui-btn layui-btn-big layui-btn-normal"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-warm">正常暖色</button>
        </td>
        <td>class="layui-btn layui-btn-warm"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-small layui-btn-danger">小型警告</button>
        </td>
        <td>class="layui-btn layui-btn-small layui-btn-danger"</td>
    </tr>
    <tr>
        <td>
            <button class="layui-btn layui-btn-mini layui-btn-disabled">禁用</button>
        </td>
        <td>class="layui-btn layui-btn-mini layui-btn-disabled"</td>
    </tr>
    </tbody>
</table>
</body>
</html>
