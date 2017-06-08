-- SQL 2.0 ver 06/01
/*
 * 디폴트 SQL
 */
-- DROP ALL
DROP TABLE DELIVERY_MATCH;
DROP TABLE APPLICATION;
DROP TABLE G_PRODUCT;
DROP TABLE LOC_COMMENT_REPLY;
DROP TABLE LOC_COMMENT;
DROP TABLE G_BOARD;
DROP TABLE REPORT;
DROP TABLE GD_MEMBER;
DROP TABLE VISIT;
DROP TABLE DELIVERY;
-- TABLES
-- 회원 테이블
CREATE TABLE GD_MEMBER(
	ID VARCHAR2(30) PRIMARY KEY,
	NAME VARCHAR2(18) NOT NULL,
	PASSWORD VARCHAR2(30) NOT NULL,
	ADDR VARCHAR2(100) NOT NULL,
	ADDR_DETAIL VARCHAR2(100) NOT NULL,
	TEL VARCHAR2(100) NOT NULL,
	JOB VARCHAR2(18) NOT NULL,
	DELETEMEMBER VARCHAR2(100) DEFAULT 'TRUE'
);
select * from GD_MEMBER;
INSERT INTO GD_MEMBER (ID,PASSWORD,NAME,ADDR,ADDR_DETAIL,TEL,JOB)
		VALUES('JAVA','1234','아이유','경기','판교','01085175486','학생');

		UPDATE GD_MEMBER SET deletemember='TRUE' WHERE ID='JAVA' AND PASSWORD='1234';
-- 물려줄 물건 게시 단위 테이블
CREATE TABLE G_BOARD(
	BNO NUMBER PRIMARY KEY,
	TITLE VARCHAR2(50) NOT NULL,
	HIT NUMBER NOT NULL,
	TIME_POSTED DATE NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	ADDR VARCHAR2(100) NOT NULL,
	BCONTENT CLOB NOT NULL,
	THUMBPATH VARCHAR2(100) NOT NULL,
	IS_TRADED VARCHAR2(10) DEFAULT 'WAITING',
	IS_DELETED VARCHAR2(10) DEFAULT 'NO',
	CONSTRAINT FK_BD_ID FOREIGN KEY(ID) REFERENCES GD_MEMBER ON DELETE CASCADE
);

-- 지역 후기 테이블
CREATE TABLE LOC_COMMENT(
	CNO NUMBER PRIMARY KEY,
	TITLE VARCHAR2(50) NOT NULL,
	HIT NUMBER NOT NULL,
	TIME_POSTED DATE NOT NULL,
	ADDR VARCHAR2(100) NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	CONTENT CLOB NOT NULL,
	CONSTRAINT FK_COM_ID FOREIGN KEY(ID) REFERENCES GD_MEMBER ON DELETE CASCADE
);

-- 물려줄 물건 테이블
CREATE TABLE G_PRODUCT(
	PNO NUMBER PRIMARY KEY,
	PTITLE VARCHAR2(50) NOT NULL,
	BNO NUMBER  NOT NULL,
	KIND VARCHAR2(50) NOT NULL,
	PCONTENT VARCHAR2(50) NOT NULL,
	IMG_PATH VARCHAR2(100) NOT NULL,
	IS_TRADED VARCHAR2(50) DEFAULT 'FALSE',
	CONSTRAINT FK_BNO FOREIGN KEY(BNO) REFERENCES G_BOARD ON DELETE CASCADE
);

-- 신청서 테이블
CREATE TABLE APPLICATION(
   BNO NUMBER NOT NULL,
   REASON VARCHAR2(100) NOT NULL,
   PNOS VARCHAR2(100) NOT NULL,
   ID VARCHAR2(30) NOT NULL,
   IS_SELECTED VARCHAR2(10) DEFAULT 'WAITING', -- 기부자가 신청 채택시 selected
   IS_DELIVERY VARCHAR2(10) DEFAULT 'NO', -- 직거래일시 no,용달일 경우 yes
   IS_DONE VARCHAR2(50) DEFAULT 'NO',
   PRIMARY KEY(BNO,ID),
   CONSTRAINT FK_APP_ID FOREIGN KEY(ID) REFERENCES GD_MEMBER ON DELETE CASCADE,
   CONSTRAINT FK_APP_BNO FOREIGN KEY(BNO) REFERENCES G_BOARD ON DELETE CASCADE
   );
   
