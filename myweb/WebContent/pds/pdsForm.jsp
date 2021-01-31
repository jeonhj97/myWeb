<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 사진 올리기 *</h3>
<form name="photofrm"
	  method="post"
	  enctype="multipart/form-data"
	  action="pdsIns.jsp"
	  onsubmit="return pdsCheck()">
<table class="table">
<tr>
	<th>성명</th>
	<td><input type="text" name="wname" id="wname" size="20" maxlength="100" required autofcus
				class="form-control"></td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<textarea rows="5" cols="30" name="subject" id="subject"
					class="form-control"></textarea>
	</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="passwd" id="passwd" 
				class="form-control"></td>
</tr>
<tr>
	<th>첨부파일</th>
	<td><input type="file" name="filename" id="filename" ></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="사진올리기" class="btn btn-success">
		<input type="reset" value="취소" class="btn btn-default">
	</td>
</tr>
</table>
<br>
			
	
</form>					
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

