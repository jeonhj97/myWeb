<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<!--비밀번호가 일치하는지 안하는지검사 일치해야 글수정가능  -->
<!-- 글비밀번호 입력 -->
<h3>* 글수정 *</h3>
<p>
	<a href="./bbslist.do">[글목록]</a>
</p>
<form method="post" action="./bbsupdateform.do"
		onsubmit="return pwCheck()">
<input type="hidden" name="num" value="${requestScope.num }">
<input type="hidden" name="pageNum" value="${requestScope.pageNum }">
<table class="table">
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="passwd" id="passwd" required></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="확인" class="btn btn-success">
	</td>
</tr>
</table>
</form>	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

