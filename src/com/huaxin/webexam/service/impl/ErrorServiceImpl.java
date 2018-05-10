package com.huaxin.webexam.service.impl;

import java.util.List;

import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.PageBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.dao.ErrorDao;
import com.huaxin.webexam.dao.impl.ErrorDaoImpl;
import com.huaxin.webexam.service.ErrorService;

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
public class ErrorServiceImpl implements ErrorService {

	public void toAddError(List<ErrorBean> yourErrorQuestion) {
		ErrorDao errorDao = new ErrorDaoImpl();
		errorDao.toAddError(yourErrorQuestion);
	}

	public List<ErrorBean> toSelectErrorPaper(Student student) {
		ErrorDao errorDao = new ErrorDaoImpl();
		List<ErrorBean> errorList = errorDao.toSelectErrorPaper(student);
		return errorList;
	}

	@Override
	public List<ErrorBean> selectByPage(PageBean<Question> pageBean, Student student) {
		ErrorDao errorDao = new ErrorDaoImpl();
		return errorDao.selectByPage(pageBean, student);
	}

	// false 已存在错题
	@Override
	public boolean checkError(ErrorBean error) {
		ErrorDao errorDao = new ErrorDaoImpl();
		List<ErrorBean> list = errorDao.checkError(error);
		if (list != null && list.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public void toAddError(ErrorBean errorBean) {
		ErrorDao errorDao = new ErrorDaoImpl();
		errorDao.toAddError(errorBean);
	}

}
