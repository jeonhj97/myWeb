<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsIns.jsp -->
<%
 
  String subject=request.getParameter("subject").trim();
  String content=request.getParameter("content").trim();

  dto.setSubject(subject);
  dto.setContent(content);

  int cnt=dao.insert(dto);
  if(cnt==0){
    out.println("<p>공지사항 추가 실패했습니다</p>");
    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
  }else{
    out.println("<script>");
    out.println("  alert('공지사항이 추가되었습니다');");
    out.println("  location.href='noticeList.jsp'");
    out.println("</script>");
  }//if end
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %> 