package com.study.message;

import java.util.List;
import java.util.Map;

public interface MessageService {


	void scheckdelete(int messgeno); 
	void rcheckdelete(int messgeno); 
	
	int sdelete(int messageno);
	int rdelete(int messageno);

	int reply(MessageDTO dto);
	int create(MessageDTO dto);
	
	List<MessageDTO> recelist(Map map);	
	List<MessageDTO> sendlist(Map map);
	 
	 MessageDTO read(int messageno);
	
	 
	 int stotal(Map map);
	 int rtotal(Map map);
	 
}
