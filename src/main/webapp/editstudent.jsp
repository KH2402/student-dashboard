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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js">
	
</script>

<script type="text/javascript">
	function validateForm() {
		// Fetching input values

		var phone = document.getElementById("phone").value;
		var email = document.getElementById("email").value;
		var rollno = document.getElementById("rollno").value;
		var prn = document.getElementById("prn").value;
		var attendance = document.getElementById("attendance").value;

		// Validating Mobile Number
		if (!validateMobileNumber(phone)) {
			alert("Please enter a valid phone number");
			return false;
		}

		// Validating Email
		if (!validateEmail(email)) {
			alert("Please enter a valid email address");
			return false;
		}

		// Validating Roll Number
		if (!validateRollNumber(rollno)) {
			alert("Please enter a valid roll number");
			return false;
		}
		//Validating PRN Number
		if (!validatePRN(prn)) {
			alert("Please enter a valid PRN number");
			return false;
		}
		//Validating Attendance Number
		if (!validateAttendance(attendance)) {
			alert("Please enter a valid Attendance number");
			return false;
		}

		return true;
	}

	// Mobile number validation
	function validateMobileNumber(phone) {
		const regex = /^[6-9]\d{9}$/; // Regular expression for Indian mobile numbers
		return regex.test(phone);
	}

	// Email validation
	function validateEmail(email) {
		const regex = /^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // Regular expression for email validation
		return regex.test(email);
	}

	// Roll number validation
	function validateRollNumber(rollno) {
		const regex = /^305[ABC]\d{3}$/; // Roll number pattern: 305 followed by A, B, or C, and then three digits
		return regex.test(rollno);
	}
	// PRN validation
	function validatePRN(prn) {
		const regex = /^\d{8}[A-Z]$/; // PRN number pattern: 8 digits followed by a single uppercase letter
		return regex.test(prn);
	}

	// Attendance validation
	function validateAttendance(attendance) {
		const parsedAttendance = parseInt(attendance, 10); // Parse the attendance as an integer

		if (isNaN(parsedAttendance)) {
			// Check if the attendance is a valid number
			return false;
		}

		return parsedAttendance >= 0 && parsedAttendance <= 100; // Check if the attendance is within the range of 0 to 100
	}
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




		<form action="updatestudent" onsubmit="return validateForm()" method="post">
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" value="<%=name%>" required> <label for="rollNo">RollNo:</label>
			<input type="text" id="rollno" name="rollno" value="<%=rollno%>"
				required> <label for="prn">PRN:</label> <input type="text"
				id="prn" name="prn" value="<%=prn%>" required> <label
				for="phone">Phone:</label> <input type="tel" id="phone" name="phone"
				value="<%=phone%>" required> <label for="email">Email:</label>
			<input type="email" id="email" name="email" value="<%=email%>"
				required> <label for="attendance">Attendance(%):</label> <input
				type="number" name="attendance" value="<%=attendance%>" required></input>

			<button type="submit">Save</button>
		</form>
	</main>
</body>
</html>
