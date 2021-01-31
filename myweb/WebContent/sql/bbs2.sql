--bbs2.sql

--1)테이블 생성
create table board(
  num          number         NOT NULL,
  writer       varchar2(20)   NOT NULL,
  email        varchar2(30),
  subject      varchar2(50)   NOT NULL,--제목
  content      varchar2(2000) NOT NULL,--내용
  passwd       varchar2(10)   NOT NULL,
  reg_date     date           NOT NULL,
  readcount    number         default 0,
  ref          number         NOT NULL,  -- 그룹번호(grpno)
  re_step      number         NOT NULL,  -- 글순서  (ansnum)
  re_level     number         NOT NULL,  -- 들여쓰기(indent)
  ip           varchar2(20)   NOT NULL,
  PRIMARY KEY(num)  
);

--2)시퀀스생성
create sequence board_seq;



sql.append(" SELECT num, writer ,email ,subject ,passwd ,reg_date ,ref, re_step ,re_level, content, ip, readcount, r ");
sql.append(" FROM ( ");
sql.append(" SELECT num, writer ,email ,subject ,passwd ,reg_date ,ref, re_step ,re_level, content, ip, readcount, @RNO := @RNO + 1 AS r ");
sql.append(" FROM ( ");
sql.append(" SELECT num, writer ,email ,subject ,passwd ,reg_date ,ref ");
sql.append(" ,re_step ,re_level, content, ip, readcount ");
sql.append(" FROM board "); //그룹별로 최신글, 그룹내에서는 처음쓴글부터
sql.append(" ) A,( SELECT @RNO := 0 ) B ORDER BY ref desc ,re_step ASC ");
sql.append(" ) C ");
sql.append(" WHERE r >= ? AND r<=? ");

