<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="com.shoppingcart.dto.Customers"%>
<%@page import="com.shoppingcart.dto.Items"%>
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
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Items items=em.find(Items.class, id1);
	
	Customers customers=(Customers)session.getAttribute("customer");
	Cart cart=customers.getCart();
	
	Query query=em.createQuery("select a from Items a");
	List<Items>items2=query.getResultList();
	
	List<Items> items3=new ArrayList(); 
	if(items2.size()>0)
	{
		for(Items i:items2)
		{
			if(i.getId()!=id1)
			{
				items3.add(i);
			}
		}
		
		cart.setItems(items3);
		cart.setTotalprice(cart.getTotalprice()-(items.getQuantity()*items.getPrice()));
		
		et.begin();
		em.merge(cart);
		em.remove(items);
		et.commit();
		
		RequestDispatcher rd=request.getRequestDispatcher("viewcartaddeditems.jsp");
		rd.forward(request, response);
	}
	else
	{
		out.println("Yet No items added in your cart!");
	}
	
%>
</body>
</html>