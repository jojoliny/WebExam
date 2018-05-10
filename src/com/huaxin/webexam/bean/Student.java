package com.huaxin.webexam.bean;

public class Student {
	String sno;
	String sname;
	int sex;
	String password;
	String email;

	@Override
	public String toString() {
		return "Student [sno=" + sno + ", sname=" + sname + ", sex=" + sex + ", password=" + password + ", email="
				+ email + "]";
	}

	public Student() {
	}

	public Student(String sno, String password) {
		this.sno = sno;
		this.password = password;
	}

	public Student(String sno, String password, String email) {
		this.sno = sno;
		this.password = password;
		this.email = email;
	}

	public Student(String sno, String sname, int sex, String password, String email) {
		this.sno = sno;
		this.sname = sname;
		this.sex = sex;
		this.password = password;
		this.email = email;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
