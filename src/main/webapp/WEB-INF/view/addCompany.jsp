<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체가입</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		// 유효성 확인
		
		// 아이디, 비밀번호, 비밀번호 일치, 사진, 업체명, 업체 전번, 업체 주소, 사업자명, 사업자 번호, 은행, 계좌버노, 약과동의, 위도/경도
		
	});
</script>
</head>
<body>
	<h2>업체가입</h2>
	<form action="${pageContext.request.contextPath}/addCompany" method="post" id="addForm">
		<table border="1">
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="id" name="companyId" disabled>
				</td>
				<th>ID 중복확인</th>
				<td>
					<input type="text" id="idCk">
					<button type="button" id="idCkBtn">확인</button>
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<input type="text" id="email" name="companyEmail">
					<button type="button" id="emailCkBtn">인증번호 발송</button>
				</td>
				<th>Email 인증번호</th>
				<td>
					<input type="text" id="codeCk">
					<button type="button" id="codeCkBtn">인증번호 확인</button>
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" id="pw" name="companyPw">
				</td>
				<th>PW 확인</th>
				<td>
					<input type="password" id="pwCk">
				</td>
			</tr>
			<tr>
				<th>업체사진등록</th>
				<td colspan="3">
					<div>
						<input type="file" id="img" name="companyImg" multiple>
					</div>
				</td>
			</tr>
			<tr>
				<th>업체명</th>
				<td colspan="3">
					<input type="text" id="name" name="companyName">
				</td>
			</tr>
			<tr>
				<th>업체 전화번호</th>
				<td colspan="3">
					<input type="text" id="phone" name="companyPhone">
				</td>
			</tr>
			<tr>
				<th>업체주소</th>
				<td colspan="3">
					<input type="text" id="address" name="companyAddress">
				</td>
			</tr>
			<tr>
				<th>사업자명</th>
				<td>
					<input type="text" id="ceo" name="companyCeo">
				</td>
				<th>사업자번호</th>
				<td>
					<input type="text" id="number" name="companyNumber">
				</td>
			</tr>
			<tr>
				<th>은행</th>
				<td>
					<input type="text" id="bank" name="companyBank">
				</td>
				<th>계좌번호</th>
				<td>
					<input type="text" id="account" name="companyAccount">
				</td>
			</tr>
			<tr>
				<th colspan="4">약관동의</th>
			</tr>
			<tr>
				<td colspan="4">
					1. 수집하는 개인정보 항목<br>
					문화체육관광부 대표 누리집의 이용자 참여와 이용통계 분석 등의 서비스를 위해 회원 가입시 아래의 개인정보를 수집하고 있습니다.<br>
					<br>
					가. 필수정보: 아이디, 이름, 성별, 출생년도, 비밀번호, 이메일<br>
					나. 서비스 이용 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
					(접속로그, 접속IP정보, 쿠키, 방문 일시, 서비스 이용기록, 불량 이용 기록)<br>
					2. 대표 누리집에서 이용자 회원가입 시 직접 개인정보를 입력 및 수정하여 개인정보를 수집합니다.<br>
					3. 수집 개인정보의 이용목적<br>
					회원가입, 회원활동 실적 관리, 회원탈퇴 의사 확인 등 회원관리<br>
					제공되는 서비스 이용에 관한 인구통계학적 분석, 서비스 방문 및 이용기록 분석, 관심사에 기반한 맞춤형 서비스 등 제공<br>
					신규 서비스 개발 및 활성화, 홍보 및 이벤트, 전자우편 서비스 등 정보 전달<br>
					향후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등<br>
					4. 개인정보의 보유 및 이용기간<br>
					이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br>
					따라서 문화체육관광부 대표누리집은 최종 로그인 후 2년이 경과하였거나 정보주체의 회원 탈퇴 신청 시 회원의 개인정보를 지체 없이 파기합니다.<br>
					<br>
					동의 거부 권리 사실 및 불이익 내용<br>
					이용자는 동의를 거부할 권리가 있습니다. 동의를 거부할 경우에는 서비스 이용에 제한됨을 알려드립니다.<br>
					<br>
					<div>
						<label>
							<input type="radio" id="agree" class="agree" name="agree" value="동의">약관 및 마케팅 동의
						</label>
						<label>
							<input type="radio" id="agree" class="agree" name="agree" value="미동의">약관 및 마케팅 미동의
						</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>위도</th>
				<td>
					<input type="number" id="la" name="companyLatitude">
				</td>
				<th>경도</th>
				<td>
					<input type="number" id="long" name="companyLongtitude">
				</td>
			</tr>
		</table>
		<button type="button" id="addBtn">가입</button>
	</form>
<script>
	// 아이디 중복확인
	$('#idCkBtn').click(function(){
		$.ajax({
			url:'idCk' // 요청보낼 컨트롤러 맵핑주소
			, type:'get' // 맵핑 방식
			, data: {idCk:$('#idCk').val()} // 보낼 데이터
			, success:function(model){ // model -> 컨트롤러(idCk)에서 받아오는 값
				if(model=='yes'){
					$('#id').val($('#idCk').val());
				} else {
					alert($('#idCk').val()+'는 사용중인 아이디입니다');
				}
			}
		});
	});
</script>
</body>
</html>