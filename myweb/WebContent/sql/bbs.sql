--bbs.sql
--답변 및 댓글형 게시판

--테이블 삭제
drop table tb_bbs;

--테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999 상품번호
 ,wname    varchar2(20)    not null -- 작성자					작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호				x
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate   -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null  -- 글 IP
 ,primary key(bbsno)                 --bbsno 기본키 
);

select count(*) from tb_bbs;

--시퀀스 생성
create sequence bbs_seq;

--시퀀스 삭제
drop sequence bbs_seq;


--새글쓰기
bbsno : 시퀀스를 이용한 일련번호
wname, subject, content, passwd : 사용자 입력
readcnt, regdt, indent, ansnum  : default값
grpno :  max(bbsno)+1
ip    : 127.0.0.1


--행추가 테스트
insert into tb_bbs (bbsno, wname, subject, content, passwd, grpno, ip)
values(bbs_seq.nextval, '솔데스크', '대한민국','무궁화 꽃이 피었습니다'
     ,'1234',(select nvl(max(bbsno),0)+1 from tb_bbs),'127.0.0.1');

insert into tb_bbs (bbsno, wname, subject, content, passwd, grpno, ip)
values(bbs_seq.nextval, ?, ?, ?, ?
       ,(select nvl(max(bbsno),0)+1 from tb_bbs),?);



--전체목록
select * from tb_bbs
order by grpno desc, ansnum asc;


--상세보기
select * from tb_bbs where bbsno=?


--조회수 증가(bbsRead.jsp상세보기가 요청되었을때)
update tb_bbs set readcnt=readcnt+1
where bbsno=?


--삭제
delete from tb_bbs where bbsno=? and passwd=?



--수정

--1)단계
--글번호와 비밀번호가 일치하는 행 가져오기(read()메소드 참조)
select * from tb_bbs where bbsno=? and passwd=?

--2)단계
--해당글 수정하기
update tb_bbs
set wname=?, subject=?, content=?, passwd=?
where bbsno=?




[답변형 게시판 알고리즘]

- 새글쓰기 : 최초의 부모글
- 답변쓰기 : 자식글
- 그룹번호(grpno)  : 부모글번호와 동일하게
- 들여쓰기(indent) : 부모글 들여쓰기+1
- 글순서(ansnum)   : 부모글 글순서 +1 한 후, 글순서 재조정


  번호  제목                    그룹번호 		들여쓰기 			글순서
  1      서울시                   1            0           0
           ▶종로구               1            1            1
           ▶▶인사동             1             2            2
           ▶▶▶솔데스크         1              3           	 3
           ▶▶▶탑골공원         1              3            3-->4
           ▶강남구               1            1            4-->5
           ▶▶역삼동             1             2            5-->6
  2      제주시                   2            0           0     
  3      부산시                   3            0           0



- 글순서 재조정
update tb_bbs set ansnum=ansnum+1
where grpno=1 and ansnum>=3


- 글목록
select * from tb_bbs 
order by grpno desc, ansnum asc
///////////////////////////////////////////////////
[검색]

--작성자에서 '솔데스크'기 있는지 검색
select * from tb_bbs
where wname like '%솔데스크%'

--제목에서 '트럼프'기 있는지 검색
select * from tb_bbs
where subject like '%트럼프%'

--내용에서 '손흥민'기 있는지 검색
select * from tb_bbs
where content like '%손흥민%'

--제목 또는 내용에서 '환불'이 있는지 검색
select * from tb_bbs
where subject like '%환불%' or content like '%환불%'















////////////////////////////////////////////////////////////


if(word.length()==0) {
//검색을 하지 않는 경우
// 쿼리가 X같이 복잡한이유는 rownum을 사용하려면
// 화려하게 세번은 감싸줘야 recordPerPage 이후로 조회가 가능하
답.
sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r ");
sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, @RNO := @RNO + 1 AS r ");
sql.append(" FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt,grpno,ansnum ");
sql.append(" FROM tb_bbs");
sql.append(" ) A, ( SELECT @RNO := 0 ) B ORDERBY grpno DESC, ansnum ASC");
sql.append(" )C ");
sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
} else {
//검색을 하는 경우
// if문을 추가하여 어떤 검색조건을 선택했는지 확인하고,
// 해당 조건에 일치하는 조건을 WHERE 절에 넣기 위해서다.
sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, @RNO := @RNO + 1 AS r ");
sql.append(" FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt,grpno,ansnum ");
sql.append(" FROM tb_bbs");



sql.append(" ) A, ( SELECT @RNO := 0 ) B ORDER BY grpno DESC, ansnum ASC");
sql.append(" ) C ");
sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
}//if end
   
   
   



