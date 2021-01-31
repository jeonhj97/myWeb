<%@page import="net.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--ssi.jsp 공통코드    -->

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.bbs.*" %>

<jsp:useBean id="dao" class="net.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.bbs.BbsDTO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

<%
	//검색
	String col =request.getParameter("col");	 //칼럼
	String word=request.getParameter("word");//겅색어

	//String값이 null이면 빈문자열로 치환
	col =Utility.checkNull(col);
	word=Utility.checkNull(word);

%>