<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>考试成绩单</title>
<link type="text/css" rel="stylesheet" href="css/bird-style.css">
<link rel="stylesheet" href="${ctx }/css/examResult_files/reset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="${ctx }/css/examResult_files/style.css"> <!-- Resource style -->
	<link rel="stylesheet" href="css/bootstrap-3.3.4.css">
</head>

<body>
  
	
    
    
<div id="sky">
	<div class="" style="position: relative; left: 100px;top: 50px;" >
	<div class="row">
        <div class="btn-group">
          <a href="${ctx }/StudentServlet?method=indexUI"><button class="btn btn-default" type="button" >返回首页</button></a>
        </div>
    </div>
    </div>
    
	
  <div class="bird">
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="wind"></div>
    <div class="bird_body">
      <div class="bird_head"></div>
      <div class="bird_wing_left">
        <div class="bird_wing_left_top"></div>
      </div>
      <div class="bird_wing_right">
        <div class="bird_wing_right_top"></div>
      </div>
      <div class="bird_tail_left"></div>
      <div class="bird_tail_right"></div>
    </div>
    
  </div>
  <span style="font-size: 40px;">您的考试成绩为</span>
  <span style="color: #D43F3A;font-size: 45px;">${grade}</span>
  <span style="font-size: 40px;">分</span>
  
</div>

</body>
</html>