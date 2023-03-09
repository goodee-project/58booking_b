<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Ansonika">
<title>예약 | 업체가입</title>
<!-- Favicons-->
<link rel="shortcut icon" href="img/favicon.ico" type="${pageContext.request.contextPath}/resources/admin_section/image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-144x144-precomposed.png">

<!-- GOOGLE WEB FONT -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- Bootstrap core CSS-->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/css/admin.css" rel="stylesheet">
<!-- Icon fonts-->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Plugin styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/dropzone.css" rel="stylesheet">
<!-- WYSIWYG Editor -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_section/js/editor/summernote-bs4.css">
<!-- Your custom styles -->
<link href="${pageContext.request.contextPath}/resources/admin_section/css/custom.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        // 첫번째 사진 추가
        $('#inputImgBtn0').click(function(){ // 0버튼 눌리면
            $('#inputImg0').click(); // input0 열기
        });
        
    	$('#inputImg0').change(function(e) { // 두번째 파일 등록 위한 동적 버튼 생성
    		
    		// 확장자 확인
    		var thumbext = $('#inputImg0').val();
    		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); // 파일 확장자를 잘라내고, 비교를 위해 소문자로
			if(thumbext != "jpg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp"){ // 확장자 확인
				alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
				return;
			}
    		
			var tag0 = "<input type='file' name='companyImg' accept='image/*' id='inputImg1' style='display:none;'>" +
						"<button type='button' id='inputImgBtn1'>사진등록</button>";
			$('#target0').html(tag0);
			
			// 이미지 미리보기
			var tmp = e.target.files[0];
			var img = URL.createObjectURL(tmp);
			$('#img0').attr('src', img);
		});
    	
    	// 첫번째 사진 클릭 시
    	$('#img0').click(function(){
            $('#level').attr('value', 0);
            $('#img0').css("filter", "brightness(0.8)");
            $('#img1').css("filter", "");
            $('#img2').css("filter", "");
        });
		
		// 두번째 사진 추가
		$(document).on('click', '#inputImgBtn1', function() {
			$('#inputImg1').click(); // input1 열기
			
			$('#inputImg1').change(function(e) { // 세번째 파일 등록 위한 동적 버튼 생성
				
				// 확장자 확인
	    		var thumbext = $('#inputImg1').val();
	    		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); // 파일 확장자를 잘라내고, 비교를 위해 소문자로
				if(thumbext != "jpg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp"){ // 확장자 확인
					alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
					return;
				}
				
				var tag1 = "<input type='file' name='companyImg' accept='image/*' id='inputImg2' style='display:none;'>" +
							"<button type='button' id='inputImgBtn2'>사진등록</button>";
				$('#target1').html(tag1);
				
				var tmp = e.target.files[0];
				var img = URL.createObjectURL(tmp);
				$('#img1').attr('src', img);
			});
			
			// 두번째 사진 클릭 시
	    	$('#img1').click(function(){
	            $('#level').attr('value', 1);
	            $('#img0').css("filter", "");
	            $('#img1').css("filter", "brightness(0.8)");
	            $('#img2').css("filter", "");
	        });
		});
		
		// 세번째 사진 추가
		$(document).on('click', '#inputImgBtn2', function() {
			$('#inputImg2').click(); // input2 열기
			
			$('#inputImg2').change(function(e) { // 세번째 파일 등록 위한 동적 버튼 생성
				
				// 확장자 확인
	    		var thumbext = $('#inputImg2').val();
	    		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); // 파일 확장자를 잘라내고, 비교를 위해 소문자로
				if(thumbext != "jpg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp"){ // 확장자 확인
					alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
					return;
				}
				
				var tmp = e.target.files[0];
				var img = URL.createObjectURL(tmp);
				$('#img2').attr('src', img);
			});
			
			// 세번째 사진 클릭 시
	    	$('#img2').click(function(){
	            $('#level').attr('value', 2);
	            $('#img0').css("filter", "");
	            $('#img1').css("filter", "");
	            $('#img2').css("filter", "brightness(0.8)");
	        });
		});
    });
