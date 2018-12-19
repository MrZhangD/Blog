<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学无止境_张迪个人博客 - 一个咸鱼而已</title>
<link href="CSS/index.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/index.js"  async></script>
<script src="js/scrollReveal.js"></script>
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
			<div><a href="study.do" <c:if test="${subject=='学无止境'}">id="now"</c:if>>学无止境</a>
				<ul class="xwzj" style="display:none;">
					<li><a href="study.do?id=1" <c:if test="${article.subject=='心得笔记'}">id="now"</c:if>>心得笔记</a></li>
					<li><a href="study.do?id=2" <c:if test="${article.subject=='前端知识'}">id="now"</c:if>>前端知识</a></li>
					<li><a href="study.do?id=3" <c:if test="${article.subject=='后台研发'}">id="now"</c:if>>后台研发</a></li>
					<li><a href="study.do?id=4" <c:if test="${article.subject=='其他知识'}">id="now"</c:if>>其他知识</a></li>
				</ul>
			</div>
			<div><a href="life.do" <c:if test="${subject=='生活点滴'}">id="now"</c:if>>生活点滴</a>
				<ul class="shdd" style="display:none;">
					<li><a href="life.do?id=1" <c:if test="${article.subject=='生活日记'}">id="now"</c:if>>生活日记</a></li>
					<li><a href="life.do?id=2" <c:if test="${article.subject=='学会欣赏'}">id="now"</c:if>>学会欣赏</a></li>
					<li><a href="life.do?id=3" <c:if test="${article.subject=='程序人生'}">id="now"</c:if>>程序人生</a></li>
				</ul>
			</div>
			<div><a href="time.do">时间轴</a></div>
			<div><a href="about.do">关于我</a></div>
			<div><a href="gbook.do">留言</a></div>
			<!-- 搜索框 -->
			<div id="search">
				<form action="search.do" method="post">
				<input type="text" placeholder="想搜点什么？" class="input" name="keyword">
				<span></span>
				</form>
			</div>
		</div>
	</div>
<!------------------------------------------------- content -------------------------------------------------- -->
	<div class="main">
	<!-- ---------页面位置--------- -->
		<h1 class="t_nav">
			<span>
				您现在的位置是：首页 > ${subject} > ${article.subject}
			</span>
			<a href="index.do" class="n1">网站首页</a>
			<a href="<c:if test="${subject=='生活点滴'}">life.do</c:if><c:if test="${subject=='学无止境'}">study.do</c:if>" class="n1">${subject}</a>
			<a href="<c:if test="${subject=='生活点滴'}">life.do</c:if><c:if test="${subject=='学无止境'}">study.do</c:if>?subject=${article.subject}" class="n2">${article.subject}</a>
		</h1>
		<div class="infosbox">
			<div class="newsview">
				<h3 class="news_title">${article.title}</h3>
				<div class="blog_show_part_info">
				<ul>
					<li class="author">
						<a href="about.do">张迪</a>
					</li>
					<li class="pname">
						<a href="<c:if test="${subject=='生活点滴'}">life.do</c:if><c:if test="${subject=='学无止境'}">study.do</c:if>?subject=${article.subject}">${article.subject}</a>
					</li>
					<li class="time">${article.time}</li>
					<li class="view">${article.read}人已阅读</li>
					<li class="like">${article.like}</li>
				</ul>
				</div>
				<div class="news_about">
					<strong>简介:</strong>
					${article.introduce}
				</div>
				<div class="news_con">
					${article.content}
					<br><br>
				</div>
			</div>
			<!--
			 <div class="share">
     			<p class="diggit">
     				<a href="javascript:;" onclick="great(${article.id});"> 很赞哦！ </a>
     				(<b id="diggnum">${article.like}</b>)
     			</p>
     		</div>
     		 -->	
     		<div class="nextinfo">
     			<p>
     				上一篇：<a href="content.do?id=${ids[0].id}">${ids[0].title}</a>
     			</p>
     			<p>
     				下一篇：<a href="content.do?id=${ids[1].id}">${ids[1].title}</a>
     			</p>
     		</div>
     		<div class="news_pl">
     			<h2></h2>
     			<div class="gbko"></div>
     		</div>
  		</div>
		<div class="side_show">
			<div class="side_show_part1">
				<h2 class="side_show_part_title">
					特别推荐
				</h2>
				<ul>
					<c:forEach items="${likes}" var="like">
					<li>
						<i><img src="${like.img}"></i>
						<p>
							${like.title}
							<span>
								<a href="content.do?id=${like.id}">阅读</a>
							</span>
						</p>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="side_show_part2">
				<h2 class="side_show_part_title">
					点击排行
				</h2>
				<ul class="side_show_part2_one">
					<i><img src="${reads[0].img}"></i>
					<p><a href="content.do?id=${reads[0].id}">${reads[0].title}</a></p>
				</ul>
				<ul class="side_show_part2_two">
					<c:forEach items="${reads}" var="read" begin="1">
						<li>
							<i><img src="${read.img}"></i>
							<p><a href="content.do?id=${read.id}">${read.title}</a></p>
							<span>${read.time}</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="side_show_part4">
				<h2 class="side_show_part_title">
					友情链接
				</h2>
				<ul>
     			   	<li><a href="#" target="_blank">张迪博客</a></li>
     			   	<li><a href="http://www.baidu.com" target="_blank">百度一下</a></li>
					<li><a href="http://www.baidu.com" target="_blank">百度一下</a></li>
      			</ul>
			</div>
			<div class="side_show_part5" id="float">
				<h2 class="side_show_part_title">
					关注我，么么哒！
				</h2>
				<ul>
					<li class="sina">
						<a href="https://weibo.com/u/5661586940?refer_flag=1001030101_&is_all=1" target="_blank">
							<span>新浪微博</span>张迪的微博
						</a>
					</li>
					<li class="qq">
						<a href="tencent://message/?uin=2813284515&Site=http://vps.shuidazhe.com&Menu=yes">
							<span>QQ号</span>1053338363
						</a>
					</li>
					<li class="email">
						<a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=qpuan5mZmZKZnJnq29uEycXH" target="_blank">
							<span>邮箱帐号</span>1053338363@qq.com
						</a>
					</li>
					<li class="wxgzh">
						<a href="javascript:;">
							<span>微信号</span>zhangdi1215-
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- ----------微信弹窗部分（单独写了出来） ------------ -->
	<div class="wxpop" style="display: none;">
		<div class="wxpop_top">
			<a href="javascript:;" title="关闭" class="close">×</a>
			<h3>扫一扫添加好友呦~</h3>
		</div>
		<div class="wx_img">
			<img src="images/wx.jpg">
		</div>
	</div>
	<div class="wxpop_mask" style="display: none;"></div>
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
</body>
</html>