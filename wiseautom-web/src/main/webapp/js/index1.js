$(function () {
	$("body").click(function () {
		$(".layui-nav-item").removeClass("layui-this");
    });
    //时间
    function data(){
        var d=new Date(),str='';
        str +=d.getFullYear()+'年'; //获取当前年份
        str +=d.getMonth()+1+'月'; //获取当前月份（0——11）
        str +=d.getDate()+'日';
        return str;
    }
    function week(){
        var arr = new Array("日", "一", "二", "三", "四", "五", "六");
        var week = new Date().getDay();
        return "星期" + arr[week];
    }

    function time(){
        var d=new Date();
        var hours=d.getHours();
        var minutes = d.getMinutes()>9?d.getMinutes().toString():'0' + d.getMinutes();
        var seconds = d.getSeconds()>9?d.getSeconds().toString():'0' + d.getSeconds();
        var str = hours + ':' + minutes + ':' + seconds;
        return str;
    }

    setInterval(function(){
        $("#nowTime").children(".data").html(data());
        $("#nowTime").children(".week").html(week());
        $("#nowTime").children(".time").html(time());
    },1000);

});

layui.config({
  base:'js/'
}).use(['navtab'],function(){
	window.jQuery = window.$ = layui.jquery;
	window.layer = layui.layer;
    var element = layui.element(),
	navtab = layui.navtab({
		elem: '.larry-tab-box'
	});

    //iframe自适应
	$(window).on('resize', function() {
		var $content = $('#larry-tab .layui-tab-content');
		$content.height($(this).height() - 140);
	    $content.find('iframe').each(function() {
	    	$(this).height($content.height());
	    });
	}).resize();
  
	$(function(){
	    $('#larry-nav-side').click(function(){
	        if($(this).attr('lay-filter')!== undefined){
	            $(this).children('ul').find('li').each(function(){
	                var $this = $(this);
	                if($this.find('dl').length > 0){
	                   var $dd = $this.find('dd').each(function(){
	                       $(this).on('click', function() {
	                           var $a = $(this).children('a');
	                           var href = $a.data('url');
                               var id = $a.data('id');
	                           var icon = $a.children('i:first').data('icon');
	                           var title = $a.children('span').text();
	                           var data = {
	                                 href: href,
	                                 icon: icon,
	                                 title: title,
                                   tabId:id
	                           }
	                           navtab.tabAdd(data);
	                       });
	                   });
	                }else{
	                	$this.on('click', function() {
                           var $a = $(this).children('a');
                           var href = $a.data('url');
                           var icon = $a.children('i:first').data('icon');
                           var title = $a.children('span').text();
                           var data = {
                                 href: href,
                                 icon: icon,
                                 title: title
                           }
                           navtab.tabAdd(data);
	                    });
	                }
	            });
	        }
	    }).trigger("click");
	});
});


layui.use(['jquery','layer','element'],function(){
	window.jQuery = window.$ = layui.jquery;
	window.layer = layui.layer;
	var element = layui.element();

	// larry-side-menu向左折叠
	$('.larry-side-menu').click(function() {
	  var sideWidth = $('#larry-side').width();
	  if(sideWidth === 200) {
	      $('#larry-body').animate({
	        left: '0'
	      }); 
	      $('#larry-footer').animate({
	        left: '0'
	      });
	      $('#larry-side').animate({
	        width: '0'
	      });
	  } else {
	      $('#larry-body').animate({
	        left: '200px'
	      });
	      $('#larry-footer').animate({
	        left: '200px'
	      });
	      $('#larry-side').animate({
	        width: '200px'
	      });
	  }
	});
});



//生成菜单
var menuItem = Vue.extend({
	name: 'menu-item',
	props:{item:{}},
	template:[
	          '<li class="layui-nav-item">',
	          '<a v-if="item.type === 0" href="javascript:;">',
	          '<i v-if="item.icon != null" :class="item.icon"></i>',
	          '<span>{{item.name}}</span>',
	          '<em class="layui-nav-more"></em>',
	          '</a>',
	          '<dl v-if="item.type === 0" class="layui-nav-child">',
	          '<dd v-for="item in item.list">',
	          '<a v-if="item.type === 1" href="javascript:;" :data-url="item.url" :data-id="item.menuId" ><i v-if="item.icon != null" :class="item.icon" :data-icon="item.icon"></i> <span>{{item.name}}</span></a>',
	          '</dd>',
	          '</dl>',
	          '<a v-if="item.type === 1" href="javascript:;" :data-url="item.url" :data-id="item.menuId" ><i v-if="item.icon != null" :class="item.icon" :data-icon="item.icon"></i> <span>{{item.name}}</span></a>',
	          '</li>'
	].join('')
});

//注册菜单组件
Vue.component('menuItem',menuItem);

var vm = new Vue({
	el:'#layui_layout',
	data:{
		user:{},
		menuList:{},
		password:'',
		newPassword:'',
        navTitle:"控制台"
	},
	methods: {
		getMenuList: function (event) {
			$.getJSON("sys/menu/user?_"+$.now(), function(r){
				vm.menuList = r.menuList;
                window.permissions = r.permissions;
			});
		},
		getUser: function(){
			$.getJSON("sys/user/info?_"+$.now(), function(r){
				vm.user = r.user;
			});
		},
		updatePassword: function(){
			layer.open({
				type: 1,
				skin: 'layui-layer-molv',
				title: "修改密码",
				area: ['550px', '270px'],
				shadeClose: false,
				content: jQuery("#passwordLayer"),
				btn: ['修改','取消'],
				btn1: function (index) {
					var data = "password="+vm.password+"&newPassword="+vm.newPassword;
					$.ajax({
						type: "POST",
					    url: "sys/user/password",
					    data: data,
					    dataType: "json",
					    success: function(result){
							if(result.code == 0){
								layer.close(index);
								layer.alert('修改成功', function(index){
									location.reload();
								});
							}else{
								layer.alert(result.msg);
							}
						}
					});
	            }
			});
		}
	},
	created: function(){
		this.getMenuList();
		this.getUser();
	}
});
