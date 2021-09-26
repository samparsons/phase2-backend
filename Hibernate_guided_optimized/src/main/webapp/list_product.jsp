<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.criterion.Restrictions" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="java.util.List" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="shop.Product" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Products</title>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
            <td>Product Id</td>
            <td>Product Name</td>
            <td>Product Price</td>
	</tr>       
<%
	Session se = HibernateUtil.getSessionFactory().openSession();
	CriteriaBuilder cb = se.getCriteriaBuilder();
	CriteriaQuery<Product> cr = cb.createQuery(Product.class);
	Root<Product> root = cr.from(Product.class);
	//cr.select(root).where( cb.ge(root.get("price"), 12.0));
	Query<Product> query = se.createQuery(cr);
	List<Product> products = query.getResultList();
	for(Product p : products) {
		//out.println(p.getName()+" | "+p.getPrice()+" | "+p.getProductId()+"<br>");
%>
	<tr>
            <td><%=p.getProductId() %></td>
            <td><%=p.getName() %></td>
            <td><%=p.getPrice() %></td>
            <td> 
            <a href="delete?pid=<%=p.getProductId() %>">Delete</a>
            <a href="update.jsp?pid=<%=p.getProductId() %>">Update</a>
           
            </td>
	</tr>
<%	
	}
	se.close();
%>
</table>
 <a href="add.jsp">Add Product</a>


</body>
</html>