package com.study.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface TicketMapper {

	
	
	int delete(int ticketno);
	
	int updateFile(Map map);
	int update(TicketDTO dto);
	
	
	int create(TicketDTO dto);
	
	TicketDTO detail(int ticketno);
	
	int total(Map map);
	
	List<TicketDTO> list(Map map);
}
