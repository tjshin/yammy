package com.study.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.message.MessageServiceImpl")
public class MessageServiceImpl implements MessageService {

	@Autowired
		private MessageMapper mapper;

	@Override
	public List<MessageDTO> sendlist(Map map) {
		// TODO Auto-generated method stub
		return mapper.sendlist(map);
	}

	@Override
	public int stotal(Map map) {
		// TODO Auto-generated method stub
		return mapper.stotal(map);
	}

	
	@Override
	public int rtotal(Map map) {
		// TODO Auto-generated method stub
		return mapper.rtotal(map);
	}
	
	@Override
	public List<MessageDTO> recelist(Map map) {
		// TODO Auto-generated method stub
		return mapper.recelist(map);
	}


	@Override
	public int create(MessageDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int reply(MessageDTO dto) {
		// TODO Auto-generated method stub
		return mapper.reply(dto);
	}

	@Override
	public int rdelete(int messageno) {
		// TODO Auto-generated method stub
		return mapper.rdelete(messageno);
	}

	@Override
	public int sdelete(int messageno) {
		// TODO Auto-generated method stub
		return mapper.sdelete(messageno);
	}

	@Override
	public void rcheckdelete(int messgeno) {
		// TODO Auto-generated method stub
		 mapper.rcheckdelete(messgeno);
		
	}
	
	@Override
	public void scheckdelete(int messgeno) {
		// TODO Auto-generated method stub
		 mapper.scheckdelete(messgeno);
		
	}

	@Override
	public MessageDTO read(int messageno) {
		// TODO Auto-generated method stub
		return mapper.read(messageno);
	}

	@Override
	public List<MessageDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public int delete(int messageno) {
		// TODO Auto-generated method stub
		return mapper.delete(messageno);
	}



	



}
