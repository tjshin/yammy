CREATE TABLE BBS (
       bbsno                NUMBER(10) NOT NULL,
       btitle               VARCHAR2(500) NULL,
       bcontents            VARCHAR2(4000) NULL,
       bview                NUMBER(5) NULL,
       bcate                VARCHAR2(20) NULL,
       bdate                DATE NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (bbsno), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);

CREATE TABLE TEAMBBS (
       tbno                 NUMBER(2) NOT NULL,
       bbsno                NUMBER(10) NOT NULL,
       PRIMARY KEY (tbno), 
       FOREIGN KEY (bbsno)
                             REFERENCES BBS
);


CREATE TABLE REPLY (
       reno                 NUMBER(10) NOT NULL,
       bbsno                NUMBER(10) NOT NULL,
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
       recnt                NUMBER(5) NULL,
       id                   VARCHAR2(50) NOT NULL,
       reno                 NUMBER(10) NOT NULL,
       PRIMARY KEY (reno), 
       FOREIGN KEY (reno)
                             REFERENCES REPLY, 
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


CREATE TABLE Bcategory(
                bcate                                  NUMBER(10)     NOT NULL,
                bcatename                              VARCHAR2(50)     NOT NULL,
                bcategrpno                              NUMBER(10)      NULL,
        PRIMARY KEY (bcate),
        FOREIGN KEY (bcategrpno) REFERENCES bcategory     
);