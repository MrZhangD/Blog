<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>关于我_张迪个人博客 - 一个咸鱼而已</title>
<link href="CSS/index.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
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
			<div><a href="about.do"  id="now">关于我</a></div>
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
	<div class="pagebg ab"> </div>
<!-- -----------------------------------------------主体内容----------------------------------------------------- -->
	<div class="container">
		<h1 class="t_nav">
			<span>
				像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。
			</span>
			<a href="index.do" class="n1">网站首页</a>
			<a href="#" class="n2">关于我</a>
		</h1>
		<div class="news_infos">
			<ul>
				<p>
					${about.content}
				</p>
				<br>
				<h2>About my blog</h2>
				<br>
				<p>这是第一次做个人博客</p>
				<br>
				<p>${about.abblog}</p>
			</ul>
		</div>
		
		<div class="side_show">
			<div class="about">
				<p class="abpic"><img src="${about.img}" alt=""></p>
				<p class="abname">
					${about.name}
				</p>
				<p class="abposition">
					${about.work}
				</p>
				<p class="abtext">
					${about.abtext}
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
</body>
</html>