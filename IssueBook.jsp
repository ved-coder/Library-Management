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
<title>issue book record</title>
</head>
<body>
<%
String un=(String)session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
System.out.println(con);

Statement stmt=con.createStatement();
String bn=request.getParameter("bname");
ResultSet rs=stmt.executeQuery("select id from book where bname='"+bn+"'");
rs.next();
int i=rs.getInt(1);

PreparedStatement ps=con.prepareStatement("insert into issuebook values(issue_seq.NEXTVAL,?,?,sysdate)");
ps.setInt(1,i);
ps.setString(2,un);
ps.executeUpdate();

ResultSet rs2=stmt.executeQuery("select available,issued from book where bname='"+bn+"'");
rs2.next();
int x=rs2.getInt(1);
int a=x-1;
int b=rs2.getInt(2);
int y=b+1;

PreparedStatement ps2=con.prepareStatement("update book set available='"+a+"',issued='"+y+"' where bname='"+bn+"'");

ps2.executeUpdate();
ps.close();

%>
<h1>Book Issued Successfully</h1>
<form action="Issue.jsp" method="post">
<p><input type="submit" value="Go Back"/></p>
</form>
</body>
</html>