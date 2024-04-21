<%@page import="com.shoppingcart.dto.Merchant"%>
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
<style type="text/css">
#form1 
{
	border: 2px	solid orange;
	padding-top: 20px;
	padding-bottom: 20px;
	background-color: black;
}

input[type="search"] 
{
	width:30%;
	padding-top:"10px";
}
body
{
	background-image: url("Retail-Business-Cart.png");
	background-attachment: fixed;
}
</style>
</head>
<body>
<form action="searchproduct.jsp" align="center" id="form1">
<input type="search" name="product" placeholder="Search">
<button type="submit">Search</button>
</form>
<br>


<%
	String product=request.getParameter("product");
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shopping");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();

	Query query=em.createQuery("select a from Product a where a.name=?1");
	query.setParameter(1, product);
	List <Product> products=query.getResultList();
	
	
	
	if(products.size()>0 )
	{
%>
<table border="0px" align="center" cellpadding="40px">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Available Stock</th>
				<th>Quantity</th>
				<td>Add to cart</td>
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
				<td>
					<form action="" method="post">
					<select type="dropdown" name="quant" required="required">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select>
					<button type="submit">set</button>
					</form>
					<%
					String quantity1=request.getParameter("quant");
					%>
				</td>
				
				<td><a href="additemtocart.jsp?id=<%=p.getId()%>=?quantity=<%=quantity1%>">Add to cart</a></td>
				</tr>
			<%} %>
		</table>
		<%} else { %>
		<h2 align="center">No such type of product available</h2>
		<%} %>
		
</body>
</html>