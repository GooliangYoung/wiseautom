<!--
* 修改页面
* @author chenyi
* @email 228112142@QQ.com
* @date 2017-06-27 10:40:56
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
    <div class="layui-field-box">
        <form class="layui-form" action="">
            <input type="hidden" name="id" value="${model.id}">
            <div class="layui-form-item">
                <label class="layui-form-label">编码名</label>
                <div class="layui-input-normal">
                    <input type="text"  name="codeName" value="${model.codeName}"  lay-verify="required" autocomplete="off" placeholder="请输入编码名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">参数值</label>
                <div class="layui-input-normal">
                    <input type="text"  name="code" value="${model.code}"   lay-verify="required" placeholder="请输入参数值" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">参数名</label>
                <div class="layui-input-normal">
                    <input type="text"  name="value" value="${model.value}"  lay-verify="required" placeholder="请输入参数名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div  cyType="radioTool"  cyProps="codeName:'state'"  name="status" value="${model.status}" class="layui-input-inline"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-normal">
                    <input type="text"  name="name" value="${model.name}"  placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-normal">
                    <input type="text"  name="remark" value="${model.remark}" placeholder="请输入备注" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">

                    <button class="layui-btn" lay-submit="" lay-filter="submit">保存</button>
                    <button  class="layui-btn" onclick="closeWindow()"> 返回</button>
                </div>
            </div>
        </form>
    </div>
<script>
    layui.use(['form'], function(){
        var form = layui.form();
        //监听提交
        form.on('submit(submit)', function(data){
            var url ="/sys/code/update" ;
            $.ajax({
                //url: "/sys/menu/list",
                type: "post",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(data.field),
                async: false,
                dataType:"json",
                success: function (R) {
                    if(R.code === 0){
                        alert('操作成功', function(index){
                            closeWindow();
                            //刷新父级页面
                           // parent.location.reload();
                        });
                    }else{
                        alert(R.msg);
                    }
                },
                error:function(){
                    alert("系统错误");
                }
            });
            return false;
        });

    });
</script>
</body>
</html>
