<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>时间轴_张迪个人博客 - 一个咸鱼而已</title>
<link  rel="stylesheet" href="CSS/index.css">
<link  rel="stylesheet" href="CSS/myPagination.css">
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
			<div><a href="time.do" id="now">时间轴</a></div>
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
	<div class="pagebg timer"> </div>
<!-- -----------------------------------------------主体内容----------------------------------------------------- -->
	<div class="container">
		<h1 class="t_nav">
			<span>
				时光飞逝，机会就在我们眼前，何时找到了灵感，就要把握机遇，我们需要智慧和勇气去把握机会。
			</span>
			<a href="inedx.do" class="n1">网站首页</a>
			<a href="#" class="n2">时间轴</a>
		</h1>
		<div class="timebox">
			<ul id="list">
				<c:forEach items="${lists}" var="article">
			    	<li><span>${article.time}</span><a href="content.do?id=${article.id}" title="${article.title}">${article.title}</a></li>
	 			</c:forEach>
	 		</ul>
	 		<!-- 页表 -->
	 		<div id="pagination" class="pagination"></div>
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
				var page_num = ${page_num};
				var info_num = ${info_num};
				var page = ${page};
				var page_size = ${page_size};
				new Page({
					id:'pagination',
					nowpage:'time.do',
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