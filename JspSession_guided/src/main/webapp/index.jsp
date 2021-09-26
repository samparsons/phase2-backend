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
	if(request.getParameter("error")!=null){
		out.println("ERROR");
	}

%>

<form method="post" action="login.jsp">
	Name: 	<input type="text" name="name" />
	Pwd:	<input type="text" name="pwd" />
	<button type="submit">Submit</button>
</form>

</body>
</html>