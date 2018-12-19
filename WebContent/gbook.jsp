<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>关于我_张迪个人博客 - 一个咸鱼而已</title>
<link href="CSS/index.css" rel="stylesheet">
<link  rel="stylesheet" href="CSS/myPagination.css">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/scrollReveal.js"></script>
<style type="text/css">
.pagination {
    margin-top: 20px;
    margin-bottom: 20px;
}
.pagination ul{
	padding: 0;
    text-align: center;
}
</style>
</head>
<body>
<!-------------------------------------------------- 导航栏 ------------------------------------------------->
	<div class="menu">
		<div class="login"><a href="login.do">登录后台</a></div>
		<div class="nav">
			<!-- logo -->
			<h1 class="log">
				<a href="index.do">张迪博客</a>
			</h1>
			<!-- 导航  -->
			<div><a href="index.do">网站首页</a></div>
			<div><a href="study.do">学无止境</a>
				<ul class="xwzj" style="display:none;">
					<li><a href="study.do?id=1">心得笔记</a></li>
					<li><a href="study.do?id=2">前端知识</a></li>
					<li><a href="study.do?id=3">后台研发</a></li>
					<li><a href="study.do?id=4">其他知识</a></li>
				</ul>
			</div>
			<div><a href="life.do">生活点滴</a>
				<ul class="shdd" style="display:none;">
					<li><a href="life.do?id=1">生活日记</a></li>
					<li><a href="life.do?id=2">学会欣赏</a></li>
					<li><a href="life.do?id=3">程序人生</a></li>
				</ul>
			</div>
			<div><a href="time.do">时间轴</a></div>
			<div><a href="about.do">关于我</a></div>
			<div><a href="gbook.do" id="now">留言</a></div>
			<!-- 搜索框 -->
			<div id="search">
				<form action="search.do" method="post">
				<input type="text" placeholder="想搜点什么？" class="input" name="keyword">
				<span></span>
				</form>
			</div>
		</div>
	</div>
	<div class="pagebg ab"> </div>
<!-- -----------------------------------------------主体内容----------------------------------------------------- -->
	<div class="container">
		<h1 class="t_nav">
			<span>
				你，我生命中一个重要的过客，我们之所以是过客，因为你未曾会为我停留。
			</span>
			<a href="index.do" class="n1">网站首页</a>
			<a href="#" class="n2">留言</a>
		</h1>
		<!-- 留言区 -->
		<div class="news_infos">
			<!-- 留言区顶部 -->
			<div class="gbook_header">
				<h1><a href="gbook.do">给我留言</a></h1>
			</div>
			<div class="gbook_separate"></div>
		
			<div id="gbook_fb">
				<div class="gbook_title">
					<div class="gbook_title_img"><img alt="图片" src="images/gbook_title_img.png"></div>
					<div class="gbook_title_info" id="gbook_title_info">
					<c:if test="${name != null}">${name}<a href="javascript:;" onclick="switchID()">(切换身份)</a></c:if>
					<c:if test="${name == null}">发表我的评论</c:if>
					</div>
					<a id="gbook_cancle_comment" class="cancle_comment" href="javascript:;">取消回复</a>
				</div>
				<!-- 留言区发表区 -->
					<div class="gbook_comment">
						<!-- 内容 -->
						<div class="gbook_comment_box">
							<textarea placeholder="留点什么..." id="comment" name="comment" rows="3" cols="100%"
							class="gbook_comment_text"></textarea>
							<div class="gbook_comment_ctrl">
								<input type="text" id="gbook_reply_info" style="display: none;">
								<button class="gbook_comment_btn">提交评论</button>
							</div>
						</div>
						<!-- 昵称邮箱 -->
						<div class="gbook_comment_author" id="comment_author_info">
							<h4>Hi，您需要填写昵称和邮箱！</h4>
							<ul>
								<li class="form-inline">
									<input class="ipt" type="text" name="author" id="author" value="<c:if test='${name != null}'>${name}</c:if>" maxlength="20" tabindex="2" placeholder="昵称">
									<span class="help-inline">昵称 (必填)</span>
								</li>
								<li class="form-inline">
									<input class="ipt" type="text" name="email" id="email" value="<c:if test='${email != null}'>${email}</c:if>" tabindex="3" placeholder="邮箱">
									<span class="help-inline">邮箱 (必填)</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- 留言展示区 -->
			</div>
			<div class="gbook_comments">
					<!-- 顶部数量展示 -->
					<div class="comments">
						一共有<i class="fa">( ${count} )</i>条吐槽...
					</div>
					<!-- 中间留言列表 -->
					<ol class="comment_list">
					<c:forEach items="${lists}" var="comment" varStatus="i">
						<li>
							<div class="comment_list_avatar" id="comment_list_avatar${comment.id}">
								<img src="images/touxiang.jpg" class="avatar">
								<div class="comment_list_main" id="comment_list_main${comment.id}">
									${comment.comment }
									<div class="comment_list_info">
										<span>${comment.name }</span>
										${comment.time }
										<a style="cursor: pointer;" class="comment_list_reply" id="reply${comment.id}" onclick="reply(${comment.id},${comment.id},'${comment.name}')" >回复</a>
									</div>
									<c:forEach items="${allReplys[i.index]}" var="reply">	
									<div id="comment_list_avatar${reply.id}">
										<p style="border:solid 3px #fbfdfb;"></p>
										<span style="color: #aaa;">${reply.name}<c:if test="${reply.pre_name != comment.name}">回复${reply.pre_name}</c:if>(${reply.time})：</span>${reply.comment}
										<a style="cursor: pointer;" class="comment_list_reply" id="reply${reply.id}" onclick="reply(${comment.id} , ${reply.id},'${reply.name}')" >回复</a>
									</div>
									</c:forEach>
								</div>
							</div>
						</li>
					</c:forEach>
					</ol>
					<!-- 底部页表 -->
					<!-- <div id="pagination" class="pagination"></div> -->
				</div>
		</div>
		<div class="side_show">
			<div class="about">
				<p class="abpic"><img src="${about.img}" alt=""></p>
				<p class="abname">
					${about.name }
				</p>
				<p class="abposition">
					${about.work }
				</p>
				<p class="abtext">
					${about.abtext }
				</p>
			</div>
			<div class="weixin">
				<h2 class="side_show_part_title">微信关注</h2>
				<ul><img src="images/wx.jpg"></ul>
			</div>
		</div>
	</div>
<!-- -----------------------------------------------页面尾部----------------------------------------------------- -->
	<div class="footer">
		<p>Design by 
			<a href="#" target="_blank">张迪个人博客</a> 
			<a href="#">鲁ICP备19961215号-23</a>
		</p>
	</div>
	<a href="#" class="cd-top">
		Top
	</a>
	
	<script src="js/index.js"></script>
	<script type="text/javascript">
			window.onload = function () {
				var page_num = 2;
				var info_num = 10;
				var page = 1;
				var page_size = 5;
				new Page({
					id:'pagination',
					nowpage:'gbook.do',
					pageTotal:page_num, //必填,总页数
					pageAmount:10,  //每页多少条
					dataTotal:info_num, //总共多少条数据
					curPage:page, //初始页码,不填默认为1
					pageSize:page_size, //分页个数,不填默认为5
					showPageTotalFlag:false, //是否显示数据统计,不填默认不显示
					showSkipInputFlag:false, //是否支持跳转,不填默认不显示
				});
			}
	</script>
	<script src="js/myPagination.js"></script>
</body>
</html>