package com.huaxin.webexam.service.impl;

import java.util.List;

import com.huaxin.webexam.bean.Student;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.dao.StuUserDao;
import com.huaxin.webexam.dao.impl.StuUserDaoImpl;
import com.huaxin.webexam.service.StuUserService;

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
public class StuUserServiceImpl implements StuUserService {

	public void regist(Student student) {
		StuUserDao stuUserDao = new StuUserDaoImpl();
		stuUserDao.regist(student);
	}

	public List<Student> login(Student student) {
		StuUserDao stuUserDao = new StuUserDaoImpl();
		List<Student> query = stuUserDao.login(student);
		return query;
	}

	@Override
	public int update(Student student) {
		// TODO Auto-generated method stub
		StuUserDao stuUserDao = new StuUserDaoImpl();
		int update = stuUserDao.update(student);
		return update;
	}

	@Override
	public List<StudentAndTestPaper> queryMark(Student student) {
		// TODO Auto-generated method stub
		StuUserDao stuUserDao = new StuUserDaoImpl();
		List<StudentAndTestPaper> list = stuUserDao.queryMarkStudent(student);
		return list;
	}

	public static void main(String[] args) {
		StuUserServiceImpl impl = new StuUserServiceImpl();
		Student student = new Student("2", "2");
		List<StudentAndTestPaper> list = impl.queryMark(student);
		System.out.println("list=" + list);
	}

	public boolean checkUsername(Student student) {
		StuUserDao stuUserDao = new StuUserDaoImpl();
		List<Student> list = stuUserDao.checkUsername(student);
		if (list != null && list.size() > 0) {
			return false;
		}
		return true;
	}
}
