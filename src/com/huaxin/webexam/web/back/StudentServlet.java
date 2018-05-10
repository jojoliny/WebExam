package com.huaxin.webexam.web.back;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.service.StuUserService;
import com.huaxin.webexam.service.impl.StuUserServiceImpl;
import com.huaxin.webexam.web.common.CommonServlet;

public class StudentServlet extends CommonServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String frameIndex(HttpServletRequest request, HttpServletResponse response) {
		return "back/frame/index";
	}

	public String toTopUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/frame/top";
	}

	public String toLeftUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/frame/left";
	}

	public String toBottomUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/frame/bottom";
	}

	public String selectPaper(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("selectPaper");
		return "back/student/selectpaper";
	}

	public String selectTeacher(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("selectTeacher");
		return "back/student/selectTeacher";
	}

	public String loginUI(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("跳转到登陆界面stlogin");
		// 进入学生登陆界面
		return "back/student/login";
	}

	public String xtoLogin(HttpServletRequest request, HttpServletResponse response) {
		// 真正登录sql 跳转到主界面
		Student currentUser = (Student) request.getAttribute("currentUser");
		// 到时候删除
		// System.out.println("currentUser=" + currentUser);
		if (currentUser == null) {
			// 学号
			String name = request.getParameter("sLogNo");
			// 密码
			String pass = request.getParameter("sLogPwd");

			Student student = new Student(name, pass);

			StuUserService stuUserService = new StuUserServiceImpl();
			List<Student> login = stuUserService.login(student);
			// 在数据库中查找登陆用户的所有信息
			currentUser = login.get(0);
			if (login != null && login.size() > 0) {
				HttpSession session = request.getSession();
				// 验证码
				String validtor = session.getAttribute("validateCode").toString();
				String myValidtor = request.getParameter("validateCode");
				System.out.println("validtor=" + validtor);
				System.out.println("myValidtor=" + myValidtor);
				if (!validtor.equalsIgnoreCase(myValidtor)) {
					// 验证没通过
					request.setAttribute("loginMsg", "验证码有误");
					return loginUI(request, response);
				}
				// return "back/student/index";
			} else {
				System.out.println("账号密码错误");
				request.setAttribute("loginMsg", "账号密码错误");
				return loginUI(request, response);
			}
		}
		// 设置当前用户
		System.out.println("currentUser=" + currentUser);
		HttpSession session = request.getSession();
		session.setAttribute("currentUser", currentUser);
		// request.setAttribute("currentUser", currentUser);
		System.out.println("当前用户" + currentUser + "登陆成功");
		return "back/student/index";
	}

	// 登陆界提交表单进入toLogin
	public String toLogin(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("sLogNo");
		String pass = request.getParameter("sLogPwd");
		Student student = new Student(name, pass);
		// 看是否有当前用户
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");
		if (currentUser != null) {
			// 已经登陆
			request.setAttribute("loginMsg", "已经登陆");
			return "back/student/login";
		} else {
			// 没登陆
			StuUserService stuUserService = new StuUserServiceImpl();
			List<Student> login = stuUserService.login(student);
			if (login != null && login.size() > 0) {
				currentUser = login.get(0);
				System.out.println("currentUser=" + currentUser);
				// 验证码
				String validtor = session.getAttribute("validateCode").toString();
				String myValidtor = request.getParameter("validateCode");
				System.out.println(validtor + "" + myValidtor);
				if (!validtor.equalsIgnoreCase(myValidtor)) {
					// 验证没通过
					request.setAttribute("loginMsg", "验证码有误");
					return "back/student/login";
				}
				// 设置当前用户
				session.setAttribute("currentUser", currentUser);
				request.setAttribute("loginStatus", "已经登陆");
				request.setAttribute("loginMsg", "已经登陆");
				return "back/student/index";
			} else {
				request.setAttribute("loginMsg", "账号密码错误");
				return "back/student/login";
			}
		}
	}

	// 进入注册的页面
	public String toRegistUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/student/regist";
	}

	// 提交注册表单
	public String toRegist(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("register");
		// 真正注册sql，跳转到登录
		// sno sname spwd sConfirmPwd sex email 这些都不可能为空
		String sno = request.getParameter("sno");
		String password = request.getParameter("spwd");
		String sConfirmPwd = request.getParameter("sConfirmPwd");

		int sex = 0;
		String[] checkboxSex = new String[0];
		checkboxSex = request.getParameterValues("sex");
		if (checkboxSex != null && checkboxSex.length >= 1) {
			if (checkboxSex[0] == "1") {
				sex = 1;
			} else {
				sex = 0;
			}
		}

		// String ssex = request.getParameter("sex");
		// int sex = Integer.parseInt(ssex);

		String sname = request.getParameter("sname");
		String email = request.getParameter("email");
		Student student = new Student(sno, sname, sex, password, email);
		StuUserService stuUserService = new StuUserServiceImpl();
		stuUserService.regist(student);
		// 注册成功 之后自动登陆界面
		// HttpSession session = request.getSession();
		// session.setAttribute("currentUser", student);
		// request.setAttribute("currentUser", student);
		return loginUI(request, response);
	}

	public String logoutUI(HttpServletRequest request, HttpServletResponse response) {
		/** 第一步： session 销毁 **/
		request.getSession().invalidate();
		/** 第二步： 跳转到登入 **/
		HttpSession session = request.getSession();
		Student attribute = (Student) session.getAttribute("currentUser");
		System.out.println("注销 当前用户currentUser=" + attribute);
		// 转到登陆界面 要求登陆
		return loginUI(request, response);
	}

	public String toJoinExamUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/student/testPaper/index";
	}

	// 新的学生登陆之后进入的界面
	public String indexUI(HttpServletRequest request, HttpServletResponse response) {

		// HttpSession session = request.getSession();
		// session.setAttribute(GlobalForFilter.filterQuestion, "in");

		System.out.println("indexUI");
		return "back/student/index";
	}

	public String examinationUI(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("selectTeacher");
		return "back/student/examination";
	}

	// 调到查询成绩那
	public String queryUI(HttpServletRequest request, HttpServletResponse response) {
		// 在这访问数据库返回成绩
		StuUserService stuUserServiceImpl = new StuUserServiceImpl();
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("currentUser");
		List<StudentAndTestPaper> queryMark = stuUserServiceImpl.queryMark(student);
		System.out.println(queryMark);
		request.setAttribute("queryMark", queryMark);
		return "back/student/query";
	}

	// 个人信息修改界面
	public String personalUI(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("selectTeacher");
		return "back/student/personal";
	}

	// 个人信息修改界面提交表单 updatePersonal
	public String updatePersonal(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sno = request.getParameter("sPerNo");
		String sname = request.getParameter("sPerName");
		String password = request.getParameter("sPerPwd");
		String sPerConfirmPwd = request.getParameter("sPerConfirmPwd");
		String sexs = request.getParameter("sPerSex");
		int sex = Integer.parseInt(sexs);
		String email = request.getParameter("sPerEmail");
		Student student = new Student(sno, sname, sex, password, email);
		System.out.println("student=" + student);
		//
		StuUserService stuService = new StuUserServiceImpl();
		int update = stuService.update(student);
		System.out.println(" update success");
		request.setAttribute("update", "修改成功");
		HttpSession session = request.getSession();
		Student currentUser = student;
		session.setAttribute("currentUser", currentUser);
		return "back/student/personal";
	}
	// -------------------------

	public String checkUsername_Json(HttpServletRequest request, HttpServletResponse response) {
		try {
			String sno = request.getParameter("sno");
			Student student = new Student();
			student.setSno(sno);
			/** 第二步： 查询数据库 **/
			// select * from tb_emploee where username=?

			StuUserService stuService = new StuUserServiceImpl();
			boolean checkUsername = stuService.checkUsername(student);

			/** 第三步： 返回结果 **/
			PrintWriter writer = response.getWriter();
			String x = "";
			if (checkUsername) {
				x = "{\"valid\":true}"; // 可以使用
			} else {
				x = "{\"valid\":false}";// 不可以
			}

			writer.println(x);
			return null;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
