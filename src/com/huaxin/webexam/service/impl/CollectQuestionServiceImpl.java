package com.huaxin.webexam.service.impl;

import java.util.List;

import com.huaxin.webexam.bean.CollectQuestionBean;
import com.huaxin.webexam.dao.CollectQuestionDao;
import com.huaxin.webexam.dao.impl.CollectQuestionDaoImpl;
import com.huaxin.webexam.service.CollectQuestionService;

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
public class CollectQuestionServiceImpl implements CollectQuestionService {

	public List<CollectQuestionBean> toSelectCollectQuestion(CollectQuestionBean collectQuestionBean) {
		CollectQuestionDao collectQuestionDao = new CollectQuestionDaoImpl();
		return collectQuestionDao.toSelectCollectQuestion(collectQuestionBean);
	}

	public void toCollect(CollectQuestionBean collectQuestionBean) {
		CollectQuestionDao collectQuestionDao = new CollectQuestionDaoImpl();
		collectQuestionDao.toCollect(collectQuestionBean);
	}

	public void toCancelCollect(CollectQuestionBean collectQuestionBean) {
		CollectQuestionDao collectQuestionDao = new CollectQuestionDaoImpl();
		collectQuestionDao.toCancelCollect(collectQuestionBean);

	}

}
