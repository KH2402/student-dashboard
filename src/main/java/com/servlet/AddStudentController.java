package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnect;

@WebServlet("/addstudent")
public class AddStudentController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String name = req.getParameter("name");
		String rollno = req.getParameter("rollno");
		String prn = req.getParameter("prn");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String attendance = req.getParameter("attendance");
		
		try {
			
			Connection con = DBConnect.getConn();
			PreparedStatement ps ;
			ResultSet rs;
			RequestDispatcher rd=null;
			PrintWriter out=resp.getWriter();
			boolean status=false;
		
			
			String query="select rollno from students where rollno=? ";
			
			ps = con.prepareStatement(query);
			ps.setString(1, rollno);
			rs=ps.executeQuery();
	       
	        
	        
	        //roll no validation
	        if(rs.next()) {
	            rd = req.getRequestDispatcher("addstudent.jsp");
	            rd.include(req, resp);
	            out.println("<script> swal('Sorry','Enter Correct Roll No','error');</script>");
	        }
	        else {

				// add student details to db
		        String query1="insert into students(name,rollno,prn,phone,email,attendance) values(?,?,?,?,?,?)";
		        ps = con.prepareStatement(query1);
				ps.setString(1, name);
				ps.setString(2, rollno);
				ps.setString(3, prn);
				ps.setString(4, phone);
				ps.setString(5, email);
				ps.setString(6, attendance);
	
	
				ps.executeUpdate();
		       
				rd = req.getRequestDispatcher("addstudent.jsp");
				rd.include(req, resp);
				out.println("<script> swal('Successfully Added','click me','success');</script>");
				
				
				
	        }
	        ps.close();
			con.close();
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	
	
}
