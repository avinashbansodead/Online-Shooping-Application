<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Admin"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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
	
	Merchant merchant =em.find(Merchant.class, id1);
	
	Admin admin =merchant.getAdmin();
	if(admin!=null)
	{
		List<Merchant>merchants=new ArrayList();
		for(Merchant m:admin.getMerchants())
		{
			if(m.getId()==id1)
			{
				
			}
			else
			{
				merchants.add(m);
			}
		}
		
		admin.setMerchants(merchants);
		
		et.begin();
		em.merge(admin);
		em.remove(merchant);
		et.commit();
		
		RequestDispatcher rd=request.getRequestDispatcher("deletemerchant.jsp");
		rd.forward(request, response);
	}
	else
	{
		
	}
	
	
	
	
%>
</body>
</html>