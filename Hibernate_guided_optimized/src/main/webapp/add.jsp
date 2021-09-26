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

<form method="post" action="newProduct">

Name: <input type="text" name="pname"><br>
Price: <input type="text" name="price"><br>
Image Url: <input type="text" name="imageUrl"><br>
Image Metadata Key: <input type="text" name="imageMetaKey"><br>
Image Metadata Value: <input type="text" name="imageMetaValue"><br>
<button type="submit">Create Product</button>


</form>

</body>
</html>