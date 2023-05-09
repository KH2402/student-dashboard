<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.StudentDetails"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
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
	color: white;
}

nav ul li a:hover {
	color: #262626;
	background: #f7f7f7;
	text-decoration: none;
}

main {
	margin: 20px;
}


p {
	margin-top: 10px;
}



@media screen and (max-width: 767px) {
	nav ul {
		flex-direction: column;
		align-items: center;
	}
}
</style>

</head>
<body>
		<%!
		StudentDetails student;
		Connection con;
		PreparedStatement ps1;
		ResultSet rs1;
		HttpSession sess;
		String email;
		String qu;
		%>


		<%
		try{
			
			sess=request.getSession(true);
			email=sess.getAttribute("emailData").toString();
			
			con=DBConnect.getConn();
			qu="select * from students where email=?";
			
			ps1 = con.prepareStatement(qu);
			ps1.setString(1, email);
			rs1=ps1.executeQuery();
			student=new StudentDetails();
			if(rs1.next()){
				student.setName( rs1.getString("name")) ;
				student.setRollno(rs1.getString("rollno"));
				student.setPrn(rs1.getString("prn"));
				student.setPhone(rs1.getString("phone"));
				student.setEmail(rs1.getString("email"));
				student.setAttendance(rs1.getString("attendance"));
			}
		}catch(SQLException ex){
			out.println(ex);
		}

		%>	
	<header>
	
		
		<h1>WELCOME  <%=student.getName()%> </h1>
		<nav>
			<ul>
				<li><a href="index.jsp">Logout</a></li>

			</ul>
		</nav>
	</header>
	<main>
		<p>Your RollNo : <%=student.getRollno() %></p><br>
		<p>Your RollNo : <%=student.getPrn() %></p><br>
		<p>Your RollNo : <%=student.getPhone() %></p><br>
		<p>Your RollNo : <%=student.getEmail() %></p><br>
		<p>Your RollNo : <%=student.getAttendance() %></p><br>
	</main>
	

</body>
</html>