package com.study.bbs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BbsMapper {

	int reply(BbsDTO dto);

	int create(BbsDTO dto);

	List<BbsDTO> list(Map map);

	BbsDTO read(int bbsno);

	int total(Map map);

	int delete(int bbsno);

	void upbview(int noticeno);

	int update(BbsDTO bbsDTO);

	List<Map> getCategory();

	List<BbsDTO> bestlist(Map map);

	int besttotal(Map map);
	
	
}
