package com.study.ticket;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.ticket.TicketServiceImpl")
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketMapper mapper;

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<TicketDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public TicketDTO detail(int ticketno) {
		// TODO Auto-generated method stub
		return mapper.detail(ticketno);
	}

	@Override
	public int create(TicketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		return mapper.updateFile(map);
	}

	@Override
	public int update(TicketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int ticketno) {
		// TODO Auto-generated method stub
		return mapper.delete(ticketno);
	}
	
	

}
