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
<meta charset="UTF-8">
<title>예약 | 업체 비밀번호 변경</title>
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
</style>
<script>
	$(document).ready(function(){
		
		// 비밀번호 보이기 1
		$('#eye1').hover(function(){
	    	$('#newPw').toggleClass('active');
	    	if($('#newPw').hasClass('active')){
		        $('#eye1').attr('class',"fa fa-eye-slash fa-lg");
		        $('#newPw').attr('type',"text");
	    	} else {
	    		$('#eye1').attr('class',"fa fa-eye fa-lg");
		        $('#pw').attr('type',"password");
	    	}
	    });
		
		// 비밀번호 보이기 2
		$('#eye2').hover(function(){
	    	$('#pwCk').toggleClass('active');
	    	if($('#pwCk').hasClass('active')){
		        $('#eye2').attr('class',"fa fa-eye-slash fa-lg");
		        $('#pwCk').attr('type',"text");
	    	} else {
	    		$('#eye2').attr('class',"fa fa-eye fa-lg");
		        $('#pwCk').attr('type',"password");
	    	}
	    });
		
		// 유효성 확인
		$('#modiBtn').click(function(){
			if($('#newPw').val() == ''){
				$('#newPwMsg').text('새 비밀번호를 입력하세요.');
				$('#pwCkMsg').text('');
				return;
			}
			if($('#pwCk').val() == ''){
				$('#pwCkMsg').text('새 비밀번호 확인을 입력하세요.');
				$('#newPwMsg').text('');
				return;
			}
			if($('#pwCk').val() != $('#newPw').val()){
				$('#pwCkMsg').text('');
				$('#newPwMsg').text('');
				$('#msg').text('두 비밀번호가 일치하지 않습니다.');
				return;
			}
			
			$('#modiForm').submit();
			
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
			
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/index">Home</a>
				</li>
				<li class="breadcrumb-item active">비밀번호 변경</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<form action="${pageContext.request.contextPath}/beforeLogin/modifyCompanyPw" method="post" id="modiForm">
					<input type="hidden" name="companyId" value="${id}">
					<input type="hidden" name="companyEmail" value="${email}">
					<table class="mx-auto table table-borderless w-50">
						<tr>
							<td class="text-center"><h3>비밀번호 변경</h3></td>
						</tr>
						<tr>
							<td class="text-center"><div id="msg" style="color:#fc5b62;"></div></td>
						</tr>
						<tr>
							<td class="td-position">
								<div>새 비밀번호</div>
								<input type="password" name="companyPw" id="newPw" class="form-control size1">
								<i id="eye1" class="fa fa-eye fa-lg" style="position: absolute; left: 39%; top: 47px;"></i>
								<div id="newPwMsg" style="color:#fc5b62;"></div>
							</td>
						</tr>
						<tr>
							<td class="td-position">
								<div>새 비밀번호 확인</div>
								<input type="password" id="pwCk" class="form-control size1">
								<i id="eye2" class="fa fa-eye fa-lg" style="position: absolute; left: 39%; top: 47px;"></i>
								<div id="pwCkMsg" style="color:#fc5b62;"></div>
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<button type="button" id="modiBtn" class="btn_1 mb-3">변경 완료</button>
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