package com.study.reviewlike;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.reviewlike.ReviewlikeServiceImpl")
public class ReviewlikeServiceImpl implements ReviewlikeService {
	
	@Autowired
	private ReviewlikeMapper mapper;

	@Override
	public int total(int hugino) {
		// TODO Auto-generated method stub
		return mapper.total(hugino);
	}

	@Override
	public int idcheck(Map map) {
		// TODO Auto-generated method stub
		return mapper.idcheck(map);
	}

	@Override
	public int create(ReviewlikeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return mapper.delete(map);
	}

}
