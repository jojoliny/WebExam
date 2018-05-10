package com.huaxin.webexam.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.huaxin.webexam.bean.CollectQuestionBean;
import com.huaxin.webexam.dao.CollectQuestionDao;
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
public class CollectQuestionDaoImpl implements CollectQuestionDao {

	public List<CollectQuestionBean> toSelectCollectQuestion(CollectQuestionBean collectQuestionBean) {
		QueryRunner queryRunner = new QueryRunner();
		String sql = "select * from  tb_collectquestion where sno=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			List<CollectQuestionBean> query = queryRunner.query(connection, sql,
					new BeanListHandler<>(CollectQuestionBean.class), collectQuestionBean.getSno());
			connection.close();
			return query;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void toCollect(CollectQuestionBean collectQuestionBean) {
		// 目前默认是学生1
		QueryRunner queryRunner = new QueryRunner();
		String sql = "insert into tb_collectquestion(sno,qid,createtime) values(?,?,Now())";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			queryRunner.update(connection, sql, collectQuestionBean.getSno(), collectQuestionBean.getQid());
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void toCancelCollect(CollectQuestionBean collectQuestionBean) {
		// 目前默认是学生1
		QueryRunner queryRunner = new QueryRunner();
		String sql = "delete from tb_collectquestion where qid=? and sno=?";
		try {
			java.sql.Connection connection = JdbcUtil.getConn();
			queryRunner.update(connection, sql, collectQuestionBean.getQid(), collectQuestionBean.getSno());
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
