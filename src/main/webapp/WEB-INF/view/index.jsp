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
	  <title>예약 | 기업-메인</title>
		
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
	          <a href="${pageContext.request.contextPath}/index">Dashboard</a>
	        </li>
	        <li class="breadcrumb-item active">Main</li>
	      </ol>
	      
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-bar-chart"></i>예약팀-기업</h2>
				</div>
				<p>
					<button type="button" class="btn_1 btn-sm btn-outline-primary" onclick="window.open('/58booking_b/resources/admin_section/UI.pdf')"><i class="fa fa-fw fa-eye"></i> UI/UX</button>
					<button type="button" class="btn_1 btn-sm btn-outline-primary" onclick="window.open('/58booking_b/resources/admin_section/UI.pdf')"><i class="fa fa-fw fa-eye"></i> ERD</button>
					<a href="https://github.com/goodee-project/58booking_b" class="btn_1 " target="blank"><i class="fa fa-fw fa-eye"></i> git</a>
				</p>
				<div class="list_general">
				<ul>
					<li>
						<h2>김민송</h2>
						<strong>1. 고객 관리</strong>
						<p>
							1) SQL 동적 쿼리를 활용한 검색 기능<br>
							- MyBatis의 기능으로 검색어가 있을 때만 조건을 추가하는 동적 쿼리를 활용했습니다.<br>
							- MyBatis의 기능으로 클릭한 분류별로 오름차순/내림차순이 되는 동적 쿼리를 활용했습니다.<br>
						</p>
						<strong>2. 예약 관리</strong>
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
						<strong>1. 예약관리</strong> 
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
						<strong>2. 상품관리</strong>
						<p>
							1) Ajax 활용 공개 여부 변경<br>
							- Ajax를 이용하여 post 방식으로 공개 여부 변경 가능하게 구현했습니다.<br>
							<br>
							2) 구현예정<br>
							- 상품등록(FullCalendar 라이브러리, Ajax 사용예정)<br>
							- 상품수정 <br>
						</p>
						<strong>3. 문의사항</strong> 
						<p>
							- 플랫폼에 문의글을 남길 수 있고 답변이 없을 경우 삭제가 가능합니다.<br>
						</p>
						
					</li>
					<li>
						<h2>이가을</h2>
						<strong>1. 고객 관리</strong>
						<p>
							1) SQL 동적 쿼리를 활용한 검색 기능<br>
							- MyBatis의 기능으로 검색어가 있을 때만 조건을 추가하는 동적 쿼리를 활용했습니다.<br>
							- MyBatis의 기능으로 클릭한 분류별로 오름차순/내림차순이 되는 동적 쿼리를 활용했습니다.<br>
						</p>
						<strong>2. 예약 관리</strong>
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
	    <!-- Logout Modal-->
	    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
	            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">×</span>
	            </button>
	          </div>
	          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
	          <div class="modal-footer">
	            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	            <a class="btn btn-primary" href="#0">Logout</a>
	          </div>
	        </div>
	      </div>
	    </div>
	
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
