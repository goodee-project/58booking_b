<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 비밀번호 찾기</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
	<h2>업체 비밀번호 찾기</h2>
	<!-- 정보입력 폼 -->
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" name="companyId">
				<div id="idMsg" style="color: red;"></div>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="email1" name="companyEmail1">
				<span>@</span>
				<select id="email2" name="companyEmail2">
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
				</select>
				<button type="button" id="emailCkBtn">인증번호 발송</button>
				<div id="emailMsg" style="color: red;"></div>
				<div id="emailSendMsg" style="color: blue;"></div>
			</td>
		</tr>
		<tr>
			<th>인증번호</th>
			<td>
				<input type="text" id="codeCk" disabled>
				<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
				<div id="codeMsg" style="color: red;"></div>
			</td>
		</tr>
	</table>

	<!-- 인증 후 비밀번호 설정 링크 -->
	<div id="a"></div>
	
	<!-- 아이디찾기/비밀번호 찾기 링크 -->
	<div>
		<a href="${pageContext.request.contextPath}/beforeLogin/loginCompany">로그인</a>
		<span> | </span>
		<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디 찾기</a>
	</div>
	
	<!-- 자주묻는 질문 링크 -->
	<div>
		<a href="#">자주묻는 질문</a>
	</div>
	
<script>
	$(document).ready(function(){
		var code = ''; // 인증번호를 담을 변수
		var email1 = '';
		var email2 = '';
		var id = '';
		
		//이메일 인증
		$('#emailCkBtn').click(function() {	
			
			if($('#email1').val() == ''){ // 이메일 유효성 확인
				$('#emailMsg').text('이메일을 입력해주세요.');
			}
			
			if ($('#id').val() == ''){ // 아이디 입력 유효성 확인
				$('#idMsg').text('아이디를 입력해주세요.');
			}
			
			if ($('#id').val() != '' && $('#email1').val() != ''){
				$('#emailMsg').text('');
				$('#idMsg').text('');
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				
				// 유효성 확인 후 이메일 전송
				$.ajax({
					url:'emailCk'
					, type:'get'
					, data:{companyEmail1:$('#email1').val(), companyEmail2:$('#email2').val(), companyId:$('#id').val()}
					, success:function(model) {
						code = model;
						console.log(code);
						
						if(code == 'fail'){
							$('#emailMsg').text('인증번호 전송에 실패하였습니다. 입력한 이메일을 확인해주세요.');	
							$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
						} else if (code == 'noResult'){
							$('#emailMsg').text('등록된 이메일이 없습니다. 입력한 이메일을 확인해주세요.');
							$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
						} else {
							$('#emailMsg').text('');
							$('#emailSendMsg').text('인증번호가 전송되었습니다. 전송된 인증번호를 입력해주세요.');
							$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
							$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
							$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
							
							// 인증번호 전송 시점에 이메일, 이름 정보 변수에 저장(이후 아이디 조회에 사용)
							email1 = $('#email1').val();
							email2 = $('#email2').val();
							id = $('#id').val();
							
							console.log(email1);
							console.log(email2);
							console.log(id);
						}
					}
				});
			}
		});
		
		// 인증번호 비교
		$('#codeCkBtn').click(function() {
			if ($('#codeCk').val() == ''){ // 인증번호 입력 유효성 확인
				$('#codeMsg').text('인증번호를 입력해주세요.');
			} else {
				if($('#codeCk').val() == code){ // 인증번호 일치 시
					$('#idMsg').text();
					$('#codeMsg').text();
					$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
					$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
					alert('이메일 인증에 성공하였습니다.');
					
					// 이메일 인증 성공 시 비밀번호 변경 링크 생성
					var email = email1+'@'+email2;
					var html = "<a href='${pageContext.request.contextPath}/beforeLogin/modifyCompanyPw?email="+email+"&id="+id+"'>비밀번호 변경</a>"
					$('#a').append(html);
				} else { // 인증번호 실패 시
					alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
				}
			}
		});
	});
</script>
</body>
</html>