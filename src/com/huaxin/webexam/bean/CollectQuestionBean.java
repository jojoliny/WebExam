package com.huaxin.webexam.bean;

import java.util.Date;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月20日 下午3:18:57
 * @ClassName CollectQuestionBean
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class CollectQuestionBean {
	public String sno;
	public Integer qid;
	public Date createTime;

	public CollectQuestionBean() {
	}

	public CollectQuestionBean(String sno, Integer qid, Date createTime) {
		this.sno = sno;
		this.qid = qid;
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "CollectQuestionBean [sno=" + sno + ", qid=" + qid + ", createTime=" + createTime + "]";
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
