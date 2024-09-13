<%@page import="java.sql.PreparedStatement"%>
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
<title>List of books</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body >
<form action='Add.jsp' method='get'>
<% 

String n=request.getParameter("bname");
String d=request.getParameter("aname");
String c=request.getParameter("cost");
String u=request.getParameter("available");
String da=request.getParameter("issued");
String a=request.getParameter("total");

	
	 Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
		
		String sql="insert into book values(seq.NEXTVAL,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		   
		
		pstmt.setString(1,n);
		pstmt.setString(2, d);
		pstmt.setString(3, c);
		pstmt.setString(4, u);
		pstmt.setString(5, da);
		pstmt.setString(6, a);
		
		
		 pstmt.executeUpdate(); 
         pstmt.close();
         
 		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select *from book");
	
		%>
		<table border ='1'><tr><thead><th>ID</th><th>BOOK_NAME</th><th>AUTHOR</th><th>COST</th><th>AVAILABLE_COPIES</th><th>ISSUED_COPIES</th><th>TOTAL_COPIES</th>
<tbody>
<%while (rs.next()){ %>		
	
<tr>		 
	    <td><%= rs.getInt(1)%></td>
		<td><%= rs.getString(2)%></td>
		<td><%= rs.getString(3)%></td>
		<td><%= rs.getInt(4)%></td>
		<td><%= rs.getInt(5)%></td>
	    <td><%= rs.getInt(6)%></td>
	    <td><%= rs.getInt(7)%></td>
	   
	    
	</tr>
	<%} %>	
	</tbody></table>
	<input type ="submit" value="GO BACK">
	</form>	
	
	<form action="HomePage.jsp" method="post">
<input type="submit" value="Home Page"/>
</form>

</body>
</html>