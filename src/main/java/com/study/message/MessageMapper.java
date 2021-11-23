package com.study.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MessageMapper {

	
	void rcheckdelete(int messgeno); 
	void scheckdelete(int messgeno); 
	
	int sdelete(int messageno);
	int rdelete(int messageno);
	int delete(int messageno);
	
	int reply(MessageDTO dto);
	int create(MessageDTO dto);
	
	
	 List<MessageDTO> list(Map map);	
	 List<MessageDTO> recelist(Map map);
	 List<MessageDTO> sendlist(Map map);
	 
	 MessageDTO read(int messageno);

	 
	 
	 
	 int total(Map map);
	 int stotal(Map map);
	 int rtotal(Map map);
}
