<%--
  Created by IntelliJ IDEA.
  User: 陈熠
  Date: 2017/7/10
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下拉树控件</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<div class="layui-input-inline">
    <button class="layui-btn" onclick="submitCode()">提交代码</button>
</div>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">代码</li>
        <li>效果</li>
        <li>参数详解</li>

    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <code style="margin-top: 4px; display: block;">下拉树控件使用示例</code>
            <textarea class="layui-textarea" rows="18">


                    <div class="layui-input-inline">

                        <input    value="0"  id="demo"  cyType="treeTool"   cyProps="url:'/sys/menu/select',name:'parentId'"
                                  placeholder="请选择上级菜单" class="layui-input"/>

                    </div>

           </textarea>
        </div>
        <div class="layui-tab-item" id="result">
            <div class="layui-input-inline">

                <input    value="0"  id="demo"  cyType="treeTool"   cyProps="url:'/sys/menu/select',name:'parentId'"
                          placeholder="请选择上级菜单" class="layui-input"/>

            </div>
        </div>
        <div class="layui-tab-item">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>组件参数</th>
                    <th>描述</th>
                    <th>默认值</th>
                    <th>代码示例</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>cyType</td>
                    <td>控件类型</td>
                    <td><span style="color:red">必填</span></td>
                    <td>cyType="treeTool"</td>
                </tr>
                <tr>
                    <td>id</td>
                    <td>组件id</td>
                    <td><span style="color:red">必填</span></td>
                    <td>id="parent"</td>
                </tr>
                <tr>
                    <td>value</td>
                    <td>下拉树显默认值</td>
                    <td>null</td>
                    <td>value="0" || value="\${model.id}"</td>
                </tr>
                <tr>
                    <td>cyProps:url</td>
                    <td>数据源</td>
                    <td><span style="color:red">必填</span></td>
                    <td>cyProps="url:'sys/menu/select'"</td>
                </tr>
                <tr>
                    <td>cyProps:name</td>
                    <td>对应的字段名，用于表单提交</td>
                    <td>null</td>
                    <td>cyProps="name:'parentId"</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script>
    layui.use('element', function () {
    });
    function submitCode() {
        var code = $("textarea").val();
        $("#result").html(code);

        $("#result").find("#demo").treeTool();
        Msg.success("代码提交成功,请查看效果!");
        Tips.info("点此查看效果",$("#showResult"));

    }
    $(document).ready(function () {
        $('#result').on('click','#demo', function(){
            var obj=$(this);
            openZtree(obj);
        });
    });
</script>
</body>
</html>
