<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeTest.jsp</title>
</head>
<body>
<h3>웹페이지의 SCOPE(유효범위)</h3>
<%
/*
[내부객체]
1)out			
2)pageContext	:JSP페이지 자체의 Context 제공
3)request		:요청에 관한 정보
4)session		:요청에 관한 Context 제공
5)response		:응답에 관한 정보
6)application	:서블릿 및 외부 환경 정보 Context 제공

-------------------------------------------------------------------
[SCOPE의 종류]
-myweb프로젝트에서 페이지들간에 값을 공유하기 위해 사용
1)page		 :현재 페이지에서만 유효. 기본값
2)request	 :부모페이지와  자식페이지에서만 유효
3)session	 :모든 페이지에서 유효(사용자 개별 접근, 시간)
4)application:모든 페이지에서 유효(모든 사용자 접근, 서버정보)


-----------------------------------------------------------------
[내장변수 선언 형식]- 별도의 자료형이 없다
1)pageContext.setAttribute("변수명", 값)
2)request.setAttribute("변수명", 값)
3)session.setAttribute("변수명", 값)
4)application.setAttribute("변수명", 값)


[각SCOPE의 변수값 가져오기]
1)pageContext.getAttribute("변수명")
2)request.getAttribute("변수명")
3)session.getAttribute("변수명")
4)application.getAttribute("변수명")

[각SCOPE의 변수 삭제하기]
1)pageContext.removeAttribute("변수명")
2)request.removeAttribute("변수명")
3)session.removeAttribute("변수명")
4)application.removeAttribute("변수명")
----------------------------------------------------------------
*/
	//각 SCOPE에 내장변수를 이용해서 값 올리기
pageContext.setAttribute("kor",100);	
request.setAttribute("eng",200);
session.setAttribute("mat",300);
application.setAttribute("uname","SOLDESK");


//SCOPE영역에 값 가져오기
Object obj=pageContext.getAttribute("kor");
int kor=(int)obj;
int eng=(int)request.getAttribute("eng");
int mat=(int)session.getAttribute("mat");
String uname=(String)application.getAttribute("uname");

//출력
out.print("1)pageContext영역:"+kor+"<hr>");
out.print("2)requset영역:"+eng+"<hr>");
out.print("3)session영역:"+mat+"<hr>");
out.print("4)application:"+uname+"<hr>");

/*
//각SCOPE 변수 삭제 -> null값 변환
pageContext.removeAttribute("kor");
request.removeAttribute("eng");
session.removeAttribute("mat");
application.removeAttribute("uname");

out.print("<p>* SCOPE영역 변수 삭제 후*</p>");
out.print("1)pageContext영역: "  +pageContext.getAttribute("kor") + "<hr>");
out.print("2)request영역: " 		+request.getAttribute("eng") + "<hr>");
out.print("3)session영역: " 		+session.getAttribute("mat") + "<hr>");
out.print("4)application: " 	+application.getAttribute("uname") + "<hr>");
*/
//----------------------------------------------------------------------------
/*
//request.setAttribute(); 내가 임의로 올린거
request.setAttribute("aver", 95);
out.print(request.getAttribute("aver"));

out.print("<hr>");

//request.getParameter();	사용자가 요청한거 서버를 타고옴
//http://localhost:9090/myweb/scope/scopeTest.jsp?total=85
out.print(request.getParameter("total"));
*/
//--------------------------------------------------------
/*
[페이지 이동]
1)<a href=""></a>
2)<form action=""></form>
3)location.href=""
4)<jsp:forward page=""></jsp:forward> 액션태크
5)response.sendRedirect("")
*/

%>
<!-- 1)request.getAttribute("eng")는 null값
<a href="scopeResult.jsp">[SCOPE 결과 페이지로 이동]</a>
 -->
 
 
<!-- 2) request.getAttribute("eng")는 null값
<form action="scopeResult.jsp">
	<input type="submit" value="[SCOPE 결과 페이지로 이동]">
</form>
-->


<!-- 3)request.getAttribute("eng")는 null값
<script>
alert("[SCOPE 결과 페이지로 이동");
location.href="scopeResult.jsp";
</script>
-->


<%-- 4) 액션 태그로 이동 request.getAttribute("eng")는 200접근 가능
<jsp:forward page="scopeResult.jsp"></jsp:forward>
--%>


<%
//5)request.getAttribute("eng")는 null값
//response.sendRedirect("scopeResult.jsp");

//6)페이지 이동  request.getAttribute("eng")는 200접근 가능
String view="scopeResult.jsp";
RequestDispatcher rd=request.getRequestDispatcher(view);
rd.forward(request, response);


/*
		[scopeTest.jsp에서 scoperesult.jsp이동한 경우]
==================================================
page		o				x
request		o				o또는x	
sessionn	o				o
application	o				o


*/


%>






</body>
</html>