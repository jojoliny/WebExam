package com.huaxin.webexam.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.dao.Stu_TestPaperDao;
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
public class Stu_TestPaperDaoImpl implements Stu_TestPaperDao {

	public void toAddStu_TestPaper(List<Question> question) {
		// TODO Auto-generated method stub

	}

	public void toAddStu_testpaper(StudentAndTestPaper studentAndTestPaper) {
		// 真正的
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_stu_testpapers(sno,status,grade,pid,major) values(?,?,?,?,?)";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			queryRunner.update(connection, sql, studentAndTestPaper.getSno(), studentAndTestPaper.getStatus(),
					studentAndTestPaper.getGrade(), studentAndTestPaper.getPid(), studentAndTestPaper.getMajor());
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
