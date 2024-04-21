<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.Query"%>
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
	
	Product product=em.find(Product.class, id1);
	
	Merchant merchant=(Merchant)session.getAttribute("merchant");
	List<Product>products=merchant.getProducts();
	
	List <Product> products2=new ArrayList();
	
	for(Product p:products)
	{
		if(p.getId()==id1)
		{
			
		}
		else
		{
			products2.add(p);
		}
	}
	merchant.setProducts(products2);
	
	et.begin();
	em.remove(product);
	em.merge(merchant);
	et.commit();
	
	RequestDispatcher rd=request.getRequestDispatcher("deleteproduct.jsp");
	rd.forward(request, response);
	
%>
</body>
</html>