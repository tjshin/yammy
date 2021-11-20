
CREATE TABLE BCATEGORY (
       bcate                NUMBER(10) NOT NULL,
       bcatename            VARCHAR2(50) NULL,
       bcategrpno           NUMBER(10) NULL,
       PRIMARY KEY (bcate), 
       FOREIGN KEY (bcate)
                             REFERENCES BCATEGORY
);


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


CREATE TABLE TICKET (
       ticketno             NUMBER(10) NOT NULL,
       tickettitle          VARCHAR2(500) NULL,
       ticketdate           DATE NULL,
       gamedate             VARCHAR2(20) NULL,
       location             VARCHAR2(100) NULL,
       stadium              VARCHAR2(50) NULL,
       ticketcontents       VARCHAR2(4000) NULL,
       filename             VARCHAR2(100) NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (ticketno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE BBS (
       bbsno                NUMBER(10) NOT NULL,
       btitle               VARCHAR2(500) NULL,
       bcontents            VARCHAR2(4000) NULL,
       bview                NUMBER(5) NULL,
       bcate                NUMBER(10) NULL,
       bbscate              VARCHAR2(20) NOT NULL,
       bdate                DATE NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (bbsno), 
       FOREIGN KEY (bcate)
                             REFERENCES BCATEGORY, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE BBSLIKE (
       bcnt                 NUMBER(5) NULL,
       id                   VARCHAR2(50) NOT NULL,
       bbsno                NUMBER(10) NOT NULL,
       PRIMARY KEY (bbsno), 
       FOREIGN KEY (bbsno)
                             REFERENCES BBS, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE REPLY (
       reno                 NUMBER(10) NOT NULL,
       bbsno                NUMBER(10) NOT NULL,
       recontents           VARCHAR2(300) NULL,
       id                   VARCHAR2(50) NOT NULL,
       redate               DATE NULL,
       PRIMARY KEY (reno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER, 
       FOREIGN KEY (bbsno)
                             REFERENCES BBS
);


CREATE TABLE REPLYLIKE (
       recnt                NUMBER(5) NULL,
       id                   VARCHAR2(50) NOT NULL,
       reno                 NUMBER(10) NOT NULL,
       PRIMARY KEY (reno), 
       FOREIGN KEY (reno)
                             REFERENCES REPLY, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE MESSAGE (
       messageno            NUMBER(10) NOT NULL,
       mcontents            VARCHAR2(4000) NULL,
       rconfirm             VARCHAR2(2) DEFAULT Y NOT NULL,
       sconfirm             VARCHAR2(2) DEFAULT Y NOT NULL,
       meticketno           NUMBER(10) NULL,
       receid               VARCHAR2(50) NOT NULL,
       mdate                DATE NULL,
       sendid               VARCHAR2(50) NOT NULL,
       PRIMARY KEY (messageno), 
       FOREIGN KEY (receid)
                             REFERENCES MEMBER, 
       FOREIGN KEY (sendid)
                             REFERENCES MEMBER
);


CREATE TABLE NOTICE (
       noticeno             NUMBER(10) NOT NULL,
       ntitle               VARCHAR2(500) NULL,
       ncontents            VARCHAR2(4000) NULL,
       nview                NUMBER(5) NULL,
       ndate                DATE NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (noticeno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE SIKDANG (
       sikid                VARCHAR2(50) NOT NULL,
       sikname              VARCHAR2(100) NULL,
       jibunadd             VARCHAR2(200) NULL,
       sikurl               VARCHAR2(200) NULL,
       sikphone             VARCHAR2(20) NULL,
       reviewcnt            NUMBER(10) NULL,
       distance             NUMBER(30) NULL,
       coy                  VARCHAR2(50) NULL,
       cox                  VARCHAR2(50) NULL,
       roadadd              VARCHAR2(200) NULL,
       PRIMARY KEY (sikid)
);


CREATE TABLE REVIEW (
       hugino               NUMBER(10) NOT NULL,
       htitle               VARCHAR2(500) NULL,
       hcontents            VARCHAR2(4000) NULL,
       hdate                DATE NULL,
       sikid                VARCHAR2(50) NOT NULL,
       star                 NUMBER(1) NULL,
       stadium              NUMBER(2) NOT NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (hugino), 
       FOREIGN KEY (sikid)
                             REFERENCES SIKDANG, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE REVIEWREPLY (
       hugireno             NUMBER(10) NOT NULL,
       hrecontents          VARCHAR2(300) NULL,
       hredate              DATE NULL,
       hugino               NUMBER(10) NOT NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (hugireno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER, 
       FOREIGN KEY (hugino)
                             REFERENCES REVIEW
);



