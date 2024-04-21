<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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
	margin: 330px;
	padding-top: 10px;
}
</style>
</head>
<body>
<header>
	<div class="main">
		<ul>
			<li><a href="addproduct.html">add product</a></li>
			<li><a href="viewproduct.jsp">view product</a></li>
			<li><a href="deleteproduct.jsp">remove product</a></li>
			<li><a href="updateProduct.jsp">update product</a></li>
		</ul>
	</div>

<%
	Merchant merchant=(Merchant)session.getAttribute("merchant");
	List<Product>products=merchant.getProducts();
	if(products.size()>0)
	{
%>
<table cellpadding="10px" align="center" cellpadding="50px" cellspacing="50px">
<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Category</th>
	<th>Price</th>
	<th>Stock</th>
	<th>Delete</th>
</tr>
<%
	for(Product p:products)
	{
%>
<tr>
	<td><%=p.getId()%></td>
	<td><%=p.getName()%></td>
	<td><%=p.getCategory()%></td>
	<td><%=p.getPrice()%></td>
	<td><%=p.getStock()%></td>
	<td><a href="deleteproduct1.jsp?id=<%=p.getId()%>">Delete</a></td>
</tr>
<%} %>
</table>
<%}
else
{
	out.println("Product is not available");
}
%>
</header>
</body>
</html>