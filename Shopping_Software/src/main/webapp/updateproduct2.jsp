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
	String name=request.getParameter("name");
	String category=request.getParameter("category");
	String price=request.getParameter("price");
	String stock=request.getParameter("stock");
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Product product=em.find(Product.class, Integer.parseInt(id));
	product.setName(name);
	product.setCategory(category);
	product.setPrice(Double.parseDouble(price));
	product.setStock(Integer.parseInt(stock));
	
	et.begin();
	em.merge(product);
	et.commit();
	
	out.println("Product Updated Successfully");
%>
</body>
</html>