-- 해당 부분 무결성 제약조건을 무시하며 삭제 할 수 있게 해주는 제약조건 
alter table "ADMIN"."TICKET" drop constraint "SYS_C005764"; -- 외래키 삭제
        
        -- 자식테이블
alter table ticket
add constraint allticketlistdelete
    foreign key (id)     -- 자식의 외래키 
    references member(id) --부모의 기본키
    on delete cascade;
    
    
alter table "ADMIN"."MESSAGE" drop constraint "SYS_C005790";


alter table message
add constraint allmessagelistdelete
    foreign key (receid)     -- 자식의 외래키 
    references member(id) --부모의 기본키
    on delete cascade;
    
    
alter table "ADMIN"."MESSAGE" drop constraint "SYS_C005791";

alter table message
add constraint sendmessagelistdelete
    foreign key (sendid)     -- 자식의 외래키 
    references member(id) --부모의 기본키
    on delete cascade;
    
    
    
alter table "ADMIN"."MESSAGE" drop constraint "ALLMESSAGELISTDELETE";

alter table message
add constraint recemessagelistdelete
    foreign key (receid)     -- 자식의 외래키 
    references member(id) --부모의 기본키
    on delete cascade;