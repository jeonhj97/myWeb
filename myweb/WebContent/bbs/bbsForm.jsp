i<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   -->
<h2>글쓰기 </h2>
<p><a href="bbsList.jsp">[글목록]</a></p>
<form name="bbsfrm" id="bbsfrm" method="post" 
		action="bbsins.jsp" onsubmit="return bbsCheck(this)">
<table  class="table">
<tr>
	
	<th style="color:black">작성자</th>
	<td><input type="text" name="wname" id="wname" size="30" maxlength="20" required
				class="form-control"></td>
</tr>
<tr>
	<th style="color:black">제목</th>
	<td><input type="text" name="subject" id="subject" size="30" maxlength="100" required
				class="form-control"></td>
</tr>
<tr>
	<th style="color:black">내용</th>
	<td><textarea rows="5" cols="30" name="content" id="content"	
					class="form-control"></textarea></td>
</tr>
<tr>
	<th style="color:black">비밀번호</th>
	<td><input type="text" name="passwd" id="passwd" size="30" maxlength="15" required
			class="form-control"></td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="쓰기" class="btn btn-default">	
		<input type="reset" value="취소"  class="btn btn-default">	
	</td>
</tr>	   
</table>
</form>
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

