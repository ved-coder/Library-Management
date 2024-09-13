<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registered users</title>
</head>
<body>
<form action='RegisterUser.jsp' method='get'>
<%

String n=request.getParameter("fname");
String d=request.getParameter("lname");
String c=request.getParameter("date");
String u=request.getParameter("email");
String da=request.getParameter("pno");
String a=request.getParameter("uname");
String p=request.getParameter("pass");


	
	 Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
		
		String sql="insert into lib values(seq.NEXTVAL,?,?,to_date(?,'YYYY-MM-DD'),?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		   
		
		pstmt.setString(1,n);
		pstmt.setString(2, d);
		pstmt.setString(3, c);
		pstmt.setString(4, u);
		pstmt.setString(5, da);
		pstmt.setString(6, a);
		pstmt.setString(7,p);
		
		 pstmt.executeUpdate(); 
         pstmt.close();
         
 		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select *from lib");
		%>

<table border ='1'><tr><thead><th>ID</th><th>FIRST NAME</th><th>LAST NAME</th><th>DATE</th><th>EMAIL</th><th>PHONE_NUMBER</th><th>USER_NAME</th><th>PASSWORD</th>
<tbody>
<%while (rs.next()){ %>		
	
<tr>		 
	    <td><%= rs.getInt(1)%></td>
		<td><%= rs.getString(2)%></td>
		<td><%= rs.getString(3)%></td>
		<td><%= rs.getString(4)%></td>
		<td><%= rs.getString(5)%></td>
	    <td><%= rs.getString(6)%></td>
	    <td><%= rs.getString(7)%></td>
	    <td><%= rs.getString(8)%></td>
	    
	</tr>
	<%} %>	
	</tbody></table>
	<input type ="submit" value="go back">
	</form>	
</body>
</html>