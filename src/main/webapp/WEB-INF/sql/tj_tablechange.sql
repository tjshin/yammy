alter table "ADMIN"."REVIEWLIKE" drop constraint "SYS_C005891";

alter table reviewlike
add constraint allreviewlikedeleteformember
    foreign key (id)
    references member(id)
    on delete cascade;
    
alter table "ADMIN"."REVIEWLIKE" drop constraint "SYS_C005892";

alter table reviewlike
add constraint allreviewlikedeleteforreview
    foreign key (hugino)
    references review(hugino)
    on delete cascade;
    
alter table "ADMIN"."REVIEW" drop constraint "SYS_C005706";

alter table review
add constraint allreviewdeleteforsikdang
    foreign key (sikid)
    references sikdang(sikid)
    on delete cascade;
    
alter table "ADMIN"."BBS" drop constraint "SYS_C005769";

alter table bbs
add constraint bbsdeleteformember
    foreign key (id)
    references member(id)
    on delete cascade;
    
alter table "ADMIN"."REVIEWREPLY" drop constraint "SYS_C005800";

alter table reviewreply
add constraint allreviewreplydeleteformember
    foreign key (id)
    references member(id)
    on delete cascade;