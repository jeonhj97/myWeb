package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsDeleteProc implements CommandAction{
@Override
public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
	
	//사용자가 요청한 정보가져와서 변수에 옮겨담기---------------------------------	
	// bbs2/bbsDel.jsp에서 14행
	int num=Integer.parseInt(req.getParameter("num"));
	// bbs2/bbsDel.jsp에서 22행
	String passwd=req.getParameter("passwd");
	// bbs2/bbsDel.jsp에서 15행
	String pageNum=req.getParameter("pageNum");
	//--------------------------------------------------------------
	
	
	//DTO에 담기
	BoardDataBean article=new BoardDataBean();
	article.setNum(num);
	article.setPasswd(passwd);
	
	//오라클 데이터베이스에 가서 글번호와 비밀번호가 일치하면 글 삭제하기
	BoardDBBean dao=new BoardDBBean();
	int cnt=dao.delete(article);
	
	
	//request영역에 변수선언하기
	req.setAttribute("cnt", cnt);
	req.setAttribute("pageNum", pageNum);
	
	return "bbsDelProc.jsp";

 }//end
}//class end
