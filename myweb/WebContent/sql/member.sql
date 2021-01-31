rs--member.sql


--회원테이블

CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼 
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 12345
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);


--MariaDB 테이블
CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 101-101
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일   
    PRIMARY KEY (id)
);


insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('webmaster', '12341234', '솔데스크'
       , '123-4567', 'soldesk3@naver.com'
       , '12345', '서울시 종로구 관철동', '코아빌딩5층'
       , 'A02', 'A1', sysdate);
       
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('soldesk', '12341234', '솔데스크'
       , '123-4567', 'soldesk@naver.com'
       , '12345', '서울시 종로구 관철동', '코아빌딩5층'
       , 'A01', 'D1', sysdate);
       
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('user', '12341234', '솔데스크'
       , '123-4567', 'soldesk@naver.com'
       , '12345', '서울시 종로구 관철동', '코아빌딩5층'
       , 'A01', 'D1', sysdate);
       
       
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('user0', '12341234', '솔데스크'
       , '123-4567', 'user0@naver.com'
       , '12345', '서울시 종로구 관철동', '코아빌딩5층'
       , 'A01', 'F1', sysdate);
       
       
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate);
       
   
       
       
       
       
       
       
       




--로그인 성공하면 회원등급 가져오기
--(단, 비회원(E1), 탈퇴회원(F1)은 제외)
select mlevel
from member where id='soldesk'and passwd='12341234'
and mlevel in('A1','B1','C1','D1');





-- 아이디 중복 확인
값이 1나오면 아이디가있는것으로 중복확인 가능
select count(*) from member where id='webamster'


이름이랑 이메일이 일치하는사람 찾기
select id
from member
where id='soldesk' and email='soldesk@naver.com';






--


