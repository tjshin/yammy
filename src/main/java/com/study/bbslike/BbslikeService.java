package com.study.bbslike;

import java.util.List;
import java.util.Map;

public interface BbslikeService {

	int idcheck(Map map);

	int delete(Map map);

	int create(BbslikeDTO dto);

	int total(int bbsno);

}
