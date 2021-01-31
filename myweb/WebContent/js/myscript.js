/**
 *  myscript.js
 */

/* 함수선언??
class 자바 
function	자바스크립트
선택자{}	css
*/


function bbsCheck(f){
	//게시판 유효성 검사
	//this 자기자신
	//f-><form name=bbsfrm></form>

	//규정정하기 그냥requierd 만넣기 심심해서 만듬
	//1)작성자 2글자 이상 입력
	var wname=f.wname.value;	//작성자 가져오기
	wname=wname.trim();			//좌우 공백 제거하기
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해 주세요");
		f.wname.focus();			//작성자 칸에 커서 생성
		return false;			//전송하지 않음
	}//if end

	//2)제목 2글자 이상 입력
	var subject=f.subject.value;	//작성자 가져오기
	subject=subject.trim();			//좌우 공백 제거하기
	if(subject.length<2){
		alert("제목 2글자 이상 입력해 주세요");
		f.subject.focus();			//작성자 칸에 커서 생성
		return false;			//전송하지 않음
	}//if end

	//3)내용 2글자 이상 입력
	var content=f.content.value;	//작성자 가져오기
	content=content.trim();			//좌우 공백 제거하기
	if(content.length<2){
		alert("내용 2글자 이상 입력해 주세요");
		f.content.focus();			//작성자 칸에 커서 생성
		return false;			//전송하지 않음
	}//if end

	//4)비밀번호 4글자 이상 입력
	var passwd=f.passwd.value;	//작성자 가져오기
	passwd=passwd.trim();			//좌우 공백 제거하기
	if(passwd.length<4){
		alert("비밀번호 4글자 이상 입력해 주세요");
		f.passwd.focus();			//작성자 칸에 커서 생성
		return false;			//전송하지 않음
	}//if end


		return true;	//onosubmit이벤트에서 서버로 전송

}//bbsCheck() end


function pwCheck(){
var passwd=document.getElementById("passwd").value	
	passwd=passwd.trim();			
	if(passwd.length<4){
		alert("비밀번호 4글자 이상 입력해 주세요");
		document.getElementById("passwd").focus;
		return false;			
	}//if end

	var message="진행된 내용은 복구되지 않습니다 계속 진행할까요?";
	if(confirm(message)){//확인 true, 취소 false
		return true;	//서버로 전송됨
	}else{
		return false;
	}//if end

}//pwCheck()end


function searchCheck(f){
	//검색어를 입력하새요
	var word=f.word.value;	
	word=word.trim();		
	if(word.length==0){
		alert("검색어를 입력해 주세요");
		return false;			//전송하지 않음
	}//if end
	
	return true;	
	
}//searchCheck()end



function noticeCheck(f){//f는 this가가리키는 noticeform임
	var subject=f.subject.value;	//작성자 가져오기
	subject=subject.trim();			//좌우 공백 제거하기
	if(subject.length<2){
		alert("제목 2글자 이상 입력해 주세요");
		f.subject.focus();			//작성자 칸에 커서 생성
		return false;			//전송하지 않음
	}//if end

	//3)내용 2글자 이상 입력
	var content=f.content.value;	//작성자 가져오기
	content=content.trim();			//좌우 공백 제거하기
	if(content.length<2){
		alert("내용 2글자 이상 입력해 주세요");
		f.content.focus();			//작성자 칸에 커서 생성
		return false;			//전송하지 않음
	}//if end
	
}//noticeCheck()end


function loginCheck(){
		//로그인 유효성 검사
		//1) 아이디 5~10글자 이내인지 검사
		var id=document.getElementById("id").value;
		id=id.trim();
		if(!(id.length>=5 && id.length<=10)){
			alert("아이디 5~10 글자이내 입력해 주세요");
			document.getElementById("id").focus();
			return false;
		}//if end
		
		//2)비밀번호 5~10글자 이내인지 검사
		var passwd=document.getElementById("passwd").value;
		passwd=passwd.trim();
		if(!(passwd.length>=5 && passwd.length<=10)){
			alert("비밀번호 5~10 글자이내 입력해 주세요");
			document.getElementById("passwd").focus();
			return false;
		}//if end
		
		return true;
}//loginCheck()end




