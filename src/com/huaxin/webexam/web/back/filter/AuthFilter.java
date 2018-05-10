package com.huaxin.webexam.web.back.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.huaxin.webexam.conf.GlobalForFilter;

/**
 *
 * @版权: Copyright (c) 2016-2017 ****公司技术开发部
 * @author :Steven Liu
 * @E-mail:1661105301@qq.com
 * @版本: 1.0
 * @创建日期: 2017年9月29日 下午7:50:54
 * @ClassName AuthFilter
 * @类描述-Description: TODO 权限拦截的
 * @修改记录:
 * @版本: 1.0
 */
public class AuthFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		String parameter = request.getParameter("method");
		System.out.println("parameter=" + parameter);

		// String requestURI = req.getRequestURI();///
		// WebDemo/back/SysUserServlet
		// System.out.println(requestURI);
		// StringBuffer requestURL =
		// req.getRequestURL();//http://localhost/WebDemo/back/SysUserServlet
		// System.out.println(requestURL.toString());

		/** 第一步： 判断有没有登入,,,session域里面是否有 user对象 **/
		String in = (String) req.getSession().getAttribute(GlobalForFilter.filterQuestion);

		System.out.println("in=" + in);
		System.out.println();
		/** 第二步： 如果有 ,就放行 **/
		// && parameter.contains("examinationUI")

		if (in != null && in.equals(GlobalForFilter.filterQuestion_in)) {
			chain.doFilter(request, response);
		} else {
			// 拦截!!!!
			/** 第三步： 如果没有,拦截,指导用户登入 **/
			System.out.println("AuthFilter拦截了");
			request.getRequestDispatcher("/StudentServlet?method=indexUI").forward(request, response);
		}

		// if (in != null) {
		// chain.doFilter(request, response);
		// } else if (parameter.contains("login")) { // loing
		// // 登出操作被拦截
		// chain.doFilter(request, response);
		// } else {
		// // 拦截!!!!
		// /** 第三步： 如果没有,拦截,指导用户登入 **/
		// System.out.println("AuthFilter拦截了");
		// request.getRequestDispatcher(
		// "/back/SysUserServlet?method=toLoginUI")
		// .forward(request, response);
		// }

	}

	@Override
	public void destroy() {
	}

}
