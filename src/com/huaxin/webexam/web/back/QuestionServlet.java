package com.huaxin.webexam.web.back;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.huaxin.webexam.bean.CollectQuestionBean;
import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.JudgeAnswers;
import com.huaxin.webexam.bean.PageBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.bean.TestPaper;
import com.huaxin.webexam.service.CollectQuestionService;
import com.huaxin.webexam.service.ErrorService;
import com.huaxin.webexam.service.QuestionService;
import com.huaxin.webexam.service.Stu_TestPaperService;
import com.huaxin.webexam.service.TestPaperService;
import com.huaxin.webexam.service.impl.CollectQuestionServiceImpl;
import com.huaxin.webexam.service.impl.ErrorServiceImpl;
import com.huaxin.webexam.service.impl.QuestionServiceImpl;
import com.huaxin.webexam.service.impl.Stu_TestPaperServiceImpl;
import com.huaxin.webexam.service.impl.TestPaperServiceImpl;
import com.huaxin.webexam.utils.AnswerUtil;
import com.huaxin.webexam.utils.QuestionUtil;
import com.huaxin.webexam.web.common.CommonServlet;

/**
 * Servlet implementation class QuestionServlet
 */
public class QuestionServlet extends CommonServlet {
	/**
	 * 
	 */

	// flag[i]==-1 做错了 flag[i]==0:没做 flag[i]==1 做对了
	// 6种情况
	// 答对了 -1 +5 不收藏错题
	// 答对了 0
	// 答对了 1 +0 ？ 不收藏错题
	// 答错了 -1 +0 收藏
	// 答错了 0
	// int[] flag = new int[20];

	// 用一类保存答案 和 题号
	private static final long serialVersionUID = 1L;
	private List<Question> question;// 题目表值
	private List<JudgeAnswers> answers = new ArrayList<JudgeAnswers>();;

