
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management System</title>
<link rel="stylesheet" href="component/style.css">
<script src=
"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js">
  </script>

</head>
<body>
     

	<div class="container">
		
		<div class="login form">
			<header>Student Login</header>

			<form action="login_student">
				<input type="email" name="t1" placeholder="Enter your email"
					required="required"> 
				<input type="password" name="t2"
					placeholder="Enter your password" required="required"> 
				<input type="submit" id="login" class="btn1"  value="Login">

			</form>

			<form action="index.jsp">
				<div>
					<input type="submit" class="btn1"  value="Back">
				</div>
			</form>
		</div>
		<!-- 
		
	  	
	  </script>
		
		
			<div class="signup">
				<span class="signup">Don't have an account? 
				<label for="check">Signup</label>
				</span>
			</div>
			
			
		</div>

 

		<div class="registration form">
			<header>Signup</header>
			<form action="signup_page" >
				<input type="email" name="s1" placeholder="Enter your email"required="required"> 
				<input type="password" name="s2" placeholder="Create a password"required="required">
				<input type="password" name="s3" placeholder="Confirm your password"required="required"> 
				<input type="submit" class="btn1" value="Signup">
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
		 -->
        
        <!-- javascript -->
 
	</div>


</body>
</html>