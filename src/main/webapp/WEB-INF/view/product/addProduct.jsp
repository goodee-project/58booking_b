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
		<title>예약 | 상품등록</title>
		
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
		
	</head>
	
	<body class="fixed-nav sticky-footer" id="page-top">
	 <!-- Navigation-->
	  <nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
	    <a class="navbar-brand" href="index.html"><img src="img/logo.png" alt="" width="150" height="36"></a>
	    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarResponsive">
	      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
	          <a class="nav-link" href="index.html">
	            <i class="fa fa-fw fa-dashboard"></i>
	            <span class="nav-link-text">Dashboard</span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Messages">
	          <a class="nav-link" href="messages.html">
	            <i class="fa fa-fw fa-envelope-open"></i>
	            <span class="nav-link-text">Messages</span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Bookings">
	          <a class="nav-link" href="bookings.html">
	            <i class="fa fa-fw fa-calendar-check-o"></i>
	            <span class="nav-link-text">Bookings <span class="badge badge-pill badge-primary">6 New</span></span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
	          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings">
	            <i class="fa fa-fw fa-list"></i>
	            <span class="nav-link-text">My listings</span>
	          </a>
	          <ul class="sidenav-second-level collapse" id="collapseMylistings">
	            <li>
	              <a href="listings.html">Pending <span class="badge badge-pill badge-primary">6</span></a>
	            </li>
				<li>
	              <a href="listings.html">Active <span class="badge badge-pill badge-success">6</span></a>
	            </li>
				<li>
	              <a href="listings.html">Expired <span class="badge badge-pill badge-danger">6</span></a>
	            </li>
	          </ul>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
	          <a class="nav-link" href="reviews.html">
	            <i class="fa fa-fw fa-star"></i>
	            <span class="nav-link-text">Reviews</span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookmarks">
	          <a class="nav-link" href="bookmarks.html">
	            <i class="fa fa-fw fa-heart"></i>
	            <span class="nav-link-text">Bookmarks</span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add listing">
	          <a class="nav-link" href="add-listing.html">
	            <i class="fa fa-fw fa-plus-circle"></i>
	            <span class="nav-link-text">Add listing</span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My profile">
	          <a class="nav-link" href="user-profile.html">
	            <i class="fa fa-fw fa-user"></i>
	            <span class="nav-link-text">My Profile</span>
	          </a>
	        </li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
	          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents">
	            <i class="fa fa-fw fa-gear"></i>
	            <span class="nav-link-text">Components</span>
	          </a>
	          <ul class="sidenav-second-level collapse" id="collapseComponents">
	            <li>
	              <a href="charts.html">Charts</a>
	            </li>
				<li>
	              <a href="tables.html">Tables</a>
	            </li>
	          </ul>
	        </li>
	      </ul>
	      <ul class="navbar-nav sidenav-toggler">
	        <li class="nav-item">
	          <a class="nav-link text-center" id="sidenavToggler">
	            <i class="fa fa-fw fa-angle-left"></i>
	          </a>
	        </li>
	      </ul>
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fa fa-fw fa-envelope"></i>
	            <span class="d-lg-none">Messages
	              <span class="badge badge-pill badge-primary">12 New</span>
	            </span>
	            <span class="indicator text-primary d-none d-lg-block">
	              <i class="fa fa-fw fa-circle"></i>
	            </span>
	          </a>
	          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
	            <h6 class="dropdown-header">New Messages:</h6>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">
	              <strong>David Miller</strong>
	              <span class="small float-right text-muted">11:21 AM</span>
	              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
	            </a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">
	              <strong>Jane Smith</strong>
	              <span class="small float-right text-muted">11:21 AM</span>
	              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
	            </a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">
	              <strong>John Doe</strong>
	              <span class="small float-right text-muted">11:21 AM</span>
	              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
	            </a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item small" href="#">View all messages</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	            <i class="fa fa-fw fa-bell"></i>
	            <span class="d-lg-none">Alerts
	              <span class="badge badge-pill badge-warning">6 New</span>
	            </span>
	            <span class="indicator text-warning d-none d-lg-block">
	              <i class="fa fa-fw fa-circle"></i>
	            </span>
	          </a>
	          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
	            <h6 class="dropdown-header">New Alerts:</h6>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">
	              <span class="text-success">
	                <strong>
	                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
	              </span>
	              <span class="small float-right text-muted">11:21 AM</span>
	              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
	            </a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">
	              <span class="text-danger">
	                <strong>
	                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
	              </span>
	              <span class="small float-right text-muted">11:21 AM</span>
	              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
	            </a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">
	              <span class="text-success">
	                <strong>
	                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
	              </span>
	              <span class="small float-right text-muted">11:21 AM</span>
	              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
	            </a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item small" href="#">View all alerts</a>
	          </div>
	        </li>
	        <li class="nav-item">
	          <form class="form-inline my-2 my-lg-0 mr-lg-2">
	            <div class="input-group">
	              <input class="form-control search-top" type="text" placeholder="Search for...">
	              <span class="input-group-btn">
	                <button class="btn btn-primary" type="button">
	                  <i class="fa fa-search"></i>
	                </button>
	              </span>
	            </div>
	          </form>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
	            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
	        </li>
	      </ul>
	    </div>
	  </nav>
	  <!-- /Navigation-->
	  <!-- /Navigation-->
	  <div class="content-wrapper">
	    <div class="container-fluid">
	      <!-- Breadcrumbs-->
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          <a href="#">Dashboard</a>
	        </li>
	        <li class="breadcrumb-item active">Add listing</li>
	      </ol>
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-file"></i>상품정보</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>Photos</label>
							<form action="/file-upload" class="dropzone dz-clickable">
								<div class="dz-default dz-message">
									<span>Drop files here to upload</span>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>미리보기 넣기</label>
							<div>
							
							</div>
						</div>
					</div>
				</div>
				<!-- /row-->
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>상품명</label>
							<input type="text" class="form-control" name="productName" id="productName">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>가격</label>
							<input type="text" class="form-control" placeholder="상품가격" name="productPrice" id="productPrice">
						</div>
					</div>
				</div>
			</div>
			<!-- /box_general-->
			
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-map-marker"></i>세부사항</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>최소 인원</label>
							<input type="text" class="form-control" value="1" name="productMinPeople" id="productMinPeople">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>최대 인원</label>
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<!-- /row-->
			</div>
			<!-- /box_general-->
			
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-clock-o"></i>상품 휴무</h2>
				</div>
			</div>
			<!-- /box_general-->
			
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-dollar"></i>옵션</h2>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h6>option</h6>
						<table id="pricing-list-container" style="width:100%;">
							<tr class="pricing-list-item">
								<td>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control" placeholder="Title" name="productOptionName" id="productOptionName">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<input type="text" class="form-control" placeholder="Description" name="productOptionMemo" id="productOptionMemo">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" class="form-control"  placeholder="Price" name="productOptionPrice" id="productOptionPrice">
											</div>
										</div>
										<div class="col-md-2 d-flex align-items-center">
											<div class="form-group">
												<a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
						<a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>Add Option</a>
						</div>
				</div>
				<!-- /row-->
			</div>
			<!-- /box_general-->
			<p><a href="#0" class="btn_1 medium">Save</a></p>
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
