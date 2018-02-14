<!--
* 修改页面
* @author chenyi
* @email qq228112142@qq.com
* @date 2017-08-08 17:59:52
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
            <label class="layui-label-left">账号</label>
            <label class="layui-label-right"> ${model.account}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">姓名</label>
            <label class="layui-label-right">${model.name}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">电话</label>
            <label class="layui-label-right">${model.phone}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">邮箱</label>
            <label class="layui-label-right">${model.email}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">余额(元)</label>
            <label class="layui-label-right">${model.amount}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">会员等级</label>
            <label cyType="labelTool" cyProps="codeName:'memberLevel'"
                   value="${model.level}" class="layui-label-right"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">推荐下级人数</label>
            <label class="layui-label-right">${model.lowerNumber}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">创建时间</label>
            <label class="layui-label-right">${model.dateStr}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">状态</label>
                <label cyType="labelTool" cyProps="codeName:'state',showColor:'true'"
                     value="${model.state}" class="layui-label-right"></label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">上级账号</label>
            <label class="layui-label-right">${model.parentAccount}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">推荐上级姓名</label>
            <label class="layui-label-right">${model.parentName}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">推荐上级电话号码</label>
            <label class="layui-label-right">${model.parentPhone}</label>
        </div>
        <div class="layui-form-item">
            <label class="layui-label-left">下级账户信息</label>
            <div class="layui-form " style="margin:0 10px 5px 200px; ">
                <table class="layui-table" id="ParentTable" cyType="pageGrid"
                       cyProps="url:'/member/findByParentAccount/${model.account}',checkbox:'false',pageSize:'5',pageColor:'#2991d9'">
                    <thead>
                    <tr>
                        <th width="10%" param="{name:'account'}">下级账号</th>

                        <th width="10%" param="{name:'name'}">下级姓名</th>

                        <th width="10%" param="{name:'phone'}">下级电话</th>
                    </tr>
                    </thead>
                </table>
            </div>
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
