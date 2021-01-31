<%@page import="net.utility.Paging"%>
<%@page import="net.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	

<!--  본문 시작 bbsList.jsp   -->
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
//한페이지당 출력할 행의 갯수
int recordPerPage=5;//페이지에 5개의행씩 끊어서 보여지게하기위함
ArrayList<BbsDTO> list=dao.list3(col, word, nowPage, recordPerPage);			
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
		//답변이미지 출력  답글을써줄때 마다 이미지가 하나씩추가됨
		for(int n=1; n<=dto.getIndent();n++){
			out.println("<img src='../images/reply.gif'>");
		}//for end

%>		
			<a href="bbsRead.jsp?col=<%=col%>&word=<%=word%>&bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
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
	int totalRecord=dao.count(col,word);
				out.println("<tr>");
				out.println("	<td colspan='4' style='text-align: center;'>");
				out.println("		글갯수:<strong>");
				out.println(totalRecord);
				out.println("		</strong>");
				out.println("	</td>");
				out.println("</tr>");
%>
<!-- 페이지 리스트 시작 -->
	<tr>	
		<td colspan="4">	
<%				
		String paging=new Paging().paging3(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp"); 			
		out.print(paging);			
	
%>		
		</td>
	</tr>
<!-- 페이지 리스트 끝  -->

<!-- 검색시작  -->
<tr>
	<td colspan="4" style="text-align: center; height: 50px">
		<form action="bbsList.jsp" onsubmit="return searchCheck(this)">	
			<select name="col">
			  <option value="wname">작성자
			  <option value="subject">제목
			  <option value="content">내용
			  <option value="subject_content">제목+내용
			</select>	
			<input type="text" name="word">
			<input type="submit" value="검색">
		</form>
	</td>		
</tr>	

<!-- 검색끝 -->
<% 
	}//if end
%>	
</table>	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

