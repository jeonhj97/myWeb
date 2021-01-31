package net.member2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class ModifyForm implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		//회원정보 변경
		
		//id를 받아옴
		String id		=req.getParameter("id");
		String mname	=req.getParameter("mname");
		String tel		=req.getParameter("tel");
		String address1	=req.getParameter("address1");
		String address2	=req.getParameter("address2");
		String job		=req.getParameter("job");
		
		
		
		//이걸바꿀수있게 보여줘야됨
		//dto에 담아둠
		MemberDataBean dto=new MemberDataBean();
		dto.getMname();
		dto.getTel();
		dto.getAddress1();
		dto.getAddress2();
		dto.getJob();
		
		MemberDBBean dao=new MemberDBBean();
		dao.modifyform(dto);
		
		req.setAttribute("id", id);
		req.setAttribute("manme", mname);
		req.setAttribute("tel", tel);
		req.setAttribute("address1", address1);
		req.setAttribute("address2", address2);
		req.setAttribute("job", job);
		
		
		return "modifyForm.jsp";
	}
	
	
	
	
	
	

}
