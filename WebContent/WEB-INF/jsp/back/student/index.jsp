<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
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
			<div class="logo" >
				<h1><a href="${ctx }/StudentServlet?method=indexUI">Exam</a></h1>
			</div>	
<!-- start header menu -->
			<div class="header-top" style="background-color: #7850F0;">
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
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background-color: #7850F0;">
								<ul class="nav navbar-nav">
									<li class="active"><a href="${ctx }/StudentServlet?method=indexUI" >首页</a></li>
									<li <c:if test="${currentUser==null }">class="btn disabled"</c:if>>
										<a href="#" class="test-center">考试中心</a>
										<ul>
											<li><a href="${ctx }/StudentServlet?method=examinationUI" class="test-center-li">进入考试</a></li>
											<li><a href="${ctx }/StudentServlet?method=queryUI" class="test-center-li">成绩查询</a></li>
											<li><a href="${ctx }/QuestionServlet?method=toListErrorUI&pageIndex=1" class="test-center-li">错题本</a></li>
											<li><a href="${ctx }/QuestionServlet?method=toSelectCollectQuestion" class="test-center-li">收藏本</a></li>
										</ul>
									</li>
									<li <c:if test="${currentUser==null }">class="btn disabled"</c:if>><a href="${ctx }/StudentServlet?method=personalUI" >个人中心</a></li>
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
    <div>
    	<img src="img/1.jpg" style="width:100%;"/>
    </div>
    <div>
    	<img src="img/2.jpg" style="width:100%;"/>
    </div>
    <div>
    	<img src="img/3.jpg" style="width:100%;"/>
    </div>
<!-- start banner -->
<br />


<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h3>Telephone</h3>
			<p>1 800 603 6035</p>
		</div>
		<div class="col-md-3 footer-left">
			<h3>E-Mail Us</h3>
			<p>Email : info@mycompany.com</p>
		</div>
		<div class="col-md-3 footer-left">
			<h3>Follow Us</h3>
			<ul>
				<li><a href="#"><i class="facebok"> </i></a></li>
				<li><a href="#"><i class="twiter"> </i></a></li>
				<li><a href="#"><i class="goog"> </i></a></li>
				<li><a href="#"><i class="inst"> </i></a></li>
					<div class="clearfix"></div>	
			</ul>
		</div>
		<div class="col-md-3 footer-left">
			<h3>Address</h3>
			<p>8058 St Perth Place,
Australia, DC 55 Fr 88.</p>
		</div>
			<div class="clearfix"></div>
			<div class="foot-bottom" style="text-align:center;margin:0px;">
				<p>Copyright &copy; 2017.Company name All rights reserved.三只小可爱制作</p>
			</div>
	</div>
</div>
<!-- footer -->
<span id="toTopHover" style="opacity: 0;"></span> <span id="toTopHover" style="opacity: 0;"> </span>
</body>
</html>