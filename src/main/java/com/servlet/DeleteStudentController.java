package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnect;

@WebServlet("/deletestudent")
public class DeleteStudentController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String rollno = req.getParameter("rollno");

		try {

			Connection con = DBConnect.getConn();
			PreparedStatement ps;

			RequestDispatcher rd = null;
			PrintWriter out = resp.getWriter();

			String query = "delete from students where rollno=? ";

			ps = con.prepareStatement(query);
			ps.setString(1, rollno);
			int status = ps.executeUpdate();
           
			// roll no validation
			if (status == 1) {// deleted successfully
				rd = req.getRequestDispatcher("deletestudent.jsp");
				rd.include(req, resp);
				out.println("<script> swal('Successfully Deleted','click me','success');</script>");
				
			} else {
				rd = req.getRequestDispatcher("deletestudent.jsp");
				rd.include(req, resp);
				out.println("<script>  swal('Sorry','Enter Correct Roll No','error');</script>");
				

			}
			ps.close();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
