<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
<title>examination</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${ctx }/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${ctx }/css/student_index/style.css" rel='stylesheet' type='text/css' />
<script type='text/javascript' src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx }/js/move-top.js"></script>
<link href="${ctx }/css/test-center.css" rel='stylesheet' type='text/css' />
		
		
	
</head>
	<body>

	    <!-- header -->
	<div class="header">
			<div class="logo">
				<h1><a href="${ctx }/StudentServlet?method=indexUI">Exam</a></h1>
			</div>	
<!-- start header menu -->
			<div class="header-top">
				<div class="head-nav">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
								</button>
							</div>
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li><a href="${ctx }/StudentServlet?method=indexUI">首页</a></li>
									<li <c:if test="${currentUser==null }">class="btn disabled"</c:if>>
										<a href="" class="test-center active">考试中心</a>
										<ul>
											<li><a href="${ctx }/StudentServlet?method=examinationUI" class="test-center-li">进入考试</a></li>
											<li><a href="${ctx }/StudentServlet?method=queryUI" class="test-center-li">成绩查询</a></li>
											<li><a href="${ctx }/QuestionServlet?method=toListErrorUI&pageIndex=1" class="test-center-li">错题本</a></li>
											<li><a href="${ctx }/QuestionServlet?method=toSelectCollectQuestion" class="test-center-li">收藏本</a></li>
										</ul>
									</li>
									<li <c:if test="${currentUser==null }">class="btn disabled"</c:if>><a href="${ctx }/StudentServlet?method=personalUI">个人中心</a></li>
									<li <c:if test="${currentUser!=null }">class="btn disabled"</c:if>><a href="${ctx }/StudentServlet?method=loginUI">登录系统</a></li>
									<li <c:if test="${currentUser==null }">class="btn disabled"</c:if>><a href="${ctx }/StudentServlet?method=logoutUI">注销系统</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
				<div class="search-box">
					<div id="sb-search" class="sb-search">
						<form>
							<input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
							<input class="sb-search-submit" type="submit" value="">
							<span class="sb-icon-search"> </span>
							</form>
					</div>
				</div>
				<div class="clearfix"> </div>
				<!-- search-scripts -->
					<script src="js/classie.js"></script>
					<script src="js/uisearch.js"></script>
					<script>
						new UISearch( document.getElementById( 'sb-search' ) );
					</script>
				<!-- //search-scripts -->
			</div>
		    <div class="clearfix"> </div>
	</div>
<!-- header -->



	    
	    
		<div class="col-sm-12" style="height: 200px;"></div>
		<div class="container">
			<form id="registerForm" class="form-vertical" action="${ctx }/QuestionServlet?method=toSelectPaper"  method="post">
			    
			    <div class="form-group col-sm-12">
					<div class="col-sm-3"></div>
				    <label for="teacherlb" class="col-sm-2 control-label"><font size="5">请选择老师</font></label>
				    <div class="col-sm-3">
				     <select name="teacher" id="teacher" class="form-control">
				     	<option value="0">----</option>
				     </select>
				    </div>
				    <div class="col-sm-4"></div>
			    </div>	
			    
			    <div class="form-group col-sm-12">
					<div class="col-sm-3"></div>
				    <label for="subjectLb" class="col-sm-2 control-label"><font size="5">请选择科目</font></label>
				    <div class="col-sm-3">
				     <select name="subject" id="subject" class="form-control">
				     	<option value="0">----</option>
				     	
				     	<option value="computer">computer</option>
				     	<option value="math">math</option>
				     </select>
				    </div>
				    <div class="col-sm-4"></div>
			    </div>	
			
				<div class="form-group col-sm-12">
					<div class="col-sm-3"></div>
				    <label for="paperLb" class="col-sm-2 control-label"><font size="5">请选择试卷</font></label>
				    <div class="col-sm-3">
				     <select name="paper" id="paper" class="form-control">
				     	<option value="0">----</option>
				     </select>
				    </div>
				    <div class="col-sm-4"></div>
			    </div>	
			    
				<div class="form-group col-sm-12">
					<div class="col-sm-5">
				    </div>
				    <div class="col-sm-2">
				      <button type="submit" class="btn btn-primary">查询</button>
				    </div>
				    <div class="col-sm-1">
				      <!--js写一个点击事  -->
				      <button type="button" class="btn btn-primary">
				      		返回
				      </button>
				    </div>
				</div>
			
		 </form>
		</div>
	</body>
	
	
	
	
	
</html>