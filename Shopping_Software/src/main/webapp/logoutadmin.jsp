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
	HttpSession ht=request.getSession();
	ht.invalidate();
	RequestDispatcher rd=request.getRequestDispatcher("MainPage.html");
	rd.forward(request, response);
%>
</body>
</html>