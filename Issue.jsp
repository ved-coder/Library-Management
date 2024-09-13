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
<title>Issue</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body  background="images\img.jpg ">
<form action='IssueBook.jsp' method='post'>
<div class='container'>
<h2 align='center'>Issue Book</h2>
<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
	
	Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select bname ,available from book");
		%>
		
		
		<p>Select book name to issue:<select name="bname">
		<option>select book</option>
		<% while (rs.next()) {
			String bn=rs.getString(1);
	        int a = rs.getInt(2);
	        if(a>0) {%>
	        <option value"">
	        <%= bn %><%} %> </option>
	        <%} %>
<br><br>
<p><input type="submit" value="Issue"/></p>
</form>
<form action="HomePage.jsp" method="post">
<p><input type="submit" value="Go Back"/></p>
</form>
</div>
</body>
</html>