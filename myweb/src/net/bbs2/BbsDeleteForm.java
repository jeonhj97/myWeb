package net.bbs2;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsDeleteForm implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		
	/*
	BoardDataBean article=new BoardDataBean();
	article.setNum(Integer.parseInt(req.getParameter("num")));
	article.setPasswd(req.getParameter("passwd"));
	*/

	//사용자가 요청한 정보(bbsContent.jsp에서 42행)가져와서 request영역에 올리기
	req.setAttribute("num", req.getParameter("num"));	
	req.setAttribute("pageNum", req.getParameter("pageNum"));	
	
	return "bbsDel.jsp";
	

	}//end

}//class end
