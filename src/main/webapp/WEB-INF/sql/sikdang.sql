drop table sikdang;

CREATE TABLE SIKDANG (
       sikid                VARCHAR2(50) NOT NULL,
       sikname              VARCHAR2(100) NULL,
       jibunadd             VARCHAR2(200) NULL,
       sikurl                  VARCHAR2(200) NULL,
       sikphone             VARCHAR2(20) NULL,
       coy                  VARCHAR2(50) NULL,
       cox                  VARCHAR2(50) NULL,
       roadadd              VARCHAR2(200) NULL,
       PRIMARY KEY (sikid)
);

alter table sikdang
rename column url to sikurl;



insert into sikdang(sikid, sikname, sikphone, roadadd, jibunadd,
                    url, cox, coy)
values('26884143',
       '하남돼지집 대치은마점',
       '02-562-6888',
       '서울 강남구 삼성로58길 9',       
       '서울 강남구 대치동 989-5',
       'http://place.map.kakao.com/26884143',
       '127.06206251070869',
       '37.49870676012346'
       );