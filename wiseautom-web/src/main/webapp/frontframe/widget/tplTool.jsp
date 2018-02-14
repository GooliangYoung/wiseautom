<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">代码</li>
        <li>效果</li>
        <li>参数详解</li>

    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
              <pre class="layui-code">

<div cyType="tplTool" cyProps="url:'/frontframe/json/student.json'">

    <script type="text/html" >
        <table class="layui-table">

            {{# d.page.list.forEach(function(item){ }}
            <tr>
                <td>{{ item.name }}</td>
                <td>{{ item.age }}</td>
                <td>{{ item.sfzh || '' }}</td>
            </tr>
            {{# }); }}
            {{# if(d.page.list.length === 0){ }}
            <tr>
                <td colspan="3" class="center">暂无数据</td>
            </tr>
            {{# } }}
        </table>
    </script>

</div>


              </pre>
        </div>

        <div class="layui-tab-item" id="result">
            <div cyType="tplTool" cyProps="url:'/frontframe/json/student.json'">

                <script type="text/html" >
                    <table class="layui-table">

                        {{# d.page.list.forEach(function(item){ }}
                        <tr>
                            <td>{{ item.name }}</td>
                            <td>{{ item.age }}</td>
                            <td>{{ item.sfzh || '' }}</td>
                        </tr>
                        {{# }); }}
                        {{# if(d.page.list.length === 0){ }}
                        <tr>
                            <td colspan="3" class="center">暂无数据</td>
                        </tr>
                        {{# } }}
                    </table>
                </script>

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
                    <td>cyType="tplTool"</td>
                </tr>
                <tr>
                    <td>cyProps:url</td>
                    <td>数据源</td>
                    <td><span style="color:red">必填</span></td>
                    <td>cyProps="url:'/frontframe/json/student.json'"</td>
                </tr>
                <tr>
                    <td colspan="4" class="center">未完待续...</td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<a class="click-span ft-20" href="http://www.layui.com/doc/modules/laytpl.html#syntax" target="_blank"> &gt;&gt;&gt; laytpl入口</a>
<script>
    layui.use('code', function(){ //加载code模块
        layui.code({encode: true}); //引用code方法
    });
    layui.use('element', function () {
    });

</script>

</body>
</html>
