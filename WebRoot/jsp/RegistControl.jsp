<%@ page language="java" 
import="java.util.*" 
import="bean.User"
import="service.RegistService"
pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	System.out.println(username);
	System.out.println(password);
	//如果用户名和密码不为空
	if (username.equals("") || password.equals("")) {
		out.print("-1");//错误码-1 :   用户名和密码不能为空！
	} else {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		RegistService res = new RegistService();
		int i = res.regist(user);
		if(i==0){
			out.print(-2);
		}else{
			out.print(1);
		}
		System.out.println(i);
	}
%>

