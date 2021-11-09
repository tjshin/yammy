
CREATE TABLE MEMBER (
       id                   VARCHAR2(50) NOT NULL,
       mname                VARCHAR2(10) NULL,
       nick                 VARCHAR2(16) NULL,
       email                VARCHAR2() NULL,
       password             VARCHAR2() NULL,
       address              VARCHAR2() NULL,
       postcode             VARCHAR2(7) NULL,
       phone                VARCHAR2(15) NULL,
       filename             VARCHAR2() NULL,
       grade                CHAR(2) NULL,
       point                NUMBER() NULL,
       favteam              VARCHAR2() NULL,
       PRIMARY KEY (id)
);


CREATE TABLE TICKET (
       ticketno             NUMBER() NOT NULL,
       tickettitle          VARCHAR2() NULL,
       stadium              NUMBER(2) NULL,
       ticketcontents       VARCHAR2() NULL,
       filename             VARCHAR2() NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (ticketno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE BBS (
       bbsno                NUMBER() NOT NULL,
       btitle               VARCHAR2(500) NULL,
       bcontents            VARCHAR2() NULL,
       bview                NUMBER() NULL,
       bcate                VARCHAR2(20) NULL,
       bdate                DATE NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (bbsno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE BBSLIKE (
       bcnt                 NUMBER() NULL,
       id                   VARCHAR2(50) NOT NULL,
       bbsno                NUMBER() NOT NULL,
       PRIMARY KEY (bbsno), 
       FOREIGN KEY (bbsno)
                             REFERENCES BBS, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE REPLY (
       reno                 NUMBER() NOT NULL,
       bbsno                NUMBER() NOT NULL,
       recontents           VARCHAR2(200) NULL,
       id                   VARCHAR2(50) NULL,
       redate               DATE NULL,
       PRIMARY KEY (reno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER, 
       FOREIGN KEY (bbsno)
                             REFERENCES BBS
);


CREATE TABLE REPLYLIKE (
       recnt                NUMBER NULL,
       id                   VARCHAR2(50) NOT NULL,
       reno                 NUMBER() NOT NULL,
       PRIMARY KEY (reno), 
       FOREIGN KEY (reno)
                             REFERENCES REPLY, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE TEAMBBS (
       tbno                 NUMBER(2) NOT NULL,
       bbsno                NUMBER() NOT NULL,
       PRIMARY KEY (tbno), 
       FOREIGN KEY (bbsno)
                             REFERENCES BBS
);


CREATE TABLE MESSAGE (
       messageno            NUMBER() NOT NULL,
       mcontents            VARCHAR2() NULL,
       receid               VARCHAR2(50) NULL,
       mdate                DATE NULL,
       sendid               VARCHAR2(50) NULL,
       PRIMARY KEY (messageno), 
       FOREIGN KEY (receid)
                             REFERENCES MEMBER, 
       FOREIGN KEY (sendid)
                             REFERENCES MEMBER
);


CREATE TABLE NOTICE (
       noticeno             NUMBER() NOT NULL,
       ntitle               VARCHAR2(500) NULL,
       ncontents            VARCHAR2() NULL,
       nview                NUMBER() NULL,
       ndate                DATE NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (noticeno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


CREATE TABLE SIKDANG (
       sikno                NUMBER() NOT NULL,
       sikname              VARCHAR2() NULL,
       sikphone             VARCHAR2() NULL,
       staravg              NUMBER(2,1) NULL,
       coy                  VARCHAR2() NULL,
       cox                  VARCHAR2() NULL,
       sikadd               VARCHAR2() NULL,
       PRIMARY KEY (sikno)
);


CREATE TABLE REVIEW (
       hugino               NUMBER() NOT NULL,
       htitle               VARCHAR2() NULL,
       hcontents            VARCHAR2() NULL,
       sikno                NUMBER() NOT NULL,
       star                 NUMBER(1) NULL,
       stadium              NUMBER(2) NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (hugino), 
       FOREIGN KEY (sikno)
                             REFERENCES SIKDANG, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);



