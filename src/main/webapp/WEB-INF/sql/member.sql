CREATE TABLE MEMBER (
       id                   VARCHAR2(50) NOT NULL,
       mname                VARCHAR2(10) NULL,
       nick                 VARCHAR2(16) NULL,
       email                VARCHAR2(50) NULL,
       password             VARCHAR2(150) NULL,
       address2             VARCHAR2(150) NULL,
       address1             VARCHAR2(150) NULL,
       postcode             VARCHAR2(7) NULL,
       phone                VARCHAR2(15) NULL,
       filename             VARCHAR2(100) NULL,
       grade                CHAR(2) NULL,
       point                NUMBER(10) NULL,
       favteam              VARCHAR2(20) NULL,
       PRIMARY KEY (id)
);

INSERT INTO member(id, mname, nick , email ,  password, address2,address1,
		postcode, phone,filename, grade ,  point , favteam)
		VALUES('dhwhdqls321', '오종빈', '개발자1','dhwhdqls321@naver.com', '1234', '주소1', '주소2','123-222','01057119371','meber.jsp'
			, 'h',200,'두산');


INSERT INTO member(id, mname, nick , email ,  password, address2,address1,
		postcode, phone,filename, grade ,  point , favteam)
		VALUES('tlsxowls', '신태진', '개발자2','태진21@naver.com', '1234', '주소1', '주소2','333-222','01022229371','meber.jsp'
			, 'h',100,'기아');