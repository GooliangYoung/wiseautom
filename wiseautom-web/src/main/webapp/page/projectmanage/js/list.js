/**
 * 项目管理表
 * @author GooliangYoung
 * @email 18551631365@163.com
 * @date 2018-02-18 14:08:39
 */

/**数据渲染对象*/
var Render = {
    /**
     * @param rowdata    行数据
     * @param renderData 渲染后的列
     * @description      详情按钮渲染
     */
    info: function (rowdata, renderData) {
        var btn = ' <button  onclick="detailOne(\'' + "/projectmanage/info" + '\',\'' + rowdata.objId + '\')" class="layui-btn layui-btn-mini">详情</button>';
        return btn;
    },
    /**
     * @param rowdata    行数据
     * @param renderData 渲染后的列
     * @description      修改按钮渲染
     */
    edit: function (rowdata, renderData) {
        var btn = ' <button  onclick="editOne(\'' + "/projectmanage/edit" + '\',\'' + rowdata.objId + '\')" class="layui-btn layui-btn-mini">修改</button>';
        return btn;
    },
    /**
     * @param rowdata    行数据
     * @param renderData 渲染后的列
     * @description      删除按钮渲染
     */
    delete: function (rowdata, renderData) {
        var btn = ' <button  onclick="deleteOne(\'' + "删除" + '\',\'' + "/projectmanage/delete" + '\',\'' + rowdata.objId + '\')" class="layui-btn layui-btn-mini layui-btn-delete">删除</button>';
        return btn;
    }
};
