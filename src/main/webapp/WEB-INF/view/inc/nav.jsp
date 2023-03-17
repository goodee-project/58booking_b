<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/resources/admin_section/img/logo.png" alt="" width="150" height="36"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        
        <!-- 인덱스 -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/index">
            <i class="fa fa-fw fa-home"></i>
            <span class="nav-link-text">Home</span>
          </a>
        </li>
        
        <!-- 내 업체관리 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings">
            <i class="fa fa-fw fa-gear"></i>
            <span class="nav-link-text">내 업체관리</span>
          </a>
          <ul class="sidenav-second-level collapse show" id="collapseMylistings">
            <li>
              <a href="${pageContext.request.contextPath}/company/companyBasicInfo/companyMain">기본정보</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/company/modifyCompanyDetail">상세정보</a>
            </li>
          </ul>
        </li>
        
        <!-- 상품관리 -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/company/productList">
            <i class="fa fa-fw fa-tags" aria-hidden="true"></i>
            <span class="nav-link-text">상품관리</span>
          </a>
        </li>
        
        <!-- 고객관리 -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/company/customerList">
            <i class="fa fa-fw fa-user"></i>
            <span class="nav-link-text">고객관리</span>
          </a>
        </li>
        
        <!-- 예약관리 -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/company/bookingList">
            <i class="fa fa-fw fa-calendar-check-o"></i>
            <span class="nav-link-text">예약관리</span>
          </a>
        </li>
        
        <!-- 리뷰관리 -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/company/reviewList">
            <i class="fa fa-fw fa-star"></i>
            <span class="nav-link-text">리뷰관리</span>
          </a>
        </li>
        
        <!-- 통계 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylisting">
            <i class="fa fa-fw fa-bar-chart"></i>
            <span class="nav-link-text">통계</span>
          </a>
          <ul class="sidenav-second-level collapse show" id="collapseMylisting">
            <li>
              <a href="${pageContext.request.contextPath}/company/statistics/totalStatistics">전체통계</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/company/statistics/salesStatistics">매출통계</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/company/statistics/reportStatistics">신고통계</a>
            </li>
          </ul>
        </li>
        
        <!-- 문의사항 -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/company/questionList">
            <i class="fa fa-fw fa-question-circle"></i>
            <span class="nav-link-text">문의사항</span>
          </a>
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
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
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
           <a class="nav-link" href="${pageContext.request.contextPath}/company/logout">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
</html>