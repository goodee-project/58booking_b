<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Ansonika">
<title>예약 | 업체 기본정보</title>

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

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
	th{
		text-align: center;
	}
	.w-40{
		width:40%;
	}
	.w-10{
		width:10%;
	}
	.form-control {
		display: inline;
	}
    .imgs_wrap img {
        width: 300px;
        height: 300px;
        margin-bottom:10px;
        margin-top:5px;
    }
    .imgLevel{
    	width: 300px;
    	text-align: center;
    }
</style>
</head>
<body class="fixed-nav sticky-footer" id="page-top">
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/view/inc/nav.jsp"></jsp:include>
	<!-- /Navigation-->
	
	<div class="content-wrapper">
		<div class="container-fluid">   
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/index">Dashboard</a>
				</li>
				<li class="breadcrumb-item active">업체 기본정보</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<table class="mx-auto table w-75">
					<tr>
						<th class="w-10 align-middle">ID</th>
						<td colspan="3">${com.companyId}</td>
					</tr>
					<tr>
						<th class="align-middle" colspan="1">이메일</th>
						<td colspan="3">${com.companyEmail}</td>
					</tr>
					<tr>
						<th class="align-middle">PW</th>
						<td colspan="3">
							<!-- 모달 링크 -->
							<a data-toggle="modal" data-target="#exampleModal" class="btn_1">비밀번호 변경</a>
							<!-- 모달 내용 -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-modal="true" role="dialog">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
									
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경하기</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										
										<div class="modal-body">
											<table class="table table-borderless">
												<tr>
													<td><div id="msg" style="color:red;"></div></td>
												</tr>
												<tr>
													<th class="align-middle">새 비밀번호</th>
													<td>
														<div style="position: relative;">
															<input type="password" name="companyPw" id="newPw" class="form-control">
															<i id="eye1" class="fa fa-eye fa-lg" style="position: absolute; left: 90%; top: 15px;"></i>
														</div>
														<div id="newPwMsg" style="color:red;"></div>
													</td>
												</tr>
												<tr>
													<th class="align-middle">새 비밀번호 확인</th>
													<td>
														<div style="position: relative;">
															<input type="password" id="pwCk" class="form-control">
															<i id="eye2" class="fa fa-eye fa-lg" style="position: absolute; left: 90%; top: 15px;"></i>
														</div>
														<div id="pwCkMsg" style="color:red;"></div>
													</td>
												</tr>
											</table>
										</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
											<button type="button" id="modiBtn" class="btn btn-primary">변경</button>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="align-middle">업체사진</th>
						<td colspan="3">
							<!-- 대표사진 여부 -->
					        <div style="display:flex;">
					        	<c:forEach var="img" items="${imgList}">
									<c:if test="${img.companyImgLevel eq 'Y'}">
										<div class="imgLevel"><i class="pending">대표사진</i></div>
									</c:if>
									<c:if test="${img.companyImgLevel eq 'N'}">
										<div class="imgLevel"></div>
									</c:if>
					        	</c:forEach>
						    </div>
							<!-- 사진 -->
							<div class="imgs_wrap">
								<c:forEach var="img" items="${imgList}">
									<c:if test="${img.companyImgLevel eq 'Y'}">
										<img src="${pageContext.request.contextPath}/upload/${img.companyImgSaveName}">
									</c:if>
									<c:if test="${img.companyImgLevel eq 'N'}">
										<img src="${pageContext.request.contextPath}/upload/${img.companyImgSaveName}">
									</c:if>
					        	</c:forEach>
					        </div>
						</td>
					</tr>
					<tr>
						<th class="align-middle">업체명</th>
						<td>${com.companyName}</td>
						<th class="align-middle">전화번호</th>
						<td>${com.companyPhone}</td>
					</tr>
					<tr>
						<th class="align-middle">업체주소</th>
						<td colspan="3" class="align-middle">
							<span id="address">${com.companyAddress} (${com.companyAddressDetail})</span>
							<div id="map" style="width:600px;height:300px;margin-top:10px;"></div>
						</td>
					</tr>
					<tr>
						<th class="w-10 align-middle">사업자명</th>
						<td class="w-40">${com.companyCeo}</td>
						<th class="w-10 align-middle">사업자번호</th>
						<td class="w-40">${com.companyNumber}</td>
					</tr>
					<tr>
						<th class="w-10 align-middle">은행</th>
						<td class="w-40">${com.companyBank}</td>
						<th class="w-10 align-middle">계좌번호</th>
						<td class="w-40">${com.companyAccount}</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right align-middle">
							<a href="${pageContext.request.contextPath}/company/companyBasicInfo/modifyCompany" class="btn_1 mb-3 mt-2">정보수정</a>
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
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1019ec0068d27d2c4d9f0551986950d2&libraries=services"></script>
<script>
	$(document).ready(function(){
		
		var lat = '${com.latitude}';
		var lng = '${com.longtitude}';
		
		console.log(lat);
		console.log(lng);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	
	    // 지도 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);

	    // 마커 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(lat, lng),
	        map: map
	    });
	    
	    
	    // 비밀번호 보이기
	    $('#eye1').hover(function(){
	    	$('#newPw').toggleClass('active');
	    	if($('#newPw').hasClass('active')){
		        $('#eye1').attr('class',"fa fa-eye-slash fa-lg");
		        $('#newPw').attr('type',"text");
	    	} else {
	    		$('#eye1').attr('class',"fa fa-eye fa-lg");
		        $('#newPw').attr('type',"password");
	    	}
	    });
	    $('#eye2').hover(function(){
	    	$('#pwCk').toggleClass('active1');
	    	if($('#pwCk').hasClass('active1')){
		        $('#eye2').attr('class',"fa fa-eye-slash fa-lg");
		        $('#pwCk').attr('type',"text");
	    	} else {
	    		$('#eye2').attr('class',"fa fa-eye fa-lg");
		        $('#pwCk').attr('type',"password");
	    	}
	    });
	    
	    
	    // 비밀번호 변경
	    $('#modiBtn').click(function(){
	    	
	    	// 유효성 확인
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
			
			var companyEmail = '${com.companyEmail}';
			var companyId = '${com.companyId}';
			
			// 변경 진행
			$.ajax({
				url:'modifyCompanyPw'
				, type: 'post'
				, data:{companyPw: $('#newPw').val(), companyEmail:companyEmail, companyId:companyId}
				, success:function(model){ // true 성공, false 실패
					if(model){
						alert('비밀번호 변경을 완료하였습니다.');
					} else {
						alert('비밀번호 변경에 실패하였습니다.');
					}
				}
			});
		});
	});
</script>
</body>
</html>