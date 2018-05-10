<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>上传题目</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link href="${ctx }/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
	<link href="${ctx }/css/student_index/style.css" rel='stylesheet' type='text/css' />
	<script type='text/javascript' src="${ctx }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/js/bootstrap.js"></script>
	<script type="text/javascript" src="${ctx }/js/move-top.js"></script>
	<style type="text/css">
		body {
		    border: medium none;
		    margin: 0;
		    padding: 0;
		    width: 100%;
		}
		
		.headerWrap {
		    width: 100%;
		    height: 127px;
		    background: url('../img/logo.jpg') no-repeat;
		    background-position-y: 71%;
		    background-position-x: 56.5%;
		    min-width: 1290px;
		    display: block;
		}
		
		.header {
			text-align:center;
		}
		
		.mandatory {
			color:RED;
			text-align:left!important;
			font-weight:normal;
		}
	</style>
	
	<script  type="text/javascript" >
		// 重置按钮的点击事件
		function resetForm() {
			$('#registerForm').data('bootstrapValidator').resetForm(true);
		}
		function submits() {
			alert("上传成功！");
		}
	</script>
</head>
	<body>

    <!-- header -->
	<div class="header">
			<div class="logo">
				<h1><a href="${ctx }/TeacherServlet?method=indexUI">Exam</a></h1>
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
									<li><a href="${ctx }/TeacherServlet?method=indexUI">首页</a></li>
									<li><a href="${ctx }/TeacherServlet?method=personalUI">个人中心</a></li>
									<li  class="active"><a href="${ctx }/TeacherServlet?method=toAddTestPaperUI">添加试题</a></li>
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
			 <!-- end header menu -->
		    <div class="clearfix"> </div>
	</div>
    <!-- header -->
    
    
    <br/>
    <br/>
   <br/>
    <br/> 
    <!--  -->
  
  
    
   <!--  添加试题       -->
   <div class="container">
		<form id="registerForm" class="form-horizontal" action="${ctx }/TeacherServlet?method=toAddTestPaper"  method="post">
		  <div class="form-group">
		  	<h4 class="col-sm-11">老师添加题目x</h4>
		  </div>
		  <div class="form-group">
		    <label for="major" class="col-sm-2 control-label">所属科目</label>
		    <div class="col-sm-4">
		    <select name="major" id="major" class="form-control">
				     	<option value="computer">computer</option>
				     	<option value="math">math</option>
				     </select>
		    </div>
		  </div>  
		  
		  <div class="form-group">
		    <label for="questions" class="col-sm-2 control-label">题目</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="questions" name="questions" placeholder="输入题目">
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="questionA" class="col-sm-2 control-label">A选项</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="questionA" name="questionA" placeholder="输入A选项">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="questionB" class="col-sm-2 control-label">B选项</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="questionB" name="questionB" placeholder="输入B选项">
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="questionC" class="col-sm-2 control-label">C选项</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="questionC" name="questionC" placeholder="输入C选项">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="questionD" class="col-sm-2 control-label">D选项</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="questionD" name="questionD" placeholder="输入D选项">
		    </div>
		  </div>
		  
		  
		 <div class="form-group">
		    <label for="answer" class="col-sm-2 control-label">选项答案</label>
		    <div class="col-sm-4">
		    <select name="answer" id="answer" class="form-control">
				     	<option value="1">A</option>
				     	<option value="2">B</option>
				     	<option value="3">C</option>
				     	<option value="4">D</option>
				     </select>
		    </div>
		  </div>  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-6">
		      <button type="submit" class="btn btn-primary" onclick="javascript:submits();">添加</button>
		      <button type="reset" class="btn btn-primary" onclick="javascript:resetForm();">重置</button>
		    </div>
		  </div>	  
		  
		</form>
	</div>
	
   
   
    

    </body>
</html>
