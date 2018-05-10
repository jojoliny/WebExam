package com.huaxin.webexam.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Teacher;
import com.huaxin.webexam.dao.TeacherDao;
import com.huaxin.webexam.utils.JdbcUtil;

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
public class TeacherDaoImpl implements TeacherDao {

	// public void addTestPaper(Question question) {
	// System.out.println(question);
	// QueryRunner queryRunner = new QueryRunner();
	// String sql = "insert into tb_question(question,tno,point,answer,major)
	// values(?,?,5,?,?)";
	// try {
	// java.sql.Connection connection = JdbcUtil.getConn();
	// if (question.getMajor().equals("computer")) {
	// String address = Global.getQuestion_address_computer();
	// queryRunner.update(connection, sql, address, "no.001",
	// question.getAnswer(), question.getMajor());
	// FileOutputStream os = new FileOutputStream(
	// new
	// File("E:\\java2\\webCode\\WebExam\\src\\question\\computer.properties"),
	// true);
	// String endThing = address + "=" + question.getQuestions() + "##" +
	// question.getQuestionA() + "##"
	// + question.getQuestionB() + "##" + question.getQuestionC() + "##" +
	// question.getQuestionD()
	// + "##" + question.getAnswer() + "\r\n";
	// System.out.println("endThing" + endThing);
	// os.write(endThing.toString().getBytes("utf-8"));
	// } else {
	// String address = Global.getQuestion_address_computer();
	// queryRunner.update(connection, sql, Global.getQuestion_address_math(),
	// "no.001", question.getAnswer(),
	// question.getMajor());
	//
	// // InputStream resourceAsStream =
	// //
	// TeacherDaoImpl.class.getClassLoader().getResourceAsStream("question/computer.properties");
	// FileOutputStream os = new FileOutputStream(
	// new File("E:\\java2\\webCode\\WebExam\\src\\question\\math.properties"),
	// true);
	// String endThing = address + "=" + question.getQuestions() + "##" +
	// question.getQuestionA() + "##"
	// + question.getQuestionB() + "##" + question.getQuestionC() + "##" +
	// question.getQuestionD()
	// + "##" + question.getAnswer() + "\r\n";
	// System.out.println("endThing" + endThing);
	// os.write(endThing.toString().getBytes("utf-8"));
	// }
	// connection.close();
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	public void addTestPaper(Question question) {
		System.out.println(question);
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_question(question,tno,point,answer,major) values(?,?,5,?,?)";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			String realQuestion = question.getQuestions() + "##" + question.getQuestionA() + "##"
					+ question.getQuestionB() + "##" + question.getQuestionC() + "##" + question.getQuestionD() + "##"
					+ question.getAnswer();
			queryRunner.update(connection, sql, realQuestion, question.getTno(), question.getAnswer(),
					question.getMajor());
			// InputStream resourceAsStream =
			// TeacherDaoImpl.class.getClassLoader().getResourceAsStream("question/computer.properties");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Teacher> login(Teacher teacher) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_teacher where tno=? and password=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			List<Teacher> query = queryRunner.query(connection, sql, new BeanListHandler<>(Teacher.class),
					teacher.getTno(), teacher.getPassword());
			connection.close();
			return query;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int update(Teacher teacher) {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner();
		String sql = "update tb_teacher set tname=?,tsex=?,password=?,email=?where tno=?";
		try {
			java.sql.Connection conn = JdbcUtil.getConn();
			int update = queryRunner.update(conn, sql, teacher.getTname(), teacher.getTsex(), teacher.getPassword(),
					teacher.getemail(), teacher.getTno());
			conn.close();
			return update;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}

	public int regist(Teacher teacher) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_teacher(tno, tname, tsex, password, email) values(?,?,?,?,?)";
		try {
			int update = queryRunner.update(JdbcUtil.getConn(), sql, teacher.getTno(), teacher.getTname(),
					teacher.getTsex(), teacher.getPassword(), teacher.getemail());
			return update;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Teacher> checkUsername(Teacher teacher) {
		try {
			QueryRunner queryRunner = new QueryRunner();
			Connection conn = JdbcUtil.getConn();
			String sql = "select * from tb_teacher where tno=?";
			List<Teacher> query = queryRunner.query(conn, sql, new BeanListHandler<>(Teacher.class), teacher.getTno());
			conn.close();
			return query;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
