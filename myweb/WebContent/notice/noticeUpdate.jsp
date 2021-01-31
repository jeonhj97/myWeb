<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeUpdateForm.jsp -->
<h3>* 공지사항 수정 *</h3>
<p>
   <a href="noticeForm.jsp">[공지사항 쓰기]</a>
   &nbsp;&nbsp;
   <a href="noticeList.jsp">[공지사항 목록]</a>
</p>
<%
  int noticeno=Integer.parseInt(request.getParameter("noticeno"));
  dto=dao.updateform(noticeno); 			
  if(dto==null){
    out.println("<p>해당 글 없음</p>");
    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
  }else{
%>
    <form name="noticefrm" id="noticefrm" method="post"
      action="noticeUpdateProc.jsp" onsubmit="return noticeCheck(this)">
    <input type="hidden" name="noticeno" value="<%=noticeno%>">
	<table class="table">
	<tr>
	   <th>제목</th>
	   <td><input type="text" name="subject" id="subject"
	              value="<%=dto.getSubject()%>" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th>내용</th>
	   <td><textarea rows="5"  class="form-control" name="content" id="content"><%=dto.getContent()%></textarea></td>
	</tr>
	<tr>
	    <td colspan="2" align="center">
	       <input type="submit" value="수정" class="btn btn-primary">
	       <input type="reset"  value="취소" class="btn btn-primary">
	    </td>
	</table>
	</form>

<%    
  }//if end
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>

	

