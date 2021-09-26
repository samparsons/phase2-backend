<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String name = request.getParameter("name");
	String password = request.getParameter("pwd");
	
	if(name.equalsIgnoreCase("test") && password.equals("hello")) {
		session.setAttribute("name",name);
		response.sendRedirect("dashboard.jsp");
	} else {
		response.sendRedirect("index.jsp?error=1");
	}


%>

</body>
</html>