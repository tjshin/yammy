package com.study.reviewreply;

import java.util.List;
import java.util.Map;

public interface ReviewreplyMapper {

	List<ReviewreplyDTO> list(Map map);

	int total(int hugino);

}
