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

<title>欢迎登陆</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function sub() {
		var username = $(".username").val();
		var password = $(".password").val();
		$.ajax({
			type : "post",
			url : "jsp/LoginControl.jsp",
			data : {
				"username" : username,
				"password" : password
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			},

			success : function(data) {
				if (data == -1) {
					alert("用户名或者密码不能为空");
				} else if (data == -2) {
					alert("用户名不存在")
				} else if (data == -3) {
					alert("用户名或者密码错误")
				} else {
					alert("恭喜你，登陆成功！")
					window.location.href = "jsp/HollePage.jsp";
				}
			}
		})
	}
</script>

<style type="text/css">
#container {
}

#a {
	width: 800px;
	height: 80px;
	margin: 0 auto;
	text-align: center;
	font-size: 60px;
}

#chose {
	margin: 60 auto;
	text-align: center;
}

#chose1, #chose2, #chose3 {
	width: 200px;
	height: 20px;
	font-size: 30px;
	display: inline;
	color: red;
	margin-left: 40px;
}

#login {
	margin-top: 200px;
	text-align: center;
}

#btn {
	margin-top: 20px;
}
</style>

</head>

<body>
	<div id="container">
		<div id="a">客户管理系统</div>

		<div id="chose">
			<div id="chose1">普通客户</div>
			<div id="chose2">白金客户</div>
			<div id="chose3">合作伙伴</div>
		</div>

		<div id="login">
			<form action="">
				<div id="input">

					用户：<input type="text" name="username" class="username" /><br>
					<br> 密码：<input type="password" name="password"
						class="password" /><br>
				</div>
				<div id="btn">
					<input type="button" name="login" value="登陆" onclick="sub()" /> <input
						type="button" name="regist" value="注册"
						onclick="window.location.href='Regist.jsp'" />
				</div>
			</form>
		</div>
	</div>



</body>
</html>
