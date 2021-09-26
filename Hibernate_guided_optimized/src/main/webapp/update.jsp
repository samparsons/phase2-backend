<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="shop.Product" %>
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
	Session se = HibernateUtil.getSessionFactory().openSession();
	int pid = Integer.parseInt(request.getParameter("pid"));
	Product p = se.load(Product.class,pid);
	
%>
<form method="post" action="update?pid=<%=p.getProductId() %>">

Name: <input type="text" name="pname" value="<%=p.getName() %>" >
Price: <input type="text" name="price" value="<%=p.getPrice() %>" >
<button type="submit">Save</button>


</form>
<%	
	se.close();
%>

</body>
</html>