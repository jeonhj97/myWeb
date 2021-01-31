<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   bbsUpdate.jsp-->

<h3>* 글수정 *</h3>
	<p>
		<a href="./bbsform.do">[글쓰기]</a>
		<a href="./bbslist.do">[글목록]</a>
	</p>
	

	
	<c:set var="article" value="${requestScope.article}" />
	<c:choose>
		<c:when test="${empty article}">	<!-- article 이 null값이냐?? 반대: !empty(null이 아닌경우) -->
			<div>비밀번호가 일치하지 않습니다</div>
			<div><a href='javascript:history.back()'>[다시시도]</a></div>
		</c:when>
		
		<c:otherwise>
		
		
	
	

<form method="post" action="./bbsupdateproc.do" onsubmit="return bbsCheck(this)">
<input type="hidden" name="num" value="${requestScope.num}">
<input type="hidden" name="pageNum" value="${requestScope.pageNum }">
<input type="hidden" name="ip" value="${requestScope.pageNum }">
<div class="container">
<table  class="table table-hover">
	<tr>
	<th bgcolor="${value_c}">작성자</th>
	<td><input type="text" name="writer" id="writer" value="${requestScope.writer }"  size="30" maxlength="20" required></td>
</tr>
<tr>
	<th bgcolor="${value_c}">제목</th>
	<td><input type="text" name="subject" id="subject"  value="${requestScope.subject }" size="30" maxlength="100" required></td>
</tr>
<tr>
	<th bgcolor="${value_c}">내용</th>
	<td><textarea rows="5" cols="30" name="content" id="content" value="${requestScope.content  }"></textarea></td>
</tr>
<tr>
	<th bgcolor="${value_c}">비밀번호</th>
	<td><input type="text" name="passwd" id="passwd"  size="30" maxlength="15" value="${requestScope.passwd }" required></td>
</tr>
<tr>
	  <td colspan="2" align="center">
	    <input type="submit" value="수정" class="btn btn-default">	
		<input type="reset" value="취소"  class="btn btn-default">
	  </td>
	</tr>
	</table>
	</div>
	</form>

	</c:otherwise>
	</c:choose>

	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

