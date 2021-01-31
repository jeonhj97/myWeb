<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeList.jsp -->
<h3>* 글목록 *</h3>
<p><a href="noticeForm.jsp">[공지사항 쓰기]</a></p>   
<table class="table table-hover">
<tr>
	<th>제목</th>
	<th>작성일</th>
</tr>
<%
ArrayList<NoticeDTO> list=dao.list(); 
if(list==null){
  out.println("<tr>");
  out.println("  <td colspan='2'>");
  out.println("    <strong>관련자료 없음!!</strong>");
  out.println("  </td>");
  out.println("</tr>");
}else{
  
    //오늘 날짜를 문자열 "2020-10-30" 만들기
    String today=Utility.getDate();  
  
    for(int i=0; i<list.size(); i++){
      dto=list.get(i);
%>
      <tr>
      	<td style="text-align:left">
      	  <a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>"><%=dto.getSubject()%></a>

<%
		  String regdt=dto.getRegdt().substring(0, 10);
		  if(regdt.equals(today)){
		      out.println("<img src='../images/new.gif'>");
		  }//if end		  
%>    	  
      	</td>
  	    <td><%=dto.getRegdt().substring(0,10)%></td>
      </tr>
<%      
    }//for end
}//if end
%>
</table>   

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>   