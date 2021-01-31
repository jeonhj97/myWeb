<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<a><input type="hidden" name="id" value="${sessionScope.id }" >   </a>

<div align="center">
<c:set var="cnt" value="${sessionScope.cnt }" />
<c:choose>

	<c:when test="${cnt eq 1}">
	 회원정보 수정에 실패했습니다.<br/>
	 <a href="./loginForm.do">[로그인 홈]</a>
	</c:when>
	
	<c:when test="${cnt eq 0}">
	회원정보 수정에 성공했습니다
	<meta http-equiv="Refresh" content="0;url=/myweb/member2/loginForm.do">
	</c:when>

</c:choose>






</div>



	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

