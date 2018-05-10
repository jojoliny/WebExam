package com.huaxin.webexam.service.impl;

import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.dao.Stu_TestPaperDao;
import com.huaxin.webexam.dao.impl.Stu_TestPaperDaoImpl;
import com.huaxin.webexam.service.Stu_TestPaperService;

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
public class Stu_TestPaperServiceImpl implements Stu_TestPaperService {

	public void toAddStu_testpaper(StudentAndTestPaper studentAndTestPaper) {
		Stu_TestPaperDao stu_TestPaperDao = new Stu_TestPaperDaoImpl();
		stu_TestPaperDao.toAddStu_testpaper(studentAndTestPaper);

	}

}
