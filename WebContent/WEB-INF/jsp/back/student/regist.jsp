<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
<title>regist</title>
<!-- 字段名已修改
注册界面
学生（
学号 sno
姓名 sname
密码 spwd
确认密码 sConfirmPwd
性别 sex
邮箱 email
邮箱验证码 eValidate
）

教师（
学号 tno
姓名 ntame
密码 tpwd
确认密码 tConfirmPwd
性别 tsex
邮箱 temail
邮箱验证码 teValidate
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
<link href="${ctx }/css/test-center.css" rel='stylesheet' type='text/css' />
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
			$("#stuRegForm").bootstrapValidator({
				message : '该值不合法',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					sno : {
						message : '学号不合法',
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
								message : '用户名只能为字母、数字、下划线'
							},
							/* different: { //不同验证
		                        field: 'password',
		                        message: '用户名不能与密码相同'
		                    },*/
		                    
						}
					}, //用户名验证结束
					sname : {
						message : '姓名不合法',
						validators : {
							notEmpty : { //非空验证
								message : '姓名不能为空'
							},
						}
					},
					spwd: {
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
		                        field: 'sno',
		                        message: '密码不能与学号相同'
		                    }
						}
					}, //密码验证结束
					sConfirmPwd:{
						message: '两次密码不一致',
						validators:{
							notEmpty: {
								message : '请确认密码'
							},
							identical: {
		                        field: 'spwd',
		                        message: '两次密码不一致'
		                    }
						}
					}, 
					email:{
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
					eValidate:{
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
				}// end of student_reg fields

			});
			//====================
			$("#teaRegForm").bootstrapValidator({
				message : '该值不合法',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					tno : {
						message : '教师编号不合法',
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
								regexp : /^[0-9a-zA-Z_.]+$/,
								message : '用户名只能为字母、数字、下划线'
							},
							 /* different: { //不同验证
		                        field: 'tConfirmPwd',
		                        message: '用户名不能与密码相同'
		                    } */
		                     remote: {
		                    	type:'POST',
		                    	url:'${ctx}/TeacherServlet?method=checkUsername_Json',
		                    	message:'该用户名已被占用'
		                    }  
						}
					}, //用户名验证结束
					tname : {
						message : '姓名不合法',
						validators : {
							notEmpty : { //非空验证
								message : '姓名不能为空'
							},
							
						}
					},
					tpwd: {
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
		                        field: 'sno',
		                        message: '密码不能与学号相同'
		                    }
						}
					}, //密码验证结束
					 tConfirmPwd:{
						message: '两次密码不一致',
						validators:{
							notEmpty: {
								message : '请确认密码'
							},
							identical: {
		                        field: 'tpwd',
		                        message: '两次密码不一致'
		                    }
						}
					}, 
					temail:{
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
					teValidate:{
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
				}// end of teacher_reg fields
		});
		});

		// 改变验证码图片
		function changeValidateImage() {
			var img = document.getElementById("validateImage");
			img.src = "${basePath}/validationCode.do?t=" + (new Date()).valueOf();
		}

		// 重置按钮的点击事件
		function resetForm() {
			$('#registerForm').data('bootstrapValidator').resetForm(true);
		}
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
									<li  <c:if test="${currentUser!=null }">class="btn disabled"</c:if>><a href="${ctx }/StudentServlet?method=loginUI">登录系统</a></li>
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
			 <!-- end header menu -->
		    <div class="clearfix"> </div>
	</div>
    <!-- header -->
    <!-- 注册界面 -->
	
	<div class="container " >
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="container " style="margin-top: 20px">
		
			<ul class="nav nav-pills" role="tablist">
			  <li role="presentation" class="active"><a href="#student_reg" aria-controls="student_reg" role="tab" data-toggle="tab">学生注册</a></li>
		      <li role="presentation"><a href="#teacher_reg" aria-controls="teacher_reg" role="tab" data-toggle="tab">教师注册</a></li>
			</ul>
			
			<div class="tab-content ">
			<!-- 学生注册表 -->
				<div role="tabpanel" class="tab-pane active" id="student_reg">
					<form id="stuRegForm" class="form-horizontal" action="${ctx }/StudentServlet?method=toRegist"  method="post">
					  
					   <div class="form-group header">
					  	<h4 class="col-sm-11"></h4>
					  </div>
					  <div class="form-group">
					    <label for="sno" class="col-sm-2 control-label">学号</label>
					    <div class="col-sm-4">
					      <input type="text" id="sno" name="sno" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="sname" class="col-sm-2 control-label">姓名</label>
					    <div class="col-sm-4">
					      <input type="text" id="sname" name="sname" class="form-control">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="spwd" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="spwd" name="spwd" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="sConfirmPwd" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="sConfirmPwd" name="sConfirmPwd" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="sex" class="col-sm-2 control-label">性别</label>
					    <div class="col-sm-4">
					      <input type="radio" name="sex" value=1 id="sex"/>男
						  <input type="radio" name="sex" value=0 id="sex"/>女
					    </div>
					  </div>
	  
					  
				      <div class="form-group">
					    <label for="email" class="col-sm-2 control-label">邮箱</label>
					    <div class="col-sm-3">
					      <input type="email" id="email" name="email" class="form-control">
					    </div>
					    <div style="margin-left: -16px" class="col-sm-2">
					      <input type="button"  class="btn btn-primary" value="邮箱验证" >
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="eValidate" class="col-sm-2 control-label">验证码</label>
					    <div class="col-sm-4">
					      <input type="text" id="eValidate" name="eValidate" class="form-control">
					    </div>
					  </div>
					  <div class="col-sm-offset-2 col-sm-6">
					    
					    <button type="submit" class="btn btn-primary" style="width:125px;  margin-left:-10px">注册</button>
					    <button type="reset" class="btn btn-primary" onclick="javascript:resetForm();" style="width:125px;">重置</button>
					  </div>			 
					</form>
				</div>
			<!-- 教师注册表 -->
				<div role="tabpanel" class="tab-pane" id="teacher_reg">
				    <form id="teaRegForm" class="form-horizontal" action="${ctx }/TeacherServlet?method=toRegist"  method="post">
					   <div class="form-group header">
					  	<h4 class="col-sm-11"></h4>
					  </div>
					  <div class="form-group">
					    <label for="tno" class="col-sm-2 control-label" >教师编号</label>
					    <div class="col-sm-4">
					      <input type="text" id="tno" name="tno" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tname" class="col-sm-2 control-label">姓名</label>
					    <div class="col-sm-4">
					      <input type="text" id="tname" name="tname" class="form-control">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tpwd" class="col-sm-2 control-label" >密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="tpwd" name="tpwd" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tConfirmTpwd" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-4">
					      <input type="password" id="tConfirmPwd" name="tConfirmPwd" class="form-control" placeholder="仅支持字母数字下划线">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="tsex" class="col-sm-2 control-label">性别</label>
					    <div class="col-sm-4">
					      <input type="radio" name="tsex" value=1 id="tsex"/>男
						  <input type="radio" name="tsex" value=0 id="tsex"/>女
					    </div>
					  </div> 
				      <div class="form-group">
					    <label for="temail" class="col-sm-2 control-label" >邮箱</label>
					    <div class="col-sm-3">
					      <input type="email" id="temail" name="temail"  class="form-control">
					    </div>
					    <div style="margin-left: -16px" class="col-sm-2">
					      <input type="button"  class="btn btn-primary" value="邮箱验证" >
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="teValidate" class="col-sm-2 control-label">验证码</label>
					    <div class="col-sm-4">
					      <input type="text" id="teValidate" name="teValidate"  class="form-control">
					    </div>
					  </div>
					  <div class="col-sm-offset-2 col-sm-6">
					    <button type="submit" class="btn btn-primary" style="width:125px; margin-left:-10px">注册</button>
					    <button type="reset" class="btn btn-primary" onclick="javascript:resetForm();" style="width:125px; ">重置</button>
					  </div>		 
					</form>
				</div>
				</div>
				</div>
				</div>
				</div>
    
   
    

    </body>
</html>
