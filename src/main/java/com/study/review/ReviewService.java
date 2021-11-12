package com.study.review;

import java.util.List;
import java.util.Map;

import com.study.sikdang.SikdangDTO;

public interface ReviewService {

	int create(ReviewDTO dto);

	int total(Map map);

	List<ReviewDTO> list(Map map);

	ReviewDTO read(int hugino);

	int update(ReviewDTO dto);

	SikdangDTO detail(String sikid);

}
