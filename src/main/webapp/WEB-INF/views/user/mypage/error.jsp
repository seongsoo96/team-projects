<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>

<style type="text/css">
.modalMsg {font-size:15px; margin:30px 0;}
#btnModalComplete {background-color:#4EE2EC; color:white;}
</style>

<div class="container" style="height:350px;">
	<!-- 모달창 -->
	<div class="modal fade" id="mypageErrorModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body form-inline">
					<div class="form-group text-center" style="width:100%;">
						<div class="modalMsg">로그인 후 이용할 수 있습니다.</div>
						<button type="button" class="btn" id="btnModalComplete">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- .container -->

<script type="text/javascript">
$(document).ready(function() {
	
	//페이지 로드시 모달 toggle	
	$('#mypageErrorModal').modal('toggle')
	
	// 모달에서 '확인' 클릭 시 로그인 페이지로 이동
	$("#btnModalComplete").click(function() {
		location.href = "/user/member/loginForm"
	})
	
})
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>