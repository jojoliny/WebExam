package com.huaxin.webexam.bean;

/**
 * 考试题目
 * 
 * @author Administrator
 * 
 */
public class Question {
	public Integer qid;
	public String question;// 题目的key
	public String tno;// 老师

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String questions;
	public String questionA;
	public String questionB;
	public String questionC;
	public String questionD;
	public String answer;
	public String major;

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getQuestions() {
		return questions;
	}

	public void setQuestions(String questions) {
		this.questions = questions;
	}

	public String getQuestionA() {
		return questionA;
	}

	public void setQuestionA(String questionA) {
		this.questionA = questionA;
	}

	public String getQuestionB() {
		return questionB;
	}

	public void setQuestionB(String questionB) {
		this.questionB = questionB;
	}

	public String getQuestionC() {
		return questionC;
	}

	public void setQuestionC(String questionC) {
		this.questionC = questionC;
	}

	public String getQuestionD() {
		return questionD;
	}

	public void setQuestionD(String questionD) {
		this.questionD = questionD;
	}

	public Question() {
	}

	public Question(String questions, String questionA, String questionB, String questionC, String questionD,
			String answer) {
		this.questions = questions;
		this.questionA = questionA;
		this.questionB = questionB;
		this.questionC = questionC;
		this.questionD = questionD;
		this.answer = answer;
	}

	public Question(Integer qid, String question, String tno, String questions, String questionA, String questionB,
			String questionC, String questionD, String answer, String major) {
		this.qid = qid;
		this.question = question;
		this.tno = tno;
		this.questions = questions;
		this.questionA = questionA;
		this.questionB = questionB;
		this.questionC = questionC;
		this.questionD = questionD;
		this.answer = answer;
		this.major = major;
	}

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	@Override
	public String toString() {
		return "Question [qid=" + qid + ", question=" + question + ", tno=" + tno + ", questions=" + questions
				+ ", questionA=" + questionA + ", questionB=" + questionB + ", questionC=" + questionC + ", questionD="
				+ questionD + ", answer=" + answer + ", major=" + major + "]";
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
