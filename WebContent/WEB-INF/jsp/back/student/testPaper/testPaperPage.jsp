<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0052)http://www.sucaihuo.com/jquery/22/2253/demo/#qu_0_44 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>已考试卷</title>

<link href="${ctx }/errorPage_files/main.css" rel="stylesheet" type="text/css">
<link href="${ctx }/errorPage_files/iconfont.css" rel="stylesheet" type="text/css">
<link href="${ctx }/errorPage_files/test.css" rel="stylesheet" type="text/css">

<script src="${ctx}/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css" />
<script src="${ctx}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-3.3.4.css">


<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
}
</style>

</head>
<body>

  <div class="col-md-2" style="position: absolute;left:10px ;">
	<div class="row">
        <div class="btn-group">
          <a href="${ctx }/StudentServlet?method=indexUI"><button class="btn btn-default" type="button" >返回首页</button></a>
        </div>
    </div>
    </div><br/>
<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
				<form action="http://www.sucaihuo.com/jquery/22/2253/demo/" method="post">
					<div class="test_title">
						<!--<p class="test_time">
							<i class="icon iconfont"></i><b class="alt-1"><time class="countdown-alt-1" datetime="PT01H39M10S"><span class="item item-hh"><span class="hh-1">0</span><span class="hh-2">1</span><span class="label label-hh"></span></span><span class="separator">:</span><span class="item item-mm"><span class="mm-1">3</span><span class="mm-2">9</span><span class="label label-mm"></span></span><span class="separator">:</span><span class="item item-ss"><span class="ss-1">1</span><span class="ss-2">0</span><span class="label label-ss"></span></span></time></b>
						</p>
						<font><input type="button" name="test_jiaojuan" value="交卷"></font>-->
					</div>
					
						<div class="test_content">
							<div class="test_content_title">
								<!--共？题，合计？分-->
								<h2>已考试卷</h2>
								<p>
									<span>共</span><i class="content_lit">${totalSize}</i><span>题，</span><span>总计</span><i class="content_fs">${totalSize*5}</i><span>分</span>
								</p>
							</div>
						</div>
						<%int num=0; %>
				<c:forEach items="${pages.pageList}" var="item" varStatus="vs">
						
						<div class="test_content_nr">
							<ul>
								<!--题目-->
									<li id="qu_0_0">
										<!--#E21737;">A 为正确答案-->
										<div class="test_content_nr_tt">
											<i>${vs.count+tid}</i><span>(5分)</span><font>${item.questions}（  <span style="color: #E21737;">${item.answer}</span>）</font><b class="icon iconfont"></b>
										</div>

										<div class="test_content_nr_main">
											<ul>
												
													<li class="option">
														
														<label for="0_answer_1_option_1">
															A.
															<p class="ue" style="display: inline;">${item.questionA}</p>
														</label>
													</li>
												
													<li class="option">
														
														<label for="0_answer_1_option_2">
															B.
															<p class="ue" style="display: inline;">${item.questionB}</p>
														</label>
													</li>
												
													<li class="option">
														
														
														<label for="0_answer_1_option_3">
															C.
															<p class="ue" style="display: inline;">${item.questionC}</p>
														</label>
													</li>
												
													<li class="option">
														
														
														<label for="0_answer_1_option_4">
															D.
															<p class="ue" style="display: inline;">${item.questionD}</p>
														</label>
													</li>
												
											</ul>
										</div>
									</li>
								
									
					          </ul>
						 </div>
					</c:forEach>			
								
						
								
								
							</ul>
						</div>
					
				</form>
			
<!--页码  -->
			
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  
			  <!-- 上一页 -->
			    <li class="btn
			        <c:if test='${pages.pageIndex ==1}'>
			    	 disabled
			        </c:if>
			    ">
			      <a href="${ctx }/QuestionServlet?method=toListTestpPaperUI&pageIndex=${pages.pageIndex -1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="1" end="${pages.getTotalIndex() }"  varStatus="vs">
			    	<c:if test="${ vs.count == pages.pageIndex}">
			    		<li class="active "><a  href="${ctx }/QuestionServlet?method=toListTestpPaperUI&pageIndex=${ vs.count}">${ vs.count}</a></li>
			    	</c:if>
			    	
			    	<c:if test="${ vs.count != pages.pageIndex}">
			    		<li><a href="${ctx }/QuestionServlet?method=toListTestpPaperUI&pageIndex=${ vs.count}">${ vs.count}</a></li>
			    	</c:if>
			    </c:forEach>
			    
			    <!-- 下一页 -->
			    <li class="btn
			    	<c:if test='${pages.pageIndex==pages.totalIndex }'>
			    	 disabled
			    	</c:if>
			    ">
			      <a href="${ctx }/QuestionServlet?method=toListTestpPaperUI&pageIndex=${pages.pageIndex +1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>	
			</div>		
		</div>
		
			
						
		
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<!--<div class="rt_nr1_title">
						<h1>
							<i class="icon iconfont"></i>答题卡
						</h1>
						<p class="test_time">
							<i class="icon iconfont"></i><b class="alt-1"><time class="countdown-alt-1" datetime="PT01H39M10S"><span class="item item-hh"><span class="hh-1">0</span><span class="hh-2">1</span><span class="label label-hh"></span></span><span class="separator">:</span><span class="item item-mm"><span class="mm-1">3</span><span class="mm-2">9</span><span class="label label-mm"></span></span><span class="separator">:</span><span class="item item-ss"><span class="ss-1">1</span><span class="ss-2">0</span><span class="label label-ss"></span></span></time></b>
						</p>
					</div>-->
					
						
					
						
					
				</div>

			</div>
		</div>
	</div>
	<!--nr end-->
	<div class="foot"></div>
</div>

<script src="${ctx }/errorPage_files/jquery.js.下载"></script>
<script src="${ctx }/errorPage_files/jquery.easy-pie-chart.js.下载"></script>
<!--时间js-->
<script src="${ctx }/errorPage_files/jquery.countdown.js.下载"></script>
<script>
	window.jQuery(function($) {
		"use strict";
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
		
	});
	
	
	$(function() {
		$('li.option label').click(function() {
		debugger;
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
			
		});
	});
</script>




</body></html>