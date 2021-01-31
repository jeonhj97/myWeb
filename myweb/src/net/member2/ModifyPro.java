package net.member2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class ModifyPro implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		
		//modifyForm.jsp에서 id받아옴
		//이걸로 로그인 판단해야됨
		//modifyForm.jsp에서 사람들이 친걸 담음 변수에
		String id		=req.getParameter("id");
		String address1 =req.getParameter("address1");
		String address2 =req.getParameter("address2");
		String tel =req.getParameter("tel");
		String mname =req.getParameter("mname");
		String job =req.getParameter("job");
			
		
		//위에 과정에서 받아온 변수를 dto에담기
		//왜냐하면 이걸로 함수쓸거거든
		MemberDataBean dto=new MemberDataBean();
		MemberDBBean dao=new MemberDBBean();
		dto.getAddress1();
		dto.getAddress2();
		dto.getTel();
		dto.getId();
		dto.getMname();
		dto.getJob();
		
		
		int cnt=dao.modifypro(dto);
		
		
		//req에담음 왜냐하면 회원정보변경할때 누군지 알기위해 필요
		
		
		//request에 cnt담아가기
		req.setAttribute("cnt", cnt);
		
	
	
	
	return "modifyPro.jsp";
	}
}//end
