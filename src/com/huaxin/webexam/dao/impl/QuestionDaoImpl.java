package com.huaxin.webexam.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.huaxin.webexam.bean.CollectQuestionBean;
import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.bean.TestPaper;
import com.huaxin.webexam.dao.QuestionDao;
import com.huaxin.webexam.utils.JdbcUtil;
import com.huaxin.webexam.utils.common.Global;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月7日 下午10:03:05
 * @ClassName StuUserDaoImpl
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public class QuestionDaoImpl implements QuestionDao {

	public List<String> toSelectPaper(StudentAndTestPaper studentAndTestPaper) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select question from  tb_question where major=? ";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			List<String> query = (List<String>) queryRunner.query(connection, sql, new ColumnListHandler("question"),
					studentAndTestPaper.getMajor());
			// 随机选择题目
			connection.close();
			if (query != null && query.size() > 0) {
				List<String> genPaper = genPaper(query);
				return genPaper;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<String> genPaper(List<String> query) {
		List<String> realQuestion = new ArrayList<>(Global.question_totalNum);
		for (int i = 0; query != null && i < Global.question_totalNum; i++) {
			Random random = new Random();
			int index = random.nextInt(query.size());
			realQuestion.add(i, query.get(index));
		}
		return realQuestion;
	}

	public List<Question> toGetQuestionByKey(List<String> query) {
		List<Question> realQuestion = new ArrayList<>();
		//
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_question where question=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			for (int i = 0; query != null && i < query.size(); i++) {
				Question q = queryRunner.query(connection, sql, new BeanHandler<>(Question.class), query.get(i));
				realQuestion.add(i, q);
			}
			connection.close();
			return realQuestion;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Question> toGetQuestionByQid(List<ErrorBean> errorList) {
		List<Question> realQuestion = new ArrayList<>();
		//
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_question where qid=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			for (int i = 0; errorList != null && i < errorList.size(); i++) {
				Question q = queryRunner.query(connection, sql, new BeanHandler<>(Question.class),
						errorList.get(i).getQid());
				realQuestion.add(i, q);
			}
			connection.close();
			return realQuestion;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Question> toGetQuestionByCollectId(List<CollectQuestionBean> collectQuestionIdList) {
		List<Question> realQuestion = new ArrayList<>();
		//
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_question where qid=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			for (int i = 0; collectQuestionIdList != null && i < collectQuestionIdList.size(); i++) {
				Question q = queryRunner.query(connection, sql, new BeanHandler<>(Question.class),
						collectQuestionIdList.get(i).getQid());
				realQuestion.add(i, q);
			}
			connection.close();
			return realQuestion;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Question> toGetQuestionByTestPaperQid(List<TestPaper> testPaperList) {
		List<Question> realQuestion = new ArrayList<>();
		//
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_question where qid=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			for (int i = 0; testPaperList != null && i < testPaperList.size(); i++) {
				Question q = queryRunner.query(connection, sql, new BeanHandler<>(Question.class),
						testPaperList.get(i).getQid());
				realQuestion.add(i, q);
			}
			connection.close();
			return realQuestion;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
