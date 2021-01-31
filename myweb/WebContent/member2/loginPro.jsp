<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>


<!-- 본문시작 -->
<div align="center">
<c:if test="${res==1 }">
	<c:set var="memid" value="${sessionScope.s_id }" scope="session" />
	<meta http-equiv="Refresh" content="0;url=/myweb/member2/loginForm.do">
</c:if>

<c:if test="${res==0 }">
아이디  또는 비밀번호를 확인해주세요<br/>
<a href="javascript:history.go(-1)">[돌아가기]</a>
</c:if>
</div>


<!-- 본문 끝 -->

</body>
</html>