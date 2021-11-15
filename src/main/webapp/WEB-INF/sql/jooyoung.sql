select * from member;

insert into member(id, mname, nick, email, password, address1, address2, postcode, phone, filename, grade, point, favteam)
values('admin', '관리자', '관리자', 'abc123@gmail.com', '1234', '서울시', '강남구', '12345', '01012345678', 'member.jpg','A', null, null );

select * from member
where id = 'admin';

insert into bbs(bbsno, btitle, bcontents, bview, bcate, bdate, id)
values(1, '제목입니다.', '내용입니다', 0, '머릿말입니다', sysdate , 'user1');

insert into notice(noticeno, ntitle, ncontents, nview, ndate, id)
values((select nvl(max(noticeno), 0)+1 from notice), '공지 제목입니다.', '공지 내용입니다.', 0, sysdate, 'admin');

select bbsno, bcate, btitle, id, bview, to_char(bdate, 'yyyy-mm-dd') bdate, r
		from(                                                                                        
    		select bbsno, bcate, btitle, id, bview, bdate, rownum r    
    		from (                                                                                                                                                                    
	 			select bbsno, bcate, btitle, id, bview, bdate           
	 			from bbs
                where bcate = '머릿글'
		    order by bbsno desc
		    )
   	 );
     
     
     select count(*) from bbs
    where id = 'user1' and

                      btitle like '%'||'1'||'%';