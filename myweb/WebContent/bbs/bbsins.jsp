<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<%
String wname=request.getParameter("wname").trim();
String subject=request.getParameter("subject").trim();//에러 getParameter String이 반환값이여서
String content=request.getParameter("content").trim();
String passwd=request.getParameter("passwd").trim();	 
String ip=request.getRemoteAddr();//요청 PC의 IP


dto.setWname(wname);
dto.setSubject(subject);
dto.setContent(content);
dto.setPasswd(passwd);
dto.setIp(ip);

int cnt=dao.insert(dto);   
if(cnt==0){
	out.println("<p>게시글입력이 실패했습니다</p>");
	out.println("<p><a href='javascript:history.back()'[다시시도]</a></p>");
}else{
	out.println("<script>");
	out.println("alert('게시글이 입력이되었습니다');");
	out.println("location.href='bbsList.jsp';");//목록페이지 이동
	out.println("</script>");
	
}//if end
	
%>

<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

