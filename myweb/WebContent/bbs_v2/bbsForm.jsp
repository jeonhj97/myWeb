<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   -->
<h3>* 글쓰기 *</h3>
<p><a href="bbsList.jsp">[글목록]</a></p>
<form name="bbsfrm" id="bbsfrm" method="post" 
		action="bbsins.jsp" onsubmit="return bbsCheck(this)">
<div class="container">
<table  class="table table-hover">
<tr>

	<th>작성자</th>
	<td><input type="text" name="wname" id="wname" size="30" maxlength="20" required></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="subject" id="subject" size="30" maxlength="100" required></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea rows="5" cols="30" name="content" id="content"></textarea></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="text" name="passwd" id="passwd" size="30" maxlength="15" required></td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="쓰기" class="btn btn-default">	
		<input type="reset" value="취소"  class="btn btn-default">	
	</td>
</tr>	   
</table>
</div>
</form>
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

