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
        width: 200px;
        filter: brightness(1);
        transition:1s;
        margin-bottom:10px;
        margin-top:10px;
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
				<form>
					<table class="mx-auto table w-75">
						<tr>
							<th class="w-10 align-middle">ID</th>
							<td colspan="3">
								<input type="text" name="" value="${com.companyId}" readonly class="form-control">
							</td>
						</tr>
						<tr>
							<th class="align-middle" colspan="1">이메일</th>
							<td colspan="3">
								<input type="text" name="" value="${com.companyEmail}" readonly class="form-control">
							</td>
						</tr>
						<tr>
							<th class="align-middle">PW</th>
							<td colspan="3">********</td>
						</tr>
						<tr>
							<th class="align-middle">업체사진</th>
							<td colspan="3">
								<!-- 사진미리보기 -->
								<div class="imgs_wrap">
									<c:forEach var="img" items="${imgList}">
						        		<img src="${pageContext.request.contextPath}/upload/${img.companyImgSaveName}">
						        	</c:forEach>
						        </div>
							</td>
						</tr>
						<tr>
							<th class="align-middle">업체명</th>
							<td>
								<input type="text" name="" value="${com.companyName}" readonly class="form-control">
							</td>
							<th class="align-middle">전화번호</th>
							<td>
								<input type="text" name="" value="${com.companyPhone}" readonly class="form-control">
							</td>
						</tr>
						<tr>
							<th class="align-middle">업체주소</th>
							<td colspan="3" class="align-middle">
								<input type="text" name="" value="${com.companyAddress}" readonly class="form-control">
							</td>
						</tr>
						<tr>
							<th class="w-10 align-middle">사업자명</th>
							<td class="w-40">
								<input type="text" name="" value="${com.companyCeo}" readonly class="form-control">
							</td>
							<th class="w-10 align-middle">사업자번호</th>
							<td class="w-40">
								<input type="text" name="" value="${com.companyNumber}" readonly class="form-control">
							</td>
						</tr>
						<tr>
							<th class="w-10 align-middle">은행</th>
							<td class="w-40">
								<input type="text" name="" value="${com.companyBank}" readonly class="form-control">
							</td>
							<th class="w-10 align-middle">계좌번호</th>
							<td class="w-40">
								<input type="text" name="" value="${com.companyAccount}" readonly class="form-control">
							</td>
						</tr>
						<tr>
							<td colspan="4" class="text-right align-middle">
								<a href="" class="btn_1 mb-3 mt-2">수정완료</a>
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
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
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
                    }
                });
            }
        }).open();
    }
</script>

<script>
	$(document).ready(function(){
		var imgCk = false;
		
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
						"<button type='button' id='inputImgBtn1' class='btn_1'>사진등록</button>";
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
							"<button type='button' id='inputImgBtn2' class='btn_1'>사진등록</button>";
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
				
				imgCk = true;
			});
			
			// 세번째 사진 클릭 시
	    	$('#img2').click(function(){
	            $('#level').attr('value', 2);
	            $('#img0').css("filter", "");
	            $('#img1').css("filter", "");
	            $('#img2').css("filter", "brightness(0.8)");
	        });
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
			} else if (imgCk == false){ // 업로드된 이미지 갯수 확인
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
			} else if ($('.agree:checked').val() == '미동의'){ // 약관동의
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