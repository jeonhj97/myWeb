--pds.sql
--포토갤러리 테이블

-- 테이블 생성
CREATE TABLE tb_pds (
   pdsno       NUMBER         NOT NULL
  , wname      VARCHAR2(100)  NOT NULL
  , subject    VARCHAR2(250)  NOT NULL
  , regdate    DATE           NOT NULL
  , passwd     VARCHAR2(15)   NOT NULL
  , readcnt    NUMBER         DEFAULT 0
  , filename   VARCHAR2(250)  NOT NULL   
  , filesize   NUMBER         DEFAULT 0  
  , PRIMARY KEY(pdsno)
);

--MariaDB테이블생성
 CREATE TABLE tb_pds (
      pdsno       INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
      ,wname      VARCHAR(100)   NOT NULL
      ,subject    VARCHAR(250)   NOT NULL
      ,regdate    DATETIME       NOT NULL
      ,passwd     VARCHAR(15)    NOT NULL
      ,readcnt    INT            DEFAULT 0
      ,filename   VARCHAR(250)   NOT NULL
      ,filesize   INT            DEFAULT 0
    );



--시퀀스 생성
CREATE sequence pds_seq;

--행추가
pdsno			:시퀀스
wname, subject, passwd:사용자 입력
filename, filesize		:첨부파일 관련 정보
regdate					:오늘날짜


insert into tb_bbs(pdsno, wname, subject, passwd, 
					filename, filesize,regdate)
values(pds_seq.nextval, ?,?,?,?,? sysdate);




--전체목록
SELECT pdsno, wname, subject, readcnt, regdate, filename
FROM tb_pds
ORDER BT regdate DESC
