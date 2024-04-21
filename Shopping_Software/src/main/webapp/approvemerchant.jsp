<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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
	margin: 180px;
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
	Query query=em.createQuery("select b from Merchant b where b.status='inactive'");
	List <Merchant> merchants=query.getResultList();
	if(merchants.size()>0)
	{
%>

<table border="0px" align="center" cellpadding="50px" cellspacing="50px">
<th>id</th>
<th>name</th>
<th>email</th>
<th>password</th>
<th>mobilenumber</th>
<th>status</th>
<th>Approve</th>

<% for(Merchant merchant:merchants) {%>
<tr> 
<td><%=merchant.getId() %></td>
<td><%=merchant.getName() %></td>
<td> <%=merchant.getEmail() %></td>
<td><%=merchant.getPassword()%></td>
<td><%=merchant.getMobilenumber() %></td>
<td><%=merchant.getStatus() %></td>
<td><a href="merchantstatusapprove.jsp?id=<%=merchant.getId()%>">approve</a></td>
<tr>
<%} %>
</table>

<% } else { 
	PrintWriter printWriter=response.getWriter();
	printWriter.write("No Merchant");
	RequestDispatcher rd=request.getRequestDispatcher("adminoption.html");
	rd.include(request, response);
}
%>
</header>
</body>
</html>