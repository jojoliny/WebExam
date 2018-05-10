package com.huaxin.webexam.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test
 */
public class TestServlet extends CommonServlet {
	private static final long serialVersionUID = 1L;

	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}

	public String index(HttpServletRequest request, HttpServletResponse response) {
		return "back/frame/index";
	}
}
