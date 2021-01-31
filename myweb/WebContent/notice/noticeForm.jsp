<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeForm.jsp -->
<h3>* 공지사항 쓰기 *</h3>
<p><a href="noticeList.jsp">[공지사항 목록]</a></p>   

<form name="noticefrm" id="noticefrm" method="post"
      action="noticeins.jsp" onsubmit="return noticeCheck(this)">
<table class="table">
<tr>
   <th>제목</th>
   <td><input type="text" name="subject" id="subject"
              class="form-control" maxlength="100" required></td>
</tr>
<tr>
   <th>내용</th>
   <td><textarea rows="5"  class="form-control" name="content" id="content"></textarea></td>
</tr>
<tr>
    <td colspan="2" align="center">
       <input type="submit" value="공지사항 쓰기" class="btn btn-success">
       <input type="reset"  value="취소" class="btn btn-success">
    </td>
</table>
</form>   
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>