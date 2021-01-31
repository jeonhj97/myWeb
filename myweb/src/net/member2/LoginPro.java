package net.member2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.CommandAction;

public class LoginPro implements CommandAction{
@Override
public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
	String id= req.getParameter("id");
	String passwd= req.getParameter("passwd");
	
	MemberDBBean dao= new MemberDBBean();
	int res=0;
	res=dao.login(id, passwd);
	System.out.println("res:"+ res);
	
	if(res==1) {
		req.setAttribute("id", id);
		req.setAttribute("passwd", passwd);
		
		//session영역에 자료 올리기
		HttpSession session=req.getSession();
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		
		//-------------------------------------------------쿠키(아이디저장)
		String c_id=req.getParameter("c_id");
		if(c_id==null) {
			c_id="";
		}//if end
		Cookie cookie=null;
		if(c_id.equals("SAVE")) {
			cookie=new Cookie("c_id",id);
			cookie.setMaxAge(60*60*24*31);//1달동안 쿠키저장
		}else {
			cookie=new Cookie("c_id","");
			cookie.setMaxAge(0);
		}
		resp.addCookie(cookie);
		//--------------------------------------------------
	}//if end
	
	req.setAttribute("res", new Integer(res));
	return "loginPro.jsp";
	
	
	
	

}//requestPro() end
}//class end
