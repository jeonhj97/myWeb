<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 글삭제 *</h3>
<p>
	<a href="bbsList.jsp">[글목록]</a>
</p>
<form method="post" action="bbsDelProc.jsp"
		onsubmit="return pwCheck()">
<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
<table class="table">
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="passwd" id="passwd" required></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="삭제" class="btn btn-danger">
	</td>
</tr>
</table>
</form>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

