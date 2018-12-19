<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<div class="main" style="height:auto;">
		<c:forEach items="${lists}" var="lists">
			<div class="blog_show_part" style="" data-scroll-reveal="enter bottom over 1s" 
			<c:if test="${lists==null}">style="display:none;"</c:if>>
				<h3 class="blog_show_noe_title">
					<a href="content.do?id=${lists.id}">${lists.title}</a>
				</h3>
				<p style="height:70px;">${fn:substring(lists.content,0,120)}...</p>
				<div class="blog_show_part_info">
					<ul>
						<li class="author">
							<a href="about.do">张迪</a>
						</li>
						<li class="pname">
							<a href="<c:if test="${lists.subject=='心得笔记'||lists.subject=='前端知识'||
							lists.subject=='后台研发'||lists.subject=='其他知识'}">study.do</c:if>
							<c:if test="${lists.subject=='生活日记'||lists.subject=='学会欣赏'||
							lists.subject=='程序人生'}">life.do</c:if>
							?subject=${lists.subject}">${lists.subject}</a>
						</li>
						<li class="time">${lists.time}</li>
						<li class="view">${lists.read}人已阅读</li>
						<li class="like">${lists.like}</li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
<!-- -----------------------------------------------页面尾部----------------------------------------------------- -->
	<div class="footer">
		<p>Design by 
			<a href="index.do" target="_blank">张迪个人博客</a> 
			<a>鲁ICP备19961215号-23</a>
		</p>
	</div>
	<a href="#" class="cd-top">
		Top
	</a>
</body>
</html>