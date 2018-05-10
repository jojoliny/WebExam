<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0044)http://www.sucaihuo.com/jquery/23/2393/demo/ -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<title>动画切换的登录和注册窗口</title>
	<link type="text/css" rel="stylesheet prefetch" href="/WebExam/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet prefetch" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900&amp;subset=latin,latin-ext">
	<link type="text/css" rel="stylesheet" href="/WebExam/css/style.css">
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
	
</head>

<body>


<div class="materialContainer">
	<form action="${ctx }/StudentServlet?method=toLogin" method="post">
	   <div class="box">
	      <div class="title" >登录</div>
	      <dt>
				<strong>${loginMsg}</strong>
		  </dt>
	      <div class="input" style="height: 45px;">
	         <label for="name">用户名</label>
	         <input type="text" name="name" id="name" value="${currentUser.getSno()}">
	         <span class="spin"></span>
	      </div>
	      <div class="input" style="height: 45px;">
	         <label for="pass">密码</label>
	         <input type="password" name="pass" id="pass" value="${currentUser.getPassword()}">
	         <span class="spin"></span>
	      </div>
	       <div class="input" style="height: 45px; width: 200px;">
	         <label for="validatecode">验证码</label>
	         <input type="text" name="validatecode" id="validatecode">
	         <span class="spin" ></span>
	      </div>
	      <div style="height: 45px; width: 100px;background-color: #000000; margin-top: 242px;margin-left: 250px;">
	         <img id="myCanvas2"
						src="${ctx}/ValidateCode" 
						alt="对不起，您的浏览器不支持canvas，请下载最新版浏览器!" title="验证码"
						onclick="changeValidateCode(this)" />
	      </div>
	      <div class="button login">
	         <button type="submit" id="login"><span>立即登录</span> <i class="fa fa-check"></i></button>
	      </div>
	   </div>
	</form>   
   
   <form id="registerForm" action="${ctx }/StudentServlet?method=toRegist" method="post">
	   <div class="overbox" style="overflow: initial;">
	      <div class="alt-2 material-button" style="width: 60px; height: 50px;">
	      	<span class="shape" style="width: 100%; height: 100%; transform: rotate(0deg);"></span>
	      </div>
	      <div class="title" style="display: none;">注册</div>
	      <div class="input" style="display: none;height: 45px;">
	         <label for="regname"style="">用户名</label>
	         <input type="text" name="regname" id="regname" style="">
	         <span class="spin"></span>
	      </div>
	      <div class="input" style="display: none;height: 45px;">
	         <label for="regpass"style="">密码</label>
	         <input type="password" name="regpass" id="regpass"style="">
	         <span class="spin"></span>
	      </div>
	      <div class="input" style="display: none;height: 45px;">
	         <label for="x"style="">注册邮箱</label>
	         <input type="text" name="xx" id="x"style="">
	         <span class="spin"></span>
	      </div>
	      <div class="input" style="display: none;height: 45px;width: 220px;">
	         <label for="validate"style="">验证码</label>
	         <input type="text" name="validate" id="validate" style="width：80px">
	         <span class="spin"></span>
	      </div>
	      <div class="button" style="display: none;width: 100px;margin-left: 20px;margin-bottom: -500px;">
	         <button onclick="javascript:getValidate();"><span>获取验证码</span></button>
	      </div>
	      <div class="button" style="display: none;margin-bottom: 10px; " >
		      <button type="submit"><span>
	                 	下一步
	                 </span>
	          </button>
	      
	      <!-- 	 <input type="submit" name="regist" id="regist"style="" value="下一步"> -->
	      </div>
	   </div>
   </form> 
</div>
<script type="text/javascript" src="/WebExam/js/jquery.min.js"></script>
<script type="text/javascript" src="/WebExam/js/index.js"></script>
</body>
</html>