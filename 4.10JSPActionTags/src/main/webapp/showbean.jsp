<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Bean Properties</title>
</head>
<body>
<jsp:useBean id="productBean" class="shop.ProductBean" scope="session"></jsp:useBean>
Product Id: 	<jsp:getProperty property="productId" name="productBean"/><br>
Product Name: 	<jsp:getProperty property="productName" name="productBean"/><br>
Product Price:	<jsp:getProperty property="price" name="productBean"/><br>


</body>
</html>