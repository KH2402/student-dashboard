
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management System</title>
<link rel="stylesheet" href="component/style.css">

</head>
<body>


	<div class="container">
		<input type="checkbox" id="check">
		<div class="login form">
			<header>Login</header>

			<form action="login_page" >
				<input type="email" name="t1" placeholder="Enter your email">
				<input type="password" name="t2" placeholder="Enter your password">
				<input type="submit" value="Login">

			</form>
			
			<form action="index.jsp">
				<div>
					<input type="submit" id="btn1" value="Back">
				</div>
			</form>
		
			<div class="signup">
				<span class="signup">Don't have an account? 
				<label for="check">Signup</label>
				</span>
			</div>
			
			
		</div>

 

		<div class="registration form">
			<header>Signup</header>
			<form action="signup_page" >
				<input type="email" name="s1" placeholder="Enter your email"> 
				<input type="password" name="s2" placeholder="Create a password">
				<input type="password" name="s3" placeholder="Confirm your password"> 
				<input type="submit" class="button" value="Signup">
			</form>
			
			<div class="signup">
				<span class="signup">Already have an account? <label
					for="check">Login</label>
				</span>
			</div>
			<form action="index.jsp">
				<div>
					<input type="submit" value="Back">
				</div>
			</form>
		</div>
		
	</div>


</body>
</html>