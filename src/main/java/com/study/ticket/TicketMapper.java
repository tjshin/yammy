package com.study.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TicketMapper {

	
	TicketDTO detail(int ticketno);
	
	int total(Map map);
	
	List<TicketDTO> list(Map map);
}
