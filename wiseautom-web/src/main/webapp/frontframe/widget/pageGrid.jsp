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
    <title>表格控件</title>
    <%@ include file="/common/jsp/resource.jsp" %>
    <script type="text/javascript" src="/page/commpara/js/list.js"></script>
</head>
<body>
<div class="layui-input-inline">
    <button  style="display:none" class="layui-btn search-btn" table-id="commparaTable" lay-submit="" lay-filter="search"></button>
</div>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">代码</li>
        <li>效果</li>
        <li>参数详解</li>

    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <code style="margin-top: 4px; display: block;">表格代码示例</code>
            <textarea class="layui-textarea" rows="28">
            <div class="layui-form ">
               <table class="layui-table" id="commparaTable" cyType="pageGrid" cyProps="url:'/commpara/list',checkbox:'true',pageColor:'#2991d9'">
                  <thead>
                      <tr>
                            <!--复选框-->
                            <th width="1%" param="{type:'checkbox'}">
                                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
                            </th>
                           <!--isPrimary：是否是主键-->
                            <th width="10%" param="{name:'paraId',isPrimary:'true',hide:'true'}">主键</th>

                            <th width="10%" param="{name:'paraCode'}">参数编码</th>

                            <th width="10%" param="{name:'paraName'}">参数名称</th>

                            <th width="10%" param="{name:'paraKey'}">参数值</th>

                            <th width="10%" param="{name:'sortNo'}">排序</th>
                             <!--render：渲染列-->
                            <th width="10%" param="{name:'state',codeName:'state',render:'Render.customState'}">状态</th>
                             <!--buttons：操作列-->
                            <th width="10%" param="{operate:'true',buttons:'Render.state,Render.edit,Render.delete'}">操作</th>
                       </tr>
                  </thead>
               </table>
            </div>
            </textarea>
            <code style="margin-top: 4px; display: block;">list.js示例  用于渲染表格列</code>
            <textarea class="layui-textarea" rows="20">
           //数据渲染对象
           var Render = {
               customState: function (rowdata,renderData index, value) {
                  if(value == "启用"){
                      return '<span style="color:green">'+value+'</span>';
                  }
                  if(value == "禁用"){
                      return '<span style="color:red">'+value+'</span>';
                  }
                  return value;
               },
               edit:function(rowdata,renderData){
                   var btn=' <button  onclick="editOne(\''+"/commpara/edit"+'\',\''+rowdata.paraId+'\')" class="layui-btn layui-btn-mini">修改</button>';
                   return btn;
               }
            };
         </textarea>
        </div>

        <div class="layui-tab-item" id="result">
            <div class="layui-form">
                    <table class="layui-table" id="commparaTable" cyType="pageGrid"  cyProps="url:'/commpara/list',checkbox:'true',pageColor:'#2991d9'">
                        <thead>
                        <tr>
                            <!--复选框-->
                            <th width="1%" param="{type:'checkbox'}">
                                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
                            </th>
                            <!--isPrimary：是否是主键-->
                            <th width="10%" param="{name:'paraId',isPrimary:'true',hide:'true'}">主键</th>

                            <th width="10%" param="{name:'paraCode'}">参数编码</th>

                            <th width="10%" param="{name:'paraName'}">参数名称</th>

                            <th width="10%" param="{name:'paraKey'}">参数值</th>

                            <th width="10%" param="{name:'sortNo'}">排序</th>
                            <!--render：渲染列-->
                            <th width="10%" param="{name:'state',codeName:'state',render:'Render.customState'}">状态</th>
                            <!--buttons：操作列-->
                            <th width="10%" param="{operate:'true',buttons:'Render.state,Render.edit,Render.delete'}">操作</th>
                        </tr>
                        </thead>
                    </table>
            </div>
        </div>
        <div class="layui-tab-item">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>表格参数</th>
                    <th>描述</th>
                    <th>默认值</th>
                    <th>代码示例</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>id</td>
                    <td>表格id,用于查询表单关联</td>
                    <td><span style="color:red">必填</span></td>
                    <td>id="demo" || &lt;button table-id="demo"&gt;查询&lt;/button&gt;</td>
                </tr>
                <tr>
                    <td>cyType</td>
                    <td>控件类型</td>
                    <td><span style="color:red">必填</span></td>
                    <td>cyType="pageGrid"</td>
                </tr>
                <tr>
                    <td>cyProps:url</td>
                    <td>数据源</td>
                    <td><span style="color:red">必填</span></td>
                    <td> cyProps="url:'/syscode/list'"</td>
                </tr>
                <tr>
                    <td>cyProps:checkbox</td>
                    <td>是否开启复选框</td>
                    <td>true</td>
                    <td>yProps="checkbox:'true'"</td>
                </tr>
                <tr>
                    <td>cyProps:pageColor</td>
                    <td>分页样式</td>
                    <td>#2991d9</td>
                    <td>cyProps="pageColor:'#2991d9'"</td>
                </tr>
                <tr>
                    <td>cyProps:pageSize</td>
                    <td>每页显示条数</td>
                    <td>10</td>
                    <td>cyProps="pageSize:'20'"</td>
                </tr>
                </tbody>
            </table>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>列参数</th>
                    <th>描述</th>
                    <th>默认值</th>
                    <th>代码示例</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>param.name</td>
                    <td>字段值</td>
                    <td><span style="color:red">必填</span></td>
                    <td>param="{name:'code'}"</td>
                </tr>
                <tr>
                    <td>param.isPrimary</td>
                    <td>该字段是否是主键,勾选复选框时对应的值</td>
                    <td>false</td>
                    <td>param="{isPrimary:'true'}"</td>
                </tr>
                <tr>
                    <td>param.hide</td>
                    <td>是否隐藏</td>
                    <td>false</td>
                    <td>param="{hide:'true'}"</td>
                </tr>
                <tr>
                    <td>param.codeName</td>
                    <td>通过字典自动渲染列</td>
                    <td>null</td>
                    <td>param="{codeName:'state'}"</td>
                </tr>
                <tr>
                    <td>param.enumName</td>
                    <td>通过枚举自动渲染列</td>
                    <td>null</td>
                    <td>param="{enumName:'stateEnum'}"</td>
                </tr>
                <tr>
                    <td>param.render</td>
                    <td>渲染列,进入js方法,自定义返回该列的数据与格式</td>
                    <td>null</td>
                    <td>param="{render:'Render.customState'}"</td>
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
        $("#result").find("#demo").pageGrid();
        alert("代码提交成功,请查看效果!");
    }
</script>
</body>
</html>
