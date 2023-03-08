<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="Ansonika">
		<title>예약 | 문의사항</title>
		
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
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				$('#btn').click(function() {
					// 유효성 검사
					if($('#questionTitle').val() == '') {
						$('#msg').text('제목을 입력 해주세요');
						$('#questionTitle').focus();
						return;
					} else {
						$('#msg').text('');
					}
					if($('#questionMemo').val() == '') {
						$('#msg').text('내용을 입력 해주세요');
						$('#questionMemo').focus();
						return;
					} else {
						$('#msg').text('');
					}
					$('#questionForm').submit();
					alert('문의사항등록 완료');
				});
			});
		</script>
	</head>
	
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
	        <li class="breadcrumb-item active">Add listing</li>
	      </ol>
	      	<h3>문의사항 등록</h3>
			<form id="questionForm" method="post" action="${pageContext.request.contextPath}/company/addQuestion">
				<div>
	 				<p id="msg" style="color: red;"></p>
				</div>
				<table border="1">
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="questionTitle" id="questionTitle">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="50" name="questionMemo" id="questionMemo"></textarea>
						</td>
					</tr>
				</table>
				<button type="button"id="btn">등록</button>
			</form>
			
			<hr>
		
			<h3>문의사항 목록</h3>
			<table border="1">
				<thead>
					<tr>
						<th>제목</th>
						<th>날짜</th>
						<th>답변</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="q" items="${list}">
	              		<tr>
	                		<td>
	                			<a href="${pageContext.request.contextPath}/company/questionOne?questionNo=${q.questionNo}">${q.questionTitle}</a>
	                		</td>
	                		<td>${fn:substring(q.createdate,0,10) }</td>
	                		<td>
			               		<c:choose> 
									<c:when test="${empty q.questionComment}">
										<a href="${pageContext.request.contextPath}/company/removeQuestion?questionNo=${q.questionNo}">삭제</a>
									</c:when> 
									<c:otherwise>
										<p>답변완료</p>
									</c:otherwise> 
								</c:choose> 
							</td>
	              		</tr>
	             	</c:forEach>
				</tbody>
			</table>
			
	        <a href="${pageContext.request.contextPath}/company/questionList?currentPage=${currentPage-1}"> < </a>
	        <c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
				<a href="${pageContext.request.contextPath}/company/questionList?currentPage=${i}">${i}</a>
			</c:forEach>
	        <a href="${pageContext.request.contextPath}/company/questionList?currentPage=${currentPage+1}"> > </a>
		    	
	    </div>
	  </div>

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
