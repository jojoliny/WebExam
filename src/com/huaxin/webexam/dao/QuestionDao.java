package com.huaxin.webexam.dao;

import java.util.List;

import com.huaxin.webexam.bean.CollectQuestionBean;
import com.huaxin.webexam.bean.ErrorBean;
import com.huaxin.webexam.bean.Question;
import com.huaxin.webexam.bean.StudentAndTestPaper;
import com.huaxin.webexam.bean.TestPaper;

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
public interface QuestionDao {

	public List<String> toSelectPaper(StudentAndTestPaper studentAndTestPaper);

	public List<Question> toGetQuestionByKey(List<String> query);

	public List<Question> toGetQuestionByQid(List<ErrorBean> errorList);

	public List<Question> toGetQuestionByCollectId(List<CollectQuestionBean> collectQuestionIdList);

	public List<Question> toGetQuestionByTestPaperQid(List<TestPaper> testPaperList);

}
