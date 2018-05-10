package com.huaxin.webexam.service;

import java.util.List;

import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.PageBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Student;

/**
 *
 * @版权: Copyright (c)
 * @author :liu
 * @E-mail:2842878082@qq.com
 * @版本: 1.0
 * @创建日期: 2017年10月7日 下午9:10:16
 * @ClassName StuUserService
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public interface ErrorService {

	public void toAddError(List<ErrorBean> yourErrorQuestion);

	public List<ErrorBean> toSelectErrorPaper(Student student);

	public List<ErrorBean> selectByPage(PageBean<Question> pageBean, Student student);

	public boolean checkError(ErrorBean error);

	public void toAddError(ErrorBean errorBean);

}