--댓글 테이블
CREATE TABLE LOC_COMMENT_REPLY(
	RNO NUMBER PRIMARY KEY,
	CNO NUMBER NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	NAME VARCHAR2(30) NOT NULL,
	TIME_POSTED DATE NOT NULL,
	PARENT NUMBER DEFAULT 0,
	CONTENT CLOB NOT NULL,
	GNO NUMBER NOT NULL,
	DEPTH NUMBER DEFAULT 0,
	ORDER_NO NUMBER DEFAULT 1,
	CONSTRAINT FK_REP_CNO FOREIGN KEY(CNO) REFERENCES LOC_COMMENT ON DELETE CASCADE,
	CONSTRAINT FK_REP_ID FOREIGN KEY(ID) REFERENCES GD_MEMBER ON DELETE CASCADE
);

-- 방문자 카운트 테이블
CREATE TABLE VISIT (
	ID VARCHAR(30) NOT NULL,
	DAY VARCHAR(15) NOT NULL,
	COUNT NUMBER DEFAULT 0,
	PRIMARY KEY(ID, DAY)
);

-- 용달 사업자 테이블 
CREATE TABLE DELIVERY(
	ID VARCHAR2(30) PRIMARY KEY,
	NAME VARCHAR2(18) NOT NULL,
	PASSWORD VARCHAR2(30) NOT NULL,
	TEL VARCHAR2(100) NOT NULL,
	IS_DELETED VARCHAR2(100) DEFAULT 'NO',
	IS_CONFIRMED VARCHAR2(100) DEFAULT 'NO'
);

--용달 맷칭 
CREATE TABLE DELIVERY_MATCH(
   BNO NUMBER NOT NULL,
   AID VARCHAR2(30) NOT NULL,
   DID VARCHAR2(30) NOT NULL,
   STATE VARCHAR2(100) DEFAULT 'WAITING',
   PRIMARY KEY(BNO, AID, DID),
   CONSTRAINT FK_MAT_BNO FOREIGN KEY(BNO) REFERENCES G_BOARD ON DELETE CASCADE,
   CONSTRAINT FK_MAT_DID FOREIGN KEY(AID) REFERENCES GD_MEMBER(ID) ON DELETE CASCADE,
   CONSTRAINT FK_MAT_AID FOREIGN KEY(DID) REFERENCES DELIVERY(ID) ON DELETE CASCADE
);


--신고 관리
CREATE TABLE REPORT(
	REPORT_NO NUMBER PRIMARY KEY,
	CATEGORY VARCHAR2(30) NOT NULL,
	RENO NUMBER NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	REPORTER VARCHAR2(30) NOT NULL,
	WHY CLOB NOT NULL,
	TIME_POSTED DATE NOT NULL,
	PROCESS VARCHAR2(30) DEFAULT 'FALSE',
	CONSTRAINT FK_REPORT_ID FOREIGN KEY(ID) REFERENCES GD_MEMBER(ID) ON DELETE CASCADE
);
select * from REPORT;
-- SEQUENCES
DROP SEQUENCE B_SEQ;
DROP SEQUENCE P_SEQ;
DROP SEQUENCE C_SEQ;
DROP SEQUENCE CR_SEQ;
DROP SEQUENCE RE_SEQ;
-- B : BOARD / T : TRANSACTION / P : PRODUCT / A : APPLICATION / C : COMMENT / CR: COMMENT_REPLY / RE : REPORT
CREATE SEQUENCE B_SEQ;
CREATE SEQUENCE P_SEQ;
CREATE SEQUENCE C_SEQ;
CREATE SEQUENCE CR_SEQ;
CREATE SEQUENCE RE_SEQ;




