/**
 * Created by Administrator on 14-11-16.
 */
$(document).ready(function(){
    $('#menu').tendina({
        openCallback: function(clickedEl) {
            clickedEl.addClass('opened');
        },
        closeCallback: function(clickedEl) {
            clickedEl.addClass('closed');
        }
 });
	
/*	$("#menu li a.firsta").click(function(){
			var status=$(this).next("ul").css("display");
			var firstchild_a=$(this).find("i");
			var all_lis=$(this).parents("ul").find("a.firsta i");
			all_lis.removeClass("xlcddown");
			all_lis.addClass("xlcd");
				
			if(status=="none"){
				firstchild_a.removeClass("xlcd");
				firstchild_a.addClass("xlcddown");
			}else{
				firstchild_a.removeClass("xlcddown");
				firstchild_a.addClass("xlcd");	
			}
		
		});*/
});

/*点击,菜单项高亮*/
$(function(){
	$("#menu li.menu-list>ul>li").click(function(){
		$("#menu li.menu-list>ul>li").find("a").removeClass("specialclass");
		$(this).find("a",this).addClass("specialclass");
		
	})
});

/*管理员设置*/
/*$(function(){
    $("#ad_setting").click(function(){
        $("#ad_setting_ul").show();
    });
    $("#ad_setting_ul").mouseleave(function(){
        $(this).hide();
    });
    $("#ad_setting_ul li").mouseenter(function(){
        $(this).find("a").attr("class","ad_setting_ul_li_a");
    });
    $("#ad_setting_ul li").mouseleave(function(){
        $(this).find("a").attr("class","");
    });
});*/


function AlertTips(msg,time){
	 $("#alertmsg").html(msg);
	 $("#msgbox").show();
	 setTimeout("$('#msgbox').hide()", time);
}
function isPhone(s){
	var patrn=/^1\d{10}$/;
	if (!patrn.exec(s)) return false
	return true
	
}
function isaccount(s){
	var patrn=/^[a-zA-Z0-9]{4,20}$/;
	if (!patrn.exec(s)) return false
	return true
}
function drop_confirm(msg, url){
    if(confirm(msg)){
        window.location = url;
    }
}
