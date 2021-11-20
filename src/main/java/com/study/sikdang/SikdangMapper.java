package com.study.sikdang;

import java.util.List;
import java.util.Map;

import com.study.review.ReviewDTO;

public interface SikdangMapper {

	int create(SikdangDTO dto);

	int checkId(String sikid);

	List<SikdangDTO> list();

	int total(Map map);

	List<SikdangDTO> adminlist(Map map);

	int delete(String sikid);

	SikdangDTO read(String sikid);
	
	int distance(SikdangDTO sdto);

}