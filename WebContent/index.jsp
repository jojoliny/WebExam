<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%-- <a href="${ctx }/StudentServlet?method=TologinUI">学生登陆注册界面</a><br/>
<a href="${ctx }/StudentServlet?method=frameIndex">学生登陆后进入的界面</a><br/>
<a href="${ctx }/StudentServlet?method=indexUI">学生登陆注册后进入的界面1新的</a><br/>
<a href="${ctx }/TeacherServlet?method=indexUI">老师界面</a><br/>
<a href="${ctx }/TeacherServlet?method=toAddTestPaperUI">老师上传题目</a><br/>
<a href="${ctx }/StudentServlet?method=toJoinExamUI">学生考试</a><br/>
<a href="${ctx }/StudentServlet?method=toCalculateGrade">成绩</a><br/> --%>
<%-- <a href="${ctx }/QuestionServlet?method=toSelectErrorPaper">错题</a><br/>
	<a href="${ctx }/QuestionServlet?method=toSelectCollectQuestion">收藏题</a><br/>
	<a href="${ctx }/QuestionServlet?method=toSelectErrorPaper2">心新错题</a><br/>
	<a href="${ctx }/QuestionServlet?method=toListErrorUI&pageIndex=1">心新错题分页</a><br/>  --%>
<% request.getRequestDispatcher("StudentServlet?method=indexUI").forward(request, response); %> 
<%-- <a href="${ctx }/QuestionServlet?method=toExamResultUI">考试结果</a><br/>
<a href="${ctx }/QuestionServlet?method=toExamResultUI2">考试结果2</a><br/>
<a href="${ctx }/QuestionServlet?method=toSelectCollectQuestion">收藏题</a><br/>
<a href="${ctx }/QuestionServlet?method=toListErrorUI&pageIndex=1">心新错题分页</a><br/> --%>
<%-- <a href="${ctx }/QuestionServlet?method=toExamResultUI2">考试结果2</a><br/> --%>
<!--  -->
</body>
</html>


