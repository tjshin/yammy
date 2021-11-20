insert into reviewreply (hugireno, hrecontents, hredate, hugino, id)
values((select nvl(max(hugireno),0)+1 from reviewreply),
        '댓글 내용 추가 테스트3',
        sysdate,
        '30',
        'skkutj');

--제약 조건명 확인
select * from all_constraints
where table_name = 'reviewreply';
--제약 조건 삭제
alter table "ADMIN"."REVIEWREPLY" drop constraint "SYS_C005801";

alter table reviewreply
add constraint allreplydelete
    foreign key (hugino)
    references review(hugino)
    on delete cascade;
        
select hugireno, hrecontents, hredate, hugino, m.nick
from reviewreply rr inner join member m
on rr.id = m.id
where hugireno = '1';

update reviewreply
set hrecontents = '댓글 수정 테스트'
where hugino = '30'
and hugireno = '1';

delete reviewreply
where hugireno = '1';

select hugireno, hrecontents, hredate, hugino, id, nick, r
from (
select hugireno, hrecontents, hredate, hugino, id, nick, rownum r
from (
select hugireno, hrecontents, hredate, hugino, rr.id id, m.nick nick
from reviewreply rr inner join member m
on rr.id = m.id
where hugino = '30'
order by hugireno desc
)
)
where r >= 1 and r <= 5;

select count(*) from reviewreply
where hugino = '30';