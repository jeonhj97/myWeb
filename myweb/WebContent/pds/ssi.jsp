<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--ssi.jsp 공통코드    -->

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.pds.*" %>	
<%@page import="net.utility.*"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>


<jsp:useBean id="dao" class="net.pds.PdsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.pds.PdsDTO"></jsp:useBean>	

<%request.setCharacterEncoding("UTF-8");%>



