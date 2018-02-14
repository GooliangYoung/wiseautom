<!--
* 添加页面
* @author chenyi
* @email 228112142@QQ.com
* @date 2017-06-27 10:40:56
*-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>添加</legend>
    <div class="layui-field-box">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户操作</label>
                <div class="layui-input-block">
                    <input type="text" name="operation" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="submit">保存</button>
                    <button  class="layui-btn">  <a class="btn btn-danger" style="color:white;float:right;" href="/page/syslog/list.jsp">返回</a></button>
                </div>
            </div>
        </form>
    </div>
</fieldset>
<script>
    layui.use(['form'], function(){
        var form = layui.form();

        //监听提交
        form.on('submit(submit)', function(data){

            var url ="/sys/log/save" ;
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
