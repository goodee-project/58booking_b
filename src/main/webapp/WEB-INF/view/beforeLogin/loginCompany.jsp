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
<title>예약 | 업체 로그인</title>
<!-- Favicons-->
<link rel="shortcut icon" href="img/favicon.ico" type="${pageContext.request.contextPath}/resources/admin_section/image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/admin_section/img/apple-touch-icon-144x144-precomposed.png">

<!-- GOOGLE WEB FONT -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- 리캡챠 -->
<script src="https://www.google.com/recaptcha/api.js"></script>
<!-- 쿠키 사용 -->
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.1/dist/js.cookie.min.js"></script>
<c:if test="${msg != null}">
	<script>
		$(document).ready(function(){
			var msg = '<c:out value="${msg}"/>';;
			alert(msg);
		});
	</script>
</c:if>
<script>
	// 쿠키 설정 변경(리캡챠 사용위함)
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
	
	$(document).ready(function(){
		
		// 쿠키 사용한 아이디 저장 (https://gbsb.tistory.com/99 참고)
		$("#id").val(Cookies.get('key')); // 저장된 쿠키를 받아와 아이디 값으로 지정
		
	    if($("#id").val() != ""){ // 아이디 값이 있다면
	        $("#saveLoginInfo").attr("checked", true); // remember me 체크 상태로 두기
	    }
		    
		$("#saveLoginInfo").change(function(){ // remember me 값이 바뀔 때
		    if($("#saveLoginInfo").is(":checked")){ // 체크 상태면
		        Cookies.set('key', $("#id").val(), { expires: 7 }); // 7일 동안 쿠키 보관
		        console.log('아이디 : '+$("#id").val()+'쿠키에 저장');
		    }else{ // 아니면
		          Cookies.remove('key'); // 쿠키 정보 삭제
		    }
		});
		     
		$("#id").keyup(function(){ // 아이디 입력 시
		    if($("#saveLoginInfo").is(":checked")){ // 체크 상태면
		    	console.log('아이디 : '+$("#id").val()+'쿠키에 저장');
		        Cookies.set('key', $("#id").val(), { expires: 7 }); // 7일 동안 쿠키 보관
		    }
		});
		
		// 사이트 키 값은 등록한 도메인에 매핑됨
		// 구글 리캡챠
		/*
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
		*/
		
		
		// 비밀번호 보이기
		$('#eye').hover(function(){
	    	$('#pw').toggleClass('active');
	    	if($('#pw').hasClass('active')){
		        $('#eye').attr('class',"fa fa-eye-slash fa-lg");
		        $('#pw').attr('type',"text");
	    	} else {
	    		$('#eye').attr('class',"fa fa-eye fa-lg");
		        $('#pw').attr('type',"password");
	    	}
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
<body class="fixed-nav sticky-footer" id="page-top">
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/view/inc/navBeforeLogin.jsp"></jsp:include>
	<!-- /Navigation-->
	
	<div class="content-wrapper w-75 mx-auto" style="margin-left:0px">
		<div class="container-fluid">
		<button type=button id="test" style="display:none;">dddd</button>
			<!-- 본문 입력 -->
			<div class="box_general w-50 mx-auto pt-4 pb-2">
				<form action="${pageContext.request.contextPath}/beforeLogin/loginCompany" method="post" id="loginForm">
					<!-- 로그인 폼 -->
					<table class="table table-borderless w-50 mx-auto">
						<tr>
							<td class="text-center mt-2"><h2>COMPANY LOGIN</h2></td>
						</tr>
						<tr>
							<td>
								<div><strong>ID</strong></div>
								<div>
									<input type="text" id="id" name="companyId" class="form-control" placeholder="Enter ID">	
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div><strong>PW</strong></div>
								<div style="position: relative;">
									<input type="password" id="pw" name="companyPw" class="form-control" placeholder="Enter Password">
									<i id="eye" class="fa fa-eye fa-lg" style="position: absolute; left: 90%; top: 15px;"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td><!-- 로그인 정보 저장 여부 -->
								<div>
									<label>
										<input type="checkbox" id="saveLoginInfo">
										<span class="checkmark">Remember me</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><!-- 리캡챠 -->
								<div class="g-recaptcha" data-sitekey="6LevqtkkAAAAALTd1rpqiYdFT1OHY14wxlqMG89a"></div>
							</td>
						</tr>
						<tr>
							<td><!-- 로그인 버튼 -->
								<div class="text-center mb-5">
									<button type="button" id="loginBtn" class="btn btn-lg btn-primary">login</button>
								</div>
							</td>
						</tr>
						<tr>
							<td><!-- 아이디찾기/비밀번호 찾기 링크 -->
								<div class="text-center mb-1 mt-3">
									<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디 찾기</a>
									<span> | </span>
									<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호 찾기</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="text-center mb-4">
									<strong>새로운 업체 등록을 원하시나요? <a href="${pageContext.request.contextPath}/beforeLogin/addCompany">Sign up</a></strong>
								</div>
							</td>
						</tr>
					</table>
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
</body>
</html>