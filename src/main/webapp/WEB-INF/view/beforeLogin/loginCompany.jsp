<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 로그인</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- 리캡챠 -->
<script src="https://www.google.com/recaptcha/api.js"></script>
<script>
	
	// 쿠키 설정 변경(리캡챠 사용위함)
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
	
	$(document).ready(function(){	
		// 사이트 키 값은 등록한 도메인에 매핑됨
		// 구글 리캡챠
		
		$('#test').click(function(){
			alert( document.cookie );
		});
		
		// 로그인 유효성
		$('#loginBtn').click(function(){
			
			if($('#id').val() == ''){
				alert('아이디를 입력해주세요.');
				return;
			}
			
			if($('#pw').val() == ''){
				alert('비밀번호를 입력해주세요.');
				return;
			}
			

			
			$('#loginForm').submit();
		});
	});
</script>
</head>
<body>
<!-- 
			var captcha = 1;
			$.ajax({
	            url:'/verifyRecaptcha'
	            , type:'post'
	            , data:{recaptcha: $(".g-recaptcha-response").val()}
	            , success: function(data) {
	                switch (data) {
                    case 0:
                        console.log("자동 가입 방지 봇 통과");
                        captcha = 0;
                		break;
                    case 1:
                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                        break;
                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		break;
	                }
	            }
	        });
			
			if(captcha != 0) {
				return false;
			}

 -->
	<button type=button id="test">dddd</button>
	<h2>login company</h2>
	<form action="${pageContext.request.contextPath}/beforeLogin/loginCompany" method="post" id="loginForm">
		<!-- 로그인 폼 -->
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="id" name="companyId">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" id="pw" name="companyPw">
				</td>
			</tr>
		</table>
		
		<!-- 로그인 정보 저장 여부 -->
		<div>
			<span>
				<label><input type="checkbox" id="saveLoginInfo">로그인 정보 저장</label>
			</span>
		</div>
		
		<!-- 리캡챠 -->
		<div class="g-recaptcha" data-sitekey="6LevqtkkAAAAALTd1rpqiYdFT1OHY14wxlqMG89a"></div>
		
		<!-- 아이디찾기/비밀번호 찾기 링크 -->
		<div>
			<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디 찾기</a>
			<span> | </span>
			<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호 찾기</a>
		</div>
		
		<!-- 로그인 버튼 -->
		<div>
			<button type="button" id="loginBtn">login</button>
		</div>
		
		<!-- 회원가입 링크 -->
		<div>
			<a href="${pageContext.request.contextPath}/beforeLogin/addCompany">업체가입</a>
		</div>
	</form>
</body>
</html>