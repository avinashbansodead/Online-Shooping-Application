<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
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
<form action="searchproductbycategory.jsp" align="center">
<input type="search" name="category" placeholder="Search by category">
<button type="submit">Search</button>
</form>
<br>

<%
	String category=request.getParameter("category");
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();

	Query query=em.createQuery("select a from Product a where a.category=?1");
	query.setParameter(1, category);
	List <Product> products=query.getResultList();
	if(products.size()>0)
	{
%>
<table border="0px" align="center" cellpadding="40px" >
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Available Stock</th>
			</tr>
			
			<%
				for(Product p:products)
				{
			%>
				<tr>
				<td><%=p.getId()%></td>
				<td><%=p.getName() %></td>
				<td><%=p.getCategory() %></td>
				<td><%=p.getPrice() %></td>
				<td><%=p.getStock()%></td>
				</tr>
			<%} %>
		</table>
		<%} else { %>
		<h2 align="center">No such type of product available</h2>
		<%} %>
</body>
</html>