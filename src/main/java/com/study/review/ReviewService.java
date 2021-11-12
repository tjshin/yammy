package com.study.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	int create(ReviewDTO dto);

	int total(Map map);

	List<ReviewDTO> list(Map map);

}
