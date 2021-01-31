<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   bbsContent.jsp-->
<p><strong>글내용보기</strong></p>
<table class="table table-hover">
<tr>
	<td bgcolor="${value_c }" >글번호</td>
	<td >${article.num }</td>
	<td bgcolor="${value_c }">조회수</td>
	<td>${article.readcount }</td>
</tr>
<tr>
	<td bgcolor="${value_c }">작성자</td>
	<td>${article.writer }</td>
	<td bgcolor="${value_c }">조회수</td>
	<td>${article.reg_date }</td>
</tr>
<tr>
	<td bgcolor="${value_c }">글제목</td>
	<td colspan=3>${article.subject }</td>
</tr>
<tr>
	<td bgcolor="${value_c }">글내용</td>
	<td>${article.content }
<%//치환 변수 선언
	pageContext.setAttribute("cr", "\r");		//Space
	pageContext.setAttribute("crcn","\r\n");	//Space,Enter
	pageContext.setAttribute("cn", "\n");		//Enter
	pageContext.setAttribute("br", "<br/>");	//br태그
%>
<%-- ${article.content} --%>
<!-- \n값이 <br/>값으로 바꿔서 출력하게함 -->
	</td>
</tr>
<tr>
	<td colspan=4 bgcolor="${value_c }">
	<input type="button" value="글수정"
	onclick="location.href='./bbsupdate.do?num=${article.num}&pageNum=${pageNum }'">
	
	<input type="button" value="글삭제"
	onclick="location.href='./bbsdeleteform.do?num=${article.num}&pageNum=${pageNum }'">
	
	<input type="button" value="답변"
	onclick="location.href='./bbsform.do?num=${article.num}&ref=${article.ref }&re_step=${article.re_step }&re_level=${article.re_level }'">
	
	<input type="button" value="목록"
	onclick="location.href='./bbslist.do?pageNum=${pageNum}'">
	</td>
</tr>
</table>		
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

