<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>选择试卷</title>

		<script src="${ctx}/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css" />
		<script src="${ctx}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		
		
	<head/>	
	<body>
	
		<div class="col-sm-12" style="height: 200px;"></div>
		<div class="container">
			<form id="registerForm" class="form-vertical" action="${ctx }/QuestionServlet?method=toSelectPaper"  method="post">
			    <div class="form-group col-sm-12">
					<div class="col-sm-3"></div>
				    <label for="subjectLb" class="col-sm-2 control-label"><font size="5">请选择科目</font></label>
				    <div class="col-sm-3">
				     <select name="subject" id="subject" class="form-control">
				     	<option value="0">----</option>
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