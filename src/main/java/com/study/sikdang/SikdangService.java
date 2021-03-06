package com.study.sikdang;

import java.util.List;
import java.util.Map;

import com.study.review.ReviewDTO;

public interface SikdangService {

	int create(SikdangDTO dto);

	int checkId(String sikid);

	List<SikdangDTO> list();

	int total(Map map);

	List<SikdangDTO> adminlist(Map map);

	int delete(String sikid);

	SikdangDTO read(String sikid);

	List<SikdangDTO> maplist(int nearsta);

}
