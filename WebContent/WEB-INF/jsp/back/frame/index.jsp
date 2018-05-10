<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/common_tag.jsp"%>

	<frameset rows="11%,*,10%" frameborder="no">
		<frame name="top"  src="${ctx}/StudentServlet?method=toTopUI"/>
		<frameset cols="20%,*"> 
			<frame name="left" src="${ctx}/StudentServlet?method=toLeftUI"/>
			<frame name="rightContent" />
		</frameset>
		<frame name="bottom" src="${ctx}/StudentServlet?method=toBottomUI" />
	</frameset>

	<!--弹出框效果-->
	<script>
		$(document).ready(function() {
			//弹出文本性提示框
			$("#showPopTxt").click(function() {
				$(".pop_bg").fadeIn();
			});

			//弹出：取消或关闭按钮
			$(".falseBtn").click(function() {

				$(".pop_bg").fadeOut();
			});
			//弹出：确认按钮
			$(".trueBtn").click(function() {

				$(".pop_bg").fadeOut();
			});
			$(".pop_bg").fadeIn();
		});
	</script>

</html>