select * from bbs 
where bbscate='jamsil';

select * from bbs 
where bbscate='jamsil'
and bbsno = 87;
--controller Map map = new HashMap();
--request.getParameter("bbscate");
--request.getParameter("bbsno");
--map.put("bbscate", bbscate);
--map.put("bbsno", bbsno);
--service.다음글(map);
--다음글 <select id='다음글' paramatertype='Map' resulttype='com.study.bbs.BbsDTO'>
select * from bbs 
where bbscate='jamsil'
and bbsno = (select min(bbsno) from (select bbsno from bbs where bbscate='jamsil' and bbsno > '87'));
--이전글
select * from bbs 
where bbscate='jamsil'
and bbsno = (select max(bbsno) from (select bbsno from bbs where bbscate='jamsil' and bbsno < '87'));

select bbsno from bbs where bbscate='jamsil' and bbsno > '87';

select min(bbsno) from (select bbsno from bbs where bbscate='jamsil' and bbsno > '87');
