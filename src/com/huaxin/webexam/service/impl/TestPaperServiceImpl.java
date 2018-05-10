package com.huaxin.webexam.service.impl;

import java.util.List;

import com.huaxin.webexam.bean.PageBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.TestPaper;
import com.huaxin.webexam.dao.TestPaperDao;
import com.huaxin.webexam.dao.impl.TestPaperDaoImpl;
import com.huaxin.webexam.service.TestPaperService;

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
public class TestPaperServiceImpl implements TestPaperService {

	@Override
	public String toAddTestPaper(List<Question> question) {
		TestPaperDao testPaperDao = new TestPaperDaoImpl();
		return testPaperDao.toAddTestPaper(question);
	}

	@Override
	public List<TestPaper> selectByPage(PageBean<Question> pageBean, TestPaper testPaper) {
		TestPaperDao testPaperDao = new TestPaperDaoImpl();
		return testPaperDao.selectByPage(pageBean, testPaper);
	}

}
