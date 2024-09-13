<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>

<body background="images\img.jpg ">
<form action=LoginPage.jsp Method="post" align='center'>
<div class='container'>
<h2 align='center'>Login Page</h2>
Enter user name:<input type='text' name='uname'/>
<br><br>
Enter password:<input type='text' name='pass'/>
<br><br>

<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
if(uname!=null && pass!=null){

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
System.out.println(con);

Statement stmt=con.createStatement();
   HashMap<String,String> login=new HashMap<String, String>();

ResultSet rs=stmt.executeQuery("select uname,pass from lib");
String msg=null;
while(rs.next()) {
	 String a = rs.getString(1);
	 String b = rs.getString(2);
   login.put(a,b);
}  

if(login.containsKey(uname) && login.get(uname).equals(pass)) {
	session.setAttribute("uname",uname);
%>
<jsp:forward page="HomePage.jsp"></jsp:forward> 
<% }
else {
	   msg="INVALID INPUTS" ;
}%>
<%
if(msg!=null){%>
<p style='color:red'><%= msg %></p>
<%
}%>
<%} %>
<input type='submit' value='Login To Home'/>
</form>
</div>
</body>
</html>