<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>欢迎注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>


<style type="text/css">
#container {
	
}

#word {
	width: 800px;
	height: 80px;
	margin: 0 auto;
	text-align: center;
	font-size: 60px;
}

#regist {
	text-align: center;
	margin-top: 100px;
	margin-top: 30
}
</style>
</head>

<body>
	<script>
		function sub1() {
			var username = $(".username1").val();
			var password = $(".password1").val();
			$.ajax({
				type : "post", //请求方式
				url : "jsp/RegistControl.jsp", //请求地址
				data : {
					"username" : username,
					"password" : password
				}, 
				success : function(data) { //返回成功执行回调函数。	
					if (data == 1) {
						alert("注册成功");
						window.location.href="index.jsp";
					} else if(data == -1){
						alert("用户名或者密码不能为空");
					} else if(data == -2){
						alert("注册失败");
					}
				}
			});	
		}
	</script>
	<div id="container">
		<div id="word">欢迎注册客户管理系统</div>
		<div id="regist">
			<form action="" class="regist">
				客户姓名<input type="text" class="username1" /><br>
				<br> 客户密码<input type="password" class="password1" /><br>
				<br> 客户性别<input type="radio" />男 <input type="radio" />女<br>
				<br> 客户生日<input type="text" /><br>
				<br> 客户手机<input type="text" /><br>
				<br> 客户邮箱<input type="text" /><br>
				<br>
				<textarea rows="10" cols="30">备注说明</textarea>
				<br>
				<br> 邀请码<input type="text" name="yaoqingma" /><br>
				<br>
				<button type="button" class="submit" onclick="sub1()">注册</button>
			</form>
		</div>
	</div>

</body>
</html>
