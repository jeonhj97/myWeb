<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통코드 --%>

<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ page import="net.utility.*"%>
<%@ page import="net.notice.*"%>

<jsp:useBean id="dto" class="net.notice.NoticeDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.notice.NoticeDAO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8"); %> 


