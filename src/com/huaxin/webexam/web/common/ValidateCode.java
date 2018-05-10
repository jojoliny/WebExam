package com.huaxin.webexam.web.common;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateCode extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/** 画图-验证码 **/
		int width = 100;
		int height = 30;
		//
		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 画笔
		Graphics gg = img.getGraphics();
		// 背景
		gg.setColor(Color.lightGray);
		gg.fillRect(0, 0, width, height);

		// 随机数
		String string = new String("qwertyuiopasdfghjklzxcvbnm1234567890");
		// 生成随机数生成器
		Random random = new Random();
		/** 验证码 设置session **/
		HttpSession session = request.getSession();
		String validateCode = request.getParameter("validateCode");
		System.out.println("validateCode " + validateCode);
		StringBuilder stringBuilder = new StringBuilder();
		// 画随机数
		gg.setColor(Color.black);
		for (int i = 0; i < 4; i++) {
			int index = random.nextInt(string.length());// [0,string.length())
			// 获取其中一个随机数
			char charAt = string.charAt(index);
			// 一个个画随机数
			gg.drawString(charAt + "", width / 4 * i + 5, 20);
			//
			stringBuilder.append(charAt);
		}
		session.setAttribute("validateCode", stringBuilder);
		/** 发送给浏览器 **/
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(img, "png", out);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
