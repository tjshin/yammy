package com.study.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.reviewreply.ReviewreplyDTO;

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
	public int total(int bbsno) {
		return mapper.total(bbsno);
	}

	@Override
	public List<ReplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}


	@Override
	public int delete(int reno) {
		// TODO Auto-generated method stub
		return mapper.delete(reno);
	}

	@Override
	public ReplyDTO read(int reno) {
		// TODO Auto-generated method stub
		return mapper.read(reno);
	}

	@Override
	public int update(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

}
