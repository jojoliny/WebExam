package com.huaxin.webexam.web.back;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Teacher;
import com.huaxin.webexam.service.TeacherService;
import com.huaxin.webexam.service.impl.TeacherServiceImpl;
import com.huaxin.webexam.web.common.CommonServlet;

/**
 * Servlet implementation class TeacherServlet
 */
public class TeacherServlet extends CommonServlet {

	// 登陆成功后跳转的界面
	public String indexUI(HttpServletRequest request, HttpServletResponse response) {
		// 主界面
		return "back/teacher/index";
	}

	// 登陆界提交表单进入toLogin
	public String toLogin(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("tLogNo");
		String pass = request.getParameter("tLogPwd");
		Teacher teacher = new Teacher(name, pass);
		// 看是否有当前用户
		HttpSession session = request.getSession();
		Teacher currentUser = (Teacher) session.getAttribute("currentUser");
		if (currentUser != null) {
			// 已经登陆
			request.setAttribute("loginMsg", "已经登陆");
			return "back/student/login";
		} else {
			// 没登陆
			TeacherService impl = new TeacherServiceImpl();
			List<Teacher> login = impl.login(teacher);
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
				System.out.println("currentUser=" + currentUser);
				session.setAttribute("currentUser", currentUser);
				request.setAttribute("loginStatus", "已经登陆");
				System.out.println("当前用户" + currentUser + "登陆成功");
				return "back/teacher/index";
			} else {
				request.setAttribute("loginMsg", "账号密码错误");
				return "back/student/login";
			}
		}
	}

	//
	public String personalUI(HttpServletRequest request, HttpServletResponse response) {
		// 个人信息
		return "back/teacher/personal";
	}

	public String addQuestionUI(HttpServletRequest request, HttpServletResponse response) {
		// 添加题目
		return "back/teacher/addTestPaper";
	}

	public String loginUI(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("selectTeacher");
		return "back/student/login";
	}

	public String logoutUI(HttpServletRequest request, HttpServletResponse response) {
		/** 第一步： session 销毁 **/
		request.getSession().invalidate();
		/** 第二步： 跳转到登入 **/
		HttpSession session = request.getSession();
		Teacher attribute = (Teacher) session.getAttribute("currentUser");
		System.out.println("注销 当前用户currentUser=" + attribute);
		return loginUI(request, response);
	}

	public String toRegist(HttpServletRequest request, HttpServletResponse response) {
		// 真正注册sql，跳转到登录
		System.out.println("toRegist");
		// sno sname spwd sConfirmPwd sex email 这些都不可能为空
		String tno = request.getParameter("tno");
		String password = request.getParameter("tpwd");
		String tConfirmPwd = request.getParameter("tConfirmPwd");

		int tsex = 0;
		String[] checkboxSex = new String[0];
		checkboxSex = request.getParameterValues("tsex");
		if (checkboxSex != null && checkboxSex.length >= 1) {
			if (checkboxSex[0] == "1") {
				tsex = 1;
			} else {
				tsex = 0;
			}
		}

		// String sex = request.getParameter("tsex");
		// int tsex = Integer.parseInt(sex);

		String tname = request.getParameter("tname");
		System.out.println("tname=" + tname);
		String temail = request.getParameter("temail");
		Teacher teacher = new Teacher(tno, tname, tsex, password, temail);
		System.out.println("teacher=" + teacher);
		TeacherServiceImpl teacherServiceImpl = new TeacherServiceImpl();
		int regist = teacherServiceImpl.regist(teacher);
		System.out.println("注册成功 " + regist);
		return loginUI(request, response);
	}

	// 上传试卷------------------------------
	public String toAddTestPaperUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/teacher/addTestPaper";
	}

	public String toAddTestPaper(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, String[]> parameterMap = request.getParameterMap();
			Question question = new Question();
			HttpSession session = request.getSession();
			Teacher attribute = (Teacher) session.getAttribute("currentUser");
			question.setTno(attribute.getTno());

			ConvertUtils.register(new DateLocaleConverter(), Date.class);
			BeanUtils.populate(question, parameterMap);
			// 老师添加题目，当前是哪位老师？还没写，目前默认no.001
			TeacherService teacherService = new TeacherServiceImpl();
			System.out.println("question=" + question);
			List<Question> addTestPaper = teacherService.addTestPaper(question);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 这个地方有点问题 返回回主页老师的主页
		return "back/teacher/addTestPaper";
	}

	// 个人信息修改界面提交表单 updatePersonal
	public String updatePersonal(HttpServletRequest request, HttpServletResponse response) {
		String tno = request.getParameter("tPerNo");
		System.out.println("tno=" + tno);
		String tname = request.getParameter("tPerName");
		String password = request.getParameter("tPerPwd");
		String tPerConfirmPwd = request.getParameter("tPerConfirmPwd");
		String sexs = request.getParameter("tPerSex");
		int tsex = Integer.parseInt(sexs);
		String email = request.getParameter("tPerEmail");
		Teacher teacher = new Teacher(tno, tname, tsex, password, email);
		System.out.println("teacher=" + teacher);

		TeacherService teacherServiceImpl = new TeacherServiceImpl();
		int update = teacherServiceImpl.update(teacher);
		System.out.println(update);
		request.setAttribute("update", "修改成功");
		Teacher currentUser = teacher;
		HttpSession session = request.getSession();
		session.setAttribute("currentUser", currentUser);
		System.out.println("老师 update success");
		return "back/teacher/personal";
	}

	public String checkUsername_Json(HttpServletRequest request, HttpServletResponse response) {
		try {
			String tno = request.getParameter("tno");
			Teacher teacher = new Teacher();
			teacher.setTno(tno);
			/** 第二步： 查询数据库 **/
			// select * from tb_emploee where username=?

			TeacherService teacherServiceImpl = new TeacherServiceImpl();
			boolean checkUsername = teacherServiceImpl.checkUsername(teacher);

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
