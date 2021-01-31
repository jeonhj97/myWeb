<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<%@include file="auth.jsp" %>
<%@ include file="../header.jsp"%>	
<title>memberProc.jsp</title>
</head>
<body>
<!-- 회원가입이 성공해서 loginForm.jsp로이동시키기 -->
<% 
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
String mname=request.getParameter("mname");
String tel=request.getParameter("tel");
String email=request.getParameter("email");
String zipcode=request.getParameter("zipcode");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");
String job=request.getParameter("job");


dto.setId(id);
dto.setPasswd(passwd);
dto.setMname(mname);	
dto.setTel(tel);
dto.setEmail(email);
dto.setZipcode(zipcode);
dto.setAddress1(address1);
dto.setAddress2(address2);
dto.setJob(job);


int cnt=dao.insert(dto);
if(cnt==0){
	out.println("<p>회원가입이 실패했습니다</p>");
	out.println("<p><a href='loginForm.jsp'>[로그인]</a></p>");
}else{
	out.println("<script>");
	out.println("alert('회원가입 되었습니다');");
	out.println("location.href='loginForm.jsp';");
	out.println("</script>");
}//if end
%>







</body>
</html>