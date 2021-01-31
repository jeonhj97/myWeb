<%@page import="net.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	

<!--  본문 시작   -->
<h3>* 글목록 *</h3>
<p><a href="bbsForm.jsp">[글쓰기]</a></p>
<table class="table table-hover">
<tr>
	<th>제목</th>
	<th>조회수</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
<%
ArrayList<BbsDTO> list=dao.list();
if(list==null){
	out.println("<tr>");
	out.println("	<td colspan='4'");
	out.println("		<strong>관련자료 업음</strong>");
	out.println("	</td>");
	out.println("</tr>");
}else{
	
	//오늘 날짜를 문자열	"2020-10-30"만들기
	String today=Utility.getDate();
	
	for(int i=0; i<list.size(); i++){
		dto=list.get(i);
%>
		<tr>
			<td style="text-align: left;">
<%
		//답변이미지 출력
		for(int n=1; n<=dto.getIndent();n++){
			out.println("<img src='../images/reply.gif'>");
		}//for end

%>
			
			<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
<%
		//조회수가 10이상이면 hot이미지 출력
		if(dto.getReadcnt()>=10){
			out.println("<img src='../images/hot.gif'>");
		}//if end	
		
		//오늘 작성한 글제목 뒤에new이미지 출력
		//작성일(regdt)에서 "년월일"만 자르기 <!-- 시간 수정요령 오늘쓴글을 2일에서 3일을 new붙여주기 -->
		//"2020-10-30"
		String regdt=dto.getRegdt().substring(0,10);
		if(regdt.equals(today)){//작성일과 오늘날짜가 같다면
			out.println("<img src='../images/new.gif'>");	
		}//if end
%>				

			</td>
			<td><%=dto.getReadcnt()%></td>
			<td><%=dto.getWname()%></td>
			<td><%=dto.getRegdt().substring(0,10)%></td>
			
		</tr>
<% 
		}//for end
	}//if end
%>	
</table>	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

