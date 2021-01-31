<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko"><!--한글로 번역해줄까요  -->
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트  -->
  <!-- 주의사항  
  		CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할것-->
   <link href="../css/mystyle.css" rel="stylesheet">
  <script src="../js/myscript.js"></script>
  <style></style>
</head>
<body>

<!-- 메인카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../bbs/bbsList.jsp">게시판</a></li>
        <li><a href="../notice/noticeList.jsp">공지사항</a></li>
        <li><a href="../member/loginForm.jsp">로그인</a></li>
         <li><a href="../pds/pdsList.jsp">포토갤러리</a></li>
         <li><a href="../mail/mailForm.jsp">메일보내기</a></li>
         <li><a href="../bbs2/bbslist.do">게시판(MVC)</a></li>
         <li><a href="../member2/loginForm.do">로그인(MVC)</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- 메인카테고리 끝 -->


<!-- Contest 시작-->
<div class="container-fluid bg-3 text-center">    
  <div class="row">
   	
  

