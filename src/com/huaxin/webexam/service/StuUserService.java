package com.huaxin.webexam.service;

import java.util.List;

import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.bean.StudentAndTestPaper;

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
public interface StuUserService {

	public void regist(Student student);

	public List<Student> login(Student student);

	public int update(Student student);

	public List<StudentAndTestPaper> queryMark(Student student);

	public boolean checkUsername(Student student);
}
