<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko"><!--한글로 번역해줄까요  -->
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트  -->
  <!-- 주의사항  
  		CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할것-->
   <link href="css/mystyle.css" rel="stylesheet">
  <script src="js/myscript.js"></script>
  <style>
  #clock{
  		 background:white;
         width: 300px; 
         height: 50px;
         color: green;
         font-weight: bold;
         font-size: 20px;
      	 position:relative;
      	 margin:0 auto;
            }
</style>
</head>
<body onload="showtime()" onunload="killtime()">

<!-- 메인카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.do">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
         <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
         <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
         <li><a href="./bbs2/bbslist.do">게시판(MVC)</a></li>
         <li><a href="./member2/loginForm.do">로그인(MVC)</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- 메인카테고리 끝 -->
<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">Welcome to MyWeb</h3>
  <img src="./images/pngegg.png" class="img-responsive img-circle margin" style="display:inline" alt="토끼" width="50%" >
  <h3>THE BLUES</h3>
</div>



<!-- Contest 시작-->
<div class="container-fluid bg-3 text-center">    
  <div class="row">
   	<div class="col-sm-12">
   		<!-- 디지털 시계 -->
   		<div id="clock"></div>
   	<hr>
    <script>
        function showtime(){
        //id=clock에 아레와 같이 현재시간 출력하기
        //2020. 10. 08 (목) AM 11:07:15 
        var today=new Date();
        
        var str="";
        str += today.getFullYear() + "." //년

        if(today.getMonth()+1<10){//월 (0-11)1월은 0으로나옴
            str +="0";
        }//if end
        str +=today.getMonth()+1 + ".";

        if(today.getDate()<10){//일
            str +="0";
        }//if end
        str +=today.getDate() + ".";

        switch(today.getDay()){//날짜
            case 0:str +=" (일) ";break;
            case 1:str +=" (월) ";break;
            case 2:str +=" (화) ";break;
            case 3:str +=" (수) ";break;
            case 4:str +=" (목) ";break;
            case 5:str +=" (금) ";break;
            case 6:str +=" (토) ";break;
        }//switch end

        if(today.getHours()<12){
            str +="AM";
        }else{
            str +="PM";
        }//if end

        if(today.getHours()>=13){//시
            str += (today.getHours()-12)+":";
        }else{
            str += today.getHours()+":";
        }//if end

        if(today.getMinutes()<10){//분
            str +="0"      
        }
        str +=today.getMinutes()+":";

        if(today.getSeconds()<10){//초
            str +="0";
        }
        str += today.getSeconds();

        document.getElementById("clock").innerHTML=str;

        //1초후에 showtime 함수를 호출
        //window객체 생략가능하다
        timer=window.setTimeout(showtime, 1000);
        }//showtime()end

        var timer;//전역변수

        function killtime(){//시간 반납
            clearTimeout(timer);
        }
    </script>
   	
   	</div>
  </div><!-- row end -->
</div><!--Contest 끝  -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  Copyright &copy; 2020 MYWEB
</footer>

</body>
</html>
    