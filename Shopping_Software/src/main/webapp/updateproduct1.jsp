<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	int id1=Integer.parseInt(id);
	
%>

<form action="updateproduct2.jsp" method="post">
<label>Id</label>
<input type="number" name="id" value="<%=id1%>">
<label>Name</label>
<input type="text" name="name">
<label>Category</label>
<input type="text" name="category">
<label>Price</label>
<input type="number" name="price">
<label>Stock</label>
<input type="number" name="stock">
<input type="submit">
</form>

</body>
</html>