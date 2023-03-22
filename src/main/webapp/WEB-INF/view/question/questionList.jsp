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
	        <li class="breadcrumb-item active">Q&A</li>
	      </ol>
		      <div class="box_general">
				<h2 class="d-inline-block">Q&A</h2>
				<a class="btn_1 gray delete" data-toggle="modal" data-target="#modal">문의하기</a>
				<div class="list_general">
					<ul>
						<c:forEach var="q" items="${list}">
							<li>
								<ul class="buttons">
									<c:if test="${empty q.questionComment}"> 
										<a class="btn_1 gray delete" href="${pageContext.request.contextPath}/company/removeQuestion?questionNo=${q.questionNo}">
											<i class="fa fa-fw fa-times-circle-o"></i> 삭제
										</a>
									</c:if> 
								</ul>
								<h4>
									<a href="${pageContext.request.contextPath}/company/questionOne?questionNo=${q.questionNo}">${q.questionTitle}</a> 
									<c:choose> 
										<c:when test="${empty q.questionComment}">
											<i class="unread">확인중</i>
										</c:when> 
										<c:otherwise>
											<i class="read">답변완료</i>
										</c:otherwise> 
									</c:choose> 
								</h4>
								<p>${q.questionMemo}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- /box_general-->
			<nav aria-label="...">
				<ul class="pagination pagination-sm add_bottom_30">
					<li class="page-item disabled">
						<a class="page-link" href="" tabindex="-1">Previous</a>
					</li>
					<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/company/questionList?currentPage=${i}">${i}</a>
						</li>
					</c:forEach>
					<li class="page-item">
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
				
			</nav>
			<!-- /pagination-->
		  </div>
		  <!-- /container-fluid-->
	   	</div>
	    <!-- /container-wrapper-->
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
	    
	    <!-- modal -->
	    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="client_detail_modalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="client_detail_modalLabel">예약 취소</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <form id="questionForm" method="post" action="${pageContext.request.contextPath}/company/addQuestion">
		                <div class="modal-body">
		                    <div class="row">
		                        <div class="col-md-6">
		                            <div class="form-group">
		                                <p id="msg" style="color: red;"></p>
		                                <label>제목</label>
		                                <input class="form-control" type="text" name="questionTitle" id="questionTitle">
		                                <label>내용</label>
		                                <textarea class="form-control" rows="10" cols="100" name="questionMemo" id="questionMemo"></textarea>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- /Row -->
		                </div>
		                <div class="modal-footer">
		                    <a class="btn btn-primary" id="btn">Save</a>
		                </div>
	                </form>
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
