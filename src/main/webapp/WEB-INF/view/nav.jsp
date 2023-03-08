<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<a href="${pageContext.request.contextPath}/company/addCompanyDetail">업체등록</a>
<a href="${pageContext.request.contextPath}/company/questionList">문의사항</a>
<a href="${pageContext.request.contextPath}/company/bookingList">예약관리</a>
<a href="${pageContext.request.contextPath}/company/addProduct">상품등록</a>
<a href="${pageContext.request.contextPath}/beforeLogin/loginCompany">로그인</a>
<a href="${pageContext.request.contextPath}/beforeLogin/addCompany">기업가입</a>
<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyId">아이디 찾기</a>
<a href="${pageContext.request.contextPath}/beforeLogin/findCompanyPw">비밀번호 찾기</a>
</html>