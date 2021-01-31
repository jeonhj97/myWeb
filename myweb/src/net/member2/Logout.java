package net.member2;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.CommandAction;

public class Logout implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		
		
		
	
		
		//invalidate()(session에 들어온 값을 전부 제거하는 함수)을 이용해서 
		HttpSession session = req.getSession();
		session.invalidate();
		
		
				
		
		
		
	
	
		
		
		return "logout.jsp";
	}//end
	
}//class end
