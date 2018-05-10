<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>personal</title>
<!-- 本界面字段名
教师个人信息（
教师编号 tPerno
姓名 tPerName
密码 tPerPwd
确认密码 tPerConfirmPwd
性别 tPerSex
邮箱 tPerEmail
邮箱验证码 tPerEmailVali
）
 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${ctx }/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${ctx }/css/student_index/style.css" rel='stylesheet' type='text/css' />
<script type='text/javascript' src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx }/js/move-top.js"></script>
<script src="${ctx}/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrapValidator.min.js"></script>


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
			$("#tPersonalForm").bootstrapValidator({
				message : '该值不合法',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					tPerName : {
						message : '姓名不合法',
						validators : {
							notEmpty : { //非空验证
								message : '姓名不能为空'
							},
							
						}
					},
					tPerPwd: {
						message: '密码不合法',
						validators: {
							notEmpty : { //非空验证
								message : '密码不能为空'
							},
							stringLength : { // 长度验证
								min : 1,
								max : 20,
								message : '密码长度需为1-20'
							},
							regexp : { // 正则式验证
								regexp : /^[0-9a-zA-Z_]+$/,
								message : '密码只能为字母、数字、下划线'
							},
							different: {
		                        field: 'regname',
		                        message: '密码不能与学号相同'
		                    }
						}
					}, //密码验证结束
					 tPerConfirmPwd:{
						message: '两次密码不一致',
						validators:{
							notEmpty: {
								message : '请确认密码'
							},
							identical: {
		                        field: 'tPerPwd',
		                        message: '两次密码不一致'
		                    }
						}
					}, 
					tPerEmail:{
						message: '邮箱地址不合法',
						validators:{
							notEmpty : {
								message : '邮箱不能为空'
							},
							emailAddress:{
								message:'邮箱地址格式有误'
							}
						}
					},
					tPerEmailVali:{
						message:'验证码不正确',
						validators:{
							notEmpty : {
								message : '请填写验证码'
							},
							/* remote:{ // 远程验证
								type: 'POST',
		                        url: '${basePath}/checkValidationCode.do',
								message:'验证码不正确'
							} */
						}
					}
				}

			});
				
			});
		
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
								<li   class="active"><a href="${ctx }/TeacherServlet?method=personalUI">个人中心</a></li>
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
		 <!-- end header menu -->
	    <div class="clearfix"> </div>
</div>
<!-- header -->

<!-- 个人页面 -->
<div class="container " >
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="container " style="margin-top: 20px">

			<!-- 教师个人信息表 -->
				
					<form id="tPersonalForm" class="form-horizontal" action="${ctx }/TeacherServlet?method=updatePersonal"  method="post">
					  <div class="form-group">
					  	<h4 style="text-align: center;" class="col-sm-11">${perMsg }</h4>
					   </div> 
					  <div class="form-group">
					  	   <h4 style="text-align: center;" class="col-sm-11">${update }</h4>
					   </div>
					  <!-- 教师编号不能修改 -->
					  <div class="form-group">
					    <label for="tPerNo" class="col-sm-2 control-label">教师编号</label>
					    <div class="col-sm-4">
					      <input type="text" id="tPerNo" name="tPerNo" value="${currentUser.tno}" class="form-control" readonly="readonly">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tPerName" class="col-sm-2 control-label">姓名</label>
					    <div class="col-sm-4">
					      <input type="text" id="tPerName" name="tPerName" value="${currentUser.tname}" class="form-control">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tPerPwd" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="tPerPwd" name="tPerPwd" value="${currentUser.password}" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tPerConfirmPwd" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="tPerConfirmPwd" name="tPerConfirmPwd" value="${currentUser.password}" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="sex" class="col-sm-2 control-label">性别</label>
					    <div class="col-sm-4">
					    <input type="radio" name="tPerSex" value=1   <c:if test="${currentUser.tsex==1 }">  checked="checked" </c:if> id="sex"/>男
					    <input type="radio" name="tPerSex" value=0   <c:if test="${currentUser.tsex==0 }">  checked="checked" </c:if> id="sex"/>女
					    </div>
					  </div>
					  <!-- 修改邮箱 -->
	  				  <div class="form-group">
					    <label for="temail" class="col-sm-2 control-label" >邮箱</label>
					    <div class="col-sm-3">
					      <input type="email" id="tPerEmail" name="tPerEmail" value="${currentUser.email}" class="form-control">
					    </div>
					    <div style="margin-left: -16px" class="col-sm-2">
					      <input type="button"  class="btn btn-primary" value="邮箱验证" >
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="teValidate" class="col-sm-2 control-label">验证码</label>
					    <div class="col-sm-4">
					      <input type="text" id="tPerEmailVali" name="tPerEmailVali"  class="form-control">
					    </div>
					  </div>
					  <div class="col-sm-offset-2 col-sm-6">
					    <button type="submit" class="btn btn-primary" style="width:125px">修改</button>
					  </div>			 
					</form>
				</div>
				</div>
				</div>
				</div>
</body>
</html>