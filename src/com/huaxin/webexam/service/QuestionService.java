package com.huaxin.webexam.service;

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
 * @创建日期: 2017年10月7日 下午9:10:16
 * @ClassName StuUserService
 * @类描述-Description: TODO
 * @修改记录:
 * @版本: 1.0
 */
public interface QuestionService {

	public List<Question> toSelectPaper(StudentAndTestPaper studentAndTestPaper);

	public List<Question> toGetQuestionByQid(List<ErrorBean> errorList);

	public List<Question> toGetQuestionByCollectId(List<CollectQuestionBean> collectQuestionIdList);

	public List<Question> toGetQuestionByTestPaperQid(List<TestPaper> testPaperList);

}
