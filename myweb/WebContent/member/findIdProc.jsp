<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdProc.jsp</title>
</head>
<body>
<% 					
String id=request.getParameter("id").trim();
String email=request.getParameter("email").trim();
dto.setId(id);
dto.setEmail(email);
boolean flag=dao.findID(dto);
	if(flag==false){
		out.println("<p>아이디를 다시 한번 확인해주세요!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
%>
	<form>
		<td>찾으시는 아이디</td>
		<td><%=dto.getId()%>;</td>
<%		
out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}//if end
%>
</form>
</body>	
</html>