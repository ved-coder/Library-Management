<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Return</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body background="images\img.jpg ">
<form action="return2.jsp" method="post" > 
<div class='container'>
 <h2 align='center'>Return Book</h2>
    <%
    String m=(String)session.getAttribute("uname");  
	 Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
		Statement stmt=con.createStatement();
     		ResultSet rs=stmt.executeQuery("select *from book b join issuebook ib on b.id=ib.book_id where ib.uname='"+m+"'");
   
    %>
  
    <p>select book name to:
    	<select  name= "bname"/>
    	<option>select book</option>
 <%
    while(rs.next()){
    	String bname=rs.getString("bname");
    	int copies =rs.getInt("available");
    	if(copies>0){ %>
    		<option><%=bname %> <%} %></option>
  <%} %>
     
</select></p>
<p><input type ="submit" value="Return"/></p>
</form>
<form action="HomePage.jsp" method="post" > 
<p><input type ="submit" value="Go Back"/></p>
</form>
</div>
</body>
</html>