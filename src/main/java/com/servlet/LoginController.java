package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnect;


@WebServlet("/login_page")
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		try {
			PrintWriter out=resp.getWriter();

			String email = req.getParameter("t1");
			String pass = req.getParameter("t2");
		
			Connection con = DBConnect.getConn();
			PreparedStatement ps ;
			ResultSet rs;
		
			String query="select * from login where email=? and password=?";
			
			ps = con.prepareStatement("query");
			ps.setString(1, email);
			ps.setString(2, pass);
			
			rs=ps.executeQuery();
	        boolean status=rs.next();

			// check email or pass present in db or not
			if(status) {
				resp.sendRedirect("welcome.jsp");
			}else {
				resp.sendRedirect("signup.jsp");
			}
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