function memberCheck(){
	//회원가입 유효성 검사
	//1)아이디 5~10글자인지?
	//2)비밀번호 5~10글자 인지?
	//3)비밀번호와 비밀번호확인이 서로 일치하는지?
	//4)이름 1~20글자 인지?
	//5)이메일 5글자 인지?
	//6)직업을 선택했는지?

	//1)
	var id=document.getElementById("id").value;
		id=id.trim();
		if(!(id.length>=5 && id.length<=10)){
			alert("아이디 5~10 글자이내 입력해 주세요");
			document.getElementById("id").focus();
			return false;
		}
	
	//2)
	var passwd=document.getElementById("passwd").value;
		passwd=passwd.trim();
		if(!(passwd.length>=5 && passwd.length<=10)){
			alert("비밀번호 5~10 글자이내 입력해 주세요");
			document.getElementById("passwd").focus();
			return false;
		}

	//3)
	var repasswd=document.getElementById("repasswd").value;
		repasswd=repasswd.trim();
		if(repasswd!=passwd){
			alert("비밀번호가 일치하지않습니다");
			document.getElementById("passwd").focus();
			return false;
		}

	//4)
	var mname=getElementById("mname").value;
		mname=mname.trim();
		if(!(id.length>=1 && id.length<=20)){
			alert("이름은 1~20글자로 입력해주세요");
			document.getElementById("mname").focus();
			return false;
		}

	//5)
	var email=getElementById("email").value;
		email=email.trim();
		if(email.length<5){
			alert("이메일은 5글자 이상으로 입력해주새요");
			document.getElementById("email").focus();
			return false;
		}


	//6)
	var email=getElementById("job").value;
		if(job =="0"){
			alert("직업 선택해주세요");
			return false;
		}

		return true;
}// memberCheck()end


function idCheck(){
	//아이디 중복확인

	//bootstrap
	//https://www.w3schools.com/bootstrap/bootstrap_modal.asp 참조
	//->부모창과 자식창이 한몸으로 구성되어 있음

	//새창만들기
	//->부모창과 자식창이 별개로 구성되어 있음
	//->모바일에 기반을 둔 frontend단에서는 사용하지 말것!!
	//window.open("파일명", "새창이름", "다양한옵션들")
	window.open("idCheckForm.jsp"
				,"idwin"
				,"width=400, height=350");


}//idCheck() end


function emailCheck(){
	//이메일 중복확인

	//bootstrap
	//https://www.w3schools.com/bootstrap/bootstrap_modal.asp 참조
	//->부모창과 자식창이 한몸으로 구성되어 있음

	//새창만들기
	//->부모창과 자식창이 별개로 구성되어 있음
	//->모바일에 기반을 둔 frontend단에서는 사용하지 말것!!
	//window.open("파일명", "새창이름", "다양한옵션들")
	window.open("emailCheckForm.jsp"
				,"emailwin"
				,"width=400, height=350");


}//emailCheck() end



function pdsCheck(){
	//포토갤러리 유효성 검시
	//1) 이름
	//2) 제목
	//3) 비밀번호

	//4) 첨부파일
	//확장명이 이미지 파일(png,jpg,gif)인지 확인하시오
	var filename=document.getElementById("filename").value;
	filename=filename.trim();
	if(filename.length==0){
		alert("첨부파일을 선택하세요");
		return false;
	}else{
		//마지막.의 순서 값
		//alert(filename.lastIndexOf("."));

		//문제)파일 타일(확장명)을 출력하시오
		var dot=filename.lastIndexOf(".");
		//확장명: 마지막.이후 문자열만 자르기
		var ext=filename.substr(dot+1);
		//확장명을 전부 소문자 치환
		ext=ext.toLowerCase();
		if(ext=="png" || ext=="jpg" || ext=="gif"){
			return true;
		}else{
			alert("이미지 파일만 가능합니다!!");
			return false;
		}//if end


	}//if end	

}//pdsCheck() end




function modifyCheck(){
	//회원정보변경 이름 2글자이상
	var mname=getElementById("mname").value;
	mname=mname.trim();
	if(mname.length<2){
		alert("이름은 2글자 이상으로 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	}//if end


}//modifyCheck()end










