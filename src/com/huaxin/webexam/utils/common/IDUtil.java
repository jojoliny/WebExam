package com.huaxin.webexam.utils.common;

import java.security.MessageDigest;
import java.util.UUID;

import sun.misc.BASE64Encoder;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年7月28日 下午4:07:38
 * @ClassName IDUtil
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class IDUtil {

	public static String genUUID() {
		UUID randomUUID = UUID.randomUUID();
		return randomUUID.toString();

	}

	public static String genMd5(String password) {
		try {
			MessageDigest instance = MessageDigest.getInstance("MD5");
			byte[] digest = instance.digest(password.getBytes("utf-8"));
			BASE64Encoder base64Encoder = new BASE64Encoder();
			String encode = base64Encoder.encode(digest);
			return encode;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
}
