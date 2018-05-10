package com.huaxin.webexam.web.back;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huaxin.webexam.web.common.CommonServlet;

/**
 * Servlet implementation class EmailServlet
 */
public class EmailServlet extends CommonServlet {

	public String getValidate(HttpServletRequest request, HttpServletResponse response) {

		// 收件人的电子邮件 ID
		String to = request.getParameter("validatecode");

		// 发件人的电子邮件 ID
		String from = "2842878082@qq.com";

		// 假设您是从本地主机发送电子邮件
		String host = "localhost";

		// 获取系统的属性
		Properties properties = System.getProperties();

		// 设置邮件服务器
		properties.setProperty("mail.smtp.host", host);

		// 获取默认的 Session 对象
		Session session = Session.getDefaultInstance(properties);

		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");

		try {
			PrintWriter out = response.getWriter();
			// 创建一个默认的 MimeMessage对象
			MimeMessage message = new MimeMessage(session);
			// 设置 From: headerfield of the header.
			message.setFrom(new InternetAddress(from));
			// 设置 To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// 设置 Subject: header field
			message.setSubject("欢迎来到在线考试生产系统!");
			// 随机数
			String string = new String("qwertyuiopasdfghjklzxcvbnm1234567890");
			// 生成随机数生成器
			Random random = new Random();
			// 验证码 设置session
			HttpSession sessions = request.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			// 画随机数
			for (int i = 0; i < 4; i++) {
				int index = random.nextInt(string.length());// [0,string.length()
				// 获取其中一个随机数
				char charAt = string.charAt(index);
				stringBuilder.append(charAt);
			}
			sessions.setAttribute("emailValidate", stringBuilder); // 现在设置实际消息
			message.setText("这是您的验证码：stringBuilder"); // 发送消息
			Transport.send(message);
			String title = "发送电子邮件";
			String res = "成功发送消息...";
			String docType = "<!DOCTYPE html> \n";
			out.println(docType + "<html>\n" + "<head><title>" + title + "</title></head>\n"
					+ "<body bgcolor=\"#f0f0f0\">\n" + "<h1 align=\"center\">" + title + "</h1>\n"
					+ "<p align=\"center\">" + res + "</p>\n" + "</body></html>");
		} catch (Exception mex) {
			mex.printStackTrace();
		}

		return "back/frame/index";
	}

}
