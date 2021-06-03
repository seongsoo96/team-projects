<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//모달을 전역변수로 선언
	var authNumber = false;
	var nickCheck = false;
	var idCheck = false;
	
    var modalContents = $(".modal-contents");
    var modal = $("#defaultModal");
    var regExPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 정규식
    $('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
        }
    });
    
    $(".onlyHangul").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
        }
    });

    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });
    
    
    
    
    
    //------- 검사하여 상태를 class에 적용
    $('#id').keyup(function(event){
        
        var divId = $('#divId');
        
        if($('#id').val()!="" && idCheck){
        	divId.removeClass("has-error");
            divId.addClass("has-success");
        }else{
            divId.removeClass("has-success");
            divId.addClass("has-error");
        }
    });
    
    $('#mPassword').blur(function(event){
    	console.log('blur')
        var divPassword = $('#divPassword');
         
        if(!regExPw.test($("#mPassword").val())){
        	$('#mPassword').val("");
        	
        	divPassword.removeClass("has-success");
            divPassword.addClass("has-error");
        }else{
        	divPassword.removeClass("has-error");
            divPassword.addClass("has-success");
        }
       
    });
    
    $('#passwordCheck').keyup(function(event){
        
        var passwordCheck = $('#passwordCheck').val();
        var password = $('#mPassword').val();
        var divPasswordCheck = $('#divPasswordCheck');
        
        if((passwordCheck=="") || (password!=passwordCheck)){
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
    });
    
    $('#name').keyup(function(event){
        
        var divName = $('#divName');
        
        if($.trim($('#name').val())==""){
            divName.removeClass("has-success");
            divName.addClass("has-error");
        }else{
            divName.removeClass("has-error");
            divName.addClass("has-success");
        }
    });
    
    $('#nickname').keyup(function(event){
        
        var divNickname = $('#divNickname');
        
        if($.trim($('#nickname').val())==""){
            divNickname.removeClass("has-success");
            divNickname.addClass("has-error");
        }else{
            divNickname.removeClass("has-error");
            divNickname.addClass("has-success");
        }
    });
    
    $('#email').keyup(function(event){
        
        var divEmail = $('#divEmail');
        
        if($.trim($('#email').val())==""){
            divEmail.removeClass("has-success");
            divEmail.addClass("has-error");
        }else{
            divEmail.removeClass("has-error");
            divEmail.addClass("has-success");
        }
    });
    
    $('#phoneNumber').keyup(function(event){
        
        var divPhoneNumber = $('#divPhoneNumber');
        
        if($.trim($('#phoneNumber').val())==""){
            divPhoneNumber.removeClass("has-success");
            divPhoneNumber.addClass("has-error");
        }else{
            divPhoneNumber.removeClass("has-error");
            divPhoneNumber.addClass("has-success");
        }
    });
    
	$('#birth').change(function(event){
        
        var divBirth = $('#divBirth');
        
        if($.trim($('#birth').val())==""){
        	divBirth.removeClass("has-success");
        	divBirth.addClass("has-error");
        }else{
        	divBirth.removeClass("has-error");
        	divBirth.addClass("has-success");
        }
    });
    
	$('#account').change(function(event){
        
        var divAccount = $('#divAccount');
        
        if($.trim($('#account').val())==""){
        	divAccount.removeClass("has-success");
        	divAccount.addClass("has-error");
        }else{
        	divAccount.removeClass("has-error");
        	divAccount.addClass("has-success");
        }
    });
    
    $('#btnEmail').click(function(){
    	var divEmailAuth = $('#divEmailAuth');
    	divEmailAuth.css('display', 'block');
    	
    	
    })
	
	
    //------- validation 검사
    $( "form" ).submit(function( event ) {
        
        var provision = $('#provision');
        var memberInfo = $('#memberInfo');
        var divId = $('#divId');
        var divPassword = $('#divPassword');
        var divPasswordCheck = $('#divPasswordCheck');
        var divName = $('#divName');
        var divNickname = $('#divNickname');
        var divEmail = $('#divEmail');
        var divPhoneNumber = $('#divPhoneNumber');
        var divBirth = $('#divBirth');
        var divAccount = $('#divAccount');
        var divPost = $('#divPost');
        var divDetailAddress = $('#divDetailAddress');
        
        
        //회원가입약관
        if($('#provisionYn:checked').val()=="N"){
            modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
            modal.modal('show'); //모달 띄우기
            
            provision.removeClass("has-success");
            provision.addClass("has-error");
            $('#provisionYn').focus();
            return false;
        }else{
            provision.removeClass("has-error");
            provision.addClass("has-success");
        }
        
        //개인정보취급방침
        if($('#memberInfoYn:checked').val()=="N"){
            modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
            modal.modal('show');
            
            memberInfo.removeClass("has-success");
            memberInfo.addClass("has-error");
            $('#memberInfoYn').focus();
            return false;
        }else{
            memberInfo.removeClass("has-error");
            memberInfo.addClass("has-success");
        }
        
        //아이디 검사
        if($('#id').val()==""){
            modalContents.text("아이디를 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divId.removeClass("has-success");
            divId.addClass("has-error");
            $('#id').focus();
            return false;
        }else{
            divId.removeClass("has-error");
            divId.addClass("has-success");
        }
        
        //아이디 중복 검사
        if(!idCheck){
        	modalContents.text("아이디 중복을 확인해주세요");
            modal.modal('show');
            divId.removeClass("has-success");
            divId.addClass("has-error");
            $('#id').focus();
            return false;
        }else{
            divId.removeClass("has-error");
            divId.addClass("has-success");
        }
        
      //아이디 중복 검사
        if(!nickCheck){
        	modalContents.text("닉네임 중복을 확인해주세요");
            modal.modal('show');
            divNickname.removeClass("has-success");
            divNickname.addClass("has-error");
            $('#nick').focus();
            return false;
        }else{
        	divNickname.removeClass("has-error");
        	divNickname.addClass("has-success");
        }
        
        //패스워드 검사
        if($('#mPassword').val()==""){
            modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divPassword.removeClass("has-success");
            divPassword.addClass("has-error");
            $('#mPassword').focus();
            return false;
        }else{
            divPassword.removeClass("has-error");
            divPassword.addClass("has-success");
        }
        
        //패스워드 확인
        if($('#passwordCheck').val()==""){
            modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
            $('#passwordCheck').focus();
            return false;
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
        
        //패스워드 비교
        if($('#mPassword').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
            modalContents.text("패스워드가 일치하지 않습니다.");
            modal.modal('show');
            
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
            $('#passwordCheck').focus();
            return false;
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
        
        //이름
        if($('#name').val()==""){
            modalContents.text("이름을 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divName.removeClass("has-success");
            divName.addClass("has-error");
            $('#name').focus();
            return false;
        }else{
            divName.removeClass("has-error");
            divName.addClass("has-success");
        }
        
        //별명
        if($('#nickname').val()==""){
            modalContents.text("별명을 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divNickname.removeClass("has-success");
            divNickname.addClass("has-error");
            $('#nickname').focus();
            return false;
        }else{
            divNickname.removeClass("has-error");
            divNickname.addClass("has-success");
        }
        
        //이메일
        if($('#email').val()==""){
            modalContents.text("이메일을 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divEmail.removeClass("has-success");
            divEmail.addClass("has-error");
            $('#email').focus();
            return false;
        }else{
            divEmail.removeClass("has-error");
            divEmail.addClass("has-success");
        }
        
        //휴대폰 번호
        if($('#phoneNumber').val()==""){
            modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divPhoneNumber.removeClass("has-success");
            divPhoneNumber.addClass("has-error");
            $('#phoneNumber').focus();
            return false;
        }else{
            divPhoneNumber.removeClass("has-error");
            divPhoneNumber.addClass("has-success");
        }
        
        if($('#birth').val()==""){
            modalContents.text("생년월일을 선택해주세요");
            modal.modal('show');
            
            divBirth.removeClass("has-success");
            divBirth.addClass("has-error");
            $('#birth').focus();
            return false;
        }else{
        	divBirth.removeClass("has-error");
        	divBirth.addClass("has-success");
        }
        
        if($('#account').val()==""){
            modalContents.text("계좌 번호를 입력하여 주시기 바랍니다.");
            modal.modal('show');
            
            divAccount.removeClass("has-success");
            divAccount.addClass("has-error");
            $('#account').focus();
            return false;
        }else{
        	divAccount.removeClass("has-error");
        	divAccount.addClass("has-success");
        }
        
        
        //우편 번호
        if($('#post').val()==""){
        	modalContents.text("우편번호를 선택해주세요");
        	modal.modal('show');
        	
        	divPost.removeClass("has-success");
        	divPost.addClass("has-error");
        	$('#post').focus();
            return false;
        }else{
        	divPost.removeClass("has-error");
        	divPost.addClass("has-success");
        }
        
        //상세 주소
        if($('#detailAddress').val()==""){
        	modalContents.text("상세 주소를 입력해주세요");
        	modal.modal('show');
        	
        	divDetailAddress.removeClass("has-success");
        	divDetailAddress.addClass("has-error");
        	$('#detailAddress').focus();
            return false;
        }else{
        	divDetailAddress.removeClass("has-error");
        	divDetailAddress.addClass("has-success");
        }
        
        if(!authNumber){
        	modalContents.text("이메일 인증을 완료해주세요");
        	modal.modal('show');
        	
        	return false;
        }
        
        
    
    });	
    $("#btnReset").click(function(){
    	 $("#id").attr("readonly", false);
    	 $("#emailAuth").attr("readonly", false);
    	 $("#nickname").attr("readonly", false);
    	 idCheck= false;
    	 authNumber= false;
    	 nickCheck=false;
    })
    
    
   	$("#btnIdCheck").click(function(){
   		var id = $("#id").val();
   		var divId = $('#divId');
	   	$.ajax({
	 		type: "post"
	 		, url: "/user/member/idCheck"
	 		, dataType: "json"
	 		, data: {
	 			mId: id
	 		}
	 		, success: function(res){
	 			
	 			console.log("success")
	 			console.log(id)
	 			console.log(res)
	 			idCheck= res.isId;
	 			console.log(idCheck);
	 			
	 			if(idCheck){
	 				divId.removeClass("has-error");
	 	            divId.addClass("has-success");
	 	            $("#id").attr("readonly", true);
	 			}else{
	 				divId.removeClass("has-success");
	 				divId.addClass("has-error");
	 			}
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});		
   	}) 
   	$("#btnNickCheck").click(function(){
   		var nick = $("#nickname").val();
   		var divNickname = $('#divNickname');
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/nickCheck"
	 		, dataType: "json"
	 		, data: {
	 			mNick: nick
	 		}
	 		, success: function(res){
	 			
	 			console.log("success")
	 			console.log(nick)
	 			console.log(res)
	 			nickCheck= res.isNick;
	 			console.log(nickCheck);
	 			
	 			if(nickCheck){
	 				divNickname.removeClass("has-error");
	 				divNickname.addClass("has-success");
	 	            $("#nickname").attr("readonly", true);
	 			}else{
	 				divNickname.removeClass("has-success");
	 				divNickname.addClass("has-error");
	 			}
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});		
   	})
   	$("#btnEmailCheck").click(function(){
   		var email = $("#email").val();
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/check"
	 		, dataType: "json"
	 		, data: {
	 			email: email
	 		}
	 		, success: function(res){
	 			console.log("success")
	 			console.log(res.isEmail)
	 			if(res.isEmail){ //중복일 경우
	 				modalContents.text("이메일이 중복 되어있습니다.");
	 	        	modal.modal('show');
	 			}else{//중복이 아닌경우
	 				$("#email").attr("readonly", true);
	 				$("#btnEmailCheck ").attr("disabled",true);
	 				$("#btnEmail").attr("disabled", false);
	 			}
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});	
   	})
   	
   	
   	$("#btnEmail").click(function(){
   		var email = $("#email").val();
   		
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/send"
	 		, dataType: "json"
	 		, data: {
	 			email: email
	 		}
	 		, success: function(res){
	 			
	 			console.log("success")
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});		
   	})
   		
   		$("#btnEmailAuth").click(function(){
   		var divEmailAuth = $('#divEmailAuth');
   		var authKey = $("#emailAuth").val();
   		
   		$.ajax({
	 		type: "post"
	 		, url: "/user/member/email/auth"
	 		, dataType: "json"
	 		, data: {
	 			emailAuth: authKey
	 		}
	 		, success: function(res){
	 			//인증 성공
	 			if(res.isAuth){
	 				console.log("인증 완료");
	 				authNumber=true;
	 	   			$("#emailAuth").attr("readonly", true);
	 	   			divEmailAuth.removeClass("has-error");
	 	   			divEmailAuth.addClass("has-success");
	 			}else{ //인증 실패
	 				authNumber=false;
	 	   			divEmailAuth.removeClass("has-success");
	 	   			divEmailAuth.addClass("has-error");
	 			}
	 			
	 		}
	 		, error: function() {
	 			console.log("error");
	 		}
	 	});
   		
   	})
   
    
})
function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }


</script>

<div class="container">
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
    <form class="form-horizontal" role="form" method="post" action="/user/member/join"> 
                <div class="form-group">
                    <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
                    <div class="col-lg-10" id="provision">
                        <textarea class="form-control" rows="8" style="resize:none">약관동의
여러분을 환영합니다.

PpeonFun 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 PpeonFun 서비스의 이용과 관련하여 PpeonFun서비스를 제공하는  PpeonFun 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 PpeonFun 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 
PpeonFun 서비스를 이용하시거나 PpeonFun 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 

회원으로 가입하시면 PpeonFun 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, PpeonFun는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 PpeonFun 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 PpeonFun서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 PpeonFun서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 PpeonFun 회원가입 방법 등에서 확인해 주세요. 
여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
PpeonFun는 여러분이 게재한 게시물이 PpeonFun 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 PpeonFun 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로구성된 각종 콘텐츠 자체 또는 파일을 말합니다. 
PpeonFun는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다. 
PpeonFun는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 PpeonFun 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만제한적으로 행사할 것입니다.
만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다. 
또한 여러분이 제공한 소중한 콘텐츠는 PpeonFun 서비스를 개선하고 새로운 PpeonFun 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 PpeonFun 및 PpeonFun 계열사에서 사용될 수 있습니다. PpeonFun는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다. 
PpeonFun는 여러분이 자신이 제공한 콘텐츠에 대한 PpeonFun 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 PpeonFun 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
다만, 일부 PpeonFun 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다. 

여러분의 개인정보를 소중히 보호합니다.
PpeonFun는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. PpeonFun가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다. 
PpeonFun는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다. 
타인의 권리를 존중해 주세요.
여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. PpeonFun는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요. 
한편, PpeonFun 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다. 
PpeonFun 여러분이 PpeonFun 서비스를 마음껏 이용할 수 있도록 여러분께 PpeonFun 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 PpeonFun가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요. 
PpeonFun는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다. 
부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.
PpeonFun는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 PpeonFun가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다. 
또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, PpeonFun는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 PpeonFun 서비스 이용에 대한 주의를 당부하거나, PpeonFun 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 PpeonFun 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다. 
부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다. 
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="provisionYn" name="provisionYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
                    <div class="col-lg-10" id="memberInfo">
                        <textarea class="form-control" rows="8" style="resize:none">개인정보의 항목 및 수집방법
개인정보보호법에 따라 PpeonFun에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.


1. 수집하는 개인정보

이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 PpeonFun 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, PpeonFun는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.


회원가입 시점에 PpeonFun가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호,이메일’를 필수항목으로 수집합니다. 

서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.

PpeonFun 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.

구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
PpeonFun에서 제공하는 위치기반 서비스에 대해서는 'PpeonFun 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다. 


2. 수집한 개인정보의 이용

PpeonFun 및 PpeonFun 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 PpeonFun 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.


3. 개인정보의 보관기간

PpeonFun는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. PpeonFun는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다. 
- 전자상거래 등에서 소비자 보호에 관한 법률 
계약 또는 청약철회 등에 관한 기록: 5년 보관 
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 
- 전자문서 및 전자거래 기본법 
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관 
- 통신비밀보호법 
로그인 기록: 3개월

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
                        </textarea>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
                                동의합니다.
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
                                동의하지 않습니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" style="display:inline-block; width:87%;" id="id" name="mId" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                    	<button type="button" id="btnIdCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" >아이디 중복</button>
                    </div>
                    
                </div>
                
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control passwordReg" id="mPassword" name="mPassword" data-rule-required="true" placeholder="최소 8자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" name="mName" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                
                <div class="form-group" id="divNickname">
                    <label for="inputNickname" class="col-lg-2 control-label">별명</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" style="display:inline-block; width:87%;" id="nickname" name="mNick" data-rule-required="true" placeholder="별명" maxlength="15">
                    	<button type="button" id="btnNickCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" >닉네임 중복</button>
                    </div>
                </div>
                
                
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" style="display:inline-block; width:75%;" id="email" name="mEmail" data-rule-required="true" placeholder="이메일" maxlength="40">
                        <button type="button" id="btnEmailCheck" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;">이메일 중복</button>
                        <button type="button" id="btnEmail" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" disabled>이메일 인증</button>
                    </div>
                </div>
                
                <div class="form-group" id="divEmailAuth" style="display:none;">
                    <label for="emailAuth" class="col-lg-2 control-label">인증번호</label>
                    <div class="col-lg-10">
                        <input type="text" id="emailAuth"  class="form-control onlyNumber" style="display:inline-block; width:87%;" name="emailAuth" data-rule-required="true" placeholder="인증번호" maxlength="6">
                        <button type="button" id="btnEmailAuth" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;">인증하기</button>
                    </div>
                </div>
                
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="mPhone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="gender" name="mGender">
                            <option value="M">남</option>
                            <option value="F">여</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group" id="divBirth">
                    <label for="birth" class="col-lg-2 control-label">생년월일</label>
                    <div class="col-lg-10">
                        <input type="date" class="form-control" id="birth" name="birth" data-rule-required="true" placeholder="생년 월일을 선택하세요">
                    </div>
                </div>
                
                <div class="form-group" id ="divAccount">
    			<label for="account" class="col-sm-2 control-label">계좌</label>
     			<div class="col-lg-5">
   				 <input type="text" class="form-control onlyNumber" id="account" name="mAccount" placeholder="계좌번호(숫자만)"/>
    			</div>
   				<div class="col-lg-5" >
    				<select class="form-control" id="bank" name="mBank">
						<option>KB국민은행</option>		  
						<option>SC제일은행</option>		
						<option>경남은행</option>			
						<option>광주은행</option>			
						<option>기업은행</option>			
						<option>농협</option>			
						<option>대구은행</option>			
						<option>부산은행</option>		
						<option>산업은행</option>			
						<option>새마을금고</option>			
						<option>수협</option>			
						<option>신한은행</option>			
						<option>신협</option>			
						<option>외환은행</option>			
						<option>우리은행</option>			
						<option>우체국</option>			
						<option>전북은행</option>			
						<option>축협 </option>			
						<option>카카오뱅크</option> 		
						<option>케이뱅크</option>			
						<option>하나은행(서울은행)</option>		
						<option>한국씨티은행(한미은행)</option> 
					</select>
					</div>
				</div>
                
                
                
                <div class="form-group" id="divPost">
				    <label for="post" class="col-sm-2 control-label">우편주소</label>
					 <div class="col-lg-10">
					<input type="text" class="form-control"  class="form-control" style="display:inline-block; width:85%;" id="post" name="mPost" placeholder="우편번호" readonly>
					<button type="button" class="btn btn-default" style="padding-top:5px; margin-bottom:5px;" onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>
				</div>
                
                <div class="form-group">
				    <label for="address" class="col-sm-2 control-label">주소</label>
					 <div class="col-lg-10">
					<input type="text" class="form-control"  class="form-control" id="address" name="mAddress" placeholder="주소" readonly>
					</div>
				</div>
                <div class="form-group" id="divDetailAddress">
				    <label for="detailaddress" class="col-sm-2 control-label">상세 주소</label>
					<div class="col-lg-8">
						<input type="text" class="form-control"  class="form-control" id="detailAddress" name="mDetailAddress" placeholder="상세주소">
					</div>
					<div class="col-lg-2">
						<input type="text" class="form-control" id="extraAddress" placeholder="참고항목" readonly>
					</div>
				</div>
                
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">회원가입</button>
                        <a href="/main"><button type="button" class="btn btn-info">메인</button></a>
                        <button id="btnReset" type="reset" class="btn btn-danger">다시 입력하기</button>
                    </div>
                </div>
            </form>
        
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>