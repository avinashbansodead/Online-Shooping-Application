<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="com.shoppingcart.dto.Customers"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.shoppingcart.dto.Items"%>
<%@page import="java.util.List"%>
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
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Query query=em.createQuery("select a from Items a");
	List<Items>items=query.getResultList();
	
	Customers customers=(Customers)session.getAttribute("customer");
	
	Cart cart=customers.getCart();
	int total=0;
	for(Items i:items)
	{
		total+=(i.getQuantity()*i.getPrice());
	}
	cart.setTotalprice(total);
	cart.setItems(items);
	
	et.begin();
	em.merge(cart);
	et.commit();
	
%>

<h2 align="center">product add to cart successfully</h2>
</body>
</html>