	public String toSelectPaper(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("参加考试");
		try {
			String subject = request.getParameter("subject");
			//
			StudentAndTestPaper studentAndTestPaper = new StudentAndTestPaper();
			studentAndTestPaper.setMajor(subject);
			QuestionService questionService = new QuestionServiceImpl();
			question = questionService.toSelectPaper(studentAndTestPaper);
			System.out.println(question);
			// 动态获取
			for (int i = 0; i < question.size(); i++) {
				Question realQuestion = QuestionUtil.getRealQuestion(question.get(i).getQuestion());
				question.get(i).setQuestions(realQuestion.getQuestions());
				question.get(i).setQuestionA(realQuestion.getQuestionA());
				question.get(i).setQuestionB(realQuestion.getQuestionB());
				question.get(i).setQuestionC(realQuestion.getQuestionC());
				question.get(i).setQuestionD(realQuestion.getQuestionD());
				// JudgeAnswers judgeAnswers = new JudgeAnswers();
				// judgeAnswers.setPid(111111111);
				// judgeAnswers.setAnswer("xxxx");
				// List<JudgeAnswers> list = new ArrayList<JudgeAnswers>();
				// list.add(judgeAnswers);
				// answers = list;
			}

			// HttpSession session = request.getSession();
			// session.setAttribute(GlobalForFilter.filterQuestion, "in");

			Object json = JSON.toJSON(question);
			System.out.println("json" + json);
			request.setAttribute("questions", json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "back/student/testPaper/index";
	}

	int grade = 0;
	List<Question> yourQuestionList;// 返回的题目答案
	List<ErrorBean> yourErrorQuestion = new ArrayList<>();// 错题
	private List<Question> questionByCollect;
	// 还有一种情况 没做完就提交了的
	// 暂时没写如果重新写题，怎么办

	// 默认用户为1 ，已改
	public String toCalculateGrades(HttpServletRequest request, HttpServletResponse response) {
		String answer = request.getParameter("YourAnswer");
		// 第几道题目 并不是表里面的ID号
		String id = request.getParameter("id");
		int realId = Integer.parseInt(id);
		// realId=0
		System.out.println("realId=" + realId);
		System.out.println("question");
		if (question != null)
			System.out.println("question=" + question);
		System.out.println("answer=" + answer);
		//
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");

		for (int i = 0; i < answers.size(); i++) {
			JudgeAnswers xanswer = answers.get(i);
			if (realId == xanswer.getPid()) {
				// 除去上次做的
				answers.remove(xanswer);
			}
		}
		// 上一次已经做过的被移除 这一次做的加进去
		JudgeAnswers judgeAnswers = new JudgeAnswers();
		judgeAnswers.setPid(realId);
		judgeAnswers.setAnswer(answer);
		answers.add(judgeAnswers);

		System.out.println("answers=" + answers);

		return null;
	}

	// 默认用户为1 ，已改 subm
	public String toCalculateGrade(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("grade=" + grade);

		//
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");
		//
		String[] answer = request.getParameterValues("item");// ABCD

		System.out.println("item =" + answer);
		if (answer != null && answer.length > 0) {
			System.out.println("answer[0]" + answer[0]); // A
			String id = request.getParameter("realIdEnd");
			int realId = Integer.parseInt(id) - 1;
			System.out.println("ID=" + realId);

			JudgeAnswers judgeAnswers = new JudgeAnswers();
			judgeAnswers.setPid(realId);
			judgeAnswers.setAnswer(answer[0]);
			answers.add(judgeAnswers);

			for (int i = 0; i < answers.size(); i++) {
				JudgeAnswers xanswer = answers.get(i);
				if (AnswerUtil.judge(xanswer.getAnswer(), question.get(xanswer.getPid()).getAnswer())) {
					grade = grade + 5;
				} else {
					ErrorBean errorBean = new ErrorBean();
					errorBean.setSno(currentUser.getSno());
					errorBean.setWrongAnswer(Integer.parseInt(AnswerUtil.replaceAnswer(answer[0])));
					errorBean.setRightAnswer(Integer.parseInt(question.get(realId).getAnswer()));
					errorBean.setQid(question.get(realId).getQid());
					errorBean.setMajor(question.get(realId).getMajor());
					yourErrorQuestion.add(errorBean);
				}
			}
		}
		request.setAttribute("grade", grade);
		//
		// 添加试卷表
		toAddTestpaper(request, response);
		// 添加错题
		toAddError();
		// 分数置0
		grade = 0;

		// session.invalidate();

		return "back/student/testPaper/examResult2";
	}

	public void toAddTestpaper(HttpServletRequest request, HttpServletResponse response) {
		TestPaperService testPaperService = new TestPaperServiceImpl();
		String pid = testPaperService.toAddTestPaper(question);
		// 添加分数到学生试卷表中
		toAddStu_testpaper(request, response, pid);
	}

	// 默认用户为1 ，已改
	// 学生试卷表------------------------------------
	public String toAddStu_testpaper(HttpServletRequest request, HttpServletResponse response, String pid) {
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");
		// 默认用的1用户,已改
		StudentAndTestPaper studentAndTestPaper = new StudentAndTestPaper();
		studentAndTestPaper.setGrade(grade);
		studentAndTestPaper.setSno(currentUser.getSno());
		studentAndTestPaper.setStatus(1);// 1已考，2未考
		studentAndTestPaper.setMajor(question.get(0).getMajor());
		studentAndTestPaper.setPid(pid);
		Stu_TestPaperService stu_TestPaperService = new Stu_TestPaperServiceImpl();
		stu_TestPaperService.toAddStu_testpaper(studentAndTestPaper);
		return null;
	}

	// 收藏题目 默认学生1，已改-------------------------------------
	public String toCollect(HttpServletRequest request, HttpServletResponse response) {
		// 得到题目号，转换成题目真正ID
		String id = request.getParameter("id");
		int collectId = Integer.parseInt(id);
		Integer realId = question.get(collectId).getQid();
		//
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");
		//
		CollectQuestionBean collectQuestionBean = new CollectQuestionBean();
		collectQuestionBean.setQid(realId);
		collectQuestionBean.setSno(currentUser.getSno());
		CollectQuestionService collectQuestionService = new CollectQuestionServiceImpl();
		collectQuestionService.toCollect(collectQuestionBean);
		return null;
	}

	// 默认用户为1 ，已改
	public String toCancelCollect(HttpServletRequest request, HttpServletResponse response) {
		// 得到题目号，转换成题目真正ID
		String id = request.getParameter("id");
		System.out.println("id" + id);
		int collectId = Integer.parseInt(id);
		Integer realId = question.get(collectId).getQid();
		//
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");
		//
		CollectQuestionBean collectQuestionBean = new CollectQuestionBean();
		collectQuestionBean.setQid(realId);
		collectQuestionBean.setSno(currentUser.getSno());
		CollectQuestionService collectQuestionService = new CollectQuestionServiceImpl();
		collectQuestionService.toCancelCollect(collectQuestionBean);
		return null;
	}

	public String toCancelCollectInCollectUI(HttpServletRequest request, HttpServletResponse response) {
		// 得到题目号，转换成题目真正ID
		String id = request.getParameter("id");
		System.out.println("id" + id);
		int collectId = Integer.parseInt(id);
		Integer realId = questionByCollect.get(collectId).getQid();
		//
		HttpSession session = request.getSession();
		Student currentUser = (Student) session.getAttribute("currentUser");
		//
		CollectQuestionBean collectQuestionBean = new CollectQuestionBean();
		collectQuestionBean.setQid(realId);
		collectQuestionBean.setSno(currentUser.getSno());
		CollectQuestionService collectQuestionService = new CollectQuestionServiceImpl();
		collectQuestionService.toCancelCollect(collectQuestionBean);
		return null;
	}

	// 默认用户为1 ，已改
	public String toSelectCollectQuestion(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("查看收藏的题");
		// 根据当前用户 拿到收藏的题目ID
		CollectQuestionBean collectQuestionBean = new CollectQuestionBean();

		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("currentUser");
		collectQuestionBean.setSno(student.getSno());
		//
		CollectQuestionService collectQuestionService = new CollectQuestionServiceImpl();
		List<CollectQuestionBean> collectQuestionIdList = collectQuestionService
				.toSelectCollectQuestion(collectQuestionBean);
		System.out.println("collectQuestionIdList=" + collectQuestionIdList);

		// 根据ID拿真正的题目
		QuestionService questionService = new QuestionServiceImpl();
		questionByCollect = questionService.toGetQuestionByCollectId(collectQuestionIdList);
		System.out.println("questionByCollect=" + questionByCollect);
		// 分解成真正的题目list集合
		for (int i = 0; i < questionByCollect.size(); i++) {
			Question realQuestion = QuestionUtil.getRealQuestion(questionByCollect.get(i).getQuestion());
			questionByCollect.get(i).setQuestions(realQuestion.getQuestions());
			questionByCollect.get(i).setQuestionA(realQuestion.getQuestionA());
			questionByCollect.get(i).setQuestionB(realQuestion.getQuestionB());
			questionByCollect.get(i).setQuestionC(realQuestion.getQuestionC());
			questionByCollect.get(i).setQuestionD(realQuestion.getQuestionD());
		}
		Object realQuestionAndAnswers = JSON.toJSON(questionByCollect);
		request.setAttribute("realQuestionAndAnswers", realQuestionAndAnswers);

		return "back/student/testPaper/collect";
	}

	// 错题本--------------------------------
	public String toAddError() {
		if (yourErrorQuestion != null & yourErrorQuestion.size() > 0) {
			ErrorService errorService = new ErrorServiceImpl();
			// for (int i = 0; i < yourErrorQuestion.size(); i++) {
			// boolean checkError =
			// errorService.checkError(yourErrorQuestion.get(i));
			// if (checkError)
			// errorService.toAddError(yourErrorQuestion.get(i));
			// }
			errorService.toAddError(yourErrorQuestion);
			yourErrorQuestion.clear();
		}
		return null;
	}

	// 默认用户为1 ，已改
	public String toSelectErrorPaper(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("拿错题");
		//
		HttpSession session = request.getSession();
		Student students = (Student) session.getAttribute("currentUser");
		// 根据人拿错题
		Student student = new Student();
		student.setSno(students.getSno());
		ErrorService errorService = new ErrorServiceImpl();
		List<ErrorBean> errorQuestionIdList = errorService.toSelectErrorPaper(student);
		System.out.println("errorQuestionIdList=" + errorQuestionIdList);
		// 根据 错题ID拿到真正的错题bean
		QuestionService questionService = new QuestionServiceImpl();
		List<Question> errorQuestion = questionService.toGetQuestionByQid(errorQuestionIdList);
		System.out.println("errorQuestion=" + errorQuestion);
		// 分解成真正的题目list集合
		for (int i = 0; i < errorQuestion.size(); i++) {
			Question realQuestion = QuestionUtil.getRealQuestion(errorQuestion.get(i).getQuestion());
			errorQuestion.get(i).setQuestions(realQuestion.getQuestions());
			errorQuestion.get(i).setQuestionA(realQuestion.getQuestionA());
			errorQuestion.get(i).setQuestionB(realQuestion.getQuestionB());
			errorQuestion.get(i).setQuestionC(realQuestion.getQuestionC());
			errorQuestion.get(i).setQuestionD(realQuestion.getQuestionD());
		}
		Object realQuestionAndAnswers = JSON.toJSON(errorQuestion);
		System.out.println("realQuestionAndAnswer" + realQuestionAndAnswers);
		request.setAttribute("realQuestionAndAnswer", realQuestionAndAnswers);
		return "back/student/testPaper/error";
	}

	// 默认用户为1 ，已改
	public String toSelectErrorPaper2(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("拿错题");
		//
		HttpSession session = request.getSession();
		Student students = (Student) session.getAttribute("currentUser");
		// 根据人拿错题
		Student student = new Student();
		student.setSno(students.getSno());
		ErrorService errorService = new ErrorServiceImpl();
		List<ErrorBean> errorQuestionIdList = errorService.toSelectErrorPaper(student);
		System.out.println("errorQuestionIdList=" + errorQuestionIdList);
		// 根据 错题ID拿到真正的错题bean
		QuestionService questionService = new QuestionServiceImpl();
		List<Question> errorQuestion = questionService.toGetQuestionByQid(errorQuestionIdList);
		System.out.println("errorQuestion=" + errorQuestion);
		// 分解成真正的题目list集合
		for (int i = 0; i < errorQuestion.size(); i++) {
			Question realQuestion = QuestionUtil.getRealQuestion(errorQuestion.get(i).getQuestion());
			errorQuestion.get(i).setQuestions(realQuestion.getQuestions());
			errorQuestion.get(i).setQuestionA(realQuestion.getQuestionA());
			errorQuestion.get(i).setQuestionB(realQuestion.getQuestionB());
			errorQuestion.get(i).setQuestionC(realQuestion.getQuestionC());
			errorQuestion.get(i).setQuestionD(realQuestion.getQuestionD());
			errorQuestion.get(i).setAnswer(AnswerUtil.replaceAnswerToABCD(realQuestion.getAnswer()));
		}
		Object realQuestionAndAnswers = JSON.toJSON(errorQuestion);
		System.out.println("realQuestionAndAnswer" + realQuestionAndAnswers);
		request.setAttribute("realQuestionAndAnswer", realQuestionAndAnswers);
		request.setAttribute("totalSize", errorQuestion.size());
		return "back/student/testPaper/errorPage";
	}

	// 分页错题
	// 默认用户为1 ，已改
	public String toListErrorUI(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("拿错题");
		// 根据人拿错题
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("currentUser");
		System.out.println("拿错题的人" + student);
		//
		PageBean<Question> pageBean = new PageBean<Question>();
		int currentIndex = new Integer(request.getParameter("pageIndex"));
		pageBean.setPageIndex(currentIndex);
		//
		ErrorService errorService = new ErrorServiceImpl();
		List<ErrorBean> errorQuestionIdList = errorService.selectByPage(pageBean, student);
		// 根据 错题ID拿到真正的错题bean
		QuestionService questionService = new QuestionServiceImpl();
		List<Question> errorQuestion = questionService.toGetQuestionByQid(errorQuestionIdList);
		System.out.println("errorQuestion=" + errorQuestion);
		// 分解成真正的题目list集合
		for (int i = 0; i < errorQuestion.size(); i++) {
			Question realQuestion = QuestionUtil.getRealQuestion(errorQuestion.get(i).getQuestion());
			errorQuestion.get(i).setQuestions(realQuestion.getQuestions());
			errorQuestion.get(i).setQuestionA(realQuestion.getQuestionA());
			errorQuestion.get(i).setQuestionB(realQuestion.getQuestionB());
			errorQuestion.get(i).setQuestionC(realQuestion.getQuestionC());
			errorQuestion.get(i).setQuestionD(realQuestion.getQuestionD());
			errorQuestion.get(i).setAnswer(AnswerUtil.replaceAnswerToABCD(realQuestion.getAnswer()));
		}
		pageBean.setPageList(errorQuestion);
		request.setAttribute("pages", pageBean);
		request.setAttribute("totalSize", pageBean.getCountData());
		request.setAttribute("tid", (pageBean.getPageIndex() - 1) * pageBean.getPageSize());
		return "back/student/testPaper/errorPage2";
	}

	public String toErrorUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/student/testPaper/error";
	}

	public String toErrorPageUI(HttpServletRequest request, HttpServletResponse response) {
		return "back/student/testPaper/errorPage";
	}

	// 查看试卷
	public String toTestpPaperUI(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("拿试卷");
		// 根据试卷号拿试卷
		String pid = request.getParameter("pid");
		HttpSession session = request.getSession();
		session.setAttribute("currentPid", pid);
		return toListTestpPaperUI(request, response);
	}

	public String toListTestpPaperUI(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String pid = (String) session.getAttribute("currentPid");
		//
		PageBean<Question> pageBean = new PageBean<Question>();
		int currentIndex = new Integer(request.getParameter("pageIndex"));
		pageBean.setPageIndex(currentIndex);
		// 拿到试卷题目的ID
		TestPaper testPaper = new TestPaper();
		testPaper.setPid(pid);
		TestPaperService testPaperService = new TestPaperServiceImpl();
		List<TestPaper> testPaperList = testPaperService.selectByPage(pageBean, testPaper);
		// 根据 试卷题目的ID拿到真正的错题bean
		QuestionService questionService = new QuestionServiceImpl();
		List<Question> testPaperQuestion = questionService.toGetQuestionByTestPaperQid(testPaperList);
		System.out.println("testPaperQuestion=" + testPaperQuestion);
		// 分解成真正的题目list集合
		for (int i = 0; i < testPaperQuestion.size(); i++) {
			Question realQuestion = QuestionUtil.getRealQuestion(testPaperQuestion.get(i).getQuestion());
			testPaperQuestion.get(i).setQuestions(realQuestion.getQuestions());
			testPaperQuestion.get(i).setQuestionA(realQuestion.getQuestionA());
			testPaperQuestion.get(i).setQuestionB(realQuestion.getQuestionB());
			testPaperQuestion.get(i).setQuestionC(realQuestion.getQuestionC());
			testPaperQuestion.get(i).setQuestionD(realQuestion.getQuestionD());
			testPaperQuestion.get(i).setAnswer(AnswerUtil.replaceAnswerToABCD(realQuestion.getAnswer()));
		}
		pageBean.setPageList(testPaperQuestion);
		request.setAttribute("pages", pageBean);
		request.setAttribute("totalSize", pageBean.getCountData());
		request.setAttribute("tid", (pageBean.getPageIndex() - 1) * pageBean.getPageSize());
		return "back/student/testPaper/testPaperPage";
	}

}
