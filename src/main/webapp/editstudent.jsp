<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.StudentDetails"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
	<title>Edit Student</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="component/style_addstudent.css">
	<script src=
	"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js">
	 </script>
</head>
<body>
	<header>
		<h1>Edit Student</h1>
		<nav>
			<ul>
				<li><a href="welcomeAdmin.jsp">Admin Panel</a></li>
			</ul>
		</nav>
	</header>
	<main>
	<%
	
    String name = request.getParameter("name");
    String rollno = request.getParameter("rollno");
    String prn = request.getParameter("prn");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String attendance = request.getParameter("attendance");

	%>

	
	
	
		<form action="updatestudent" method="post">
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" value="<%=name%>" required>

			<label for="rollNo">RollNo:</label>
			<input type="text" id="rollno" name="rollno" value="<%=rollno%>" required>
			
			<label for="prn">PRN:</label>
			<input type="text" id="prn" name="prn" value="<%=prn%>" required>

			<label for="phone">Phone:</label>
			<input type="tel" id="phone" name="phone" value="<%=phone%>" required>
			
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" value="<%=email%>" required>
		
			<label for="attendance">Attendance(%):</label>
			<input type="number" name="attendance" value="<%=attendance%>" required></input>

			<button type="submit">Save</button>
		</form>
	</main>
</body>
</html>
