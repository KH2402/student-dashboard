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


@WebServlet("/signup_page")
public class SignupController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		
		try{

			String email = req.getParameter("s1");
			String pass = req.getParameter("s2");
	        String confirmPass=req.getParameter("s3");
	        
			PrintWriter out=resp.getWriter();
			Connection con = DBConnect.getConn();
			PreparedStatement ps ;
			ResultSet rs;
			String query;
			query="select *from login where email=?";
			

			ps = con.prepareStatement("query");
			ps.setString(1, email);
			
			rs=ps.executeQuery();
			out.println("Sucessfully db connection ......");
			/*
			boolean status=rs.next();
	        
	        if(!status) { // email not present
	        	if(pass.equals(confirmPass)) {
		        	//enter value in db
	        		
	        		query="insert into login(email,password) values(?,?)";
	        		ps=con.prepareStatement(query);
	        		ps.setString(1, email);
	        		ps.setString(2, pass);
	        		ps.executeUpdate();
	        	
		        }else {
		        	out.print("alert('password and confirm password not matched !!!');");
		        }
	        }else {
	        	out.print("alert('enter other email address!!!');");
	        }
	        con.close();
	        */
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
	}
	

}
