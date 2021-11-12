CREATE TABLE REVIEW (
       hugino               NUMBER(10) NOT NULL,
       htitle               VARCHAR2(500) NULL,
       hcontents            VARCHAR2(4000) NULL,
       sikid                VARCHAR2(50) NOT NULL,
       star                 NUMBER(1) NULL,
       stadium              NUMBER(2) NULL,
       id                   VARCHAR2(50) NOT NULL,
       PRIMARY KEY (hugino), 
       FOREIGN KEY (sikid)
                             REFERENCES SIKDANG, 
       FOREIGN KEY (id)
                             REFERENCES MEMBER
);


insert into review(hugino, id, sikid, stadium, htitle, hcontents, star)
values((select nvl(max(hugino),0)+1 from review),
        'tester',
        '10455826',
        1,
        '리뷰 테스트 제목입니다.',
        '리뷰 테스트 내용입니다.',
        5);
        
insert into member(id, mname, nick, email, password, address1, address2,
                    postcode, phone, filename, grade, point, favteam)
values('tester', '홍길동', '테스터', 'tester@test.com', '1234',
        '서울시 송파구 가락로5길', '우리집', '12345', '010-1234-5678',
        'tester.jpg','A',1000,null);
        
select count (*) from review r inner join member m
on r.id = m.id
where hcontents like '%img%';

select hugino, nick, sikid, stadium, htitle, hcontents, star, r
from (
select hugino, nick, sikid, stadium, htitle, hcontents, star, rownum r
from (
select hugino, member.nick nick, sikid, stadium, htitle, hcontents, star
from review inner join member
on review.id = member.id
where htitle like '%테스트%'
order by hugino desc
)
)
where r > =1 and r<=4;