drop table sikdang;

CREATE TABLE SIKDANG (
       sikid                VARCHAR2(50) NOT NULL,
       sikname              VARCHAR2(100) NULL,
       jibunadd             VARCHAR2(200) NULL,
       sikurl               VARCHAR2(200) NULL,
       sikphone             VARCHAR2(20) NULL,
       nearsta              NUMBER(2) NULL,
       distance             NUMBER(30) NULL,
       coy                  VARCHAR2(50) NULL,
       cox                  VARCHAR2(50) NULL,
       roadadd              VARCHAR2(200) NULL,
       PRIMARY KEY (sikid)
);

select * from sikdang;
alter table sikdang drop column reviewcnt;
alter table sikdang add distance number(30) null;
alter table sikdang add nearsta number(2) null;


update sikdang set distance = 0;

update sikdang set reviewcnt =
(select count(hugino)       
from sikdang s inner join review
on s.sikid = review.sikid
where s.sikid='9927879')
where sikid='9927879';


select sikid, sikname, sikphone, roadadd, jibunadd, sikurl, cox, coy, r
from (
select sikid, sikname, sikphone, roadadd, jibunadd, sikurl, cox, coy, rownum r
from (
select sikid, sikname, sikphone, roadadd, jibunadd, sikurl, cox, coy
from sikdang
)
)
where r >=21 and r<=30;


insert into sikdang(sikid, sikname, sikphone, roadadd, jibunadd,
                    url, cox, coy, reviewcnt)
values('26884143',
       '하남돼지집 대치은마점',
       '02-562-6888',
       '서울 강남구 삼성로58길 9',       
       '서울 강남구 대치동 989-5',
       'http://place.map.kakao.com/26884143',
       '127.06206251070869',
       '37.49870676012346',
       0);
       
select count(*)
from sikdang;

select * from sikdang s left join review on s.sikid = review.sikid;


select * from sikdang inner join (
select s.sikid, count(hugino) reviewcnt
    from sikdang s left join review
    on s.sikid = review.sikid group by s.sikid) rc
    on sikdang.sikid = rc.sikid;
    
-- 식당 레코드 하나당 작성된 리뷰 수 count.... inner join + left join + group by    
    select sikid, sikname, sikphone, roadadd, jibunadd,
			sikurl, cox, coy, distance, reviewcnt, r
	from (
	select sikid, sikname, sikphone, roadadd, jibunadd,
			sikurl, cox, coy, distance, reviewcnt, rownum r
	from (
	select s.sikid sikid, sikname, sikphone, roadadd, jibunadd,
			sikurl, cox, coy, distance, reviewcnt
	from sikdang s inner join 
		(
		select ins.sikid sikid, count(hugino) reviewcnt
		from sikdang ins left join review
		on ins.sikid = review.sikid group by ins.sikid) jt
		on s.sikid = jt.sikid));
    



    
    


