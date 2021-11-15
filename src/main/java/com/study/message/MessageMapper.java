package com.study.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MessageMapper {

	
	
	
	void checkdelete(int messgeno); 
	
	int sdelete(int messageno);
	int rdelete(int messageno);
	
	int reply(MessageDTO dto);
	int create(MessageDTO dto);
	
	 List<MessageDTO> recelist(Map map);
	 List<MessageDTO> sendlist(Map map);
	 
	 MessageDTO receread(int messageno);
	 MessageDTO sendread(int messageno);
	 
	 
	 
	 
	 int stotal(Map map);
	 int rtotal(Map map);
}
