<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   pdsDel.jsp-->
<h3>* 사진 삭제 결과 *</h3>
<%
String passwd 	=request.getParameter("passwd").trim();
int pdsno		=Integer.parseInt(request.getParameter("pdsno"));//히든속성으로 넘긴거
String saveDir=application.getRealPath("/storage");//파일삭제 하기 위해




int cnt=dao.delete(pdsno, passwd, saveDir);		
if(cnt==0){
	out.println("<p>비밀번호가 일치하지 않습니다</p>");
	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
}else{
	out.println("<script>");
	out.println("alert('게시글이 삭제되었습니다');");
	out.println("location.href='pdsList.jsp';");
	out.println("</script>");
}//if end
%>
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

