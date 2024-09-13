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
<title>Details</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body>
<form action='HomePage.jsp' method='post'>
<%

String n=request.getParameter("bname");

	 Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
         
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id from book where bname='"+n+"'");
		rs.next();
		int id=rs.getInt(1);

		ResultSet rs2=stmt.executeQuery("select uname,date_of_issue from issuebook where book_id='"+id+"'");
		%>
<table border ='1'><tr><thead><th>UNAME</th><th>DATE</th>
<tbody>
<%while (rs2.next()){ %>		
	
<tr>		 
	    
		<td><%= rs2.getString(1)%></td>
		<td><%= rs2.getString(2)%></td>
	</tr>
	<%} %>	
	</tbody></table>
	<input type ="submit" value="go back">
	</form>	
</body>
</html>