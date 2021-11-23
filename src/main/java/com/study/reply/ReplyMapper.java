package com.study.reply;

import java.util.List;
import java.util.Map;

import com.study.reviewreply.ReviewreplyDTO;

public interface ReplyMapper {

	int create(ReplyDTO dto);

	int total(int bbsno);

	List<ReplyDTO> list(Map map);
	
	int delete(int reno);

	ReplyDTO read(int reno);

	int update(ReplyDTO dto);
	
}