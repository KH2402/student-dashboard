package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnect;

@WebServlet("/updatestudent")
public class UpdateStudentController extends HttpServlet {
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
	       
	        
        
              

			if(rs.next()) {
		        String query1="update students set name=?,prn=?,phone=?,email=?,attendance=? where rollno=?";
		        ps = con.prepareStatement(query1);
		    	ps.setString(6, rollno);
		        ps.setString(1, name);
				ps.setString(2, prn);
				ps.setString(3, phone);
				ps.setString(4, email);
				ps.setString(5, attendance);
	
	
				ps.executeUpdate();
		       
				
				rd = req.getRequestDispatcher("welcomeAdmin.jsp");
				rd.include(req, resp);
				out.println("<script> swal('Successfully Updated','click me','success');</script>");
				
			}else {
				rd = req.getRequestDispatcher("editstudent.jsp");
				rd.include(req, resp);
				out.println("<script> swal('Sorry','Dont change Roll No','error');</script>");
			}
					
					
	       
	        ps.close();
			con.close();
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}


}
