package com.study.reviewlike;

import java.util.Map;

public interface ReviewlikeMapper {

	int total(int hugino);

	int idcheck(Map map);

	int create(ReviewlikeDTO dto);

	int delete(Map map);

}
