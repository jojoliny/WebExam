package com.huaxin.webexam.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.dao.StuUserDao;
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
public class StuUserDaoImpl implements StuUserDao {

	public void regist(Student student) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_student(sno,sname,sex,password,email) values(?,?,?,?,?)";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			queryRunner.update(connection, sql, student.getSno(), student.getSname(), student.getSex(),
					student.getPassword(), student.getEmail());
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public List<Student> login(Student student) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_student where sno=? and password=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			List<Student> query = queryRunner.query(connection, sql, new BeanListHandler<>(Student.class),
					student.getSno(), student.getPassword());
			connection.close();
			return query;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int update(Student student) {
		// TODO Auto-generated method stub
		System.out.println("student=" + student);
		QueryRunner queryRunner = new QueryRunner();
		String sql = "update tb_student set sname=?,sex=?,password=?,email=?where sno=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			int update = queryRunner.update(connection, sql, student.getSname(), student.getSex(),
					student.getPassword(), student.getEmail(), student.getSno());
			connection.close();
			return update;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static void main(String[] args) {
		StuUserDaoImpl stuUserDaoImpl = new StuUserDaoImpl();
		Student student = new Student("1", "1");
		List<Student> login = stuUserDaoImpl.login(student);
		System.out.println("student=" + student);
	}

	@Override
	public List<StudentAndTestPaper> queryMarkStudent(Student student) {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from tb_stu_testpapers where sno=?";
		try {
			Connection conn = JdbcUtil.getConn();
			List<StudentAndTestPaper> query = queryRunner.query(conn, sql,
					new BeanListHandler<>(StudentAndTestPaper.class), student.getSno());
			conn.close();
			return query;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Student> checkUsername(Student student) {
		try {
			QueryRunner queryRunner = new QueryRunner();
			Connection conn = JdbcUtil.getConn();
			String sql = "select * from tb_student where sno=?";
			List<Student> query = queryRunner.query(conn, sql, new BeanListHandler<>(Student.class), student.getSno());
			conn.close();
			return query;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
