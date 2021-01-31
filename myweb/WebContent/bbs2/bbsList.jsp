<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   bbsList.jsp-->

<strong>글목록</strong>
	<table class="table table-hover">
		<tr>
			<td>전체 글:${count }</td>
			<td align="center"><a href="./bbsform.do">글쓰기</a></td>
		</tr>		
	</table>
	
	<c:if test="${count==0 }">
	<table class="table table-hover">
		<tr>
			<td>게시판에 글 없음!</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count>0 }">	
	<table class="table table-hover">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회</td>
		<td>IP</td>
	</tr>
	<!-- fmt:formatDate액션에서 Timestamp객체를 사용하기 위해서 -->
	<c:set var="today" value="<%=new Timestamp(System.currentTimeMillis()) %>"/>
	<c:set var="today" value="${fn:substring(today, 0, 10) }"/><!-- 오늘날짜 -->
	
	<c:forEach var="article" items="${articleList }">
	<tr>
		<td>
			<c:out value="${number }"/>
			<c:set var="number" value="${number-1 }"/>
		</td>
		<td style="text-align: left">
			<c:if test="${article.re_level>0 }">
				<c:forEach var="i" begin="1" end="${article.re_level }" step="1">
					<img src="../images/reply.gif"/>
				</c:forEach>
			</c:if>
		<c:if test="${article.re_level==0 }"></c:if>
		
		<a href="./bbscontent.do?num=${article.num }&pageNum=${pageNum}">${article.subject }</a>
		
		<c:set var="reg" value="${article.reg_date }"/>
		<c:set var="date" value="${fn:substring(reg,0,10)}"/><!-- 게시글날짜를 오늘날짜로 -->
		<c:if test="${today=date }">
			<img  src="../images/new.gif"/>
		</c:if>
		
		<c:if test="${article.readcount>=20 }">
			<img src="../images/hot.gif" border="0" height="16"/>
		</c:if>
		</td>
		<td><a href="mailto:${article.email }">${article.writer }</a></td>
		<td>${date }</td>
		<td>${article.readcount }</td>
		<td>${article.ip }</td>
	</tr>
	</c:forEach>
	
	</table>
	</c:if>
	
	<!-- 페이지 리스트 시작 -->
	<c:if test="${count>0 }">
		<c:set var="pageCount" value="${totalPage }"/>
		<c:set var="startPage" value="${startPage }"/>
		<c:set var="endPage" value="${endPage }"/>
		
		<c:if test="${endPage>pageCount }">	
			<c:set var="endPage" value="${pageCount+1 }"/>
		</c:if>
		
		<c:if test="${startPage>0 }">
			<a href="./bbslist.do?pageNum=${startPage}">[이전]</a>
		</c:if>
		
	
		<c:forEach var="i" begin="${startPage+1 }" end="${endPage-1 }">
				<a href="./bbslist.do?pageNum=${i }">[${i }]</a>
		</c:forEach>
	
		<c:if test="${endPage<pageCount }">
			<a href="./bbslist.do?pageNum=${startPage+11 }">[다음]</a>
		</c:if>
	</c:if>
	
	
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

