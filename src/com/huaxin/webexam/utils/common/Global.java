package com.huaxin.webexam.utils.common;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月11日 下午6:44:37
 * @ClassName Global
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class Global {

	public static int question_totalNum = 20;
	//
	public static String question_address_computer = "computer_";
	public static String question_address_math = "math_";

	public static String getQuestion_address_computer() {
		return question_address_computer + IDUtil.genUUID();
	}

	public static void setQuestion_address_computer(String question_address_computer) {
		Global.question_address_computer = question_address_computer;
	}

	public static String getQuestion_address_math() {
		return question_address_math + IDUtil.genUUID();
	}

	public static void setQuestion_address_math(String question_address_math) {
		Global.question_address_math = question_address_math;
	}

}
