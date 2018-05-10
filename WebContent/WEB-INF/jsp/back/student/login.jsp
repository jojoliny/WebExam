<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>login</title>
<!-- 本界面字段名
学生（
学号 sLogNo
密码 sLogPwd
验证码 validatecode
）

教师（
教师编号 tLogNo
密码 tLogPwd
）
 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="${ctx }/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${ctx }/css/student_index/style.css" rel='stylesheet' type='text/css' />
<script type='text/javascript' src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx }/js/move-top.js"></script>
<!--  -->
<script src="${ctx}/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrapValidator.min.js"></script>
<link href="${ctx }/css/test-center.css" rel='stylesheet' type='text/css' />

<script type="text/javascript">
		function getValidate() {
			//发送ajax
			var email=$("#btn").value;
			var url ="${pageContext.request.contextPath }/EmailServlet?method=getValidate";
			var param="email="+email;
			$.post(url,param,function(resultData){
				alert("请查看邮箱，获取验证码");
			},"text");
		}
</script>
<script type="text/javascript">
	function changeValidateCode(img)
	{
		var a = Math.random();
		img.src = "${ctx}/ValidateCode?"+a;
	}

</script>

<!-- 		 -->
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
		    background: url('${ctx}/img/logo.jpg') no-repeat;
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

	<script type="text/javascript">
		// $(function(){}) 等价于 <body onload="function(){}"> 
		$(function() {
			// $("#registerForm") 等价于 document.getElementById("registerForm");
			$("#stuLogForm").bootstrapValidator({
				message : '该值不合法',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					sLogNo : {
						validators : {
							notEmpty : { //非空验证
								message : '学号不能为空'
							},
							stringLength : { // 长度验证
								min : 1,
								max : 20,
								message : '学号长度需为1-20'
							},
							regexp : { // 正则式验证
								regexp : /^[0-9a-zA-Z_]+$/,
								message : '学号只能为字母、数字、下划线'
							}
						}
						
						},
					 
						sLogPwd: {
						validators : {
							notEmpty : { //非空验证
								message : '密码不能为空'
							}
						}	
					}
				}
					/* email:{
						message: '邮箱地址不合法',
						validators:{
							notEmpty : {
								message : '邮箱不能为空'
							},
							emailAddress:{
								message:'邮箱地址格式有误'
							}
						}
					}, */
				/* 	validationCode:{
						message:'验证码不正确',
						validators:{
							notEmpty : {
								message : '请填写验证码'
							},
							remote:{ // 远程验证
								type: 'POST',
		                        url: '${basePath}/checkValidationCode.do',
								message:'验证码不正确'
							}
						}
					} */
			});
					
				$("#teaLogForm").bootstrapValidator({
					message : '该值不合法',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						tLogNo : {
							message : '教师编号不合法',				
							validators : {
								notEmpty : { //非空验证
									message : '编号不能为空'
								},
								stringLength : { // 长度验证
									min : 1,
									max : 20,
									message : '学号长度需为1-20'
								},
								regexp : { // 正则式验证
									regexp : /^[0-9a-zA-Z_.]+$/,
									message : '教师编号只能为字母、数字、下划线'
								}
							}
						},
						tLogPwd: {
							message : '密码不合法',	
							validators : {
								notEmpty : { //非空验证
									message : '密码不能为空'
								}
							}
						}
					}
				});
			});
		
		
		


		// 改变验证码图片
		/* function changeValidateImage() {
			var img = document.getElementById("validateImage");
			img.src = "${basePath}/validationCode.do?t=" + (new Date()).valueOf();
		} */

		
	</script>
		
	
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
										<a href="" class="test-center">考试中心</a>
										<ul>
											<li><a href="${ctx }/StudentServlet?method=examinationUI" class="test-center-li">进入考试</a></li>
											<li><a href="${ctx }/StudentServlet?method=queryUI" class="test-center-li">成绩查询</a></li>
											<li><a href="${ctx }/StudentServlet?method=errorsUI" class="test-center-li">错题本</a></li>
											<li><a href="${ctx }/StudentServlet?method=collectionsUI" class="test-center-li">收藏本</a></li>
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
	
	
	
	<!-- 登录界面 -->
	<div class="headerWrap"></div>
	<div class="container">
			<ul class="nav nav-pills" role="tablist">
			  <li role="presentation" class="active"><a href="#student_log" aria-controls="student_log" role="tab" data-toggle="tab">学生登录</a></li>
		      <li role="presentation"><a href="#teacher_log" aria-controls="teacher_log" role="tab" data-toggle="tab">教师登录</a></li>
			</ul>
			
			<div class="tab-content ">
			<!-- 学生登入表 -->
				<div role="tabpanel" class="tab-pane active" id="student_log">
					<form id="stuLogForm" class="form-horizontal" action="${ctx }/StudentServlet?method=toLogin"  method="post">
					  <div class="form-group header"></div>
					  
					   <div class="form-group header">
					  	<h4 style="text-align: center;" class="col-sm-11">${loginMsg }</h4>
					  	<h4 style="text-align: center;" class="col-sm-11">${loginStatus }</h4>
					  </div>
					  <div class="form-group">
					    <label for="sLogNo" class="col-sm-2 control-label">学号</label>
					    <div class="col-sm-4">
					      <input type="text" id=sLogNo name="sLogNo" class="form-control">
					    </div>
					    <!--<label for="userName" class="col-sm-5 control-label mandatory">*(6~20 字符，可用数字、字母、下划线)</label>-->
					  	
					  </div>
					  
					  <div class="form-group">
					    <label for="sLogPwd" class="col-sm-2 control-label" >密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="sLoPwd" name="sLogPwd" class="form-control">
					    </div>
					  </div>
					 
			<!-- 验证码 -->
			<dd class="val_icon">
				<div class="form-group">
					<label for="validatecode" class="col-sm-2 control-label" >验证码</label>
					    <div class="col-sm-3">
							<input type="text" id="validatecode" placeholder="验证码" maxlength="4"
								name="validateCode" class="login_txtbx form-control">
						</div>
						<div style="float: left;">
						<img class="J_codetext2" id="myCanvas2"
							src="${ctx}/ValidateCode" width="80px" height="35px"
							alt="对不起，您的浏览器不支持canvas，请下载最新版浏览器!" title="验证码"
							style="position: relative; z-index: 10; float: left;"
							onclick="changeValidateCode(this)" />
						</div>
					</div>
			</dd>
				      <div class="form-group">
						<a href="${ctx }/StudentServlet?method=toRegistUI" style="margin-left:210px">还没有账号？点此注册</a>
				      </div>
					  <div class="col-sm-offset-2 col-sm-6">
					    <button type="submit" class="btn btn-primary" style="width:360px;margin-left:-10px">登录</button>
					  </div>			 
					</form>
				</div>
			<!-- 教师登入表 -->
				<div role="tabpanel" class="tab-pane" id="teacher_log">
				    <form id="teaLogForm" class="form-horizontal" action="${ctx }/TeacherServlet?method=toLogin"  method="post">
					  <div class="form-group header"></div>
					   <div class="form-group header">
					  	<h4 style="text-align: center;" class="col-sm-11">${loginMsg }</h4>
					  	<h4 style="text-align: center;" class="col-sm-11">${loginStatus }</h4>
					  </div>
					  <div class="form-group">
					    <label for="tLogNo" class="col-sm-2 control-label">教师编号</label>
					    <div class="col-sm-4">
					      <input type="text" id="tLogNo" name="tLogNo" class="form-control">
					    </div>
					    <!--<label for="userName" class="col-sm-5 control-label mandatory">*(6~20 字符，可用数字、字母、下划线)</label>-->
					  </div>
					  <div class="form-group">
					    <label for="tLogPwd" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="tLogPwd" name="tLogPwd" class="form-control">
					    </div>
					  </div>
					  <!-- 验证码 -->
			<dd class="val_icon">
				<div class="form-group">
					<label for="validatecode" class="col-sm-2 control-label" >验证码</label>
					    <div class="col-sm-3">
							<input type="text" id="validatecode" placeholder="验证码" maxlength="4"
								name="validateCode" class="login_txtbx form-control">
						</div>
						<div style="float: left;">
						<img class="J_codetext2" id="myCanvas2"
							src="${ctx}/ValidateCode" width="80px" height="35px"
							alt="对不起，您的浏览器不支持canvas，请下载最新版浏览器!" title="验证码"
							style="position: relative; z-index: 10; float: left;"
							onclick="changeValidateCode(this)" />
						</div>
					</div>
			</dd>
					  <div class="form-group" >
						<a href="${ctx }/StudentServlet?method=toRegistUI" style="margin-left:210px">还没有账号？点此注册</a>
				      </div>
					  <div class="col-sm-offset-2 col-sm-6">
					    <button type="submit" class="btn btn-primary" style="width:360px;margin-left:-10px">登录</button>
					  </div>		 
					</form>
				</div>
				</div>
				
	
<!-- header -->
</body>
</html>