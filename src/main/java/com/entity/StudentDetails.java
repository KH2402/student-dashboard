package com.entity;

public class StudentDetails {
	
	private String name;
	private String rollno;
	private String prn;
	private String phone;
	private String email;
	private String attendance;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getPrn() {
		return prn;
	}
	public void setPrn(String prn) {
		this.prn = prn;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	@Override
	public String toString() {
		return "StudentDetails [name=" + name + ", rollno=" + rollno + ", prn=" + prn + ", phone=" + phone + ", email="
				+ email + ", attendance=" + attendance + "]";
	}
	
	

}
