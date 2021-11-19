package com.study.reviewreply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.reviewreply.ReviewreplyServiceImpl")
public class ReviewreplyServiceImpl implements ReviewreplyService {
	
	@Autowired
	private ReviewreplyMapper mapper;

	@Override
	public List<ReviewreplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(int hugino) {
		// TODO Auto-generated method stub
		return mapper.total(hugino);
	}

	@Override
	public int create(ReviewreplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int delete(int hugireno) {
		// TODO Auto-generated method stub
		return mapper.delete(hugireno);
	}

}
