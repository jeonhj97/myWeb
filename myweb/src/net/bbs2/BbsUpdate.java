package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdate implements CommandAction{
@Override
public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
	int num=Integer.parseInt(req.getParameter("num"));
	String pageNum=req.getParameter("pageNum");
	
	req.setAttribute("num", num);	
	req.setAttribute("pageNum", pageNum);
	
	return "bbsUpdate.jsp";
	
	
	
}
}//class end
