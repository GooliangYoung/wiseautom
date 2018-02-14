<%--
  Created by 陈熠.
  email: 228112142@qq.com
  Date : 2017/6/23
  Time : 10:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表码</title>
    <%@ include file="/common/jsp/resource.jsp" %>
    <script type="text/javascript" src="/page/code/js/list.js"></script>
</head>
<body>
<form class="layui-form " action="">
    <div class="layui-form-item">
        <label class="layui-form-label">编码名:</label>
        <div class="layui-input-inline">
            <input type="text" name="codeName"  placeholder="请输入编码值" class="layui-input">
        </div>
        <label class="layui-form-label">参数名:</label>
        <div class="layui-input-inline">
            <input type="text" name="value" placeholder="请输入参数名" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn search-btn" table-id="codeTable" lay-submit="" lay-filter="search"><i class="fa fa-search">&nbsp;</i>查询
            </button>
            <button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-refresh">&nbsp;</i>重置</button>
        </div>
    </div>
</form>
<div class="layui-btn-group">
        <button class="layui-btn" onclick="add('/sys/code/add')">  <i class="fa fa-plus">&nbsp;</i>增加</button>
        <%--<button  class="layui-btn"><a style="color:white;float:right;" href="/demo/add.jsp"><i class="layui-icon"></i>增加</a></button>--%>
        <button class="layui-btn" onclick="edit('codeTable','/sys/code/edit')" style="margin-left: 5px!important;">
            <i class="fa fa-pencil-square-o">&nbsp;</i>修改
        </button>
        <button class="layui-btn" onclick="deleteBatch('codeTable','/sys/code/delete');" style="margin-left: 5px!important;">
            <i class="fa fa-trash-o">&nbsp;</i>删除
        </button>
</div>
<div class="layui-form ">
    <table class="layui-table" id="codeTable" cyType="pageGrid"
           cyProps="url:'/sys/code/list',checkbox:'true',pageColor:'#2991d9'">
        <thead>
        <tr>
            <!--复选框-->
            <th width="1%" param="{type:'checkbox'}">
                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
            </th>
            <!--isPrimary：是否是主键-->
            <th width="10%" param="{name:'id',isPrimary:'true',hide:'true'}">菜单ID</th>
            <th width="10%" param="{name:'codeName'}">编码名</th>
            <%--<th param="{name:'codeName'}">编码名称</th>--%>
            <th width="10%" param="{name:'code'}">参数值</th>
            <th width="10%" param="{name:'value'}">参数名</th>
            <th width="10%" param="{name:'status',codeName:'state',render:'Render.customState'}">状态</th>
            <th width="10%" param="{name:'name'}">名称</th>
            <th width="10%" param="{name:'remark'}">备注</th>
        </tr>
        </thead>
    </table>
</div>
</body>
</html>