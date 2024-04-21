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
<link rel="stylesheet" href="style1.css">
<style type="text/css">
table{
	margin: 270px;
	padding-top: 10px;
}
</style>
</head>
<body>
<header>
	<div class="main">
		<ul>
			<li><a href="approvemerchant.jsp">Approve Merchant</a></li>
			<li><a href="viewmerchant.html">View All Merchant</a></li>
			<li><a href="deletemerchant.jsp">Delete Merchant</a></li>
			<li><a href="blockmerchant.jsp">Block Merchant</a></li>
		</ul>
	</div>





<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	Query query=em.createQuery("select a from Merchant a where a.status='active'");
	List <Merchant> merchants=query.getResultList();
	if(merchants.size()>0)
	{
%>
<table border="0px" align="center"  cellpadding="50px" cellspacing="50px">
<tr>
<th>id</th>
<th>name</th>
<th>email</th>
<th>mobilenumber</th>
<th>status</th>
<th>Delete</th>
</tr>

<% for(Merchant merchant:merchants){ %>
<tr>
	<td><%=merchant.getId() %></td>
	<td><%=merchant.getName() %></td>
	<td><%=merchant.getEmail()%></td>
	<td><%=merchant.getMobilenumber()%></td>
	<td><%=merchant.getStatus() %></td>
	<td><a href="deletemerchant1.jsp?id=<%=merchant.getId()%>">Delete</a></td>
</tr>
<%} %>
</table>
<%}
	else
	{
		out.print("Merchant not present");
	}
	%>
	</header>
</body>
</html>