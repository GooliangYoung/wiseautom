<%--
  Created by GooliangYoung
  email: 18551631365@163.com
  Date : 2018-02-18 14:08:39
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>项目回款明细</title>
    <%@ include file="/common/jsp/resource.jsp" %>
    <script type="text/javascript" src="/page/projectpaymentdetial/js/list.js"></script>
</head>
<body>
<form class="layui-form " action="">
    <div class="layui-form-item">
        <label class="layui-form-label">名称:</label>
        <div class="layui-input-inline">
            <input type="text" name="" placeholder="请输入名称" class="layui-input">
        </div>

        <div class="layui-input-inline">
            <button class="layui-btn search-btn" table-id="projectPaymentDetialTable" lay-submit="" lay-filter="search">
                <i class="fa fa-search">&nbsp;</i>查询
            </button>
            <button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-refresh">&nbsp;</i>重置</button>
        </div>
    </div>
</form>
<div class="layui-btn-group">
    <shiro:hasPermission name="projectpaymentdetial:save">
        <button class="layui-btn" onclick="addPage('/projectpaymentdetial/add')">
            <i class="fa fa-plus">&nbsp;</i>增加
        </button>
    </shiro:hasPermission>
    <shiro:hasPermission name="projectpaymentdetial:update">
        <button class="layui-btn" onclick="editPage('projectPaymentDetialTable','/projectpaymentdetial/edit')">
            <i class="fa fa-pencil-square-o">&nbsp;</i>修改
        </button>
    </shiro:hasPermission>
    <shiro:hasPermission name="projectpaymentdetial:delete">
        <button class="layui-btn layui-btn-delete"
                onclick="deleteBatch('批量删除','projectPaymentDetialTable','/projectpaymentdetial/delete');">
            <i class="fa fa-trash-o">&nbsp;</i>删除
        </button>
    </shiro:hasPermission>

</div>
<div class="layui-form ">
    <table class="layui-table" id="projectPaymentDetialTable" cyType="pageGrid"
           cyProps="url:'/projectpaymentdetial/list',checkbox:'true',pageColor:'#2991d9'">
        <thead>
        <tr>
            <!--复选框-->
            <th width="1%" param="{type:'checkbox'}">
                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
            </th>
            <!--isPrimary：是否是主键-->
            <th width="10%" param="{name:'objId',isPrimary:'true',hide:'true'}">主键</th>
            <th width="10%" param="{name:'projectName'}">项目名称</th>
            <th width="10%" param="{name:'paymentMoney'}">回款金额</th>
            <th width="10%" param="{name:'surplusMoney'}">余款</th>
            <th width="10%" param="{name:'paymentDate'}">回款日期</th>
            <!--isPrimary：渲染列-->
            <th width="10%" param="{operate:'true',buttons:'Render.info,Render.edit,Render.delete'}">操作</th>
        </tr>
        </thead>
    </table>
</div>
</body>
</html>