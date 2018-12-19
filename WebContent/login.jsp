<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录后台设置 - 张迪个人博客</title>
<link href="CSS/style_log.css" rel="stylesheet" type="text/css">
</head>
<body class="login" mycollectionplug="bind">

	<%
		Object obj = session.getAttribute("admin");
		if(obj != null){
			response.sendRedirect("backstage.do");
		}
	%>

	<div class="login_m">
		<h1 style="text-align: center;">登录博客后台</h1>
		<div class="login_boder">
			<div class="login_padding" id="login_model">
				<form action="check.do" method="post">
					<h2>用户名:</h2>
						<label>
							<input type="text" name="username" class="txt_input txt_input2" onfocus="if (value ==&#39;username&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;username&#39;}" value="username">
						</label>
					<h2>密码:</h2>
						<label>
							<input type="password" name="password" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
						</label>
		 			<p class="forgot"></p>
					<div class="rem_sub">
						<div class="rem_sub_l">
							<input type="checkbox" name="checkbox" id="save_me">
							<label for="checkbox">Remember me</label>
						</div>
						<label>
							<input type="submit" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
						</label>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>