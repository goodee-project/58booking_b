<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 로그인</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6Le3zdgkAAAAAB-KdwNdhkNCF9M77Dcm7ltjA0Cd"></script>
<script>
	$(document).ready(function(){
		
		// 구글 리캡챠
		grecaptcha.ready(function() {
			grecaptcha.execute('6Le3zdgkAAAAAB-KdwNdhkNCF9M77Dcm7ltjA0Cd', {action: 'login'}).then(function(token) {
				// 토큰을 받아다가 g-recaptcha 에다가 값을 넣어줍니다.
				console.log(token)
				$.ajax({
					url: '${pageContext.servletContext.contextPath}/robot/token',
					type : 'POST',
					dataType: 'json',
					data : {'token': token},
					success : function(result){
						console.log(result);
					},
					fail: function(e){
					console.log("fail")
					}
				});// end ajax
			});
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
	<h2>login company</h2>
	<form action="${pageContext.request.contextPath}/loginCompany" method="post" id="loginForm">
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
		<input type="text" id="g-recaptcha-response" name="g-recaptcha-response">
		<button type="button" id="loginBtn">company login</button>
	</form>
	
<script type="text/javascript">
	grecaptcha.ready(function() {
		grecaptcha.execute('CLIENT_API_KEY', {action: 'homepage'}).then(function(token) {
			// 토큰을 받아다가 g-recaptcha 에다가 값을 넣어줍니다.
			document.getElementById('g-recaptcha').value = token;
		});
	});
</script>
</body>
</html>