<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 | 업체 기본정보 수정</title>

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

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
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
<style type="text/css">
	.form-size{
		width:220px;
	}
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
        filter: brightness(1);
        transition:1s;
        margin-bottom:10px;
        margin-top:5px;
    }
    .imgs_wrap img:hover {
        width: 300px;
        cursor: pointer;
        filter: brightness(0.8);
		
    }  
    .upload_btn {
		width: 300px;
    	text-align: center;
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
				<li class="breadcrumb-item active">업체 기본정보 수정</li>
			</ol>
			
			<!-- 본문 입력 -->
			<div class="box_general">
				<form action="${pageContext.request.contextPath}/company/companyBasicInfo/modifyCompany" method="post" encType="multipart/form-data" id="modiForm">
					<input type="hidden" name="companyId" value="${com.companyId}"><!-- 아이디 -->
					<input type="hidden" id="la" name="latitude" value="${com.latitude}"><!-- 위도 -->
					<input type="hidden" id="long" name="longtitude" value="${com.longtitude}"><!-- 경도 -->
					<input type="hidden" id="level" name="choose"><!-- 대표사진설정 -->
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
									<c:forEach var="img" items="${imgList}" varStatus="i">
						        		<img id="img${i.index}" src="${pageContext.request.contextPath}/upload/${img.companyImgSaveName}">
						        	</c:forEach>
						        </div>
						        <!-- 사진 변경 버튼 -->
						        <div style="display:flex; justify-content: right">
						        	<span class="mr-1"><a class="btn_1">사진변경</a></span>
						        </div>
							</td>
						</tr>
						<tr>
							<th class="align-middle">업체명</th>
							<td>
								<input type="text" id="name" name="companyName" value="${com.companyName}" readonly class="form-control form-size">
							</td>
							<th class="align-middle">전화번호</th>
							<td>
								<input type="text" id="phone" name="companyPhone" value="${com.companyPhone}" readonly class="form-control form-size">
							</td>
						</tr>
						<tr>
							<th class="align-middle">업체주소</th>
							<td colspan="3">
								<div class="mb-2">
									<input type="text" id="address" name="companyAddress" readonly value="${com.companyAddress}" class="form-control form-size">
									<input type="text" id="addressDetail" name="companyAddressDetail" class="form-control form-size" value="${com.companyAddressDetail}" placeholder="상세주소 입력">
									<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="btn_1">
								</div>
								<div id="map" style="width:600px;height:300px;margin-top:10px;"></div>
							</td>
						</tr>
						<tr>
							<th class="w-10 align-middle">사업자명</th>
							<td class="w-40">
								<input type="text" id="ceo" name="companyCeo" value="${com.companyCeo}" class="form-control form-size">
							</td>
							<th class="w-10 align-middle">사업자번호</th>
							<td class="w-40">
								<input type="text" id="number" name="companyNumber" value="${com.companyNumber}" class="form-control form-size">
							</td>
						</tr>
						<tr>
							<th class="w-10 align-middle">은행</th>
							<td class="w-40">
								<input type="text" id="bank" name="companyBank" value="${com.companyBank}" class="form-control form-size">
							</td>
							<th class="w-10 align-middle">계좌번호</th>
							<td class="w-40">
								<input type="text" id="account" name="companyAccount" value="${com.companyAccount}" class="form-control form-size">
							</td>
						</tr>
						<tr>
							<td colspan="4" class="text-right align-middle">
								<button type="button" id="modiBtn" class="btn_1 mb-3 mt-2">수정완료</button>
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
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1019ec0068d27d2c4d9f0551986950d2&libraries=services"></script>
<script>

	var lat = '${com.latitude}';
	var lng = '${com.longtitude}';
	
	console.log(lat);
	console.log(lng);

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(lat, lng),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                        
                        // 위도, 경도 값 변경
                        var lat = result.y;
                        var lng = result.x;
                        console.log(lat);
                        console.log(lng);
                        
                        $('#la').val(lat);
                        $('#long').val(lng);
                        $('#addressDetail').val('');
                    }
                });
            }
        }).open();
    }
</script>
<script>
	$(document).ready(function(){
		
		// 첫번째 사진
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
		
    	
		// 두번째 사진
		$('#inputImgBtn1').click(function(){ // 1버튼 눌리면
            $('#inputImg1').click(); // input1 열기
        });
		$('#inputImg1').change(function(e) { // 세번째 파일 등록 위한 동적 버튼 생성
		
			// 확장자 확인
	   		var thumbext = $('#inputImg1').val();
	   		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); // 파일 확장자를 잘라내고, 비교를 위해 소문자로
			if(thumbext != "jpg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp"){ // 확장자 확인
				alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
				return;
			}
		
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
		
		
		// 세번째 사진
		$('#inputImgBtn2').click(function(){ // 2버튼 눌리면
            $('#inputImg2').click(); // input2 열기
        });
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
			
			imgCk = true;
		});
		
		// 세번째 사진 클릭 시
    	$('#img2').click(function(){
            $('#level').attr('value', 2);
            $('#img0').css("filter", "");
            $('#img1').css("filter", "");
            $('#img2').css("filter", "brightness(0.8)");
        });
		
		
		// 유효성 확인 후 폼 제출
		var allChecked = false; // 함수 결과값
		$('#modiBtn').click(function(){
			console.log(formCheck());
			if(allChecked){
				$('#modiForm').submit();
			}
		});
		
		// 유효성 확인 함수
		formCheck = function(){
			if(imgCk == false){ // 업로드된 이미지 갯수 확인
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
			} else if ($('#addressDetail').val() == ''){ // 업체 상세주소
				alert('업체 상세주소를 입력해주세요.');
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
			} else {
				allChecked = true;
	    		return true;
	    	}
		};
	});
</script>
</body>
</html>