(function($){
    var dropDownTrees=[];

    $.fn.dropDownTreeDp=function(dpProps){
        var $dropDownTree=$(this);
        //var dpProps=$dropDownTree.attr("dpProps");
        //dpProps=eval("({"+dpProps+"})");
        if(!dpProps.key_value)dpProps.key_value="value";
        if(!dpProps.key_code)dpProps.key_code="code";
        dpProps.isTree=true;
        //var name=$dropDownTree.attr("name");
        //var value=$dropDownTree.attr("value");
        var text= $dropDownTree.attr("text");
        var name=dpProps.name;
        var value=dpProps.value;
//        var text= dpProps.text;
        $dropDownTree.attr("dpType","dropDownTree");
        $dropDownTree.css("display","none");
        var domObject=createDropDownDom($dropDownTree,dpProps);
        $dropDownTree=domObject.$inputDiv.find(".combo-text").prev();
        domObject.dpProps=dpProps;

        var $inputDiv = domObject.$inputDiv;
        var $treeDiv = domObject.$treeDiv;

        if(dpProps.width){
            var borderAndPaddingWidth= $inputDiv.find(".combo-text").outerWidth()-$inputDiv.find(".combo-text").width();
            $inputDiv.find(".combo-text").css("width",parseInt(dpProps.width)-borderAndPaddingWidth);
        }
        if(value&&text){
            domObject.$inputDiv.find(".combo-text").attr("value",text);
            domObject.$inputDiv.find(".combo-text").attr("title",text);
        }else if(dpProps.watermark){
            domObject.$inputDiv.find(".combo-text").attr("value",dpProps.watermark);
            domObject.$inputDiv.find(".combo-text").attr("title",dpProps.watermark);
        }

        if(value&&!text){
            $.fn.getDataStore(dpProps,function(data){
                var childNodes= transformToArrayFormat(data);
                var valArray=value.split(",");
                var textValue="";
                var hasEqual={};//yangjy 2015-11-15 hongzy表码有相同的只显示一个,如果已经匹配的就放进去，不做第二次匹配
                $.each(childNodes,function(){
                    var item=this;
                    if(hasEqual[item])return;
                    $.each(valArray,function(){
                        if(item[dpProps.key_code]==this){
                            (textValue.length>0)&&(textValue=textValue+",");
                            textValue=textValue+item[dpProps.key_value];
                            hasEqual[this]=true;
                        }
                    });
                });
                domObject.$inputDiv.find(".combo-text").attr("value",textValue);
                domObject.$inputDiv.find(".combo-text").attr("title",textValue);
                domObject.$inputDiv.find("input:hidden").val(value);//yangjy2015-11-11，为什么没值
            });
        }
        $inputDiv.getTreeObj=function(){
            return $inputDiv.treeObj;
        }
        $inputDiv.getValue=function(){
            return $dropDownTree.attr("value");
        }
        $inputDiv.getText=function(){ //获取显示文本
            return $dropDownTree.attr("displayValue");
        }
        $inputDiv.getTextByValue=function(value){ //根据值获取显示文本
            return getTextByValue(value,$inputDiv.treeObj,dpProps);
        }
        $inputDiv.getValueByText=function(text){ //根据显示文本获取值
            return getValueByText(text,$inputDiv.treeObj,dpProps);
        }

        $inputDiv.setReadonly=function(read){
            if(read){
                //设置只读
                $inputDiv.children().children().addClass("readonly");
                $inputDiv.children().children().eq(1).attr("readonly","readonly");
            }else{
                //设置可用
                $inputDiv.children().children().removeClass("readonly");
                $inputDiv.children().children().eq(1).removeAttr("readonly");
            }
        }
        $inputDiv.setDisabled=function(able){
            if(able){
                //设置禁用，不做表单提交
                $inputDiv.children().children().addClass("disabled");
                $inputDiv.children().children().eq(1).attr("disabled","disabled");
            }else{
                //设置可用
                $inputDiv.children().children().removeClass("disabled");
                $inputDiv.children().children().eq(1).removeAttr("disabled");
            }
        }

        $inputDiv.setValue=function(value){
            setValueOnCheck(value,$dropDownTree,$inputDiv.treeObj,dpProps);
        }
        $inputDiv.val=function(value) {
            if(arguments.length<=0)return  $dropDownTree.val();
            setValueOnCheck(value,$dropDownTree,$inputDiv.treeObj,dpProps);
        }
        $inputDiv.text4val=$inputDiv.getTextByValue;
        $inputDiv.val4text=$inputDiv.getValueByText;
        $inputDiv.readonly=$inputDiv.setReadonly;
        $inputDiv.setDisabled=$inputDiv.setReadonly;

        $inputDiv.load=function(param,callback){
            $.extend(domObject.dpProps,param);
            ($inputDiv.getTreeObj())&&$inputDiv.getTreeObj().destroy();
            createObject(domObject,function(treeObj){$inputDiv.treeObj=treeObj;callback&&callback($inputDiv);});
        };

        bindDomEvent(domObject,$inputDiv);
        dropDownTrees.push($inputDiv);
        $dropDownTree.data("dropDownTree",$inputDiv);
        //readonly 添加下拉树只读属性
        if($inputDiv.children().children(1).hasClass("readonly")){
            $inputDiv.children().children().addClass("readonly");
            //$inputDiv.children().children().eq(1).attr("readonly","readonly");
        }
        if($inputDiv.children().children(1).hasClass("disabled")){
            $inputDiv.children().children().addClass("disabled");
            //$inputDiv.children().children().eq(1).attr("readonly","readonly");
        }
        return domObject.$inputDiv;
    };
    $.fn.dropDownTreeResizePos=function(){
        var position=function($inputDiv){
            var $inputText= $inputDiv.find(".combo-text");
            var panelId=$inputDiv.data("panelId");
            var $treeDiv=$("#"+panelId);
            if ($treeDiv.is(":hidden"))return;
            var ObjBottom = $(window).height() - $inputText.offset().top - $inputText.height();
            $treeDiv.css({left:$inputText.offset().left});
            if(ObjBottom > $treeDiv.height()){
                $treeDiv.css({top:$inputText.offset().top+$inputText.outerHeight()-1});
            }else{
                $treeDiv.css({top:$inputText.offset().top - $treeDiv.height() + 1});
                $treeDiv.data("upOrDown","up");
            }
        }
        $.each(dropDownTrees, function() {
            //position(this.getDom());
            var $inputDiv=this;
            var $inputText= $inputDiv.find(".combo-text");
            var panelId=$inputDiv.data("panelId");
            var $treeDiv=$("#"+panelId);
            if($treeDiv.is(":visible")) $treeDiv.hide();
        });
    }
    /** 树节点线性化 **/
    function transformToArrayFormat(nodes) {
        if (!nodes) return [];
        var childKey = "children",
            r = [];
        if ($.isArray(nodes)) {
            for (var i=0, l=nodes.length; i<l; i++) {
                r.push(nodes[i]);
                if (nodes[i][childKey])
                    r = r.concat(transformToArrayFormat(nodes[i][childKey]));
            }
        } else {
            r.push(nodes);
            if (nodes[childKey])
                r = r.concat(transformToArrayFormat(nodes[childKey]));
        }
        return r;
    }
    /**设置值，改变checkbox选中状态**/
    function setValueOnCheck(value,$dropDownTree,treeObj,dpProps){
        //if(!value) return;
        //treeObj.checkAllNodes(false);
        if(!treeObj){
            //延迟加载时，塞值、清空处理  yh 2015.5.7
            if(!value){
                $dropDownTree.siblings(".combo-text").attr("value", "");
                $dropDownTree.siblings(".combo-text").attr("title", "");
                $dropDownTree.attr("value", "");
                $dropDownTree.attr("displayValue", "");
                return;
            }
            $.fn.getDataStore(dpProps,function(data){
                var childNodes= transformToArrayFormat(data);
                var valArray=value.split(","),txtArray=[],valueArray=[];
                $.each(childNodes,function(){
                    if($.inArray(this[dpProps.key_code],valArray)==-1) return
                    txtArray.push(this[dpProps.key_value]);
                    valueArray.push(this[dpProps.key_code]);
                    //treeObj.checkNode(node,true);
                    //if(this[dpProps.key_code]!=value)return;
                });
                $dropDownTree.siblings(".combo-text").attr("value", txtArray.toString());
                $dropDownTree.siblings(".combo-text").attr("title", txtArray.toString());
                $dropDownTree.attr("value", valueArray.toString());
                $dropDownTree.attr("displayValue", txtArray.toString());//增加显示值
            });
            return;
        }
        var checkNodes=treeObj.getCheckedNodes();
        $.each(checkNodes,function(){
            treeObj.checkNode(this,false);
            //item.halfCheck=false;
        });

        if(!value){
            $dropDownTree.siblings(".combo-text").attr("value", "");
            $dropDownTree.siblings(".combo-text").attr("title", "");
            $dropDownTree.attr("value", "");
            $dropDownTree.attr("displayValue", "");
            return;
        }

        var valArray=value.split(","),txtArray=[];
        for(var i=0;i<valArray.length;i++){
            var node=treeObj.getNodeByParam(treeObj.key_code,valArray[i]);
            if(!node)continue;
            txtArray.push(node[treeObj.key_value]);
            treeObj.checkNode(node,true);
        }
        $dropDownTree.siblings(".combo-text").attr("value", txtArray.toString());
        $dropDownTree.siblings(".combo-text").attr("title", txtArray.toString());
        $dropDownTree.attr("value", value);
        $dropDownTree.attr("displayValue", txtArray.toString());

    }

    /*根据实际值，获取显示文本 yh 2015.5.28 */
    function getTextByValue(value,treeObj,dpProps){
        if(!treeObj){
            //延迟加载时，塞值、清空处理  yh 2015.5.7
            if(!value) return "";
            var displayText="";
            $.fn.getDataStore(dpProps,function(data){
                var childNodes= transformToArrayFormat(data);
                $.each(childNodes,function(){
                    if(this[dpProps.key_code]==value){
                        displayText = this[dpProps.key_value];//增加显示值
                        return
                    }
                });
            });
            return displayText;
        }
        if(!value) return "";
        var valArray=value.split(","),txtArray=[];
        for(var i=0;i<valArray.length;i++){
            var node=treeObj.getNodeByParam(treeObj.key_code,valArray[i]);
            if(!node)continue;
            txtArray.push(node[treeObj.key_value]);
        }
        return txtArray.toString();
    }

    /*根据显示文本，获取真实值 yh 2015.5.28 */
    function getValueByText(value,treeObj,dpProps){
        if(!treeObj){
            //延迟加载时，塞值、清空处理  yh 2015.5.7
            if(!value) return "";
            $.fn.getDataStore(dpProps,function(data){
                var childNodes= transformToArrayFormat(data);
                $.each(childNodes,function(){
                    if(this[dpProps.key_value]!=value) return;
                    return this[dpProps.key_code];//增加显示值
                });
            });
            return "";
        }
        if(!value) return "";
        var valArray=value.split(","),txtArray=[];
        for(var i=0;i<valArray.length;i++){
            var node=treeObj.getNodeByParam(treeObj.key_value,valArray[i]);
            if(!node)continue;
            txtArray.push(node[treeObj.key_code]);
        }
        return txtArray.toString();
    }

    /**设置checkbox选中状态，改变值**/
    function checkOnSetValue($dropDownTree,treeObj){
        var nodes = treeObj.getNodesByParam("checked",true),
            val = "",txt="";
        for (var i=0, l=nodes.length; i<l; i++) {
            var halfCheck = nodes[i].getCheckStatus();
            var chkboxType=treeObj.setting.check.chkboxType;
            if(halfCheck){
                if (!halfCheck.half||!chkboxType.Y.match("s")){
                    txt += nodes[i][treeObj.key_value] + ",";
                    val+=nodes[i][treeObj.key_code] + ",";
                }
            }


        }
        if (val.length > 0 ) val = val.substring(0, val.length-1);
        if (txt.length > 0 ) txt = txt.substring(0, txt.length-1);
        $dropDownTree.siblings(".combo-text").attr("value", txt);
        $dropDownTree.siblings(".combo-text").attr("title", txt);
        $dropDownTree.attr("value", val);
        $dropDownTree.attr("displayValue", txt);
    }
    /** 加入拼音字段 **/
    function addPinField(data,attrName){
        var getPY=function(str){
            var doublePY=[{"hz":"厦门市","py":"xms"},{"hz":"重庆市","py":"cqs"}];
            var py=pinyin.getCamelChars(str);;
            $.each(doublePY,function(){
                var index= str.indexOf(this.hz);
                if(index<0)return;
                py=py.substr(0,index)+this.py+py.substr(index+this.py.length,py.length);
            });
            return py;
        }
        var addPin=function(data){
            data["py"]=getPY(data[attrName]);
            if(!data.children) return;
            if(data.children.length<=0) return;
            for(var i=0;i<data.children.length;i++){
                addPin(data.children[i]);
            }
        }
        for(var i=0;i<data.length;i++){
            addPin(data[i]) ;
        }
        return data;
    }
    /** 外部参数转换为内部参数 **/
    function outerProps2innerProps(domObject){
        var dpProps=domObject.dpProps;
        if(dpProps.mutil){
            dpProps.check=$.extend({},dpProps.check,{enable:true});
        }

    }
    /**创建对象 **/
    function createObject(domObject,callback){
        var $inputDiv=domObject.$inputDiv;
        var $treeDiv=domObject.$treeDiv;
        var $zTree=$treeDiv.find("ul");
        var value=$inputDiv.find(".combo-text").prev().val();
        var dpProps=domObject.dpProps;
        var setting={
            view: {
                fontCss: setFontCss_ztree
            },
            callback: {
                onClick: function (event, treeId, treeNode) {
                    if($.fn.zTree.getZTreeObj(treeId).setting.check.enable)return;
                    if(dpProps.onSelect&&!dpProps.onSelect(treeNode))return;  //点击节点自定义操作
                    $inputDiv.find(".combo-text").prev().val(treeNode[dpProps.key_code]);
                    $inputDiv.find(".combo-text").attr("value",treeNode[dpProps.key_value]);
                    $inputDiv.find(".combo-text").attr("title",treeNode[dpProps.key_value]);
                    $inputDiv.attr("validate")&&$inputDiv.find(".combo-text").validationEngine("validate");
                    $treeDiv.hide();
                    dpProps.onClick&&dpProps.onClick(treeNode);//增加点击事件
                    dpProps.onChange&&dpProps.onChange(treeNode[dpProps.key_code],$inputDiv);//增加点击事件
                },

                onCheck: function(event, treeId, treeNode){
                    var treeObj = $.fn.zTree.getZTreeObj(treeId);
                    if(dpProps.onSelect&&!dpProps.onSelect(treeNode)){
                        treeObj.checkNode(treeNode,false);
                        return;
                    }  //点击节点自定义操作
                    checkOnSetValue( $inputDiv.find(".combo-text").prev(),treeObj);
                    $inputDiv.attr("validate")&&$inputDiv.find(".combo-text").validationEngine("validate");
                    dpProps.onClick&&dpProps.onClick(treeNode);//增加点选中事件
                    dpProps.onChange&&dpProps.onChange(treeNode[dpProps.key_code],$inputDiv);//增加点击事件
                }
            } ,
            //data:{key:{name:'name'}}
            data:{key:{name:dpProps.key_value}}

        };
        var  treeObj="";

        /**如果是数组则为数据  **/
        if($.isArray(dpProps.data)){
            dpProps._data=dpProps.data;
            dpProps.data={};
        }

        dpProps.view=$.extend({},dpProps.view, setting.view);
        dpProps.callback=$.extend({},dpProps.callback, setting.callback);
        dpProps.data=$.extend({},dpProps.data, setting.data);


        outerProps2innerProps(domObject);

        $.fn.getDataStore($.extend({},dpProps,{data:dpProps._data}),function(data){
            data=addPinField(data,dpProps.key_value);
            treeObj= $.fn.zTree.init($zTree, dpProps,data);
            treeObj.key_code=dpProps.key_code;
            treeObj.key_value=dpProps.key_value;
            setTimeout(function(){
                var value=$inputDiv.find(".combo-text").prev().val();
                setValueOnCheck(value,$inputDiv.find(".combo-text").prev(),treeObj);
                callback&&callback(treeObj);
            },50);
        });
    }
    /**绑定dom事件 **/
    function bindDomEvent(domObject,$inputDiv){
        var $inputDiv=domObject.$inputDiv;
        var $treeDiv=domObject.$treeDiv;
        var $tree= $treeDiv.find(".ztree");
        $treeDiv.find(".search_condition").keypress(function(e) {
            if(/^13$/.test(e.keyCode)) { //是否为Enter键
                search_ztree($tree.attr("id"), $(this).attr("id"));
                e.stopPropagation();
                e.preventDefault();
            }
        });
        $inputDiv.find(".combo-text").click(function(){
            this.select();
        }).keydown(function(e) {
            if(/^8$/.test(e.keyCode)) { //是否为Enter键
                $inputDiv&&$inputDiv.setValue("");
                e.stopPropagation();
                e.preventDefault();
            }
        });
        $inputDiv.find(".clearIcon").click(function(e){
            // 存在禁用、只读属性时，清空事件禁用 yh 2015.7.8
            if($(this).hasClass("disabled")||$(this).hasClass("readonly")) return;
            $inputDiv&&$inputDiv.setValue("");
            e.stopPropagation();
            e.preventDefault();
        }) ;
        $treeDiv.bgiframe({
            width: "100%",
            height: "100%"
        });
        $(document).bind("click",function(e){
            var target  = $(e.target);
            if(target.closest(".dropDownBox").length == 0 && target.closest(".combo-panel").length == 0){ /*.closest()沿 DOM 树向上遍历，直到找到已应用选择器的一个匹配为止，返回包含零个或一个元素的 jQuery 对象。*/
                $treeDiv.hide();
                $inputDiv.css("z-index","0");
            };
            e.stopPropagation();
        });
        $(".combo-arrow",$inputDiv).click(function(e){
            // 存在禁用、只读属性时，三角点击事件禁用 yh 2015.7.8
            if($(this).hasClass("disabled")||$(this).hasClass("readonly")) return;
            var treeObj=$treeDiv.data("treeObj");
            BindPanelShowHide($treeDiv,$inputDiv,e,domObject);
            if(!treeObj){
                $treeDiv.find("ul").append("<li>&nbsp;&nbsp;数据正在加载</li>");
                $treeDiv.data("treeObj",{});
                createObject(domObject,function(treeObj){
                    treeObj.pageNum=domObject.dpProps.pageNum?domObject.dpProps.pageNum:5;
                    //修改父节点 禁用属性 yh 2015.9.25
                    if(domObject.dpProps.unSelectParents){
                        $.each(treeObj.getNodes(),function(){
                            if(this.children) treeObj.setChkDisabled(this,true);
                        })
                    }
                    $treeDiv.data("treeObj",treeObj);
                    $inputDiv.treeObj= treeObj;
                    $inputDiv.val($inputDiv.find("input:hidden").val());//yangyj 2015-11-11 创建对象塞值
                });
                e.stopPropagation();
                return;
            }
            e.stopPropagation();
        });
    }
    /**创建相关dom元素 **/
    function createDropDownDom($inputValue,dpProps){
        var nowTime=(new Date()).getTime();
        var txtId="text-"+nowTime +$(".combo-text").length;
        var ztreeId ="ztree-"+nowTime + $(".ztree").length;
        var searchId="search_condition-"+nowTime + $(".search_condition").length;
        /** 输入框**/
        var htmlText='<div class="dropDownBox"><span class="combo">' +
            $inputValue.prop('outerHTML')+
            '<input type="text" readonly="true" id="'+txtId+'" class="combo-text" >' +
            '<a href="javascript:;" class="clearIcon"></a> <span class="combo-arrow"></span>' +
            '</span></div>';
        var $inputDom=$(htmlText);
        $inputValue.replaceWith($inputDom);
        if($.browser.version=="6.0"){
            setTimeout(function(){
                $inputDom.css("width",$inputDom.find("#"+txtId).width()+$inputDom.find(".clearIcon").width()+$inputDom.find("span.combo-arrow").width()+8) ;
            },100);
        }

        /** 下拉层 **/
        var panelId="panel-"+ nowTime+$(".combo-panel").length;
        htmlText='<div class="combo-panel" id="'+panelId+'"><div class="search-box">'+
        '<input type = "text" class="search_condition" id="' +searchId+ '" /><span class="summary-bar"></span></div>'+
        '<div class="d-p-m"><ul class="ztree" style="margin-top:2px;" id="' + ztreeId +'" ></ul>'+
        '</div></div>';
        var $treeDom= $(htmlText);
        $treeDom.appendTo("body");
        $inputDom.data("panelId",panelId);

        $inputDom.find(".combo-text").addClass($inputValue.attr("class")).data("treeId",ztreeId);
        $inputDom.find(".combo-text")
            .attr("data-prompt-position",$inputValue.attr("data-prompt-position"))
            .attr("alignX",$inputValue.attr("alignX"))
            .attr("alignY",$inputValue.attr("alignY"))
            .attr("offsetX",$inputValue.attr("offsetX"))
            .attr("offsetY",$inputValue.attr("offsetY"));

        $inputDom.find(".combo-text").css("width",$inputDom.find("input[dptype]").width()-$inputDom.find(".clearIcon").width()-$inputDom.find(".combo-arrow").width() + 1);
        $inputDom.find("input").first().removeAttr("class");

        if(dpProps.width=="auto"){
            $inputDom.find(".combo-text").css("width","");
            $inputDom.addClass("combo-auto-width");
        }

        return {'$inputDiv':$inputDom,'$treeDiv':$treeDom};
    }
    /**隐藏其他下拉树  **/
    function hideOtherDropDownTree(){
        $(".dropDownRadioBox").each(function(){
            var id=$(".ffb-input",this).attr("id");
            $("#ctr"+id).hide();
        });
        $.each(dropDownTrees, function() {
            var panelId=this.data("panelId");
            if ($("#"+panelId).is(":hidden"))return;
            $("#"+panelId).hide();
        });
    }
    //下拉层的显示隐藏
    function BindPanelShowHide($treeDiv,$inputDiv,event,domObject) {
        var $inputText=$(event.target).siblings(".combo-text");//改变下拉树弹出层定位方式 yh 2015.12.14
        //var $inputText=$inputDiv.find(".combo-text");
        if ($treeDiv.is(":hidden")) {
            $(".dropDownBox").css("z-index","0");
            $(".dropDownBox").find(".combo-panel").hide();
            $treeDiv.css("z-index",99900); //修改弹出层优先级，低于对话框

            if(domObject.dpProps.autoWidth){//下拉层自动撑开
                $treeDiv.find(".d-p-m").css({"min-width": $inputDiv.find(".combo").width() - 2 + "px"});
                $treeDiv.find(".d-p-m").css({"overflow-x": "visible"});
            }else
                $treeDiv.css({"width": $inputDiv.find(".combo").outerWidth()-2 + "px"});

            $treeDiv.find(".d-p-m").css("height","200px");
            var ObjBottom = $(window).height() - $inputText.offset().top - $inputText.height();
            $treeDiv.css({left: $inputText.offset().left});
            if(ObjBottom > $treeDiv.height()){
                $treeDiv.css({top:$inputText.offset().top+$inputDiv.height()});
            }else{
                $treeDiv.css({top:$inputText.offset().top -  $treeDiv.height()});
                $treeDiv.data("upOrDown","up");
            }
            hideOtherDropDownTree();
            $treeDiv.show();
        }else {
            $treeDiv.hide();
            $treeDiv.css("z-index","0");
        }
    }


    /**
     * 收起树：只展开根节点下的一级节点
     * @param treeId
     */
    function close_ztree(treeId){
        var treeObj = $.fn.zTree.getZTreeObj(treeId);
        var nodes = treeObj.transformToArray(treeObj.getNodes());
        var nodeLength = nodes.length;
        for (var i = 0; i < nodeLength; i++) {
            if (nodes[i][treeObj.key_code] == '0') {
                //根节点：展开
                (!nodes[i].open)&&treeObj.expandNode(nodes[i], true, true, false);
            } else {
                //非根节点：收起
                nodes[i].open&&treeObj.expandNode(nodes[i], false, true, false);
            }
        }
    }

    /**
     * 搜索树，高亮显示并展示【模糊匹配搜索条件的节点s】
     * @param treeId
     * @param searchConditionId 文本框的id
     */
    function search_ztree(treeId, searchConditionId){
        var treeObj = $.fn.zTree.getZTreeObj(treeId);
        var pageSize=treeObj.pageNum;
        if($.browser.msie&&($.browser.version=="6.0")){
            pageSize=1;
        }
        //<1>.搜索条件
        var searchCondition = $.trim($('#' + searchConditionId).val());
        //<2>.得到模糊匹配搜索条件的节点数组集合
        var highlightNodes =[];

        if (searchCondition != "") {
            highlightNodes = treeObj.getNodesByParamFuzzy("value", searchCondition, null);
            var pyNodes=treeObj.getNodesByParamFuzzy("py", searchCondition, null);
            highlightNodes= $.merge(highlightNodes,pyNodes);
        }else{
            showAllNodes(treeObj);
        }

        var pageObj=getPageObject(treeObj,searchConditionId,highlightNodes.length,pageSize);
        highlightNodes=highlightNodes.slice((pageObj.index-1)*pageSize,pageObj.index*pageSize);
        var searchSpan=$('#' + searchConditionId).next();
        searchSpan.html(pageObj.html);
        $('#' + searchConditionId).attr("title","输入查询条件，回车翻页！");
        //<3>.高亮显示并展示【指定节点s】
        if($.browser.msie&& $.browser.version=="6.0"){
            (!searchCondition)&&removeHighlight(treeObj);
            (!searchCondition)&&close_ztree(treeId);
            searchCondition&&showTreePaths(treeObj,highlightNodes);
            return;
        }
        removeHighlight(treeObj);
        close_ztree(treeId);
        searchCondition&&showTreePaths(treeObj,highlightNodes);
    }
    /** 显示所有节点  **/
    function showAllNodes(treeObj){
        var nodes = treeObj.getNodesByParam("isHidden", true);
        if($.browser.msie&& $.browser.version=="6.0"){
            var pageSize=10;
            for(var i=0;i<nodes.length/pageSize+1;i++){
                var tempNodes=nodes.slice(i*pageSize,(i+1)*pageSize);
                var fun=(function(tempNodes){
                    return function(){treeObj.showNodes(tempNodes); }
                })(tempNodes);
                setTimeout(fun,i*30);
            }
            return;
        }
        treeObj.showNodes(nodes);
    }
    /** 删除高亮显示  **/
    function removeHighlight(treeObj){
        var treeNodes = treeObj.transformToArray(treeObj.getNodes());
        for (var i = 0; i < treeNodes.length; i++) {
            if(!treeNodes[i].highlight) continue;
            treeNodes[i].highlight = false;
            treeObj.updateNode(treeNodes[i]);
        }
    }
    /** 获取分页对象  **/
    function getPageObject(treeObj,searchConditionId,recordCount,pageSize){
        var searchCondition = $.trim($('#' + searchConditionId).val());
        /**  空的时候返回-1  **/
        if(searchCondition == ""){
            treeObj.searchObj={"key":searchCondition,index:1};
            return {index:-1,pageTotal:-1,html:"全部"};
        }
        var pageText="页,每页:"+pageSize+",总记录:"+recordCount;
        if(recordCount<=0)
            return {index:-1,pageTotal:-1,html:"0/0"};
        var pageTotal= parseInt(recordCount/pageSize);
        if(recordCount%pageSize!=0) pageTotal+=1;
        if(!treeObj.searchObj||treeObj.searchObj.key!=searchCondition) {
            treeObj.searchObj={"key":searchCondition,index:1};
            return {index:1,pageTotal:pageTotal,html:"1/"+pageTotal+pageText};
        }
        var index=treeObj.searchObj.index;
        index=index>=pageTotal?1:index+1;
        treeObj.searchObj.index=index;
        return {index:index,pageTotal:pageTotal,html:index+"/"+pageTotal+pageText};
    }
    /** 显示对应节点的根路径并展开高亮  **/
    function showTreePaths(treeObj,nodeList){
        /**  获取父节点路径直到根节点 **/
        var treeStructure={};
        var key_code=treeObj.key_code;
        var createTreeStructure=function (node){
            if(node == null || node.getParentNode() == null)return;
            var parentNode = node.getParentNode();
            treeStructure[node[key_code]].pid= parentNode[key_code];
            if(!treeStructure[parentNode[key_code]]){
                treeStructure[parentNode[key_code]]={node:parentNode,pid:"",cid:{}};
            }
            treeStructure[parentNode[key_code]].cid[node[key_code]]=true;
            arguments.callee( parentNode);
        }
        $.each(nodeList,function(){
            if(!treeStructure[this[key_code]]) treeStructure[this[key_code]]={node:this,pid:"",cid:{}};
            this.highlight=true;
            treeObj.updateNode(this);
            createTreeStructure(this);
        });

        var showAndExpandNodes= function(nodeStructure){
            if($.isEmptyObject(nodeStructure.cid)) return;
            var levelNodes=nodeStructure.node.children;
            treeObj.hideNodes(levelNodes);
            for(var cid in nodeStructure.cid){
                if($.browser.msie&&($.browser.version=="6.0")){
                    setTimeout(function(){
                        treeObj.showNode(treeStructure[cid].node);
                        treeObj.expandNode(treeStructure[cid].node,true,false,false);
                    },20);
                }else{
                    treeObj.showNode(treeStructure[cid].node);
                    treeObj.expandNode(treeStructure[cid].node,true,false,false);
                }
                arguments.callee(treeStructure[cid]);
            }
        }
        treeObj.hideNodes(treeObj.getNodes());
        (function(){
            for(var code in treeStructure){
                var nodeStructure=treeStructure[code];
                if(nodeStructure.pid)continue;
                var currentNode=nodeStructure.node;
                treeObj.showNode(currentNode);
                treeObj.expandNode(currentNode,true,false,false);
                showAndExpandNodes(nodeStructure);
            }
        })();
    }
    /**
     * 设置树节点字体样式
     */
    function setFontCss_ztree(treeId, treeNode) {
        var treeObj = $.fn.zTree.getZTreeObj(treeId);
        if (treeNode[treeObj.key_code] == 0) {
            //根节点
            return {color:"#333", "font-weight":"bold"};
        } else if (treeNode.isParent == false){
            //叶子节点
            return (!!treeNode.highlight) ? {color:"#ff0000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
        } else {
            //父节点
            return (!!treeNode.highlight) ? {color:"#ff0000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
        }
    }



})(jQuery);