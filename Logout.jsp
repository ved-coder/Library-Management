<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body>
<%
session.removeAttribute("uname");
session.invalidate();

%>
<jsp:forward  page="Success.jsp"></jsp:forward>

</body>
</html>