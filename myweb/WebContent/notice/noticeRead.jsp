<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeRead.jsp -->
<h3>* 공지사항 상세보기 *</h3>
<p>
   <a href="noticeForm.jsp">[글쓰기]</a>
   &nbsp;&nbsp;
   <a href="noticeList.jsp">[글목록]</a>
</p>
<%
  int noticeno=Integer.parseInt(request.getParameter("noticeno"));
  dto=dao.read(noticeno);      //상세보기
  if(dto==null){
    out.print("해당 글 없음!!");	
  }else{	
%>
    <table class="table">
	<tr>
		<th>제목</th>
		<td><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
<%
        //사용자가 입력한 문자 그대로 출력하기 위해	
        //특수문자로 변환
        String content=dto.getContent();
		content=content.replaceAll(" ",    "&nbsp;");
		content=content.replaceAll("'",    "&apos;");
		content=content.replaceAll("\"",   "&quot;");
		content=content.replaceAll("<",    "&lt;");
		content=content.replaceAll(">",    "&gt;");
		content=content.replaceAll("\r\n", "<br>");
		out.print(content);
%>		
		</td>
	</tr>   
	<tr>
		<th>작성일</th>
		<td><%=dto.getRegdt()%></td>
	</tr>     	
    </table> 
    <br>
    <input type="button" class="btn btn-danger"  value="삭제" onclick="location.href='noticeDel.jsp?noticeno=<%=noticeno%>'">
    <input type="button" class="btn btn-primary" value="수정" onclick="location.href='noticeUpdate.jsp?noticeno=<%=noticeno%>'">
<%    
  }//if end
%>
   
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>

	

