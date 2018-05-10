package com.huaxin.webexam.service.impl;

import java.util.List;

import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.Teacher;
import com.huaxin.webexam.dao.TeacherDao;
import com.huaxin.webexam.dao.impl.TeacherDaoImpl;
import com.huaxin.webexam.service.TeacherService;

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
public class TeacherServiceImpl implements TeacherService {

	public List<Question> addTestPaper(Question question) {
		TeacherDao teacherDao = new TeacherDaoImpl();
		teacherDao.addTestPaper(question);
		return null;
	}

	public List<Teacher> login(Teacher teacher) {
		TeacherDao daoImpl = new TeacherDaoImpl();
		List<Teacher> login = daoImpl.login(teacher);
		return login;
	}

	@Override
	public int update(Teacher teacher) {
		// TODO Auto-generated method stub
		TeacherDao teacherDaoImpl = new TeacherDaoImpl();
		int update = teacherDaoImpl.update(teacher);
		return update;

	}

	public int regist(Teacher teacher) {
		TeacherDao impl = new TeacherDaoImpl();
		int regist = impl.regist(teacher);
		return regist;
	}

	public static void main(String[] args) {
		TeacherServiceImpl serviceImpl = new TeacherServiceImpl();
		Teacher teacher = new Teacher("r", "1", 1, "q", "q");
		int regist = serviceImpl.regist(teacher);
		System.out.println("regist=" + regist);
	}

	@Override
	public boolean checkUsername(Teacher teacher) {
		TeacherDao impl = new TeacherDaoImpl();
		List<Teacher> list = impl.checkUsername(teacher);
		if (list != null && list.size() > 0) {
			return false;
		}
		return true;
	}
}
