package com.huaxin.webexam.dao;

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
 * @创建日期: 2017年10月7日 下午10:02:29
 * @ClassName StuUserDao
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public interface ErrorDao {

	public void toAddError(List<ErrorBean> yourErrorQuestion);

	public List<ErrorBean> toSelectErrorPaper(Student student);

	public List<ErrorBean> selectByPage(PageBean<Question> pageBean, Student student);

	public List<ErrorBean> checkError(ErrorBean error);

	public void toAddError(ErrorBean errorBean);

}
