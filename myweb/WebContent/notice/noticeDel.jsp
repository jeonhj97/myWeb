<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 noticeDel.jsp -->
<h3>* 공지사항 삭제 *</h3>
<%
int noticeno     =Integer.parseInt(request.getParameter("noticeno"));  
int cnt=dao.delete(noticeno); 			
if(cnt==0){ 
  out.println("<p>공지사항이 삭제되지 않았습니다</p>");
  out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
}else{
  out.println("<script>");	
  out.println("  alert('공지사항 삭제되었습니다');");
  out.println("  location.href='noticeList.jsp'");
  out.println("</script>");
}//if end
%>
   
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>  

	

