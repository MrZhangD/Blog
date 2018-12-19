<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pers.zhangdi.blog.service.IAboutService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台设置-文章列表-张迪的个人博客</title>
<link href="CSS/backstage.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/backstage.js" async></script>
<script src="js/list_page.js" async></script>
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
				<a href="javascript:;" class="side_a active">文章管理</a>
				<ul style="display: block; overflow: hidden;" class="article_box">
					<li><a href="articlelist.do" class="side_a_part" id="now">文章列表</a></li>
					<li><a href="add.do" class="side_a_part">添加文章</a></li>
				</ul>
			</li>
			<li class="about">
				<a href="info_set.do" class="side_a">信息设置</a>
			</li>
			
		</ul>
	</div>
<!--------------------------------------- 文章列表 ----------------------------------->	
	<div class="articlelist">
		<div class="list_top">
			<h1>
				<span>
					文章列表——你可以对你发布的文章进行操作
				</span>
				<a href="#" class="n1">文章管理</a>
				<a href="articlelist.do" class="n2">文章列表</a>
			</h1>	
		</div>
		<div class="list_main">
			<form class="searchform" action="backsearch.do" method="post">
				<input type="text" value='<c:if test="${title!=''}">${title}</c:if>' name="search_title" class="one" placeholder="文章题目">
				<input type="text" value='<c:if test="${subject!=''}">${subject}</c:if>' name="search_subject" class="one" placeholder="文章归类">
				<button class="one1">搜索</button>
			</form>
			<table id="mytable">
				<thead>
					<tr style="height: 50px; background-color: #99c4de;">
						<th>文章题目</th>
						<th>文章归类</th>
						<th>
							<a style="color: #000;" href="articlelist.do">添加时间</a>
						</th>
						<th>
							<a style="color: #000;" href="articlelist.do?id=read">已阅人数</a>
						</th>
						<th>
							<a style="color: #000;" href="articlelist.do?id=like">喜爱人数</a>
						</th>
						<th>文章ID</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lists}" var="article">
					<tr style="height: 79px;">
						<td>${article.title}</td>
						<td style="width: 180px;">${article.subject}</td>
						<td style="width: 180px;">${article.time}</td>
						<td style="width: 160px;">${article.read}</td>
						<td style="width: 160px;">${article.like}</td>
						<td style="width: 180px;">${article.id}</td>
						<td style="width: 120px;">
							<a href="del.do?id=${article.id}" onclick="javascript:return confirm('确认删除文章么？');"><input type="button"  class="white" value="删除" id="del"></a>
							<a href="update.do?id=${article.id}"><input type="button"  class="white" value="修改" id="update"></a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="control">
                <input id="pageSize" type="text" style="display: none;" size="1" maxlength="2" value="getDefaultValue()"/> 
				<a id="btn0"></a>
               	<a id="sjzl"></a>
                <a href="#" id="btn4"><span class="but white">尾页</span></a>
               	<a href="#" id="btn3"><span class="but white">下一页</span></a>
               	<a href="#" id="btn2"><span class="but white">上一页</span></a>
              	<a href="#" id="btn1"><span class="but white">首页</span></a>
			</div>
		</div>
	</div>
</body>
</html>