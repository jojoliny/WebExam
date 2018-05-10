package com.huaxin.webexam.utils;

import com.huaxin.webexam.bean.Question;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月13日 下午4:26:45
 * @ClassName QuestionUtil
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class QuestionUtil {
	public static Question getRealQuestion(String realQuestion) {
		if (realQuestion != null) {

			String[] split = realQuestion.split("##");
			String question = split[0];
			String questionA = split[1];
			String questionB = split[2];
			String questionC = split[3];
			String questionD = split[4];
			String questionAS = split[5];
			// 1+2=?##1##2##3##4##3
			Question realQuestions = new Question(question, questionA, questionB, questionC, questionD, questionAS);
			return realQuestions;
		}
		return null;
	}

	public static void main(String[] args) {
		QuestionUtil questionUtil = new QuestionUtil();
		Question realQuestion = questionUtil.getRealQuestion("1+2=?##1##2##3##4##3");
		System.out.println(realQuestion);
	}
}
