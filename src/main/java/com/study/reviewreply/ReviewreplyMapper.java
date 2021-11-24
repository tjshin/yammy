package com.study.reviewreply;

import java.util.List;
import java.util.Map;

public interface ReviewreplyMapper {

	List<ReviewreplyDTO> list(Map map);

	int total(int hugino);

	int create(ReviewreplyDTO dto);

	int delete(int hugireno);

	ReviewreplyDTO read(int hugireno);

	int update(ReviewreplyDTO dto);

	int admintotal(Map map);
	
	List<ReviewreplyDTO> adminlist(Map map);

}
