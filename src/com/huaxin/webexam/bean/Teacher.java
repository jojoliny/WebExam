package com.huaxin.webexam.bean;

public class Teacher {

	String tno;
	String tname;
	int tsex;
	String password;
	String email;

	public Teacher() {

	}

	public Teacher(String tno, String password) {
		this.tno = tno;
		this.password = password;
	}

	public Teacher(String tno, String tname, int tsex, String password, String email) {
		this.tno = tno;
		this.tname = tname;
		this.tsex = tsex;
		this.password = password;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Teacher [tno=" + tno + ", tname=" + tname + ", tsex=" + tsex + ", password=" + password + ", email="
				+ email + "]";
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getTsex() {
		return tsex;
	}

	public void setTsex(int tsex) {
		this.tsex = tsex;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

}
