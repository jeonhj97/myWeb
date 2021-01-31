<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>아이디 찾기</h3>

	<form 	method="post"
			action="findIdProc.jsp">
<tr>
	<td>ID</td>
	<td><input type="text" id="id" name="id" required></td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="email" id="email" name="email" required></td>
</tr>
<input type="submit" value="찾기">
</form>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>