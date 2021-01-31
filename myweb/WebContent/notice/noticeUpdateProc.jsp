<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeUpdateProc.jsp -->
<h3>* 공지사항 수정 *</h3>
<p>
   <a href="noticeForm.jsp">[공지사항 쓰기]</a>
   &nbsp;&nbsp;
   <a href="noticeList.jsp">[공지사항 목록]</a>
</p>
<%
  int noticeno=Integer.parseInt(request.getParameter("noticeno"));
  String subject=request.getParameter("subject").trim();
  String content=request.getParameter("content").trim();

  dto.setNoticeno(noticeno);
  dto.setSubject(subject);
  dto.setContent(content);

  int cnt=dao.updateproc(dto); 	
  if(cnt==0){
    out.println("<p>공지사항 수정 실패했습니다</p>");
    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
  }else{
    out.println("<script>");
    out.println("  alert('공지사항이 수정되었습니다');");
    out.println("  location.href='noticeList.jsp'");
    out.println("</script>");
  }//if end  
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>  

	

