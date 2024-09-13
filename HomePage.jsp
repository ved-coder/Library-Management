<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
  <link rel="stylesheet" type="text/css" href="style.css">     

</head>
<body background="images\img.jpg ">
<div align='center' class='container'>

<h1>Welcome <%= session.getAttribute("uname")  %></h1>

<h1>List of Book </h1>
<p><a href=List.jsp>LIST</a></p>
<br><br>
<h1>Add A New Book </h1>
<p><a href=Add.jsp>ADD</a></p>
<br><br>
<h1>Issue A Book</h1>
<p><a href=Issue.jsp>ISSUE</a></p>
<br><br>
<h1>Issued Book Details  </h1>
<p><a href=issuedetails.jsp>DETAILS</a></p>
<br><br>
<h1>Return Book  </h1>
<p><a href=return.jsp>RETURN BOOK</a></p>
<br><br>
<h1>Logout  </h1>
<p><a href=Logout.jsp>LOGOUT</a></p>
</div>
</body>

</html>