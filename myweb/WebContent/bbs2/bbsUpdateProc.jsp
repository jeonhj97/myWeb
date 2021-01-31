<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div align="center">
	<c:if test="${requestScope.cnt==0 }">
		<div>글수정이 성공하였습니다</div>
		<a href="./bbslist.do">[글목록]</a>
	</c:if>
	
	
		<c:if test="${requestScope.cnt==1 }">
		<div>글수정이 실패하였습니다</div>
		<p><a href="javascript:history.go(-1)">[다시시도]</a></p>
	</c:if>
</div>