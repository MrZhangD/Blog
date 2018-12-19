//菜单栏动画
$('.nav div').mouseover(function(){
	$(this).find('ul').slideDown(150);
});
$('.nav div').mouseleave(function(){
	$(this).find('ul').slideUp(150);	
});

$('#search span').click(function(){
	if($('.input').css('display') == 'none'){
		$('.input').fadeIn(500);
	}else{
		$('.input').fadeOut(500);
	}
});

//主题内容栏动画
var i = 0;
setInterval(function(){
	$('.p_banner div:eq(' + i + ')').fadeOut(1500);
	i++;
	if(i>2){
		i = 0 ;
	}
	$('.p_banner div:eq(' + i + ')').fadeIn(1500);
}, 8000);
$('.p_banner').hover(
	function(){
		$('.p_banner_control').find('div').slideDown(300);
	},
	function(){
		$('.p_banner_control').find('div').slideUp(300);
	}
);
$('.p_banner_pre').click(function(){
	$('.p_banner div:eq(' + i + ')').fadeOut(400);
	i--;
	if(i<0){
		i = 2 ;
	}
	$('.p_banner div:eq(' + i + ')').fadeIn(400);
});
$('.p_banner_next').click(function(){
	$('.p_banner div:eq(' + i + ')').fadeOut(400);
	i++;
	if(i>2){
		i = 0 ;
	}
	$('.p_banner div:eq(' + i + ')').fadeIn(400);
});
$('.p_right div').hover(
	function(){
		$(this).find('img').animate({'opacity' : '1'},300);
	},
	function(){
		$(this).find('img').animate({'opacity' : '0.6'},300);
	}
);
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
    (function(){
        window.scrollReveal = new scrollReveal({reset: true});
    })();
};

window.onload = function(){
	func5();
	func6();
}

function func6()
{	
// 固定层(将side_show_part5固定在右边)
	function buffer(a,b,c){
		var d;
		return function(){
			if(d)
			return;
			d=setTimeout(function(){
				a.call(this),d=undefined
			},b)
		}
	}
	(function(){
		function e(){
			var d=document.body.scrollTop||document.documentElement.scrollTop;
			d>b?(a.className="side_show_part5 gd",c&&(a.style.top=d-b+"px")):a.className="side_show_part5"
		}
		var a=document.getElementById("float");
		if(a==undefined)
		return!1;
		var b=0,c,d=a;
		while(d)b+=d.offsetTop,d=d.offsetParent;
		c=window.ActiveXObject&&!window.XMLHttpRequest;
		if(!c||!0)
		window.onscroll=buffer(e,150,this)
	})();
}
function func5()
{	
	$(document).ready(function($){
	// browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
		//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
		offset_opacity = 1200,
		//duration of the top scrolling animation (in ms)
		scroll_top_duration = 700,
		//grab the "back to top" link
		$back_to_top = $('.cd-top');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
		if( $(this).scrollTop() > offset_opacity ) { 
			$back_to_top.addClass('cd-fade-out');
		}
	});
	//www.sucaijiayuan.com
	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0 ,
		 	}, scroll_top_duration
		);
	});

});
}
//弹出微信二维码的窗口
jQuery(document).ready(function($) {
	$('.wxgzh a').click(function(){
		$('.wxpop_mask').fadeIn(200);
		$('.wxpop').slideDown(300);
	})
	$('.wxpop_top .close').click(function(){
		$('.wxpop_mask').fadeOut(200);
		$('.wxpop').slideUp(300);
	})

})

//留言处登录信息
$('.gbook_comment_text').click(function(){
//	if($('.gbook_comment_author').css('display') == 'none'){
		$('.gbook_comment_author').slideDown(500);
//	}else{
//		$('.gbook_comment_author').slideUp(500);
//	}
});

//回复移动评论框
function reply(c,a,b){
	var id = 'comment_list_avatar' + a;
	var name = "@"+b;
	var reply_info = 'pre=' + c + '&pre_name=' + b;
	console.log(reply_info);
	$(".cancle_comment").css('display','block');
	$(".gbook_comment_text").css('width','97%');
	$(".gbook_comment_text").css('text','');
	$(".gbook_comment_text").val("");
	$(".gbook_comment_text").attr('placeholder',name);
	$("#gbook_reply_info").attr("value",reply_info);
	$("#gbook_fb").addClass("gbook_fb");
	$("#gbook_fb").detach().appendTo('#' + id + '');
}
//取消评论移动评论框
$('.cancle_comment').click(function cancle(){
	$(".cancle_comment").css('display','none');
	$(".gbook_comment_text").css('width','97.5%');
	$(".gbook_comment_text").css('text','');
	$(".gbook_comment_text").val("");
	$(".gbook_comment_text").attr('placeholder','留点什么...');
	$(".gbook_comment_form").attr('action','publish.do');
	$("#gbook_fb").removeClass("gbook_fb");
	$("#gbook_fb").insertAfter($('.gbook_separate'));
});

