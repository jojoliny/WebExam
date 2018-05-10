package com.huaxin.webexam.bean;

public class JudgeAnswers {
	int pid;
	String answer;

	public JudgeAnswers() {

	}

	public JudgeAnswers(int pid, String answer) {
		super();
		this.pid = pid;
		this.answer = answer;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "JudgeAnswers [pid=" + pid + ", answer=" + answer + "]";
	}

}
