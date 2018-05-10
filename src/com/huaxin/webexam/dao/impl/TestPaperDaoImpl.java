package com.huaxin.webexam.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.huaxin.webexam.bean.PageBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.TestPaper;
import com.huaxin.webexam.dao.TestPaperDao;
import com.huaxin.webexam.utils.JdbcUtil;
import com.huaxin.webexam.utils.common.IDUtil;

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
public class TestPaperDaoImpl implements TestPaperDao {

	public String toAddTestPaper(List<Question> query) {
		// 知道题目，添加一份试卷
		String pid = IDUtil.genUUID();
		//
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_testpapers(pid,qid,major,answer) values(?,?,?,?)";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			for (int i = 0; query != null && i < query.size(); i++) {
				queryRunner.update(connection, sql, pid, query.get(i).getQid(), query.get(i).getMajor(),
						query.get(i).getAnswer());
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pid;
	}

	public List<TestPaper> selectByPage(PageBean<Question> pageBean, TestPaper testPaper) {
		// 拿到真正的行数
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select count(*) from tb_testpapers where pid=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			Object query = queryRunner.query(connection, sql, new ScalarHandler(1), testPaper.getPid());
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
				sql = "select * from tb_testpapers where pid=? limit ?,?";
				List<TestPaper> query2 = queryRunner.query(connection, sql, new BeanListHandler<>(TestPaper.class),
						testPaper.getPid(), (pageBean.getPageIndex() - 1) * pageBean.getPageSize(),
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

}
