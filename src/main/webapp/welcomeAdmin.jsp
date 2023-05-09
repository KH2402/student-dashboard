<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.StudentDetails"%>

<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="component/stylePanel.css">
<style type="text/css">
@charset "ISO-8859-1";

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

#h1 {
	color: #333;
	margin-top: 2rem;
	margin-bottom: 5rem;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: flex-end;
}

nav ul li {
	margin: 0 10px;
}

nav ul li a {
	background: #333;
	font-size: 1rem;
	text-decoration: none;
	color: #fff;
}

main {
	margin: 20px;
}

<!--
-->
<!--
-->
nav ul li a:hover {
	background: #fff;
	color: #333;
	text-decoration: none;
	border: 7px solid #fff;
	border-radius: 0.5rem;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

@media only screen and (max-width: 600px) {
	table {
		border: 0;
	}
	table caption {
		font-size: 1.3em;
	}
	table thead {
		display: none;
	}
	table tr {
		margin-bottom: 10px;
		display: block;
		border-bottom: 2px solid #ddd;
	}
	table td {
		display: block;
		text-align: right;
		font-size: 13px;
		border-bottom: 1px dotted #ccc;
	}
	table td:before {
		content: attr(data-label);
		float: left;
		text-transform: uppercase;
		font-weight: bold;
	}
}
</style>

</head>
<body>
	<header>
		<h1>Admin Panel</h1>
		<nav>
			<ul>
				<li><form action="studentservlet">
						<input type="submit" value="View Students">
					</form></li>
				<li><a href="addstudent.jsp">Add Student</a></li>
				<li><a href="deletestudent.jsp">Delete Student</a></li>
				<li><a href="index.jsp">Logout</a></li>

			</ul>
		</nav>
	</header>
	<main>
		<h2 id="h1">Welcome to the admin panel</h2>


		<section>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>RollNo</th>
						<th>PRN</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Attendance</th>
						<th>Update</th>
					</tr>
				</thead>
				
				<tbody>
					<!--  /*Fetching the attributes of the request object
	             which was previously set by the servlet 
	              "StudentServlet.java"*/ -->
				

					<%
					HttpSession sess = request.getSession(true);
					ArrayList<StudentDetails> std = (ArrayList<StudentDetails>) sess.getAttribute("data");
					if(std!=null){
						for (StudentDetails s : std) {
						%>
	
						<tr>
							<td><%=s.getName()%></td>
							<td><%=s.getRollno()%></td>
							<td><%=s.getPrn()%></td>
							<td><%=s.getPhone()%></td>
							<td><%=s.getEmail()%></td>
							<td><%=s.getAttendance()%></td>
							<th><a href="editstudent.jsp?rollno=<%=s.getRollno()%>&name=<%=s.getName()%>&prn=<%=s.getPrn()%>&phone=<%=s.getPhone()%>&email=<%=s.getEmail()%>&attendance=<%=s.getAttendance()%>">Edit</a></th>
							
						</tr>
						<%
						}
					}
					%>

				</tbody>
				  
				
			</table>
		</section>

	</main>
</body>
</html>
