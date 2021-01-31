<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 이메일 중복확인 *</h3>
		<form 	method="post"
				action="emailCheckProc.jsp"
				onsubmit="return blankCheck()"><!-- 아무것도안치고 중복확인하는경우 -->
		이메일:<input type="text" name="email" id="email" maxlength="30" autofocus>
			  <input type="submit" value="중복확인">
		</form>
	
	
	</div>
	
	<script>
	function blankCheck(){
		var email=document.getElementById("email").value;
		email=email.trim();
		if(email.length<5){
			alert("이메일은 5글자 이상 입력해 주세요");
			return false;
		}//if end
		return true;
	}//blankCheck() end
	</script>
</body>
</html>



