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
			<div><a href="life.do"  id="now">生活点滴</a>
				<ul class="shdd" style="display:none;">
					<li><a href="life.do?id=1"  <c:if test="${param.id==1||param.subject=='生活日记'}">id="now"</c:if>>生活日记</a></li>
					<li><a href="life.do?id=2"  <c:if test="${param.id==2||param.subject=='学会欣赏'}">id="now"</c:if>>学会欣赏</a></li>
					<li><a href="life.do?id=3"  <c:if test="${param.id==3||param.subject=='程序人生'}">id="now"</c:if>>程序人生</a></li>
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
	<div class="pagebg study"> </div>
<!-- -----------------------------------------------主体内容----------------------------------------------------- -->
	<div class="container">
		<!-- ---------页面位置--------- -->
		<h1 class="t_nav">
			<span>
				慢生活，不是懒惰，放慢速度不是拖延时间，而是让我们在生活中寻找到平衡。
			</span>
			<a href="index.do" class="n1">网站首页</a>
			<a href="life.do" <c:if test="${param.id==null&&param.subject==null}">class="n2"</c:if>
			<c:if test="${param.id!=null||param.subject!=null}">class="n1"</c:if>>生活点滴
				<c:if test="${param.id==null&&param.subject==null}">(${fn:length(lists)})</c:if>
			</a>
			<c:if test="${param.id==1||param.subject=='生活知识'}"><a href="" class="n2">生活日记(${fn:length(lists)})</a></c:if>
			<c:if test="${param.id==2||param.subject=='学会欣赏'}"><a href="" class="n2">学会欣赏(${fn:length(lists)})</a></c:if>
			<c:if test="${param.id==3||param.subject=='程序人生'}"><a href="" class="n2">程序人生(${fn:length(lists)})</a></c:if>
		</h1>
		<!-- -----------------博客的主要内容展示(左)-------------------- -->
		<div class="blog_show">
		<c:forEach begin="0" end="${fn:length(lists)}" varStatus="i">
			<div class="blog_show_part" data-scroll-reveal="enter bottom over 1s" 
			<c:if test="${lists[i.index]==null}">style="display:none;"</c:if>>
				<h3 class="blog_show_noe_title">
					<a href="content.do?id=${lists[i.index].id}">${lists[i.index].title}</a>
				</h3>
				<span class="blog_show_pic">
					<a href="content.do?id=${lists[i.index].id}"><img src="${lists[i.index].img}"></a>
				</span>
				<p style="height: 75px;">${fn:substring((lists[i.index].content),0,80)}...</p>
				<div class="blog_show_part_info">
					<ul>
						<li class="author">
							<a href="about.do">张迪</a>
						</li>
						<li class="pname">
							<a href="<c:if test="${lists[i.index].subject=='心得笔记'||lists[i.index].subject=='前端知识'||
							lists[i.index].subject=='后台研发'||lists[i.index].subject=='其他知识'}">study.do</c:if>
							<c:if test="${lists[i.index].subject=='生活日记'||lists[i.index].subject=='学会欣赏'||
							lists[i.index].subject=='程序人生'}">life.do</c:if>
							?subject=${lists[i.index].subject}">${lists[i.index].subject}</a>
						</li>
						<li class="time">${lists[i.index].time}</li>
						<li class="view">${lists[i.index].read}人已阅读</li>
						<li class="like">${lists[i.index].like}</li>
					</ul>
				</div>
			</div>
		</c:forEach>
		</div>
		<!-- -----------------其余板块(右)-------------------------- -->
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