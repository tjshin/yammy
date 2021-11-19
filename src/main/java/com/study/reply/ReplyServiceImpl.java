package com.study.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.reply.ReplyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Override
	public int create(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int retotal(Map map) {
		return mapper.retotal(map);
	}

	@Override
	public List<ReplyDTO> rlist(Map map) {
		// TODO Auto-generated method stub
		return mapper.rlist(map);
	}

}
