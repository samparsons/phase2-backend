<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello, 

<% session.getAttribute("name"); %>

<a href="logout.jsp">Log me out</a>

</body>
</html>