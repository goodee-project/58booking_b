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
<title>예약 | 업체 아이디 찾기</title>
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<style>
	.td-position{
		position: relative;
		left: 27.5%;
	}
	.size1{
		width:280px;
	}
	.size2{
		width:130px;
	}
	.form-control {
		display: inline;
	}
	#resultId{
		background-color: #e9ecef;
	    width: 280px;
	    height: 120px;
	    border-radius: 5px;
	    border: 2px solid #efefef;
	}
	#idHeader{
		font-size: 20px;
    	margin-top: 10px;
    	text-align: center;
	}
	#idBody{
		color: #fc5b62;
	    font-size: 17px;
	    margin-top: 15px;
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
					<a href="${pageContext.request.contextPath}/index">Home</a>
				</li>
				<li class="breadcrumb-item active">아이디 찾기</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<!-- 정보입력 폼 -->
				<table class="mx-auto table table-borderless w-50">
					<tr>
						<td class="text-center"><h3><strong>아이디 찾기</strong></h3></td>
					</tr>
					<tr>
						<td class="td-position">
							<div>이름(사업자명)</div>
							<input type="text" id="name" name="companyCeo" class="form-control size1">
							<div id="nameMsg" style="color: #fc5b62;"></div>
						</td>
					</tr>
					<tr>
						<td class="td-position">
							<div>이메일</div>
							<input type="text" id="email1" name="companyEmail1" class="form-control size2">
							<span>@</span>
							<select id="email2" name="companyEmail2" class="form-control size2">
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
							</select>
							<button type="button" id="emailCkBtn" class="btn_1">인증번호 발송</button>
							<div id="emailMsg" style="color: #fc5b62;"></div>
							<div id="emailSendMsg" style="color: #0054a6;"></div>
						</td>
					</tr>
					<tr>
						<td class="td-position">
							<div>인증번호</div>
							<input type="text" id="codeCk" disabled class="form-control size1">
							<button type="button" id="codeCkBtn" disabled class="btn_1">인증번호 확인</button>
							<div id="codeMsg" style="color: #fc5b62;"></div>
						</td>
					</tr>
					<tr>
						<!-- 아이디 조회 결과 -->
						<td class="td-position"><div id="a"></div></td>
					</tr>
					<tr>
						<td class="text-center">
							<div><!-- 아이디찾기/비밀번호 찾기 링크 -->
								<a href="${pageContext.request.contextPath}/beforeLogin/loginCompany">로그인</a>
								<span> | </span>
								<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호 찾기</a>
							</div>
						</td>
					</tr>
					<tr>
						<td class="text-center">
							<div class="mt-3"><!-- 자주묻는 질문 링크 -->
								<a href="#">자주묻는 질문</a>
							</div>
						</td>
					</tr>
				</table>
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
		var code = ''; // 인증번호를 담을 변수
		var email1 = '';
		var email2 = '';
		var name = '';
		
		//이메일 인증
		$('#emailCkBtn').click(function() {	
			
			if($('#email1').val() == ''){ // 이메일 유효성 확인
				$('#emailMsg').text('이메일을 입력해주세요.');
			}
			
			if ($('#name').val() == ''){ // 이름 입력 유효성 확인
				$('#nameMsg').text('이름을 입력해주세요.');
			}
			
			if ($('#name').val() != '' && $('#email1').val() != ''){
				$('#emailMsg').text('');
				$('#nameMsg').text('');
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				
				// 유효성 확인 후 이메일 전송
				$.ajax({
					url:'emailCk'
					, type:'get'
					, data:{companyEmail1:$('#email1').val(), companyEmail2:$('#email2').val(), companyCeo:$('#name').val()}
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
							name = $('#name').val();
							
							console.log(email1);
							console.log(email2);
							console.log(name);
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
					$('#nameMsg').text();
					$('#codeMsg').text();
					$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
					$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
					alert('이메일 인증에 성공하였습니다.');
					
					// 이메일 인증 성공 시 이메일과 이름으로 아이디 조회
					$.ajax({
						url:'findCompanyId'
						, type:'post'
						, data:{companyEmail:email1+'@'+email2, companyCeo:name}
						, success:function(model) {
							if(model == '' || null){
								var html = "<div id='resultId'>" + 
												"<div id='idHeader'><strong>아이디 조회결과</strong></div>"+
												"<div id='idbody'>등록된 아이디가 없습니다.</div>"+
											"</div>"
							} else {
								var id = model;
								var html = "<div id='resultId'>" + 
												"<div id='idHeader'><strong>아이디 조회결과</strong></div>"+
												"<div id='idBody'>"+id+"</div>"+
											"</div>"
							}
							$('#a').append(html);
						}
					});
				} else { // 인증번호 실패 시
					alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
				}
			}
		});
	});
</script>
</body>
</html>