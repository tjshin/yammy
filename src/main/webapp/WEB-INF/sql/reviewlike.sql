drop table reviewlike cascade constraints;

CREATE TABLE REVIEWLIKE (
       hugilike             NUMBER(10) NOT NULL,
       hugino               NUMBER(10) NULL,
       id                   VARCHAR2(50) NULL,
       PRIMARY KEY (hugilike), 
       FOREIGN KEY (id)
                             REFERENCES MEMBER, 
       FOREIGN KEY (hugino)
                             REFERENCES REVIEW
);

select * from reviewlike;

insert into reviewlike(hugilike, hugino, id)
values((select nvl(max(hugilike),0)+1 from reviewlike),
        '32', 'dhwhdqls321');
        
delete reviewlike
where hugino = '32'
and id = 'dhwhdqls321';

select count(*)
from reviewlike 
where hugino = '32';

select count(*)
from reviewlike
where hugino = '32'
and id = 'testuser';
