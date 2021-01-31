<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 글삭제  *</h3>
<%
String passwd 	=request.getParameter("passwd").trim();
int bbsno		=Integer.parseInt(request.getParameter("bbsno"));//히든속성으로 넘긴거

dto.setPasswd(passwd);
dto.setBbsno(bbsno);

int cnt=dao.delete(dto);
if(cnt==0){
	out.println("<p>비밀번호가 일치하지 않습니다</p>");
	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
}else{
	out.println("<script>");
	out.println("alert('게시글이 삭제되었습니다');");
	out.println("location.href='bbsList.jsp';");
	out.println("</script>");
}//if end
%>
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

