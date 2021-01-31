<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 로그인  *</h3>
<c:if test="${empty sessionScope.memid }">
<%
	//사용자 pc에 저장된 쿠키값 가져오기
	Cookie[] cookies=request.getCookies();
	String c_id="";
	if(cookies!=null){//쿠키가 존재한다면
		for(int idx=0; idx<cookies.length; idx++){
			Cookie item=cookies[idx];
			if(item.getName().equals("c_id")==true){
				c_id=item.getValue();
			}
		}//for end
	}//if end


%>


<form name="memfrm" id="memfrm"
		method="post"
		action="loginPro.do"
		onsubmit="return loginCheck()"><!-- myscript.js코딩 -->
<table class="table">
<tr>
	<td>	
		<input type="text" name="id" id="id" value=""  placeholder="아이디" maxlength="10" required>
	</td>
	<td>
		<td rowspan="2">
		<input type="image" src="../images/bt_login.gif">
		<!--  <input type image> 기본 속성이 submit -->
	</td>
</tr>
<tr>
	<td>
		<input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10"  required>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="checkbox" name="c_id" value="SAVE" >
		아이디저장
		&nbsp;&nbsp;&nbsp;
		<a href="../member/agreement.jsp">회원가입</a>
		&nbsp;&nbsp;&nbsp;
		<a href="../member/findIdForm.jsp">아이디/비번찾기</a>
	</td>
</tr>
</table>
</form>
</c:if>

<c:if test="${sessionScope.memid !=null }">
	<table class="table">
	<tr>
		<td rowspan="3" align="center">
		${sessionScope.memid }님이 방문하셨습니다.
		<form method="post" action="./logout.do">
			<input type="submit" value="로그아웃">
		</form>
		
		<form method="post" action="./modifyForm.do">
			<input type="hidden" name="id" value="${sessionScope.memid }">
			<input type="submit" value="회원정보변경">
		</form>
		
		
		
		<form method="post" action="./withdrawForm.do">
			<input type="submit" value="회원탈퇴">
		</form>
		
		
		</td>	
	</tr>
	</table>
</c:if>


<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

