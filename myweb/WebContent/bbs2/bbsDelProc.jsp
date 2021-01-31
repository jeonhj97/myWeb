<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>








<div align="center">
	<c:if test="${requestScope.cnt==1 }">
		<div>공지사항이 삭제되었습니다</div><br/>
		<meta http-equiv="refresh" content="0;url=/myweb/bbs2/bbslist.do">
	</c:if>
	
	<c:if test="${requestScope.cnt==0 }">
		비밀번호가 일치하지 않습니다<br/>
		<a href="javascript:history.go(-1)">[돌아가기]</a>
	</c:if>
</div>


	
	

	

