1. 공지사항 개발환경 구축
1)테이블 생성
 create table tb_notice(
     noticeno   number           not null  -- 일련번호
    ,subject    varchar2(255)    not null  -- 제목
    ,content    varchar2(4000)   not null  -- 내용
    ,regdt      date    default  sysdate   -- 작성일
    ,primary key(noticeno)                 -- noticeno 기본키
   );
   
   
   drop table tb_notice;
   
   
   create table tb_notice(
     noticeno   int          not null AUTO_INCREMENT PRIMARY KEY
    ,subject    varchar(255)    not null  
    ,content    varchar(4000)   not null  
    ,regdt        DATETIME       
            
   );


   
   일련번호 시퀀스 생성
   create sequence noticeno_seq;
   delete sequence noticeno_seq;
   
   
   
insert into tb_notice (noticeno,subject,content)
values(notice_seq.nextval, ?, ?);


 SELECT noticeno,subject, content, regdt
 FROM tb_notice WHERE bbsno=?
 
 
 
     DELETE FROM tb_notice
	 WHERE noticeno=? 
	 
	 
	 
	 if(word.length()==0) { // 검색어가 없을 경우
sql.append(" SELECT noticeno, subject, content, regdt, r");
sql.append(" FROM( select noticeno, subject, content, regdt,@RNO := @RNO + 1 AS r ");
sql.append(" FROM ( select noticeno, subject, content, regd");
sql.append(" FROM tb_notice ");
sql.append(" )A, ( SELECT @RNO := 0 ) B order by regdt desc ");
sql.append(" )C ");
sql.append(" WHERE r>=" +startRow + " AND r<=" +endRow );
} else { // 검색어가 있을 경우
sql.append(" SELECT noticeno, subject, content, regdt, r");
sql.append(" FROM( select noticeno, subject, content, regdt,@RNO := @RNO + 1 AS r ");
sql.append(" FROM ( select noticeno, subject, content, regdt ");
sql.append(" from tb_notice ");
// 검색어에 따라 조건문 변경
String search="";
if(col.equals("subject")) {
search += " where subject like '%"+word+"%' ";
}else if(col.equals("content")) {
search += " where content like '%"+word+"%' ";
}else if(col.equals("subject_content")) {
search += " where subject like '%"+word+"%' ";
search += " or content like '%"+word+"%' ";
}//if
sql.append(search);
sql.append(" )A, ( SELECT @RNO := 0 ) B ORDER BYregdt desc ");
sql.append(" )C ");
sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
}//if
		      