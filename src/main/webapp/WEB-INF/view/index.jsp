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
	  <title>예약 | 기업 Index</title>
		
	  <!-- Favicons-->
	  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin_section/img/favicon.ico" type="image/x-icon">
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
	  <!-- Your custom styles -->
	  <link href="${pageContext.request.contextPath}/resources/admin_section/css/custom.css" rel="stylesheet">
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
	          <a href="${pageContext.request.contextPath}/index">Home</a>
	        </li>
	        <li class="breadcrumb-item active">Index</li>
	      </ol>
	      
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-bar-chart"></i>예약팀-기업</h2>
				</div>
				<p>
					1) 화면설계<br>
					- 카카오 오븐을 사용하여 화면설계했습니다.<br>
					2) 통합 DB 생성<br>
					- 플랫폼, 쇼핑몰팀, 예약팀 통합 DB 구현했습니다.<br>
					3) 일정관리<br>
					- 팀별 일정은 Notion을 활용하여 관리했습니다.<br>
					4) gitHub<br>
				</p>
				<p>
					<button type="button" class="btn_1 btn-sm btn-outline-primary" onclick="window.open('/58booking_b/resources/admin_section/UI & UX 통합.pdf')"> 화면설계</button>
					<button type="button" class="btn_1 btn-sm btn-outline-primary" onclick="window.open('/58booking_b/resources/admin_section/erd.png')">ERD</button>
					<a href="https://chambray-alley-4a0.notion.site/70631427223d438dbefa955cd0e549fd" class="btn_1 " target="blank"> Notion</a>
					<a href="https://github.com/goodee-project/58booking_b" class="btn_1 " target="blank">git</a>
				</p>
				<div class="list_general">
				<ul>
					<li>
						<h2>김민송</h2>
						<p>담당 기능 : 
							<a href="${pageContext.request.contextPath}/company/modifyCompanyDetail">업체관리</a>,
							<a href="${pageContext.request.contextPath}/company/customerList">고객관리</a>,
							<a href="${pageContext.request.contextPath}/company/reviewList">리뷰관리</a>
						</p>
						<h6>1. 고객 관리</h6>
						<p>
							1) SQL 동적 쿼리를 활용한 검색 기능<br>
							- MyBatis의 기능으로 검색어가 있을 때만 조건을 추가하는 동적 쿼리를 활용했습니다.<br>
							- MyBatis의 기능으로 클릭한 분류별로 오름차순/내림차순이 되는 동적 쿼리를 활용했습니다.<br>
						</p>
						<h6>2. 업체 관리</h6>
						<p>
							1) SQL 계층형 구조 테이블 활용<br>
							- 업체 카테고리를 계층형 테이블로 만들어 사용했습니다.<br>
							- Ajax 기술을 활용하여 상위 카테고리에 해당하는 하위 카테고리만 나오도록 동적 셀렉트 박스를 구현했습니다.<br>
							<br>
							2) SQL 임시 테이블 및 날짜 함수 활용<br>
							- 임시 테이블을 활용하여 등록하는 날짜 기준으로 선택한 요일을 찾도록 했습니다.<br>
							- 1년간 지정한 요일의 날짜가 DB에 추가되도록 했습니다.<br>
							<br>
							3) FullCalendar 라이브러리 사용<br>
							- JAVA의 Calendar API를 이용한 달력 구현은 경험이 있어서, 새로운 걸 해보고자 많이 쓰이는 FullCalendar 라이브러리를 사용했습니다.<br>
							- 일정 관리를 위한 라이브러리지만, 예약이라는 프로젝트 성격에 맞게 월 달력에서 모든 일정을 휴무일의 개념으로 사용했습니다. <br>
							- Ajax 기술을 활용하여 비동기로 DB와 연결했습니다.<br>
						</p>
					</li>
					<li>
						<h2>민태희</h2>
						<p>담당 기능 : 
							<a href="${pageContext.request.contextPath}/company/productList">상품관리</a>,
							<a href="${pageContext.request.contextPath}/company/bookingList">예약관리</a>,
							<a href="${pageContext.request.contextPath}/company/questionList">문의사항</a>
						</p>
						<h6>1. 예약관리</h6> 
						<p>
							1) Ajax 활용 예약상태 변경<br>
							- Ajax를 이용하여 post 방식으로 상태 변경 가능하게 구현했습니다.<br>
							- 예약을 취소하면 취소 사유를 작성 폼을 모달로 띄우고 상태 변경과 동시에 취소데이터를 DB에 추가했습니다.<br>
							- 기본적인 유효성 검사는 Java Script를 이용해 검사했습니다.<br>
							<br>
							2) 구현 예정<br>
							- SQL 동적 쿼리 활용한 검색기능<br>
							- 예약수정 <br>
							- 예약 수정과 확정, 취소시 고객에게 메일 안내(스케줄러, 메일API 사용예정)<br>
						</p>
						<h6>2. 상품관리</h6>
						<p>
							1) Ajax 활용 공개 여부 변경<br>
							- Ajax를 이용하여 post 방식으로 공개 여부 변경 가능하게 구현했습니다.<br>
							<br>
							2) 구현예정<br>
							- 상품등록(FullCalendar 라이브러리, Ajax 사용예정)<br>
							- 상품수정 <br>
						</p>
						<h6>3. 문의사항</h6> 
						<p>
							- 플랫폼에 문의글을 남길 수 있고 답변이 없을 경우 삭제가 가능합니다.<br>
						</p>
						
					</li>
					<li>
						<h2>이가을</h2>
						<p>담당 기능 : 
							<a href="${pageContext.request.contextPath}/beforeLogin/loginCompany">로그인</a>, 
							<a href="${pageContext.request.contextPath}/beforeLogin/addCompany">업체가입</a>, 
							<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디찾기</a>, 
							<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호찾기</a>, 
							<a href="${pageContext.request.contextPath}/company/companyBasicInfo/companyMain">업체 기본정보</a>, 
							<a href="${pageContext.request.contextPath}/company/statistics/totalStatistics">전체통계</a>, 
							<a href="${pageContext.request.contextPath}/company/statistics/salesStatistics">매출통계</a>, 
							<a href="${pageContext.request.contextPath}/company/statistics/reportStatistics">신고통계</a>
						</p>

						<h6>1. 로그인</h6>
						<P>
						 1) 로그인 분기<br>
						 - 계정 정보로 DB에 접근하여 로그인 분기를 나누었습니다.<br>
						 &nbsp;&nbsp;&nbsp;&nbsp;첫번째 분기 : 플랫폼 미승인 - 계정 활성화 상태가 비활성화이면, 로그인 불가<br>
						 &nbsp;&nbsp;&nbsp;&nbsp;두번째 분기 : 플랫폼 승인 완료, 최초 로그인 - DB에 입력된 업체 상세정보가 없으면, 업체 상세정보 등록 페이지로<br>
						 &nbsp;&nbsp;&nbsp;&nbsp;세번째 분기 : 첫번째와 두번째 분기를 모두 지났으면, 일반 로그인 진행(업체 메인페이지로)<br>
						 <br>
						 2) 쿠키를 사용하여 사용자 아이디 정보 저장<br>
						 - 자바스크립트로 체크박스 활성화 여부 확인 후, 활성화 시 7일 동안 input에 입력된 정보를 쿠키에 저장하였습니다. 
						</P>
						
						<h6>2. 업체 기본정보</h6>
						<P>
						 1) 동적버튼 생성하여 파일 업로드<br>
						 - 업체 가입 시, 자바스크립트를 활용해 동적으로 사진 업로드 버튼이 생성되도록 구현했습니다.<br>
						 - multipart형식의 form으로 File타입의 객체를 받아와서 DB와 로컬폴더에 파일이 저장되도록 구현했습니다.<br>
						 <br>
						 2) 구글 SMTP 서버와 javaMail API 활용한 이메일 인증<br>
						 - 랜덤으로 생성된 인증번호와 API를 사용해 생성된 이메일을 구글 SMTP 서버를 통해 전송하였습니다.<br>
						 - 이메일의 전송과정은 비동기 방식으로 구현하였습니다.<br>
						 <br>
						 3) 다음 지도 API 활용<br>
						 - 업체 가입 시, 사용자가 주소를 입력하면 주소 정보에서 위도, 경도를 가져와 DB에 저장하였습니다.<br>
						 - 업체 정보 조회 시, 저장된 위도와 경도 값으로 해당 위치가 지도에 표시되도록 구현하였습니다.<br>
						 <br>
						 
						<h6>3. 아이디 찾기/비밀번호 찾기</h6>
						<P>
						1) 구글 SMTP 서버와 javaMail API 활용한 이메일 인증<br>
						- 아이디와 비밀번호를 찾는 과정에서도 비동기 방식으로 이메일을 전송하였습니다.<br>
						- 입력한 인증번호가 일치하면, 비동기 방식을 통해 아이디 정보/비밀번호 변경 페이지가 나오도록 동적으로 구현하였습니다.<br>
						<br>
						2) SQL 동적쿼리 사용<br>
						- 인증을 위한 이메일 조회 시, 동적쿼리를 사용하여 하나의 이메일 전송 컨트롤러에서 세가지 방식의 이메일을 전송하도록 구현하였습니다.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;첫번째 방식 : 업체가입 시 이메일 전송 - 이메일 조회 필요 없음<br>
						&nbsp;&nbsp;&nbsp;&nbsp;두번째 방식 : 아이디 찾기 시 이메일 전송 - 이메일 조회, 이름 정보만 필요<br>
						&nbsp;&nbsp;&nbsp;&nbsp;세번째 방식 : 비밀번호 찾기 시 이메일 전송 - 이메일 조회, 아이디 정보만 필요<br>
						</P>
						
						<h6>4. 통계</h6>
						<P>
						비동기 차트
						 - 예약통계(신규예약, 취소예약, 확정예약, 방문예약) <br>
						 - 매출통계(일별, 월별, 년도별) <br> 
						 - 신고통계<br>
						</P>
					</li>
				</ul>
			</div>
			
				
				
			</div>
			
			
		  </div>
		  <!-- /.container-fluid-->
	   	</div>
	    <!-- /.container-wrapper-->
	    <footer class="sticky-footer">
	      <div class="container">
	        <div class="text-center">
	          <small>Copyright © PANAGEA 2021</small>
	        </div>
	      </div>
	    </footer>
	    <!-- Scroll to Top Button-->
	    <a class="scroll-to-top rounded" href="#page-top">
	      <i class="fa fa-angle-up"></i>
	    </a>
	
	    <!-- Bootstrap core JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	    <!-- Core plugin JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery-easing/jquery.easing.min.js"></script>
	    <!-- Page level plugin JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/chart.js/Chart.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/jquery.dataTables.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/datatables/dataTables.bootstrap4.js"></script>
		   <script src="${pageContext.request.contextPath}/resources/admin_section/vendor/jquery.magnific-popup.min.js"></script>
	    <!-- Custom scripts for all pages-->
	    <script src="${pageContext.request.contextPath}/resources/admin_section/js/admin.js"></script>
		   <!-- Custom scripts for this page-->
	    <script src="${pageContext.request.contextPath}/resources/admin_section/js/admin-charts.js"></script>
		
	</body>
</html>
