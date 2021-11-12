CREATE TABLE REVIEW (
       hugino               NUMBER(10) NOT NULL,
       htitle               VARCHAR2(500) NULL,
       hcontents            VARCHAR2(4000) NULL,
       hdate                DATE NULL,
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
alter table review add hdate date null;

insert into review(hugino, id, sikid, stadium, htitle, hcontents, star, hdate)
values((select nvl(max(hugino),0)+1 from review),
        'tester',
        '10455826',
        1,
        '리뷰 테스트 제목입니다.',
        '리뷰 테스트 내용입니다.',
        5,
        sysdate);
        
insert into member(id, mname, nick, email, password, address1, address2,
                    postcode, phone, filename, grade, point, favteam)
values('tester', '홍길동', '테스터', 'tester@test.com', '1234',
        '서울시 송파구 가락로5길', '우리집', '12345', '010-1234-5678',
        'tester.jpg','A',1000,null);
        
select count (*) from review r inner join member m
on r.id = m.id
where hcontents like '%img%';

select hugino, nick, sikid, sikname, 
        sikurl, stadium, htitle, hcontents, star, hdate, r
from (
select hugino, nick, sikid, sikname, 
        sikurl, stadium, htitle, hcontents, star, hdate, rownum r
from (
select hugino, m.nick nick, review.sikid sikid, s.sikname sikname,
        s.sikurl sikurl, stadium, htitle, hcontents, star, hdate
from review inner join member m
on review.id = m.id
inner join sikdang s
on review.sikid = s.sikid
where htitle like '%테스트%'
order by hugino desc
)
)
where r > =1 and r<=5;

select hugino, m.nick nick, review.sikid sikid, s.sikname sikname,
        s.sikurl sikurl, stadium, htitle, hcontents, star, hdate
from review inner join member m
on review.id = m.id
inner join sikdang s
on review.sikid = s.sikid
where hugino = '13';

update review
set htitle='수정 테스트입니다.', hcontents='내용 수정 테스트입니다.',
    stadium='3', star='3'
where hugino='11';

delete from review
where hugino = '11';