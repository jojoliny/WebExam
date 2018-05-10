package com.huaxin.webexam.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.PageBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.dao.ErrorDao;
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
public class ErrorDaoImpl implements ErrorDao {

	public void toAddError(List<ErrorBean> yourErrorQuestion) {
		// 目前默认是学生1
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_errors(sno,qid,major,wrongAnswer,rightAnswer) values(?,?,?,?,?)";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			for (int i = 0; i < yourErrorQuestion.size(); i++) {
				queryRunner.update(connection, sql, yourErrorQuestion.get(i).getSno(),
						yourErrorQuestion.get(i).getQid(), yourErrorQuestion.get(i).getMajor(),
						yourErrorQuestion.get(i).getWrongAnswer(), yourErrorQuestion.get(i).getRightAnswer());
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ErrorBean> toSelectErrorPaper(Student student) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_errors where sno=? ";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			List<ErrorBean> query = queryRunner.query(connection, sql, new BeanListHandler<>(ErrorBean.class),
					student.getSno());
			connection.close();
			return query;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ErrorBean> selectByPage(PageBean<Question> pageBean, Student student) {
		// 拿到真正的行数
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select count(*) from tb_errors where sno=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			Object query = queryRunner.query(connection, sql, new ScalarHandler(1), student.getSno());
			//
			int num = ((Long) query).intValue();
			Integer row = (int) (num / 1);
			pageBean.setCountData(row);
			Integer index = row / pageBean.getPageSize();
			if (row % pageBean.getPageSize() != 0) {
				index++;
			}
			pageBean.setTotalIndex(index);
			//
			if (pageBean.getPageIndex() <= pageBean.getTotalIndex()) {
				sql = "select * from tb_errors where sno=? limit ?,?";
				List<ErrorBean> query2 = queryRunner.query(connection, sql, new BeanListHandler<>(ErrorBean.class),
						student.getSno(), (pageBean.getPageIndex() - 1) * pageBean.getPageSize(),
						pageBean.getPageSize());
				connection.close();
				return query2;
			} else {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ErrorBean> checkError(ErrorBean error) {
		try {
			QueryRunner queryRunner = new QueryRunner();
			Connection conn = JdbcUtil.getConn();
			String sql = "select * from tb_errors where qid=?";
			List<ErrorBean> query = queryRunner.query(conn, sql, new BeanListHandler<>(ErrorBean.class),
					error.getQid());
			conn.close();
			return query;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void toAddError(ErrorBean errorBean) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_errors(sno,qid,major,wrongAnswer,rightAnswer) values(?,?,?,?,?)";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();

			queryRunner.update(connection, sql, errorBean.getSno(), errorBean.getQid(), errorBean.getMajor(),
					errorBean.getWrongAnswer(), errorBean.getRightAnswer());

			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
