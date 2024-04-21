<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.List"%>
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
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Query query=em.createQuery("select a from Product a");
	List<Product>products=query.getResultList();
	
	List<Product>products2=new ArrayList();
	
	Merchant merchant=(Merchant)session.getAttribute("merchant");
	if(products.size()>0)
	{
		for(Product p:products)
		{
			if(merchant.getId()==p.getMerchant().getId())
			{
				products2.add(p);
			}
		}
		
		merchant.setProducts(products2);
		et.begin();
		em.merge(merchant);
		et.commit();
		
		PrintWriter printWriter=response.getWriter();
		printWriter.write("product added successfully");
		
		RequestDispatcher rd=request.getRequestDispatcher("addproduct.html");
		rd.include(request, response);
	}
%>

</body>
</html>