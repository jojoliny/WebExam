package com.huaxin.webexam.bean;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月18日 下午2:42:44
 * @ClassName ErrorBean
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class ErrorBean {
	public String sno;
	public Integer qid;
	public String major;
	public Integer wrongAnswer;
	public Integer rightAnswer;

	public ErrorBean() {
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Integer getWrongAnswer() {
		return wrongAnswer;
	}

	public void setWrongAnswer(Integer wrongAnswer) {
		this.wrongAnswer = wrongAnswer;
	}

	public Integer getRightAnswer() {
		return rightAnswer;
	}

	public void setRightAnswer(Integer rightAnswer) {
		this.rightAnswer = rightAnswer;
	}

	@Override
	public String toString() {
		return "ErrorBean [sno=" + sno + ", qid=" + qid + ", major=" + major + ", wrongAnswer=" + wrongAnswer
				+ ", rightAnswer=" + rightAnswer + "]";
	}

	public ErrorBean(String sno, Integer qid, String major, Integer wrongAnswer, Integer rightAnswer) {
		this.sno = sno;
		this.qid = qid;
		this.major = major;
		this.wrongAnswer = wrongAnswer;
		this.rightAnswer = rightAnswer;
	}

}
