<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<%@include file="auth.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   loginForm.jsp-->
<h3>* 로 그 인 *</h3>
		
<%
if(s_id.equals("guest")||s_passwd.equals("guest")||s_mlevel.equals("guest")){	
	//로그인을 하지 않은 경우
	
	//쿠키------------------------------------------
	//사용자pc에 저장된 모든 쿠키값 가져오기
	Cookie[] cookies=request.getCookies();
	String c_id="";
	if(cookies!=null){//쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			//쿠키변수 c_id가 있는지?
			if(cookie.getName().equals("c_id")==true){
				c_id=cookie.getValue();//쿠키변수값 가져오기
				
				
				
			}//if end
		}//for end
	}//if end
	//-----------------------------------------------
%>
<form name="memfrm" id="memfrm"
		method="post"
		action="loginProc.jsp"
		onsubmit="return loginCheck()"><!-- myscript.js코딩 -->
<table class="table">
<tr>
	<td>
		<input type="text" name="id" id="id" value="<%=c_id%>"  placeholder="아이디" maxlength="10" required>
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
		<input type="checkbox" name="c_id" value="SAVE" <%if(!(c_id.isEmpty())) {out.print("checked");}%>>
		아이디저장
		&nbsp;&nbsp;&nbsp;
		<a href="agreement.jsp">회원가입</a>
		&nbsp;&nbsp;&nbsp;
		<a href="findIdForm.jsp">아이디/비번찾기</a>
	</td>
</tr>
</table>
</form>
<%		
}else{				
	//로그인 성공했다면
	out.println("<strong>"+s_id+"</strong>님");
	out.println("<a href='logout.jsp'>[로그아웃]</a>");
	out.print("<br><br>");
	out.print("[회원정보수정]");
	out.print("[회원탈퇴]");
	
	}//if end			
%>	

		

	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

