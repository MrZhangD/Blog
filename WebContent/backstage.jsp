<%@ page import="java.util.*" language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pers.zhangdi.blog.service.IAboutService" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台设置 - 张迪的个人博客</title>
<link href="CSS/backstage.css"  rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/backstage.js" async></script>
</head>
<body>
<!--------------------------------- 侧边菜单 -------------------------------------->
	<div class="sidebar">
		<ul class="sidebar_menu">
			<li class="top">
				<p class="pic">
					<a href="index.do"><img src="${about.img}" alt=""></a>
				</p>
				<p class="abname">${about.name}</p>
			</li>
			<li class="fg"></li>
			<li class="article">
				<a href="javascript:;" class="side_a">文章管理</a>
				<ul style="display: none; overflow: hidden;" class="article_box">
					<li><a href="articlelist.do" class="side_a_part">文章列表</a></li>
					<li><a href="add.do" class="side_a_part">添加文章</a></li>
				</ul>
			</li>
			<li class="about">
				<a href="info_set.do" class="side_a">信息设置</a>
			</li>
			
		</ul>
	</div>
</body>
</html>