//提交评论按钮，判断是否填写昵称和邮箱，然后确认是否发表评论
$('.gbook_comment_btn').click(function(){
	var comment = $('#comment').val();
	var author = $('#author').val();
	var email = $('#email').val();
	if(comment.match(/^\s*$/)){
		alert("评论内容不能为空！");
		return false;
	}
	if(author.match(/^\s*$/)||email.match(/^\s*$/)){
		alert("请填写昵称和邮箱");
		return false;
	}
	if (confirm('确认发表评论么？')){
		sendComment();	//ajax向后台提交评论
		$(".gbook_comment_text").val("");
		$(".gbook_comment_text").attr('placeholder','发表成功，客官还想留点什么me...');
	}else{
		return false;
	}
});

//切换身份(ajax)
function switchID(){
	var xmlhttp;
	if(window.XMLHttpRequest){
		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	}else{
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			document.getElementById("gbook_title_info").innerHTML=xmlhttp.responseText;
			document.getElementById("author").value = "";
			document.getElementById("email").value = "";
		}
	}
	xmlhttp.open('GET','switch.do',true);
	xmlhttp.send();
}

//向后台提交评论信息(ajax)
function sendComment(){
	var comment = $('#comment').val();
	var author = $('#author').val();
	var email = $('#email').val();
	var reply_info = $('#gbook_reply_info').val();
	var xmlhttp;
	
	if(window.XMLHttpRequest){
		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	}else{
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            var jsonComment = JSON.parse(xmlhttp.responseText);/*将获取的信息解析为json对象*/
			document.getElementById("gbook_title_info").innerHTML 
			= jsonComment.name + '<a href="javascript:;" onclick="switchID()">(切换身份)</a>';
			//需要判断，如果是评论 则执行displayComment(jsonComment)，如果是回复啊，则执行displayReply(jsonComment)
			if(jsonComment.pre == 0){
				displayComment(jsonComment);
			}else{
				displayReply(jsonComment);
			}
		}
	}
	//如果要向服务器发送大量数据，一般使用POST；使用POST需要使用setRequestHeader()来添加HTTP头，然后在send()方法中规定要发送的数据
	xmlhttp.open("POST","sendcomment.do",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(reply_info + "&comment="+comment+"&author="+author+"&email="+email);
}

//(提交后展示评论)
function displayComment(c){
	var li = '<li>' +
		'<div class="comment_list_avatar" id="comment_list_avatar'+c.id+'">'+
	'<img src="images/touxiang.jpg" class="avatar"><div class="comment_list_main" id="comment_list_main'+c.id+'">'+
	''+c.comment+''+
	'<div class="comment_list_info">'+
	'<span>'+c.name+'</span>'+
	c.time+
	'<a style="cursor: pointer;" class="comment_list_reply" id="reply'+c.id+'"'+
		'onclick="reply('+c.id+','+c.id+','+"'"+c.name+"')" +'">回复</a>'+
	'</div></div></div></li>';
	
	$(li).hide().prependTo($('.comment_list')).slideDown('slow');
}

//(提交后展示回复)
function displayReply(r){
	
	var div1 = '<div id="comment_list_avatar'+r.id+'">'+
		'<p style="border:solid 3px #fbfdfb;"></p>'+
		'<span style="color: #aaa;">'+r.name;
	var div = div1;
	if(r.reply_name != "0"){
		div = div + '回复'+r.reply_name;
	}
	var div2 = '('+r.time+')：</span>'+r.comment+''+
		'<a style="cursor: pointer;" class="comment_list_reply" id="reply'+r.id+'" onclick="reply('+r.pre+' , '+r.id+',' + "'"+r.name+"')" + '">回复</a>' +
		'</div>';
	
	div = div + div2;
	$(div).hide().appendTo($('#comment_list_main'+r.pre+'')).slideDown('slow');
	
}