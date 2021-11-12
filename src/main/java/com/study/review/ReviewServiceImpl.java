package com.study.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Service("com.study.review.ReviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;

	@Override
	public int create(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<ReviewDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

}
