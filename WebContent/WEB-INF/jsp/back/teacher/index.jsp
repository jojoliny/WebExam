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
		
		
	
</head>
<body>
<!-- header -->
	<div class="header">
			<div class="logo" >
				<h1><a href="${ctx }/TeacherServlet?method=indexUI">Exam</a></h1>
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
									<li class="active"><a href="${ctx }/TeacherServlet?method=indexUI">首页</a></li>
									<li><a href="${ctx }/TeacherServlet?method=personalUI">个人中心</a></li>
									<li><a href="${ctx }/TeacherServlet?method=addQuestionUI">添加试题</a></li>
									<li><a href="${ctx }/TeacherServlet?method=logoutUI">注销系统</a></li>
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
    	<img src="img/1.jpg"/>
    </div>
    <div>
    	<img src="img/2.jpg"/>
    </div>
    <div>
    	<img src="img/3.jpg"/>
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
			<p>Email : <a href="mailto:info@example.com">info@mycompany.com</a></p>
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
			<div class="foot-bottom">
				<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
	</div>
</div>
<!-- footer -->
<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 0;"></span> <span id="toTopHover" style="opacity: 0;"> </span></a>
</body>
</html>