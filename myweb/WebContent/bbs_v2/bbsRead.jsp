<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 게시판 상세보기 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp">[글목록]</a>
</p>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno);	//상세보기
	if(dto==null){
		out.print("해당 글 없음");
	}else{
		dao.incrementCnt(bbsno);//조회수 증가
%>
	<table class="table">
	<tr>
		<th>제목</th>
		<td><%=dto.getSubject() %></td>	
	</tr>
	<tr>
		<th>내용</th>	
		<td style="text-align: left;">
<%
		String content=dto.getContent();
		content=content.replaceAll(" ", 	"&nbsp;" );
		content=content.replaceAll("'", 	"&apos;" );
		content=content.replaceAll("\"", 	"&quot;" );
		content=content.replaceAll("<", 	"&lt;" );
		content=content.replaceAll(">", 	"&gt;" );
		content=content.replaceAll("\r\n", "<br>" );
		out.print(content);
%>			
		</td>	
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getReadcnt()%></td>		
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWname()%></td>		
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegdt()%></td>		
	</tr>
	<tr>
		<th>IP</th>
		<td><%=dto.getIp()%></td>		
	</tr>
	
	</table>
	<br>
	<input type="button" class="btn btn-primary" value="답변" onclick="location.href='bbsReply.jsp?col=<%=col%>&word=<%=word%>&bbsno=<%=bbsno%>'">
	<input type="button" class="btn btn-danger"  value="삭제" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
	<input type="button" class="btn btn-success" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>'">



<% 
	}//if end
%>

	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

