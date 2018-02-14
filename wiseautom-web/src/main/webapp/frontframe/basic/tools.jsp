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
<table class="layui-table">
    <thead>
    <tr>
        <th>方法</th>
        <th>功能</th>
        <th>参数</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>$t.closeWindow()</td>
        <td>关闭当前窗口</td>
        <td></td>
    <tr>
    <tr>
        <td>$t.Refresh()</td>
        <td>关闭当前窗口并刷新父页面表格</td>
        <td></td>
    <tr>
    <tr>
        <td>$t.getStorageItem(key)</td>
        <td>获取前端数组缓存</td>
        <td>key</td>
    <tr>
        <td>$t.setStorageItem(key,data)</td>
        <td>设置前端数组缓存</td>
        <td>key:键 data:数据</td>
    </tr>
    <tr>
        <td>$t.doAjax(url,params,success,async,type,dataType)</td>
        <td>调用ajax</td>
        <td></td>
    </tr>
    <tr>
        <td>$t.getUUID(len, radix) </td>
        <td>产生一个唯一的uuid</td>
        <td>len:产生的字符串长度  radix:进制数</td>
    </tr>

    <tr>
        <td colspan="3">更多请查看 utils.js 文件</td>

    </tr>
    </tbody>
</table>

</body>

</html>
