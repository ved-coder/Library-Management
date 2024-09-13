<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Book</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body background="images\img.jpg " >

<form action="List.jsp" method="post">
<div class='container'>
<div style="margin-left:100px; border:3px solid block; width=fit-content;">
<h2 align='center'>Add Books</h2>
<p>Book Name:<input type="text" name="bname"/></p>
<p>Author:<input type="text" name="aname"/></p>

<p>Cost:<input type="text" name="cost"/></p>
<p>Available_copies:<input type="text" name="available" /></p>
<p>Issued_copies:<input type="text" name="issued"/></p>  

<p>Total_copies:<input type="text" name="total"/></p>

<input type="submit" value="add book"/>
</form>

<form action="HomePage.jsp" method="post">
<input type="submit" value="Home Page"/>
</form>
</div>
</div>
</body>
</html>