<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测试</title>
<script src="js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
	<div>姓名：<input type="text" id="name"></div><br>
	<div>性别：<input type="text" id="sex"></div><br>
	<div>年龄：<input type="text" id="age"></div><br>
	<div>介绍：<textarea id="info" rows="5" cols="100%"></textarea></div><br>
	<div id="d1"></div><br>
	<button id="btn" onclick="send2()">提交</button>
	
	<script type="text/javascript">
		//原生JS的AJAX
		function send(){
			var xmlhttp;
			var name = $('#name').val();
			var sex = $('#sex').val();
			var age = $('#age').val();
			var info = $('#info').val();
			
			//这是一个json对象
			var json = {"name":name,
					"age":age,
					"sex":sex,
					"info":info};
			//将json对象转换成json字符串 
			var jsoninfo = JSON.stringify(json);
			
			if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
			}else{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					$('#d1').html(xmlhttp.responseText);
				}
			}
			xmlhttp.open("GET","sendtest.do?jsoninfo="+jsoninfo+"",true);
			xmlhttp.send(); 
		}
		
		//JQuery支持的AJAX-load()方法
		function send1(){
			var name = $('#name').val();
			var sex = $('#sex').val();
			var age = $('#age').val();
			var info = $('#info').val();
			
			//这是一个json对象
			var json = {"name":name,
					"age":age,
					"sex":sex,
					"info":info};
			//将json对象转换成json字符串 
			var jsoninfo = JSON.stringify(json);
			
			//$(selector).load(URL,data,callback);
			//必需的 URL 参数规定您希望加载的 URL。
			//可选的 data 参数规定与请求一同发送的查询字符串键/值对集合。
			//可选的 callback 参数是 load() 方法完成后所执行的函数名称。
			/*	
				|-responseTxt - 包含调用成功时的结果内容
				|-statusTXT - 包含调用的状态
				|-xhr - 包含 XMLHttpRequest 对象
			*/
			$('#d1').load("sendtest.do",{jsoninfo:jsoninfo,info:'你好'},function(responseTxt,statusTxt,xhr){
				if(statusTxt == 'success')
					$('#btn').after(responseTxt);
				if(statusTex == 'error')
					$('#btn').after("请求发送失败...");
			});
		}
		
		//JQuery支持的AJAX-get()和post()方法
		function send2(){
			var name = $('#name').val();
			var sex = $('#sex').val();
			var age = $('#age').val();
			var info = $('#info').val();
			
			//这是一个json对象
			var json = {"name":name,
					"age":age,
					"sex":sex,
					"info":info};
			//将json对象转换成json字符串 
			var jsoninfo = JSON.stringify(json);
			
			/* 
			GET - 从指定的资源请求数据(也可以发送简单的数据，在url上添加要发送的数据)
			GET 基本上用于从服务器获得（取回）数据。注释：GET 方法可能返回缓存数据。
			POST - 向指定的资源提交要处理的数据
			POST 也可用于从服务器获取数据。不过，POST 方法不会缓存数据，并且常用于连同请求一起发送数据。 
			*/
			
			//$.get(URL,callback(data,status));必需的 URL 参数规定您希望请求的 URL。
			//可选的 callback 参数是请求成功后所执行的函数名。data:被请求页面返回的数据		status：请求的状态
			/* $.get("sendtest.do?jsoninfo=" + jsoninfo +"&info='你好'",function (data,status){
				var json = JSON.parse(data);
				$('#btn').after(json.name + status);
			}); */
			
			//$.post(URL,data,callback(data,status));三个参数与之前的一致
			$.post("sendtest.do",{jsoninfo:jsoninfo,info:"我是张迪"},function(data,status){
				var json = JSON.parse(data);
				$('#btn').after(json.name + status);
			});
		}
	</script>
</body>
</html>