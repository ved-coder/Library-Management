<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Registration</title>
  <link rel="stylesheet" type="text/css" href="style.css">     
</head>
<body background="images\img.jpg " >

<div class='container'>
<h2 align='center'>Registration Form</h2>
<form action='userinsert.jsp' method='post' align='center'>
<div style="margin-left:100px; border:3px solid block; width=fit-content;">
<p>First Name:<input type="text" name="fname"/></p>
<p>Last Name:<input type="text" name="lname"/></p>

<p>DOB:<input type="date" name="date"/></p>
<p>Email:<input type="email" id="email" name="email" 
  title="please include @ " required/></p>
<p>Phone Number:<input type="text" name="pno"/></p>  

<p>User name:<input type="text" name="uname"/></p>
<p>Password: <input type="password" name="pass"/></p>

<p><input type="submit" value="Register"/></p>

</form>
<form action='Success.jsp' method='post' align='center'>
<input type="submit" value="Login"/></p>
</div>
</div>
</body>
</html>