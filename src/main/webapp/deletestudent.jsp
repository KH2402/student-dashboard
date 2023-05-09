<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>Delete Student</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="component/style_addstudent.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js">
	
</script>
<style type="text/css">

section {
	margin: 20px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label, input {
	font-size: 1.2em;
	margin: 10px;
}

input[type="text"] {
	padding: 10px;
	border: none;
	border-radius: 5px;
	box-shadow: 0 0 5px #ccc;
}

button[type="submit"] {
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	box-shadow: 0 0 5px #ccc;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

button[type="submit"]:hover {
	background-color: #555;
}
</style>

</head>
<body>
	<header>
		<h1>Delete Student</h1>
		<nav>
			<ul>
				<li><a href="welcomeAdmin.jsp">Admin Panel</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section>
			<form action="deletestudent" method="post" id="f1">
				<label for="student-id">Student RollNo:</label> 
				<input type="text" name="rollno"  required>
				<button type="submit">Delete</button>
			</form>
		</section>
	</main>

</body>
</html>
