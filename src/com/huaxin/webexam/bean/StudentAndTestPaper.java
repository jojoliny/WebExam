package com.huaxin.webexam.bean;

/**
 * 学生&试卷表
 * 
 * @author Administrator
 *
 */
public class StudentAndTestPaper {

	public StudentAndTestPaper(String major, String sno, Integer status, Integer grade, String pid) {
		this.major = major;
		this.sno = sno;
		this.status = status;
		this.grade = grade;
		this.pid = pid;
	}

	public StudentAndTestPaper() {
	}

	public String toString() {
		return "StudentAndTestPaper [major=" + major + ", sno=" + sno + ", status=" + status + ", grade=" + grade
				+ ", pid=" + pid + "]";
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	String major;
	String sno;
	Integer status;
	Integer grade;
	String pid;
}
