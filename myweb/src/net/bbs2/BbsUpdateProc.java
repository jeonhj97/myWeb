package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdateProc implements CommandAction{
@Override
public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
	
	
	
	
	
	
	
	//DTO에 담기
	BoardDataBean article=new BoardDataBean();
	article.setNum(Integer.parseInt(req.getParameter("num")));
	article.setWriter(req.getParameter("writer"));
	article.setSubject(req.getParameter("subject"));
	article.setContent(req.getParameter("content"));
	article.setPasswd(req.getParameter("passwd"));
	article.setIp(req.getParameter("ip"));
	
	//글수정해주는 함수 
	BoardDBBean dao=new BoardDBBean();
	int cnt=dao.updateproc(article);
	
	
	//request영역에 변수선언하기
	req.setAttribute("cnt", cnt);
	
	
	
	
	
	
	return "bbsUpdateProc.jsp";
	

}//end




}//class end
