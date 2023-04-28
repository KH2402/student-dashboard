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


@WebServlet("/login_page")
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		PrintWriter out=resp.getWriter();
		String email = req.getParameter("t1");
		String pass = req.getParameter("t2");
		HttpSession session=req.getSession();
		RequestDispatcher dispatcher=null;
		
		if(email==null || pass.equals("") ) {
			req.setAttribute("status", "invalidEmail");
			dispatcher=req.getRequestDispatcher("login_admin.jsp");
			dispatcher.forward(req, resp);
		}
		if(pass==null || email.equals("") ) {
			req.setAttribute("status", "invalidPass");
			dispatcher=req.getRequestDispatcher("login_admin.jsp");
			dispatcher.forward(req, resp);
		}

		try {
			
		
			Connection con = DBConnect.getConn();
			PreparedStatement ps ;
			ResultSet rs;
		
			String query="select * from login where email=? and password=?";
			
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			
			rs=ps.executeQuery();
	        boolean status=rs.next();

			// check email or pass present in db or not
			if(status) {
				resp.sendRedirect("welcome.jsp");
			}else {
				out.println("Invalid Credentials !!");
			}
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
