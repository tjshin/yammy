ALTER TABLE BBS MODIFY(bcate NUMBER(10));
alter table bbs add  FOREIGN KEY(bcate)
                             REFERENCES bcategory(bcate);


CREATE TABLE Bcategory(
                bcate                                  NUMBER(10)     NOT NULL,
                bcatename                              VARCHAR2(50)     NOT NULL,
                bcategrpno                              NUMBER(10)      NULL,
        PRIMARY KEY (bcate),
        FOREIGN KEY (bcategrpno) REFERENCES bcategory     
);
 
COMMENT ON TABLE bcategory is '머릿말';
COMMENT ON COLUMN bcategory.bcate is '머릿말번호';
COMMENT ON COLUMN bcategory.bcatename is '머릿말';
COMMENT ON COLUMN bcategory.bcategrpno is '상위번호';

insert into bcategory(bcate, bcatename, bcategrpno)
values((select nvl(max(bcate),0)+1 from bcategory),
        '잡담', null);
insert into bcategory(bcate, bcatename, bcategrpno)
values((select nvl(max(bcate),0)+1 from bcategory),
        '야구응원', null);
insert into bcategory(bcate, bcatename, bcategrpno)
values((select nvl(max(bcate),0)+1 from bcategory),
        '야구주변정보', null);
        
select cateno, catename
from category
where categrpno is null;






    select bbsno, btitle, nick, to_char(bdate,'yyyy-mm-dd HH24:MI:SS') bdate, bview, bcontents, r, bcname
    from (
    select bbsno, btitle, nick, bdate, bview, bcontents,  rownum r, bcname
    from (
    select bbsno, btitle, member.nick nick, bdate, bview, bcontents, bcategory.bcatename as bcname
    
    from bbs 
    inner join bcategory
     on bbs.bcate = bcategory.bcate
           
     inner join member
    on bbs.id = member.id

		)
		)
        
select *
from bbs
where bview >= 10
  
  select cateno, catename
from category
where categrpno is null;
 

where bview >= 10
  
 select bbsno, btitle, nick, to_char(bdate,'yyyy-mm-dd HH24:MI:SS') bdate, bview, bcontents, r, bcname
    from (
    select bbsno, btitle, nick, bdate, bview, bcontents,  rownum r, bcname
    from (
    select bbsno, btitle, member.nick nick, bdate, bview, bcontents, bcategory.bcatename as bcname
    
    from bbs 
    inner join bcategory
     on bbs.bcate = bcategory.bcate
           
     inner join member
    on bbs.id = member.id

where bview >= 10
       ORDER BY bbsno DESC

		)
		)


create table reply(
   rnum number not null,
   content varchar(500) not null,
   regdate date not null,
   id varchar(10) not null,
   bbsno number(7) not null,
   primary key(rnum),
   foreign key(bbsno)  references bbs(bbsno)
 
);
 
insert into reply(reno, recontents, redate, id, bbsno)
values((select nvl(max(reno),0)+1 from reply),
'의견입니다.',sysdate,'admin',2
) ;
 
 
--list(목록)
select reno, recontents, to_char(redate,'yyyy-mm-dd') redate, id, bbsno, r
FROM(
    select reno, recontents, redate, id, bbsno, rownum r
    FROM(
        select reno, recontents, redate, id, bbsno
        from REPLY
        where bbsno = 2
        order by reno DESC
    )
)WHERE r >= 1 and r <= 5;
 
 
--total(목록)
select count(*) from reply
where bbsno = 2;



        