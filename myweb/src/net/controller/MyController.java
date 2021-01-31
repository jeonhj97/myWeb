package net.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class MyController extends HttpServlet{

	private Map commandMap =new HashMap();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("propertyConfig");
		Properties pr= new Properties();
		FileInputStream f = null;
		try {
			f = new FileInputStream(props);
			pr.load(f);
		} catch(IOException e) {
			System.out.println(e);
		}finally {
			if(f!=null)try {f.close();} catch(Exception ex) {}
		}//end
		
		Iterator keyIter = pr.keySet().iterator();
		while(keyIter.hasNext()) {
			String key = (String)keyIter.next();	//앞의 값
			String value = pr.getProperty(key);		//key가 가지고 있는 value값
			//System.out.println("#"+key+"#");		
			//System.out.println("#"+value+"#");	//=뒤의 값
			
			try {
				Class commandClass	=Class.forName(value);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(key, commandInstance);
				System.out.println(commandInstance);
				
			} catch(Exception e) {System.out.println(e);}
			
		}//while end
		
		
		
	}//init() end
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}//doGet()end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}//doPost()end
	


protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//사용자 요청이 있을때 마다 호출되는 함수
	
	String view=null;
	CommandAction com=null;
	
	try {
		
	//사용자가 요청한 명령어
	String command=req.getRequestURI();
	//System.out.println(command);
	com=(CommandAction)commandMap.get(command);
	view=com.requestPro(req, resp); //"index.jsp"
	
	}catch(Throwable e) {
		throw new ServletException(e);
	}//end
	
	//페이지 이동
	RequestDispatcher dispatcher=req.getRequestDispatcher(view);
	dispatcher.forward(req, resp);
	
	
	}//process()end

}//class end
