-- DROP ALL
DROP TABLE APPLICATION;
DROP TABLE TRANSACTION;
DROP TABLE G_PRODUCT;
DROP TABLE LOC_COMMENT;
DROP TABLE G_BOARD;
DROP TABLE GD_MEMBER;

-- SEQUENCES
DROP SEQUENCE B_SEQ;
DROP SEQUENCE T_SEQ;
DROP SEQUENCE P_SEQ;
DROP SEQUENCE A_SEQ;

-- B : BOARD / T : TRANSACTION / P : PRODUCT / A : APPLICATION
CREATE SEQUENCE B_SEQ;
CREATE SEQUENCE T_SEQ;
CREATE SEQUENCE P_SEQ;
CREATE SEQUENCE A_SEQ;

-- SELECT
SELECT * FROM GD_MEMBER;
SELECT * FROM LOC_COMMENT;
SELECT * FROM LOC_COMMENT;
SELECT * FROM APPLICATION;
SELECT * FROM TRANSACTION;
SELECT * FROM DELIVERY;
select * from DELIVERY_MATCH;
select * from APPLICATION;
select * from G_BOARD;

-- TEST COMMENT
insert into LOC_COMMENT(CNO, TITLE, HIT, TIME_POSTED, ADDR, ID, CONTENT) VALUES(C_SEQ.nextval, 'test1', '0', sysdate, '경기도 성남시 분당구', 'java', '내용');
insert into LOC_COMMENT(CNO, TITLE, HIT, TIME_POSTED, ADDR, ID, CONTENT) VALUES(C_SEQ.nextval, 'test2', '0', sysdate, '경기도 광주시 회덕동', 'java', '내용');

select * from (select cno, title, hit, time_posted, addr, id, content, row_number() over(order by cno desc) as rnumber from
		loc_comment) where rnumber between 1 and 5;
SELECT * FROM LOC_COMMENT_REPLY;
select * from gd_member;

INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, depth, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,0,'일빠1',1,0,1);

INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, depth, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,0,'이빠2',2,0,1);

INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, depth, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,0,'삼빠3',3,0,1);

INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, depth, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,1,'새치기',1,1,2);

SELECT rno,cno,id,name,TO_CHAR(TIME_POSTED,'YYYY.MM.DD HH24:MI') as time_posted,
parent,content,gno,depth,order_no 
FROM LOC_COMMENT_REPLY WHERE cno=1 ORDER BY GNO ASC;


-- 댓글 TEST SQL

INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, DEPT, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,0,'일빠1',1,0,1);
INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, DEPT, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,0,'이빠2',2,0,1);
INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, DEPT, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,0,'삼빠3',3,0,1);
INSERT INTO LOC_COMMENT_REPLY(RNO, CNO, ID, NAME,TIME_POSTED, PARENT, CONTENT, GNO, DEPT, ORDER_NO)
VALUES(CR_SEQ.NEXTVAL,1,'java','딘딘',sysdate,1,'새치기',1,1,2);

SELECT rno,cno,id,name,TO_CHAR(TIME_POSTED,'YYYY.MM.DD HH24:MI') as time_posted,
parent,content,gno,dept,order_no 
FROM LOC_COMMENT_REPLY WHERE cno=1 ORDER BY GNO ASC

