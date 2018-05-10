<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华信学员管理系统</title>
<link rel="stylesheet" type="text/css" href="${ctx }/css/css/style1">	
<!--menu样式-->
<link rel="stylesheet" href="${ctx }/css/index.css" type="text/css"
	media="screen">
	

<!---->
<script type="text/javascript" src="${ctx }/js/jquery-3.2.1.min.js"></script>
<!--展开效果的js-->
<script type="text/javascript" src="${ctx }/js/tendina.min.js"></script>
<!--commonjs-->
<script type="text/javascript" src="${ctx }/js/common.js"></script>

</head>
<body>

	<!--菜单-->
	<div class="left-menu">
		<ul id="menu" >
		
		
			<!-- start menu -->
			<li class="menu-list " >
				<a style="cursor: pointer" class="firsta"><i
					class="glyph-icon xlcd"></i>进入考试<s class="sz"></s> 
				</a>
				<ul>
					<li><a href="${ctx}/StudentServlet?method=selectPaper" target="rightContent"><i
							class="glyph-icon icon-chevron-right1"></i>选择试卷</a>
					</li>
					<li><a href="${ctx}/StudentServlet?method=selectTeacher" target="rightContent"><i
							class="glyph-icon icon-chevron-right1"></i>选择老师</a>
					</li>
				</ul>
			</li>
			<!--end menu  -->
			
			<!-- start menu -->
			<li class="menu-list " >
				<a style="cursor: pointer" class="firsta"><i
					class="glyph-icon xlcd"></i>查看信息<s class="sz"></s> 
				</a>
				<ul>
					<li><a href="http://www.sucaihuo.com/jquery/22/2253/demo/#qu_0_44" target="rightContent"><i
							class="glyph-icon icon-chevron-right1"></i>查看成绩</a>
							<!-- 在个人信息里面进行修改个人信息   有修改和返回两个键-->
					</li>
					<li><a href="http://www.sucaihuo.com/jquery/22/2253/demo/#qu_0_44" target="rightContent"><i
							class="glyph-icon icon-chevron-right1"></i>个人信息</a>
							<!-- 在个人信息里面进行修改个人信息   有修改和返回两个键-->
					</li>
				</ul>
			</li>
			<!--end menu  -->
			
			
		</ul>
	</div>
	<!--菜单右边的iframe页面-->

</body>



</html>