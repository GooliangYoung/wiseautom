/**
 * Created by chenyi on 2017-08-08 17:35:59
 *  email   :  qq228112142@qq.com
 */
/**跳转到添加页面*/
function add(url){
    parent.layer.open({
        type: 2,
        title: '添加',
        shadeClose: false,
        shade: [0.3, '#000'],
        maxmin: true, //开启最大化最小化按钮
        area: ['893px', '600px'],
        content: url
    });
}
/**跳转到修改页面*/
function edit(table_id,url){
    var id=getSelectedRow(table_id,url);
    if(id!=null){
        parent.layer.open({
            type: 2,
            title: '修改',
            shadeClose: false,
            shade: [0.3, '#000'],
            maxmin: true, //开启最大化最小化按钮
            area: ['893px', '600px'],
            content: url+"/"+id
        });
    }
}

function exportExcel(url){

    window.location.href=url;
}

function init(table_id,url){
    //获取选中的id
    var ids= getSelectedRows(table_id);
    $.ajax({
        type: "post",
        url: url,
        contentType: "application/json",
        data: JSON.stringify(ids),
        async: false,
        dataType:"json",
        success: function (R) {
            if (R.code === 0) {
                parent.layer.msg('操作成功 !', {icon: 1});
            } else {
                parent.layer.msg(R.msg, {icon: 5});
            }
        },
        error: function () {
            parent.layer.msg("系统繁忙", {icon: 5});
        }
    });
}

function detail(id){
  var index=  parent.layer.open({
        type: 2,
        title: '会员详情',
        shadeClose: false,
        shade: [0.3, '#000'],
        maxmin: true, //开启最大化最小化按钮
        area: ['1000px', '700px'],
        content: "/member/info/"+id
    });
    parent.layer.full(index);
}
/**删除*/
function deleteBatch(table_id,url){
    //获取选中的id
    var ids= getSelectedRows(table_id);
    if(ids!=null){
        confirm("确认删除？",function(){
            $.ajax({
                type: "post",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(ids),
                async: false,
                dataType:"json",
                success: function (R) {
                    if (R.code === 0) {
                        closeWindow();
                        parent.layer.msg('删除成功 !', {icon: 1});
                    } else {
                        parent.layer.msg(R.msg, {icon: 5});
                    }
                },
                error: function () {
                    parent.layer.msg("系统繁忙", {icon: 5});
                }
            });
        });
    }

}


/**启用*/
function enable(table_id,url){
    //获取选中的id
    var ids= getSelectedRows(table_id);
    if(ids!=null){
        confirm("确认启用？",function(){
            $.ajax({
                type: "post",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(ids),
                async: false,
                dataType:"json",
                success: function (R) {
                    if (R.code === 0) {
                        closeWindow();
                        parent.layer.msg('启用成功 !', {icon: 1});
                    } else {
                        parent.layer.msg(R.msg, {icon: 5});
                    }
                },
                error: function () {
                    parent.layer.msg("系统繁忙", {icon: 5});
                }
            });
        });
    }

}
/**禁用*/
function limit(table_id,url){
    //获取选中的id
    var ids= getSelectedRows(table_id);
    if(ids!=null){
        confirm("确认禁用？",function(){
            $.ajax({
                type: "post",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(ids),
                async: false,
                dataType:"json",
                success: function (R) {
                    if (R.code === 0) {
                        closeWindow();
                        parent.layer.msg('禁用成功 !', {icon: 1});
                    } else {
                        parent.layer.msg(R.msg, {icon: 5});
                    }
                },
                error: function () {
                    parent.layer.msg("系统繁忙", {icon: 5});
                }
            });
        });
    }

}

// layui.use('upload', function(){
//     //导入
//     var index;
//
//     layui.upload({
//         url: '/member/importExcel'
//         ,elem: '#member' //指定原始元素，默认直接查找class="layui-upload-file"
//         ,method: 'post' //上传接口的http类型
//         ,ext: 'xlsx|xls'
//         ,before:function (input) {//上传前
//             index = parent.layer.load(0, {shade: [0.1, '#000']});
//         }
//         ,success: function(res){
//             parent.layer.msg('操作成功 !', {icon: 1});
//             parent.layer.close(index);
//         }
//     });
// });
/**数据渲染对象*/
var Render = {
    //渲染状态列
    customState: function (rowdata, index, value) {
        if(value == "正常"){
            return '<span style="color:green">'+value+'</span>';
        }
        if(value == "禁用"){
            return '<span style="color:red">'+value+'</span>';
        }
        return value;
    },
    //渲染操作列
    customBtn: function (rowdata, index, value) {

        var btn=' <button class="layui-btn  layui-btn-mini"  onclick="detail(\''+rowdata.id+'\')">查看 </button>';
        return btn;
    },
    customNumber: function (rowdata, index, value) {
        if(value=="0"){
            value="0";
        }
        return value;
    }
};
