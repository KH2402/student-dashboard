
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
      <header>Admin Login</header>
      
      <form action="login_page">
        <input type="email" id="email" placeholder="Enter your email" >
        <input type="password"  id="pass" placeholder="Enter your password" required="required">
        <input type="submit" class="btn1" value="Login">
      </form>
      
      <form action="index.jsp">
      	<div >
         	<input type="submit"  value="Back">
      	</div>
      </form>
    </div>
  </div>
  
  
  <!-- javascript -->
  <script type="text/javascript"> 
  var status= <%request.getAttribute("status"); %>
	
	if(status="invalid"){
		swal("Sorry","Wrong Username or Password","error")
	}
	
  </script>

</body>
</html>