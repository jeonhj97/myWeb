<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 포토갤러리 상세보기*</h3>
<p><a href=pdsForm.jsp>[사진올리기]</a></p>
<%
int pdsno=Integer.parseInt(request.getParameter("pdsno"));
dto=dao.read(pdsno);
if(dto==null){
	out.print("관련자료없음");
}else{
%>
<table class="table">
	<tr>
		<th>글 제목</th>
		<td><%=dto.getSubject()%></td>		
	</tr>
	<tr>
		<th>사진</th>
		<td><img src="../storage/<%=dto.getFilename()%>"></td>		
	</tr>
	<tr>
		<th>파일크기</th>
		<td><%=Utility.toUnitStr(dto.getFilesize())%></td>				
	</tr>	
	<tr>
		<th>조회수</th>	
		<td><%=dto.getReadcnt()%></td>							
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegdate()%></td>						
	</tr>				
	</table>
	<br>
	<input type="button" class="btn btn-danger"  value="삭제" onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">
		

<% 	
}//if end
%>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

