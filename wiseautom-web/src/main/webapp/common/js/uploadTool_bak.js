/**
 * Created by 陈熠 on 2017/8/22
 * email   :  228112142@qq.com
 * 上传控件
 */
(function ($) {
    /* 入口函数 */
    $.fn.uploadTool = function () {
        //当前对象
        var $grid = this;
        //获取参数
        cyProps = $grid.attr("cyProps");
        cyProps = cyProps ? cyProps : "";
        //将参数转为json
        cyProps = eval("({" + cyProps + "})");
        //上传控件类型
        var type = cyProps.multiple || false;
        if (type == true) {
            //如果是多文件
            uploadTool.renderMultiple($grid, cyProps);
        } else {
            //如果是单文件
            uploadTool.renderSingle($grid, cyProps);
        }

    };
    /*默认配置*/
    var cyProps = {};
    /*方法对象*/
    var uploadTool = {
        /**渲染上传控件(上传多个文件) by chenyi 2017/8/22*/
        renderMultiple: function ($grid, cyProps) {
            var _grid = $grid;
            var _url=cyProps.url||"/getData/uploadFiles/";
            var _name=cyProps.name||"files[]";
            var _id=cyProps.uploadId||new Date().getTime();
            $(_grid).addClass("layui-btn").attr("uploadId",_id)
                .after(' <form action="'+_url+'"' +
                    ' id="'+_id+'Form" style="display: none" ' +
                    'enctype="multipart/form-data"method="post"> ' +
                    '<input uploadType="multiple" type="file"accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" multiple name="uploadFiles" onchange="changeMultipleFile(\''+_id+'\',\''+_url+'\',\''+_name+'\')" form-id="'+_id+'Form" id="'+_id+'File" > ' +
                    '</form> ' +
                    ' <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">' +
                    '预览图： <div class="layui-upload-list" id="'+_id+'Imgs"></div>' +
                    ' </blockquote>');

            //默认图片地址
            var _value=cyProps.value||"";
            if(_value!=""){
                var values=_value.split(",");
                for(var i=0;i< values.length;i++){
                    $("#"+_id+"Imgs").append('<div class="img-div"><img src="'+ values[i] +'"  class="layui-upload-img">' +
                        '<div class="file-panel" ><i class="fa fa-trash-o" onclick="removeImgs(this)">&nbsp;</i></div>' +
                        '<input name="'+_name+'" value="'+values[i]+'" type="hidden">' +
                        '</div>');
                }
            }
        },
        /**渲染上传控件(上传单个文件) by chenyi 2017/8/22*/
        renderSingle: function ($grid, cyProps) {
            var _grid = $grid;
            var _url=cyProps.url||"/getData/uploadFile/";
            var _name=cyProps.name||"file";
            var _id=cyProps.uploadId||new Date().getTime();
            $(_grid).addClass("layui-btn").attr("uploadId",_id)
                .after(' <form action="'+_url+'"' +
                    ' id="'+_id+'Form" style="display: none" ' +
                    'enctype="multipart/form-data"method="post"> ' +
                    '<input uploadType="single" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="uploadFile" onchange="changeSingleFile(\''+_id+'\',\''+_url+'\',\''+_name+'\')" form-id="'+_id+'Form" id="'+_id+'File"> ' +
                    '</form>'
                    +
                    ' <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width:110px;">' +
                    '预览图： <div class="layui-upload-list" id="'+_id+'Img"></div>' +
                    ' </blockquote>'
                );
            //默认图片地址
            var _value=cyProps.value||"";
            if(_value!=""){
                var values=_value.split(",");
                $("#"+_id+"Img").append('<div class="img-div"><img src="'+ values[0] +'"  class="layui-upload-img">' +
                    '<div class="file-panel" ><i class="fa fa-trash-o" onclick="removeImgs(this)">&nbsp;</i></div>' +
                    '<input name="'+_name+'" value="'+values[0]+'" type="hidden">' +
                    '</div>');
            }

        }
    }

})(jQuery);

function removeImg(obj) {
    $(obj).parent().prev().attr("src","/statics/img/default.png");
    $(obj).parent().remove();
}
function removeImgs(obj) {

    $(obj).parent().parent().remove();
}
function changeMultipleFile(uploadId,url,inputName){
    var formData = new FormData($( "#"+uploadId+"Form" )[0]);
    $.ajax({
        url : url,
        type : "POST",
        data: formData,
        dataType:"json",
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success : function(R) {
            if(R.code==0){
                for(var i=0;i< R.urls.length;i++){
                    $("#"+uploadId+"Imgs").append('<div class="img-div"><img src="'+ R.urls[i] +'"  class="layui-upload-img">' +
                        '<div class="file-panel" ><i class="fa fa-trash-o" onclick="removeImgs(this)">&nbsp;</i></div>' +
                        '<input name="'+inputName+'" value="'+R.urls[i]+'" type="hidden">' +
                        '</div>');
                }
                parent.layer.msg("添加成功", {icon: 1});
            }else{
                parent.layer.msg(R.msg, {icon: 5});
            }
        },
        error : function(data) {
            parent.layer.msg('系统繁忙 !', {icon: 5});
        }
    });
}
function changeSingleFile(uploadId,url,inputName) {
    var formData = new FormData($( "#"+uploadId+"Form" )[0]);
    $.ajax({
        url : url,
        type : "POST",
        data: formData,
        dataType:"json",
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success : function(R) {
            if(R.code==0){
                $("#"+uploadId+"Img").html("");
                $("#"+uploadId+"Img").append('<div class="img-div"><img src="'+ R.url +'"  class="layui-upload-img">' +
                    '<div class="file-panel" ><i class="fa fa-trash-o" onclick="removeImgs(this)">&nbsp;</i></div>' +
                    '<input name="'+inputName+'" value="'+R.url+'" type="hidden">' +
                    '</div>');
                parent.layer.msg("上传成功", {icon: 1});
            }else{
                parent.layer.msg(R.msg, {icon: 5});
            }
        },
        error : function(data) {
            parent.layer.msg('系统繁忙 !', {icon: 5});
        }
    });

}

$(document).ready(function () {
    $("[cyType='uploadTool']").click(function () {
        var uploadId=$(this).attr("uploadId");
        $("#"+uploadId+"File").val("");
        $("#"+uploadId+"File").click();
    });

    //上传控件
    var uploads = $("[cyType='uploadTool']");
    for (var i = 0; i < uploads.length; i++) {
        $(uploads[i]).uploadTool();
    }
});

