package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;
import net.bbs.BbsDAO;

public class BbsUpdateForm implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		
		int num=Integer.parseInt(req.getParameter("num"));
		String pageNum=req.getParameter("pageNum");
		String passwd=req.getParameter("passwd");
		String ip=req.getParameter("ip");
		
		
		
		
		req.setAttribute("num", num);	
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("passwd", passwd);
		req.setAttribute("ip", ip);
		
		BoardDataBean article=new BoardDataBean();
		
		//DTO에담기 왜냐 updateform에서 이거가지고 쓸거거든
		article.setNum(num);
		article.setPasswd(passwd);
		
		
		
		
	
		BoardDBBean dao=new BoardDBBean();
		article=dao.updateform(article);
		
		//비밀번호 맞으면 수정되고 안되면 수정안되게 만들기 위해 그럭 updateForm에서 알아보기위해
		//article=dao.updateform(article)의 article을 request에 담음
		req.setAttribute("article", article);
		return "bbsUpdateForm.jsp";
		
		
		
		
		
	}//BbsUpdate end
	
	
}//class end
