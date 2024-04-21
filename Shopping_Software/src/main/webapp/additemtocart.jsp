<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="org.hibernate.query.criteria.internal.compile.CriteriaQueryTypeQueryAdapter"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Items"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="com.shoppingcart.dto.Customers"%>
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
	String number[]=id.split("=");
	int id1=Integer.parseInt(number[0]);	

	int quantity1=Integer.parseInt(number[2]);
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Product product=em.find(Product.class, id1);
	
	Items items=new Items();
	items.setName(product.getName());
	items.setCategory(product.getCategory()); 
	items.setPrice(product.getPrice());
	if(product.getStock()>=quantity1)
	{
		items.setQuantity(quantity1);
	}
	else
	{
		PrintWriter pw=response.getWriter();
		pw.write("add quantity is more than available stock!");  
		
		RequestDispatcher rd=request.getRequestDispatcher("searchproduct.jsp");
		rd.include(request, response);
	}
	
	Customers customers=(Customers)session.getAttribute("customer");
	
	Cart cart=customers.getCart();
	cart.setCustomers(customers);
	items.setCart(cart);
	
	et.begin();
	em.merge(cart);
	em.merge(items);
	et.commit();
	
	RequestDispatcher rd=request.getRequestDispatcher("additemstocart1.jsp");
	rd.forward(request, response);
	
	
%>
</body>
</html>