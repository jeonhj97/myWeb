<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<%@ include file="/view/color.jspf"%>
<!--  본문 시작   bbsForm.jsp-->

<h3>* 글쓰기 *</h3>
<form method="post" name="writeform" action="./bbsinsert.do">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">
<input type="hidden" name="re_level" value="${re_level}">
	
<table  class="table table-hover">
<tr>
<td align="right" colspan=2 bgcolor="${value_c}">
	<a href="<%=request.getContextPath()%>/bbs2/bbslist.do">글목록</a></td>
</tr>	
<tr>
	<td bgcolor="${value_c}">작성자</td>
	<td><input type="text" name="writer" class="form-control"></td>
</tr>
<tr>
	<td bgcolor="${value_c}">제목</td>
	<td><input type="text" name="subject" class="form-control"></td>
</tr>
<tr>
	<td bgcolor="${value_c}">이메일</td>
	<td><input type="text" name="email" class="form-control"></td>
</tr>
<tr>
	<td bgcolor="${value_c}">내용</td>
	<td><textarea name="content" rows="5" cols="40" class="form-control"></textarea></td>
</tr>
<tr>
	<td bgcolor="${value_c}">비밀번호</td>
	<td><input type="password" name="passwd" class="form-control"></td>
</tr>
<tr>
	<td colspan=2 bgcolor="${value_c}" align="center">
	<input type="submit" value="글쓰기" >
	<input type="reset" value="취소" >
	<input type="button" value="목록보기" onclick="location.href='./bbslist.do'">
	</td>
</tr>
</table>
</form>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

