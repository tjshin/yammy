package com.study.bbs;

import java.util.List;
import java.util.Map;

public interface BbsService {

	int reply(BbsDTO dto);

	int create(BbsDTO dto);

	List<BbsDTO> list(Map map);

	BbsDTO read(int bbsno);

	int total(Map map);

	int delete(int bbsno);

	void upbview(int bbsno);

	int update(BbsDTO BbsDTO);

	List<Map> getCategory();
	
   List<BbsDTO> bestlist(Map map);

   int besttotal(Map map);



// 덧글
   
   
   
}

