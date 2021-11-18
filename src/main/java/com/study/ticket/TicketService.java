package com.study.ticket;

import java.util.List;
import java.util.Map;


public interface TicketService {

	int delete(int ticketno);
	int updateFile(Map map);
	int update(TicketDTO dto);
	
	int create(TicketDTO dto);
	
	TicketDTO detail(int ticketno);
	
	int total(Map map);
	
	List<TicketDTO> list(Map map);
	
}
