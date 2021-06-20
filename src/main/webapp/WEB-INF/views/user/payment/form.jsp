<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style type="text/css">
.circle{
	display:inline-block;
	width: 200px;
	heihgt: 200px;
	border-radius:50%;
	background:#FFFFFF;
	border: 1px dotted #000;
	font-size: 16px;
	text-align:center;
	line-height:200px;
	margin: 0 8%;
}
.active{
	background:#00d3d3;
	border: 1px solid #00d3d3;
}
.col-lg-12{
	margin-bottom: 50px;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	// iamport 변수 초기화
	var IMP = window.IMP;
	IMP.init('imp81015790');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다
	//결제 모듈 불러오기
	requestPayment();
});

// 결제 요청 - 결제 모듈 불러오기
function requestPayment() {
	IMP.request_pay({
	    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
	    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
	    name : '${project.pName}의 펀딩', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
	    amount : ${amount}, //결제금액 - 필수항목
	    buyer_email : '${member.mEmail}', //주문자Email - 선택항목
	    buyer_name : '${member.mName}', //주문자명 - 선택항목
	    buyer_tel : '${member.mPhone}', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
	    buyer_addr : '${member.mAddress} ${member.mDetailAddress}', //주문자주소 - 선택항목
	    buyer_postcode : '${member.mPost}', //주문자우편번호 - 선택항목
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작
	    
	}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
	    if ( rsp.success ) { // 결제 성공 로직
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        msg += '결제명' + rsp.name;
	        msg += '[rsp.success]';

			$("input[name='paymName']").val(rsp.name);
	        $("input[name='paymImpUid']").val(rsp.imp_uid);
	        $("input[name='paymMerchantUid']").val(rsp.merchant_uid);
	        $("input[name='paymAmount']").val(rsp.paid_amount);
	        $("input[name='paymApplyNum']").val(rsp.apply_num);
	        $("input[name='paymState']").val('Y');
	        
	        $("form").submit();
	        
	        
	       
	        
	    } else { // 결제 실패 로직
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        location.href="/story?pNo=${project.pNo}";
	        
	    }
	    alert(msg);
	});
	
}

</script>
<div class="container">
<div class="circle">리워드선택</div>
<div class="circle active">결제</div>
<div class="circle">결제완료</div>
<form style="display: none" action="/user/payment/complete" method="post">
<c:forEach items="${rewardCount }" var="info">
	<input type="hidden" name="reward" value="${info.key }">
	<input type="hidden" name="count" value="${info.value }">
</c:forEach>

<input type="hidden" name="suAddMoney" value=${suAddMoney }>
<input type="hidden" name="pNo" value="${project.pNo }">
<input type="text" name="paymName"/>
<input type="text" name="paymAmount" />
<input type="text" name="paymApplyNum" />
<input type="text" name="paymImpUid" />
<input type="text" name="paymMerchantUid" />
<input type="text" name="paymState" />
</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
