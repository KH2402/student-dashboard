package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.entity.StudentDetails;
import com.mysql.cj.Session;

@WebServlet("/studentservlet")
public class StudentServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ArrayList<StudentDetails> std=new ArrayList<StudentDetails>();
		try {
			Connection con=DBConnect.getConn();
			PreparedStatement ps;
			ResultSet rs;
			
			String query="select * from students;";
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				StudentDetails student=new StudentDetails();
				student.setName( rs.getString("name")) ;
				student.setRollno(rs.getString("rollno"));
				student.setPrn(rs.getString("prn"));
				student.setPhone(rs.getString("phone"));
				student.setEmail(rs.getString("email"));
				student.setAttendance(rs.getString("attendance"));
				std.add(student);
				
				
			
			}
			
			// Setting the attribute of the request object
	       // which will be later fetched by a JSP page
			HttpSession session=req.getSession(true);
			session.setAttribute("data", std);

	       // Creating a RequestDispatcher object to dispatch
	       // the request the request to another resource
			RequestDispatcher rd=req.getRequestDispatcher("welcomeAdmin.jsp");
			// The request will be forwarded to the resource 
	       // specified, here the resource is a JSP named,
	       // "stdlist.jsp"
			rd.forward(req, resp);
			
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		
	}

}
