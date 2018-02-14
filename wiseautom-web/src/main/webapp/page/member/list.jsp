<%--
  Created by chenyi
  email: qq228112142@qq.com
  Date : 2017-08-08 17:35:59
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title></title>
    <%@ include file="/common/jsp/resource.jsp" %>
    <script type="text/javascript" src="/page/member/js/list.js"></script>
</head>
<body>
<form class="layui-form " action="">
    <div class="layui-form-item">
        <label class="layui-form-label">账号:</label>
        <div class="layui-input-inline">
            <input type="text" name="account"  placeholder="请输账号" class="layui-input">
        </div>
        <label class="layui-form-label">姓名:</label>
        <div class="layui-input-inline">
            <input type="text" name="name"  placeholder="请输入姓名" class="layui-input">
        </div>
        <label class="layui-form-label">状态:</label>
        <div cyType="selectTool" cyProps="codeName:'state',search:'true'"
             name="state"  class="layui-input-inline">
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn search-btn" table-id="MemberTable" lay-submit="" lay-filter="search"><i class="fa fa-search">&nbsp;</i>查询
            </button>
            <button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-refresh">&nbsp;</i>重置</button>
        </div>
    </div>
</form>
<div class="layui-btn-group">
    <button class="layui-btn" onclick="add('/member/add')">
        <i class="fa fa-plus">&nbsp;</i>增加
    </button>
    <button class="layui-btn" onclick="edit('MemberTable','/member/edit')" style="margin-left: 5px!important;">
        <i class="fa fa-pencil-square-o">&nbsp;</i>修改
    </button>
    <button class="layui-btn" onclick="deleteBatch('MemberTable','/member/delete');">
        <i class="fa fa-trash-o">&nbsp;</i>删除
    </button>
    <button class="layui-btn" onclick="enable('MemberTable','/member/enable')">
        <i class="fa fa-check-square-o">&nbsp;</i>启用
    </button>
    <button class="layui-btn  layui-btn-danger"  onclick="limit('MemberTable','/member/limit')">
        <i class="fa fa-expeditedssl">&nbsp;</i>禁用
    </button>
    <button class="layui-btn" onclick="exportExcel('/member/export')">
        <i class="fa fa-download">&nbsp;</i>导出
    </button>

    <button class="layui-btn" onclick="init('MemberTable','/member/initPassword')">
        <i class="fa fa-refresh">&nbsp;</i>初始化密码
    </button>
</div>
<div class="layui-form ">
    <table class="layui-table" id="MemberTable" cyType="pageGrid"
           cyProps="url:'/member/list',checkbox:'true',pageColor:'#2991d9'">
        <thead>
        <tr>
            <!--复选框-->
            <th width="1%" param="{type:'checkbox'}">
                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
            </th>
            			            <!--isPrimary：是否是主键-->
            <th width="10%" param="{name:'id',isPrimary:'true',hide:'true'}">主键</th>

		          <th width="10%" param="{name:'account'}">账号</th>

		          <th width="10%" param="{name:'name'}">姓名</th>

		          <th width="10%" param="{name:'phone'}">电话</th>

		          <th width="10%" param="{name:'amount'}">余额</th>

                  <th width="10%" param="{name:'level',codeName:'memberLevel'}">会员等级</th>

                  <th width="10%" param="{name:'lowerNumber',render:'Render.customNumber'}">推荐下级人数</th>

		          <th width="10%" param="{name:'state',codeName:'state',render:'Render.customState'}">状态</th>

                  <th width="10%" param="{name:'state',render:'Render.customBtn'}">操作</th>
        </tr>
        </thead>
    </table>
</div>
</body>
</html>