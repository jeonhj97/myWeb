<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>	

<!--  본문 시작   template.jsp-->
<!-- 글번호와 비밓번호가 일치하면 수정할 행 가져오기  -->
<h3>* 글수정 *</h3>
	<p>
		<a href="bbsForm.jsp">[글쓰기]</a>
		<a href="bbsList.jsp">[글목록]</a>
	</p>
<%
	String passwd= request.getParameter("passwd").trim();
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto.setPasswd(passwd);
	dto.setBbsno(bbsno);
	dto=dao.updateform(dto);	
	//dto=dao.read(bbsno);
	if(dto==null){
		out.print("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'[다시시도]</a></p>");
	}else{
%>
<form method="post" action="bbsUpdateProc.jsp" onsubmit="return bbsCheck(this)">
<input type="hidden" name="bbsno" value="<%=bbsno%>"> 
<div class="container">
<table  class="table table-hover">
	<tr>

	<th>작성자</th>
	<td><input type="text" name="wname" id="wname" value="<%=dto.getWname()%>"  size="30" maxlength="20" required></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="subject" id="subject"  value="<%=dto.getSubject()%>" size="30" maxlength="100" required></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea rows="5" cols="30" name="content" id="content" ><%=dto.getContent()%></textarea></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="text" name="passwd" id="passwd"  size="30" maxlength="15" value="<%=dto.getPasswd()%>" required></td>
</tr>
<tr>
	  <td colspan="2" align="center">
	    <input type="submit" value="수정" class="btn btn-default">	
		<input type="reset" value="취소"  class="btn btn-default">
	  </td>
	</tr>
	</table>
	</div>
	</form>
<% 
}//if end
%>	

<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



	

