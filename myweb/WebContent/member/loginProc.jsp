<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<h3>* 로 그 인 결과 *</h3>
<%
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.println("<p>아이디 /비번 다시 한번 확인해주세요!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		
	}else{
		//로그인 성공
		//out.print(mlevel);
		//다른 페이지에서 로그인상태정보를 공유할 수 있도록
		//로그인의 성공/실패요인
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//쿠키 시작------------------------------------------------
		//->서버가 사용자PC에 저장하는 텍스트 파일로 된 정보
		//->각 브러우저의 쿠키삭제의 영향을 받는다
		//->보안에 취약하다
		//->예)아이디저장, 클릭한 상품목록, 오늘창 그만보기

		String c_id=Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie = null;
		if(c_id.equals("SAVE")){
			//아이디저장 체크를 했다면
			//쿠키변수 선언) new Cookie("쿠키변수명", 값)
			cookie=new Cookie("c_id", id);
			//쿠키의 생존기간 1개월
			cookie.setMaxAge(60*60*24*30);
		}else{
			cookie=new Cookie("c_id","");
			cookie.setMaxAge(0);
		}//if end
		
		//요청한 사용자PC에 쿠키값을 저장
		response.addCookie(cookie);
		
		
		//쿠키 끝----------------------------------------------
		
		
		//첫페이지로 이동
		String root=Utility.getRoot();//myweb반환
		response.sendRedirect(root+"/index.jsp");
		
		
		
		
		
	}//if end



%>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

