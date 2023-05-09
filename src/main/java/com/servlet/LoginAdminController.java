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
import javax.servlet.http.HttpSession;

import com.db.DBConnect;

@WebServlet("/login_admin")
public class LoginAdminController extends HttpServlet {
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	
		PrintWriter out=resp.getWriter();
		String email = req.getParameter("s1");
		String pass = req.getParameter("s2");
		HttpSession session=req.getSession(true);
		
	
		try {
			
			Connection con = DBConnect.getConn();
			PreparedStatement ps ;
			ResultSet rs;
			
		
			String query="select * from login_admins where email=? and password=?";
			
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			
			rs=ps.executeQuery();
	        boolean status=rs.next();

			// check email or pass present in db or not
			if(status) {
				  RequestDispatcher rd = req.getRequestDispatcher("welcomeAdmin.jsp");
				  rd.forward(req, resp);
			}else {
	            RequestDispatcher rd = req.getRequestDispatcher("login_admin.jsp");
	            rd.include(req, resp);
	            resp.getWriter().println("<script> swal('Sorry','Wrong Username or Password','error');</script>");
	        }
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
}
