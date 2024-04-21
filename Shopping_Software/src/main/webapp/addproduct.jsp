<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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
	String name=request.getParameter("name");
	String category=request.getParameter("category");
	String price=request.getParameter("price");
	String stock=request.getParameter("stock");

	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Product product=new Product();
	product.setName(name);
	product.setCategory(category);
	product.setPrice(Double.parseDouble(price));
	product.setStock(Integer.parseInt(stock));
	
	List<Product>products=new ArrayList<Product>();
	products.add(product);
	
	Merchant merchant=(Merchant)session.getAttribute("merchant");
	
	product.setMerchant(merchant);
	
	et.begin();
	em.persist(product);
	et.commit();
	
	RequestDispatcher rd=request.getRequestDispatcher("addproductsetmerchant.jsp");
	rd.include(request, response);
	
%>
</body>
</html>