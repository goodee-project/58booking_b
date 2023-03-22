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
		<title>예약 | 리뷰 관리</title>
		
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
				let bookingNo = 0;
				
				// 모달에 예약번호 넣기
				$(".btn_1").click(function(){
					bookingNo = $(this).data('id');
					$("#bookingNo").val(bookingNo);
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
        <li class="breadcrumb-item active">리뷰 관리</li>
      </ol>
    	<!--  -->
    	<div class="box_general">
    		<!--
	    	<table>
	    		<c:forEach var="m" items="${reviewList}">
	    			<tr>
	    				<td>
	    					<img src="${pageContext.request.contextPath}/upload/${m.customerImgSaveName}">
	    				</td>
	    				<td>
	    					${m.customerNickname}(${m.customerId})
	    					<br>
	    					${m.bookingDate} ${m.visitCount}번째 방문| ${m.createdate} 작성
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan="2">
	    					<img src="${pageContext.request.contextPath}/upload/${m.reviewImgSaveName}">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan="2">
	    					<c:if test="${m.starRating == 1}">
	    						<span class="rating">
	    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i>
	    						</span>
	    					</c:if>
	    					<c:if test="${m.starRating == 2}">
	    						<span class="rating">
	    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i>
	    						</span>
	    					</c:if>
	    					<c:if test="${m.starRating == 3}">
	    						<span class="rating">
	    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i>
	    						</span>
	    					</c:if>
	    					<c:if test="${m.starRating == 4}">
	    						<span class="rating">
	    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i>
	    						</span>
	    					</c:if>
	    					<c:if test="${m.starRating == 5}">
	    						<span class="rating">
	    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i>
	    						</span>
	    					</c:if>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan="2">
	    					${m.reviewMemo}
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan="2">
	    					<c:if test="${!reviewCommentBookingNoList.contains(m.bookingNo)}">
		    					<a class="btn_1" id="modalBtn" data-toggle="modal" data-target="#modal" data-id="${m.bookingNo}">답글 달기</a>
	    					</c:if>
	    					<c:if test="${reviewCommentBookingNoList.contains(m.bookingNo)}">
	    						<c:forEach var="rc" items="${reviewCommentList}">
	    							<c:if test="${m.bookingNo eq rc.bookingNo}">
	    								${rc.createdate}
	    								<br>
	    								${rc.reviewCommentMemo}
	    							</c:if>
		    					</c:forEach>
	    					</c:if>
	    				</td>
	    			</tr>
	    		</c:forEach>
	    	</table>
	    	 -->
	    	 
			<div class="row my-5">
		    		<c:forEach var="m" items="${reviewList}">
		    			<div class="col-md-6">
		    					<img src="${pageContext.request.contextPath}/upload/${m.customerImgSaveName}">

		    					${m.customerNickname}(${m.customerId})
		    					<br>
		    					${m.bookingDate} ${m.visitCount}번째 방문| ${m.createdate} 작성

	
								<br>
								<c:forEach var="ri" items="${reviewImgList}">
									<c:if test="${m.bookingNo == ri.bookingNo}">
		    							<img src="${pageContext.request.contextPath}/upload/${ri.reviewImgSaveName}">
									</c:if>
								</c:forEach>
	
								<br>
		    					<c:if test="${m.starRating == 1}">
		    						<span class="rating">
		    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i>
		    						</span>
		    					</c:if>
		    					<c:if test="${m.starRating == 2}">
		    						<span class="rating">
		    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i>
		    						</span>
		    					</c:if>
		    					<c:if test="${m.starRating == 3}">
		    						<span class="rating">
		    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i><i class="fa fa-fw fa-star"></i>
		    						</span>
		    					</c:if>
		    					<c:if test="${m.starRating == 4}">
		    						<span class="rating">
		    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star"></i>
		    						</span>
		    					</c:if>
		    					<c:if test="${m.starRating == 5}">
		    						<span class="rating">
		    							<i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i><i class="fa fa-fw fa-star yellow"></i>
		    						</span>
		    					</c:if>

	
								<br>
		    					${m.reviewMemo}

								<br>
								<hr>
		    					<c:if test="${!reviewCommentBookingNoList.contains(m.bookingNo)}">
			    					<a class="btn_1" id="modalBtn" data-toggle="modal" data-target="#modal" data-id="${m.bookingNo}">답글 달기</a>
		    					</c:if>
		    					<c:if test="${reviewCommentBookingNoList.contains(m.bookingNo)}">
		    						<c:forEach var="rc" items="${reviewCommentList}">
		    							<c:if test="${m.bookingNo eq rc.bookingNo}">
		    								${rc.createdate}
		    								<br>
		    								${rc.reviewCommentMemo}
		    							</c:if>
			    					</c:forEach>
		    					</c:if>
						</div>
						<c:if test="${m.rowNum % 2 == 0}">
							</div><div class="row">
						</c:if>
		    		</c:forEach>
					</div>	<!-- 마지막 row 닫기 위함 -->
	    	
	    	<!-- 페이징 -->
		 	<ul class="pagination pagination-sm add_bottom_30 justify-content-center my-5">
				<!-- 이전 -->
				<c:if test="${currentPage <= 10}">
					<li class="page-item disabled">
						<a href="${pageContext.request.contextPath}/company/reviewList?currentPage=${startPage-10}" class="page-link">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage > 10}">
					<li class="page-item">
						<a href="${pageContext.request.contextPath}/company/reviewList?currentPage=${startPage-10}" class="page-link">&laquo;</a>
					</li>
				</c:if>
				<!-- 1~10 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<li class="page-item active">
							<a href="${pageContext.request.contextPath}/company/reviewList?currentPage=${i}" class="page-link">${i}</a>
						</li>
					</c:if>
					<c:if test="${i != currentPage}">
						<li class="page-item">
							<a href="${pageContext.request.contextPath}/company/reviewList?currentPage=${i}" class="page-link">${i}</a>
						</li>
					</c:if>
				</c:forEach>
			    <!-- 다음 -->
				<c:if test="${currentPage+10 < lastPage}">
					<li class="page-item">
						<a href="${pageContext.request.contextPath}/company/reviewList?currentPage=${startPage+10}"  class="page-link">&raquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage+10 >= lastPage}">
					<li class="page-item disabled">
						<a href="${pageContext.request.contextPath}/company/reviewList?currentPage=${startPage+10}"  class="page-link">
							<span>&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
			
			
			<!-- 모달 -->
			<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="client_detail_modalLabel" aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="client_detail_modalLabel">리뷰 답글 달기</h5>
		                </div>
		                <form id="form" method="post" action="${pageContext.request.contextPath}/company/addReviewComment">
			                <div class="modal-body">
								<label>답글</label>
								<input type="hidden" name="bookingNo" id="bookingNo">
								<textarea name="reviewCommentMemo" class="form-control"></textarea>
			                </div>
			                <div class="modal-footer">
			                    <button type="submit" class="btn btn-primary" id="btn">등록</button>
			                </div>
		                </form>
		            </div>
		        </div>
		    </div>
	    
	    </div>
    	<!--  -->
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
