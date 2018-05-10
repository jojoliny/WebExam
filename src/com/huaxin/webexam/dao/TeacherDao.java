package com.huaxin.webexam.dao;

import java.util.List;

import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Teacher;

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
public interface TeacherDao {
	public int regist(Teacher teacher);

	public void addTestPaper(Question question);

	public List<Teacher> login(Teacher teacher);

	public int update(Teacher teacher);

	public List<Teacher> checkUsername(Teacher teacher);
}