</script>
<style type="text/css">
    .imgs_wrap {

    }
    .imgs_wrap img {
        width: 200px;
        filter: brightness(1);
        transition:1s;
    }
    .imgs_wrap img:hover {
        width: 200px;
        cursor: pointer;
        filter: brightness(0.8);
		
    }  
    .upload_btn {
		width: 200px;
    	text-align: center;
    }
</style>
</head>
<body class="fixed-nav sticky-footer" id="page-top">
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/view/inc/navBeforeLogin.jsp"></jsp:include>
	<!-- /Navigation-->
	
	<div class="content-wrapper w-75 mx-auto" style="margin-left:0px">
		<div class="container-fluid">   
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/index">Dashboard</a>
				</li>
				<li class="breadcrumb-item active">업체가입</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<form action="${pageContext.request.contextPath}/beforeLogin/addCompany" method="post" encType="multipart/form-data" id="addForm">
					<input type="hidden" id="email" name="companyEmail"><!-- 이메일 인증 후 value 변경 -->
					<input type="hidden" id="level" name="choose"><!-- 대표사진설정 -->
					
					<table class="mx-auto table w-75">
						<tr>
							<th>ID</th>
							<td>
								<input type="text" id="id" name="companyId" readonly>
							</td>
							<th>ID 중복확인</th>
							<td>
								<input type="text" id="idCk">
								<button type="button" id="idCkBtn">확인</button>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<div>* 가입 이후 아이디/비밀번호 찾기에 필요한 이메일이므로 정확히 입력해주세요.</div>
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
							</td>
							<th>인증번호</th>
							<td>
								<input type="text" id="codeCk" disabled>
								<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
							</td>
						</tr>
						<tr>
							<th>PW</th>
							<td colspan="3">
								<input type="password" id="pw" name="companyPw">
							</td>
						</tr>
						<tr>
							<th>업체사진등록</th>
							<td colspan="3">
								<div>* 업체 사진은 3개를 등록하여야 합니다.(이미지 클릭 시 대표사진으로 지정)</div>
								<!-- 사진미리보기 -->
						        <div class="imgs_wrap">
					        		<img id="img0">
					        		<img id="img1">
					        		<img id="img2">
						        </div>
						        <!-- 사진등록 -->
								<div style="display:flex;">
									<div class="upload_btn">
								        <input type="file" name="companyImg" accept="image/*" id="inputImg0" style="display:none;">
								        <button type="button" id="inputImgBtn0">사진등록</button>
								    </div>
							        <div class="upload_btn" id="target0"></div>
							    	<div class="upload_btn" id="target1"></div>
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
										<input type="radio" class="agree" name="infoAgree" value="동의">약관 및 마케팅 동의
									</label>
									<label>
										<input type="radio" class="agree" name="infoAgree" value="미동의">약관 및 마케팅 미동의
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>위도</th>
							<td>
								<input type="number" id="la" name="latitude">
							</td>
							<th>경도</th>
							<td>
								<input type="number" id="long" name="longtitude">
							</td>
						</tr>
					</table>
					<button type="button" id="addBtn">가입</button>
				</form>
			</div><!-- 본문 끝 -->
		</div>
	</div>
	
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>
<!-- Custom scripts for this page-->
<script src="${pageContext.request.contextPath}/resources/admin_section/vendor/dropzone.min.js"></script>

