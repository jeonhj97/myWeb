<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   bbsDel.jsp-->

<!-- 비밀번호 물어보는 창나와야됨 -->
<!-- 비밀번호 맞으면./bbslist.do로 넘김 -->
<!-- 비밀번호 틀리면 다시 비밀번호치는 창으로 돌아와야됨 alert로 경고창 주고 javascript -->
<!-- 여기는 그냥 비밀번호 만 보이게하고 삭제버튼하고 .java에서는 비밀번호가일치하는지 하고 DelProc으로 보내기 
그리고 DelProc에서는 지금한 삭제 진행해서 List로보내기-->
<form name="deleteForm" action="./bbsdeleteproc.do"
		 onsubmit="return pwCheck()" >
<input type="hidden" name="num" value="${requestScope.num}">
<input type="hidden" name="pageNum" value="${requestScope.pageNum}">
<tr>	
	<td colspan="2" align="center"><h2>글삭제</h2></td>
</tr>

<tr>
	<th>비밀번호</th>
	<td><input name="passwd" type="password" required></td>
</tr>

<tr>
	<td colspan=2 align="right">
		<input type="submit" value="삭제" class="btn btn-danger">
	</td>
</tr>
</form>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

