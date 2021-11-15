package com.study.reply;
 
import java.util.List;
import java.util.Map;
 
public interface ReplyMapper {
 
   int create(ReplyDTO replyDTO);
 
   List<ReplyDTO> list(Map map);
 
   ReplyDTO read(int rnum);
  
   int update(ReplyDTO replyDTO); 
   
   int rdelete(int reno);
 
   int total(int bbsno);

}