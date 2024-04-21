<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart.dto.Admin"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.util.List"%>
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

	Merchant merchant=em.find(Merchant.class,id1);
	merchant.setStatus("active");
	
	Admin a=(Admin) session.getAttribute("admin");
	
	merchant.setAdmin(a);
	 
	List <Merchant> merchants2=new ArrayList <Merchant>();
	
	merchants2.add(merchant);
	
	a.setMerchants(merchants2);
	
	et.begin();
	em.merge(a);
	em.merge(merchant);
	et.commit();
	
	RequestDispatcher rd=request.getRequestDispatcher("approvemerchant.jsp");
	rd.forward(request, response);
	
%>

</body>
</html>