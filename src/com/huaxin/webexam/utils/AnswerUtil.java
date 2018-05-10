package com.huaxin.webexam.utils;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月16日 下午9:50:35
 * @ClassName AnswerUtil
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class AnswerUtil {
	public static boolean judge(String realAnswer, String getAnswer) {
		String replaceAnswer = replaceAnswer(realAnswer);
		if (replaceAnswer != null) {
			if (replaceAnswer.equals(getAnswer)) {
				return true;
			}
		}
		return false;

	}

	public static String replaceAnswer(String realAnswer) {
		if (realAnswer != null) {
			String replace = realAnswer.replace('A', '1');
			replace = replace.replace('B', '2');
			replace = replace.replace('C', '3');
			replace = replace.replace('D', '4');
			return replace;
		}
		return null;
	}

	public static String replaceAnswerToABCD(String realAnswer) {
		if (realAnswer != null) {
			String replace = realAnswer.replace('1', 'A');
			replace = replace.replace('2', 'B');
			replace = replace.replace('3', 'C');
			replace = replace.replace('4', 'D');
			return replace;
		}
		return null;
	}

	public static void main(String[] args) {
		boolean judge1 = AnswerUtil.judge("A", "1");
		System.out.println(judge1);
		boolean judge2 = AnswerUtil.judge("B", "2");
		System.out.println(judge2);
	}
}
