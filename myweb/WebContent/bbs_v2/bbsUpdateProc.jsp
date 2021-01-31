<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<body>
	<h1>* 글쓰기 수정 결과 *</h1>
	<p>
		<a href="bbsList.jsp">[글목록]</a>
		&nbsp;&nbsp;
		<a href="bbsForm.jsp">[글쓰기]</a>
	</p>
<%
	
	String wname=request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd=request.getParameter("passwd").trim();
	int bbsno=Integer.parseInt( request.getParameter("bbsno"));
	String ip=request.getRemoteAddr();//요청PC의 IP
	
	//dao에 한꺼번에 자료를 전달하기 위해 dto에 전달값 모두 담기
	dto.setWname(wname);	
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setBbsno(bbsno);
	dto.setIp(ip);
	
	
	
	int cnt=dao.updateproc(dto);  
	if(cnt==0){
		out.println("<p>글 수정이 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("alert('게시글이 수정이되었습니다');");
		out.println("location.href='bbsList.jsp';");//목록페이지 이동
		out.println("</script>");
		
	}//if end
%>
</body>
</html>	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

