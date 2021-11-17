package com.study.ticket;

import java.util.List;
import java.util.Map;

public interface TicketService {

	TicketDTO detail(int ticketno);
	
	int total(Map map);
	
	List<TicketDTO> list(Map map);
	
}
