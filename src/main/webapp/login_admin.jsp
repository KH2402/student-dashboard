
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
      <header>Admin Login</header>
      
      <form action="login_admin">
        <input type="email" id="email" name="s1" placeholder="Enter your email" >
        <input type="password"  id="pass" name="s2"  placeholder="Enter your password" required="required">
        <input type="submit" id="login" class="btn1" value="Login">
      </form>
      
      <form action="index.jsp">
      	<div >
         	<input type="submit" class="btn1" value="Back">
      	</div>
      </form>
    </div>
  </div>
  

</body>
</html>