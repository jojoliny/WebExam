package com.huaxin.webexam.service.impl;

import java.util.List;

import com.huaxin.webexam.bean.CollectQuestionBean;
import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.bean.TestPaper;
import com.huaxin.webexam.dao.QuestionDao;
import com.huaxin.webexam.dao.impl.QuestionDaoImpl;
import com.huaxin.webexam.service.QuestionService;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月7日 下午9:11:00
 * @ClassName StuUserService
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class QuestionServiceImpl implements QuestionService {
	List<Question> question;

	public List<Question> toSelectPaper(StudentAndTestPaper studentAndTestPaper) {
		// 先向题目表 ，根据科目查询，生成试卷,返回题目key
		QuestionDao questionDao = new QuestionDaoImpl();
		List<String> query = questionDao.toSelectPaper(studentAndTestPaper);
		//
		question = questionDao.toGetQuestionByKey(query);
		// new Thread(this).start();
		// 返回题目
		return question;
	}
	//
	// public void run() {
	// System.out.println("线程中");
	//
	// // 添加试卷表，学生试卷表
	// TestPaperDao testPaperDao = new TestPaperDaoImpl();
	// testPaperDao.toAddTestPaper(question);
	// // 暂时还没做
	// Stu_TestPaperDao stu_testPaperDao = new Stu_TestPaperDaoImpl();
	// stu_testPaperDao.toAddStu_TestPaper(question);
	// }

	public List<Question> toGetQuestionByQid(List<ErrorBean> errorList) {
		QuestionDao questionDao = new QuestionDaoImpl();
		return questionDao.toGetQuestionByQid(errorList);

	}

	public List<Question> toGetQuestionByCollectId(List<CollectQuestionBean> collectQuestionIdList) {
		QuestionDao questionDao = new QuestionDaoImpl();
		return questionDao.toGetQuestionByCollectId(collectQuestionIdList);
	}

	@Override
	public List<Question> toGetQuestionByTestPaperQid(List<TestPaper> testPaperList) {
		QuestionDao questionDao = new QuestionDaoImpl();
		return questionDao.toGetQuestionByTestPaperQid(testPaperList);

	}

}
