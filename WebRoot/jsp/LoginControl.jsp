<%@ 
page language="java" import="java.util.*" import="bean.User"
	import="service.LoginService" pageEncoding="utf-8"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (username.equals("") || password.equals("")) {
		out.print("-1");
	} else {
		LoginService loginService = new LoginService();
		User user = loginService.getUser(username);
		if (user.getUsername() == null) {
			out.print(-2);
		} else
		if (!username.equals(user.getUsername()) || !password.equals(user.getPassword())) {
			out.print(-3);
		} else {
			out.print(1);
		}
	}
%>