<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>SIGN-UP PAGE</h1>
		<div class="registration form">
			<header>Signup</header>
			<form action="signup_page" method="post">
				<input type="email" name="s1" placeholder="Enter your email"> 
				<input type="password" name="s2" placeholder="Create a password">
				<input type="password" name="s3" placeholder="Confirm your password"> 
				<input type="submit" class="button" value="Signup">
			</form>
			
			<form>
				<div class="signup">
					<span class="signup">Already have an account? <label
						for="check">Login</label>
					</span>
				</div>
			</form>
			<form action="index.jsp">
				<div>
					<input type="submit" value="Back">
				</div>
			</form>
		</div>
</body>
</html>