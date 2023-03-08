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
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath}/index">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">김민송</span>
          </a>
          <ul class="sidenav-second-level collapse show" id="collapseMylistings">
            <li>
              <a href="${pageContext.request.contextPath}/company/addCompanyDetail">업체등록</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/company/customerList">고객관리</a>
            </li>
          </ul>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">민태희</span>
          </a>
          <ul class="sidenav-second-level collapse show" id="collapseMylistings">
            <li>
              <a href="${pageContext.request.contextPath}/company/bookingList">예약관리</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/company/addProduct">상품관리</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/company/questionList">문의사항</a>
            </li>
          </ul>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">이가을</span>
          </a>
          <ul class="sidenav-second-level collapse show" id="collapseMylistings">
            <li>
              <a href="${pageContext.request.contextPath}/beforeLogin/loginCompany">로그인</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/beforeLogin/addCompany">기업가입</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디찾기</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호찾기</a>
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
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
</html>