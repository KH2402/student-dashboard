package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static Connection con;
	private static String driver="com.mysql.cj.jdbc.Driver";;
	private static String url="jdbc:mysql://localhost:3306/student_management";
	private static String uname="root";
	private static String pass="root";
	
	
	
	public static Connection getConn() {

		try {
			
			Class.forName(driver);
		}
		catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		try {
			con=DriverManager.getConnection(url,uname,pass);
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return con;
	}

}
