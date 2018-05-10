package com.huaxin.webexam.dao;

import java.util.List;

import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.bean.StudentAndTestPaper;

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
public interface StuUserDao {

	public void regist(Student student);

	public List<Student> login(Student student);

	public int update(Student student);

	public List<StudentAndTestPaper> queryMarkStudent(Student student);

	public List<Student> checkUsername(Student student);

}
