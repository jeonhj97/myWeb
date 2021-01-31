<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!--footer랑 header을 연결할jsp  -->
<%@ include file="../header.jsp"%>	
<!--  본문 시작   pdsIns.jsp-->
<h3>* 사진 올리기 결과 *</h3>
<%
try{
	//1)첨부된 파일 저장하기
	String  saveDirectory=application.getRealPath("/storage");
	int maxPostSize=1024*1024*10;
	String encoding="UTF-8";
	MultipartRequest mr=new MultipartRequest(request
											,saveDirectory
											,maxPostSize		
											,encoding
											,new DefaultFileRenamePolicy());
	//2)저장된 파일명, 파일크기 가져오기
	//<input type=file name="filename">
	String item		="";	//<input type=file name="filename">
	String fileName	="";	//파일명
	long fileSize	=0;		//파일크기
	File file	 	=null;	//실제 파일 담기
	
	//만일, 여러개의 파일을 첨부하는 경우
	//<input type=file name=filename1>
	//<input type=file name=filename2>
	//<input type=file name=filename3>
	Enumeration files=mr.getFileNames();
	while(files.hasMoreElements()){ 
		//파일 담고 있는 name=filename
		item=(String)files.nextElement();
		//item이 가지고 있는 파일명 가져오기
		fileName=mr.getFilesystemName(item);
		if(fileName!=null){//파일명을 가져왔다면
			file=mr.getFile(item);//mr에서 실제 파일 가져오기
			if(file.exists()){//실제 파일이 존재하면
				fileSize=file.length();//파일크기 가져오기
			}//if end
		}//if end
	}//while end

	//3)tb_pds테이블에 행추가하기
String wname=mr.getParameter("wname").trim();
String subject=mr.getParameter("subject").trim();
String passwd=mr.getParameter("passwd").trim();

dto.setWname(wname);	
dto.setSubject(subject);
dto.setPasswd(passwd);
dto.setFilename(fileName);						
dto.setFilesize(fileSize);
	
int cnt=dao.insert(dto);
if(cnt==0){
	out.println("<p사진 추가 실패</p>");
	out.println("<p><a href='javascript:history.back();'>[다시시도]</a></p>");
}else{
	out.println("<script>");
	out.println("alert('사진을 추가했습니다');");
	out.println("location.href='pdsList.jsp';");//목록페이지 이동
	out.println("</script>");
	
}//if end



}catch(Exception e){
	out.println(e);
	out.println("<p>사진 올리기 실패!!</p>");
	out.println("<a href='javascript:history.back()'>[다시시도]</a>");
}//end






%>
	
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

	

