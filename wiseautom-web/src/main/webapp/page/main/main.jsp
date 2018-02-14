<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
 <%@ include file="/common/jsp/resource.jsp" %>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
 <legend> 框架说明</legend>
</fieldset>
<blockquote class="layui-elem-quote">
 1.基于ssm+shiro安全框架的后台管理框架，权限简单易用可控制到按钮。<br>
 2.配置代码生成器，减少70%开发时间，专注业务逻辑。<br>
 3.前端声明式组件封装、附带文档编写 ctrl+c ctrl+v 即可使用。封装数据源，可通过url、枚举、字典直接渲染组件。代码量极少且易维护。<br>
 4.layui常用代码的二次封装，省略layui部分繁琐的代码！&nbsp;&nbsp;&nbsp;<a class="a-link" target="_blank" href="http://www.layui.com">》》》layui官网入口</a><br>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
 <legend> 如何交流、反馈、参与贡献？</legend>
</fieldset>
<blockquote class="layui-elem-quote">
 1.项目主页 <a class="a-link" target="_blank" href="http://admin.cymall.xin">http://admin.cymall.com</a><br>
 2.码云地址 <a class="a-link" target="_blank" href="https://gitee.com/leiyuxi/cy-security">https://gitee.com/leiyuxi/cy-security</a><br>
 3.qq群 275846351<br>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
 <legend>版本更新记录</legend>
</fieldset>
<ul class="layui-timeline">
 <li class="layui-timeline-item">
  <i class="ft-green layui-icon layui-timeline-axis layui-anim layui-anim-rotate layui-anim-loop">&#x1002;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title"></h3>
   <p class="ft-green">熬夜更新中...</p>
   <ul>
    <li>html版</li>
    <li>cy-api前后端分离版</li>
   </ul>
  </div>
 </li>

 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title">2018-01-12</h3>
   <p class="a-link">优化</p>
   <ul>
    <li>优化列表页全选联动 -》pageGrid.js </li>
    <li>列表下图片点击全览 -》monitor.js </li>

   </ul>
  </div>
 </li>

 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title">2018-01-12</h3>
   <p class="a-link">引入星级插件</p>
   <ul>
    <li>新增starTool.js 文件</li>
    <li>新增 /statics/img/star 下图片文件</li>
    <li>新增前端文档 starTool.jsp 文件 </li>
    <li>resource.jsp中引入starTool.js即可使用</li>
   </ul>
  </div>
 </li>

 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title">2018-01-06</h3>
   <p class="a-link">cy-fast</p>
   <ul>
    <li>基于springboot+shiro+freemarker的快速开发框架</li>
    <li>分页表格增加排序功能</li>
    <li>tab页增加右键菜单功能</li>
    <li>flyway数据库版本管理</li>
   </ul>
  </div>
 </li>

 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title">2018-01-02</h3>
   <p class="a-link">修复列表页重复请求两次后台问题</p>
  </div>
 </li>
 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title">2017-12-26</h3>
   <p class="a-link">增加tab页功能</p>
   <ul>
    <li>将单页面转为tab页功能</li>
    <li>支持多模块菜单</li>
   </ul>
  </div>
 </li>
 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <h3 class="layui-timeline-title">2017-12-14</h3>
   <p class="a-link">首次发布</p>
   <ul>
    <li>前端声明式组件封装</li>
    <li>代码生成器</li>
   </ul>
  </div>
 </li>

 <li class="layui-timeline-item">
  <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
  <div class="layui-timeline-content layui-text">
   <div class="layui-timeline-title">过去</div>
  </div>
 </li>
</ul>

</body>
</html>