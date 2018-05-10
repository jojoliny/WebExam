package com.huaxin.webexam.utils;

import java.security.MessageDigest;

import sun.misc.BASE64Encoder;

/***
 * 给密码加密
 * 
 * @author Administrator
 *
 */

public class PwdUtil {
	public static String genMd5(String str) {
		String newstr = null;
		try {
			// 确定计算法
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base64en = new BASE64Encoder();
			newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newstr;
	}
}