<script>
	$(document).ready(function(){
		// 아이디 중복확인
		$('#idCkBtn').click(function(){
			console.log('dd');
			$.ajax({
				url:'idCk' // 요청보낼 컨트롤러 맵핑주소
				, type:'get' // 맵핑 방식
				, data: {id:$('#idCk').val()} // 보낼 데이터
				, success:function(model){ // model -> 컨트롤러(idCk)에서 받아오는 값
					if(model=='yes'){
						$('#id').val($('#idCk').val());
					} else {
						alert($('#idCk').val()+'는 사용중인 아이디입니다.');
					}
				}
			});
		});
		
		// 이메일 인증
		var code = ''; // 인증번호를 담을 변수
		$('#emailCkBtn').click(function() {
			if($('#email1').val() == ''){ // 이메일 유효성 확인
				alert('이메일을 입력해주세요.');
			} else {
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				
				$.ajax({
					url:'emailCk'
					, type:'get'
					, data:{companyEmail1:$('#email1').val(), companyEmail2:$('#email2').val()}
					, success:function(model) {
						code = model;
						console.log(code);
						
						if(code == 'fail'){
							alert('인증번호 전송에 실패하였습니다. 입력한 이메일을 확인해주세요.');
							$('#email').attr('disabled',false); // 입력 재활성화
							$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
						} else {
							alert('인증번호가 전송되었습니다. 전송된 인증번호를 입력해주세요.');
							$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
							$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
							$('#email').attr('value', $('#email1').val()+'@'+$('#email2').val());
						}
					}			
				});
			}
		});
		
		// 인증번호 비교
		var ckResult = false; // 이메일 인증 성공 여부를 담을 변수 (false : 인증실패, true : 인증성공)
		$('#codeCkBtn').click(function() {
			if($('#codeCk').val() == code){ // 인증번호 일치 시
				$('#email1').attr('readonly',true);
				$('#email2').attr('readonly',true);
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
				alert('이메일 인증에 성공하였습니다.');
				ckResult = true;
				console.log(ckResult);
			} else { // 인증번호 실패 시
				alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
			}
		});
		
		// 유효성 확인 후 폼 제출
		var allChecked = false; // 함수 결과값
		$('#addBtn').click(function(){
			console.log(formCheck());
			if(allChecked){
				$('#addForm').submit();
			}
		});
		
		// 유효성 확인 함수
		formCheck = function(){
			var radioCk = $('input:radio[name=agree]').is(":checked");
			
			if($('#id').val() == ''){ // 아이디
				alert('아이디를 입력해주세요.');
				return false;
			} else if (ckResult == false){ // 이메일
				alert('이메일 인증을 해주세요.');
				return false;
			} else if ($('#pw').val() == ''){ // 비밀번호
				alert('비밀번호를 입력해주세요.');
				return false;
			} else if ($('#img0').attr("src") == '' || $('#img1').attr("src") == '' || $('#img2').attr("src") == ''){ // 이미지
				alert('모든 사진(3개)을 등록해주세요.');
				return false;
			} else if ($('#level').val() == ''){ // 대표사진
				alert('대표사진을 설정해주세요.');
				return false;
			} else if ($('#name').val() == ''){ // 업체명
				alert('업체명을 입력해주세요.');
				return false;
			} else if ($('#phone').val() == ''){ // 업체전화번호
				alert('업체전화번호를 입력해주세요.');
				return false;
			} else if ($('#address').val() == ''){ // 업체주소
				alert('업체주소를 입력해주세요.');
				return false;
			} else if ($('#ceo').val() == ''){ // 사업자명
				alert('사업자명을 입력해주세요.');
				return false;
			} else if ($('#number').val() == ''){ // 사업자번호
				alert('사업자번호를 입력해주세요.');
				return false;
			} else if ($('#bank').val() == ''){ // 은행
				alert('은행을 입력해주세요.');
				return false;
			} else if ($('#account').val() == ''){ // 계좌번호
				alert('계좌번호를 입력해주세요.');
				return false;
			} else if ($('.agree:checked').val() == '' || $('.agree:checked').val() == '미동의'){ // 약관동의
				alert('약관에 동의해야만 가입이 가능합니다.');
				return false;
			} else if ($('#la').val() == ''){ // 위도
				alert('위도를 입력해주세요.');
				return false;
			} else if ($('#long').val() == ''){ // 경도
				alert('경도를 입력해주세요.');
				return false;
			} else {
				allChecked = true;
	    		return true;
	    	}
		};
	});
</script>
</body>
</html>