package com.huaxin.webexam.bean;

/**
 * 试卷表
 * 
 * @author Administrator
 *
 */
public class TestPaper {
	int id;
	String pid;
	int qid;
	String major;
	int answer;

	public TestPaper(int id, String pid, int qid, String major, int answer) {
		this.id = id;
		this.pid = pid;
		this.qid = qid;
		this.major = major;
		this.answer = answer;
	}

	public TestPaper() {
	}

	@Override
	public String toString() {
		return "TestPaper [id=" + id + ", pid=" + pid + ", qid=" + qid + ", major=" + major + ", answer=" + answer
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}
}
