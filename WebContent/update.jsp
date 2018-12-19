<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台设置-文章列表-张迪的个人博客</title>
<link href="CSS/backstage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
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
					修改文章——你可以对你发布的文章进行修改，记得修改过后要保存哦
				</span>
				<a href="#" class="n1">文章管理</a>
				<a href="articlelist.do" class="n1">文章列表</a>
				<a href="#" class="n2">修改文章</a>
			</h1>	
		</div>
		<div class="update">
		<form action="keep_update.do" method="post" enctype="multipart/form-data">
			<input type="text" value="${article.id}" name="id" hidden="hidden">
			<input type="text" value="${article.read}" name="read" hidden="hidden">
			<input type="text" value="${article.like}" name="like" hidden="hidden">
			<input type="text" value="${article.time}" name="time" hidden="hidden">
			<p> 文章标题：<input class="update_title" value="${article.title}" name="title"></p>
			<p>
				文章归类：<select class="update_subject" name="subject">
					<option value="心得笔记" <c:if test="${article.subject=='心得笔记'}">selected="selected"</c:if>>心得笔记</option>
					<option value="前端知识" <c:if test="${article.subject=='前端知识'}">selected="selected"</c:if>>前端知识</option>
					<option value="后台研发" <c:if test="${article.subject=='后台研发'}">selected="selected"</c:if>>后天研发</option>
					<option value="其他知识" <c:if test="${article.subject=='其他知识'}">selected="selected"</c:if>>其他知识</option>
					<option value="生活日记" <c:if test="${article.subject=='生活日记'}">selected="selected"</c:if>>生活日记</option>
					<option value="学会欣赏" <c:if test="${article.subject=='学会欣赏'}">selected="selected"</c:if>>学会欣赏</option>
					<option value="程序人生" <c:if test="${article.subject=='程序人生'}">selected="selected"</c:if>>程序人生</option>
				</select>
			</p>
			<p><span class="span_intr">文章简介：</span><textarea class="update_introduce" name="introduce">${article.introduce}</textarea></p>
			<p>封面图片：<input type="file" accept="image/*" class="update_img" value="img" id="xdaTanFileImg" onchange="xmTanUploadImg(this)" name="img"></p>
			<div class="img_preview">
				<input type="text" value="${article.img}" name="img_one" hidden="hidden">
				<img id="xmTanImg" alt="图片预览" src="${article.img}">
			</div>
				
			<div class="update_right">
            		<script id="editor" type="text/plain" style="width:960px;height:550px;">${article.content}</script>
            		<button type="submit" class="keep" onclick="javascript:return confirm('您确认要修改么？');" >提交</button>
			</div>
			<script type="text/javascript">
				//实例化编辑器
				//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
				var ue = UE.getEditor('editor');
    		</script>
    	</form>
		</div>
	</div>
</body>
</html>