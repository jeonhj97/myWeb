<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsReplyProc.jsp -->
<%
  String wname  =request.getParameter("wname").trim();
  String subject=request.getParameter("subject").trim();
  String content=request.getParameter("content").trim();
  String passwd =request.getParameter("passwd").trim();
  String ip     =request.getRemoteAddr();//요청PC의 IP
  int bbsno     =Integer.parseInt(request.getParameter("bbsno"));

  dto.setWname(wname);
  dto.setSubject(subject);
  dto.setContent(content);
  dto.setPasswd(passwd);
  dto.setIp(ip);
  dto.setBbsno(bbsno);

  int cnt=dao.reply(dto); 
  if(cnt==0){
    out.println("<p>답변글 추가 실패했습니다</p>");
    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
  }else{
    out.println("<script>");
    out.println("  alert('답변글이 추가되었습니다');");
    out.println("  location.href='bbsList.jsp?col="+ col + "&word=" + word + "'");
    out.println("</script>");
  }//if end
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>   




[페이징]
--rownum(줄번호 )활룡

1)
select wname, grpno, ansnum
from tb_bbs
order by grpno desc. ansnum asc;

2)rownum추가 --줄번호까지 정렬됨
select rownum,wname, grpno, ansnum
from tb_bbs
order by grpno desc. ansnum asc;
 
3) 1)의 SQL문을 셀프조인하고 rownum추가
select rownum,wname, grpno, ansnum
from(
	select wname, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc
);


4) 줄번호 1~5조회 (1페이지)
select rownum,wname, grpno, ansnum
from(
	select wname, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc
)
where rownum>=1 and rownum<=5;


5)줄번호 6~10 조회(2페이지)-->조회안됨
select rownum,wname, grpno, ansnum
from(
	select wname, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc
)
where rownum>=6 and rownum<=10;


6)줄번호가 있는 3)의 테이블을 한번 더 셀프조인하고
  rownum칼럼명을 rnum으로 바꾼다
select rnum,wname, grpno, ansnum  
from(	
	select rownum as rnum,wname, grpno, ansnum
	from(
		select wname, grpno, ansnum
		from tb_bbs
		order by grpno desc, ansnum asc
		)
	)
where rownum>=6 and rownum<=10;	
	
	
	