<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body background="images\img.jpg ">
<form action='details.jsp' method='post'>
<div class='container'>
<h2 align='center'>Issued Book Details</h2>
<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
	
	Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select bname from book");
		%>
		<p>Select book name to check details:<select name="bname"/>
		<option>select book</option>
		
		<%while (rs.next()) {
			String b=rs.getString(1); %>
	        <option value"">
	        <%= b %>
	        </option>
	        <%} %>
<br><br>
<p><input type="submit" value="Details"/></p>
<form action='HomePage.jsp' method='post'>
<p><input type="submit" value="Go Back"/></p>
</form>
</div>
</body>
</html>