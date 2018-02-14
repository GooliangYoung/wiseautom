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
    <title>单选控件</title>
    <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<div class="layui-input-inline">
    <button class="layui-btn layui-btn-disabled"
            <%--onclick="submitCode()"--%>
    >提交代码</button>
</div>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">代码</li>
        <li id="showResult">效果</li>
        <li>参数详解</li>

    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <code style="margin-top: 4px; display: block;">星级插件使用示例</code>
            <textarea class="layui-textarea" rows="20" class="layui-code">
               <form class="layui-form " action="">


                <!--默认-->
                <div cyType="starTool" cyProps="" class="layui-input-inline"></div><br><br>

                <!--常用配置-->
                <div cyType="starTool" cyType="starTool" cyProps="name:'star',value:3.5,disable:true"

                     class="layui-input-inline"></div><br><br>

               <!--全部配置-->
                <div cyType="starTool" cyType="starTool"
                     cyProps="name:'star',count:10,value:3.5,height:15,width:15,margin:5,disable:false,cursor:'default'"
                     class="layui-input-inline"></div><br><br>


               </form>
           </textarea>

        </div>
        <div class="layui-tab-item" id="result">
            <form class="layui-form " action="">

                <!--默认-->
                <div cyType="starTool" cyProps="" class="layui-input-inline"></div>
                <br><br>

                <!--常用配置-->
                <div cyType="starTool" cyType="starTool" cyProps="name:'star',value:3.5,disable:true"

                     class="layui-input-inline"></div>
                <br><br>

                <!--全部配置-->
                <div cyType="starTool" cyType="starTool"
                     cyProps="name:'star',count:10,value:3.5,height:15,width:15,margin:5,disable:false,cursor:'default'"

                     class="layui-input-inline"></div>
                <br><br>


            </form>
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
                    <td>cyType="radioTool"</td>
                </tr>
                <tr>
                    <td>cyProps:name</td>
                    <td>字段</td>
                    <td>star</td>
                    <td>cyProps="name:'star'" </td>
                </tr>
                <tr>
                    <td>cyProps:count</td>
                    <td>星星总个数</td>
                    <td>5</td>
                    <td>cyProps="count:10"</td>
                </tr>
                <tr>
                    <td>cyProps:value</td>
                    <td>默认选择个数</td>
                    <td>0</td>
                    <td>cyProps="value:1.5"</td>
                </tr>
                <tr>
                    <td>cyProps:height</td>
                    <td>高度</td>
                    <td>23</td>
                    <td>cyProps="height:15"</td>
                </tr>
                <tr>
                    <td>cyProps:width</td>
                    <td>宽度</td>
                    <td>23</td>
                    <td>cyProps="width:15"</td>
                </tr>
                <tr>
                    <td>cyProps:margin</td>
                    <td>星星之间的间距</td>
                    <td>5</td>
                    <td>cyProps="width:15"</td>
                </tr>
                <tr>
                    <td>cyProps:disable</td>
                    <td>是否禁选</td>
                    <td>false</td>
                    <td>cyProps="disable:true"</td>
                </tr>
                <tr>
                    <td>cyProps:cursor</td>
                    <td>鼠标经过手势样式</td>
                    <td>pointer</td>
                    <td>cyProps="cursor:default"</td>
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
        var starTools = $("#result").find("[cyType='starTool']");

        for (var i = 0; i < starTools.length; i++) {
            $(starTools[i]).starTool();
        }

        Msg.success("代码提交成功,请查看效果!");
        Tips.info("点此查看效果", $("#showResult"));
    }

//    layui.use('code', function () { //加载code模块
//        layui.code({encode: true}); //引用code方法
//    });
</script>
</body>
</html>
