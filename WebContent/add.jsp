<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="pers.zhangdi.blog.service.IAboutService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台设置-添加文章-张迪的个人博客</title>
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
					<li><a href="articlelist.do" class="side_a_part">文章列表</a></li>
					<li><a href="add.do" class="side_a_part" id="now">添加文章</a></li>
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
					添加文章——你可以发布新的文章，记得选择归类哦
				</span>
				<a href="#" class="n1">文章管理</a>
				<a href="add.do" class="n2">添加文章</a>
			</h1>	
		</div>
		<div class="update">
		<form action="keep_add.do" method="post" enctype="multipart/form-data">
			<p> 文章标题：<input class="update_title" name="title"></p>
			<p>
				文章归类：<select class="update_subject" name="subject">
					<option value="心得笔记">心得笔记</option>
					<option value="前端知识">前端知识</option>
					<option value="后台研发">后天研发</option>
					<option value="其他知识">其他知识</option>
					<option value="生活日记">生活日记</option>
					<option value="学会欣赏">学会欣赏</option>
					<option value="程序人生">程序人生</option>
				</select>
			</p>
			<p><span class="span_intr">文章简介：</span><textarea class="update_introduce" name="introduce"></textarea></p>
			<p>封面图片：<input type="file" accept="image/*" class="update_img" value="img" id="xdaTanFileImg" onchange="xmTanUploadImg(this)" name="img"></p>
			<div class="img_preview">
				<img id="xmTanImg" alt="图片预览" src="">
			</div>
				
			<div class="update_right" style="width:62%;">
            		<script id="editor" type="text/plain" style="width:100%;height:550px;"></script>
            		<button type="submit" class="keep" onclick="javascript:return confirm('确认发布文章？');" >提交</button>
            		<a href="add.do" class="reset"  onclick="javascript:return confirm('您要重置么？');">全部重置</a>
			</div>
			<script type="text/javascript">
				//实例化编辑器
				var ue = UE.getEditor('editor');
    		</script>
    	</form>
		</div>
	</div>
</body>
</html>