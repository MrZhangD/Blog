<%@ page import="java.util.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台设置 - 信息设置 - 张迪的个人博客</title>
<link href="CSS/backstage.css"  rel="stylesheet" type="text/css">
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
				<a href="javascript:;" class="side_a">文章管理</a>
				<ul style="display: none; overflow: hidden;" class="article_box">
					<li><a href="articlelist.do" class="side_a_part">文章列表</a></li>
					<li><a href="add.do" class="side_a_part">添加文章</a></li>
				</ul>
			</li>
			<li class="about">
				<a href="info_set.do" class="side_a active" >信息设置</a>
			</li>
		</ul>
	</div>
<!------------------------------------ 信息修改 ------------------------------------>
	<div class="articlelist">
		<div class="list_top">
			<h1>
				<span>
					信息设置——你可以对你的相关信息进行修改
				</span>
				<a href="#" class="n2">信息设置</a>
			</h1>	
		</div>
		<div class="update">
		<form action="keep_update.do" method="post" enctype="multipart/form-data">
			<p> 个人昵称：<input class="update_title" name="name" value="${about.name}"></p>
			<p> 工作专业：<input class="update_title" name="work" value="${about.work}"> </p>
			<p><span class="span_intr info">个人简介：</span><textarea class="update_introduce info1" name="abtext">${about.abtext}</textarea></p>
			<p><span class="span_intr info">关于博客：</span><textarea class="update_introduce info1" name="abblog">${about.abblog}</textarea></p>
			<p>头像图片：<input type="file" accept="image/*" class="update_img" value="img" id="xdaTanFileImg" onchange="xmTanUploadImg(this)" name="img"></p>
			<div class="img_preview1">
				<input type="text" value="${about.img}" name="img_one" hidden="hidden">
				<img id="xmTanImg" alt="图片预览" src="${about.img}">
			</div>
				
			<div class="update_right">
            		<script id="editor" type="text/plain" style="width:960px;height:550px;">${about.content}</script>
            		<button type="submit" class="keep" onclick="javascript:return confirm('确认修改么？');" >修改</button>
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