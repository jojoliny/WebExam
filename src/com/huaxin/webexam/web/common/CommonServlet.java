package com.huaxin.webexam.web.common;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			/** 0.当前字节码文件 **/
			Class<? extends CommonServlet> clazz = this.getClass();
			/** 1.获取method参数 **/
			String method = request.getParameter("method");
			/** 2.获取method 反射出当前访问的方法 **/
			Method method2 = clazz.getMethod(method, HttpServletRequest.class, HttpServletResponse.class);
			/** 3.调用方法 **/
			// this调用 ，参数有request，response
			Object path = method2.invoke(this, request, response);
			System.out.println("path " + path);
			/** 4.跳转页面 **/
			if (path != null) {
				request.getRequestDispatcher("/WEB-INF/jsp/" + path.toString() + ".jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}