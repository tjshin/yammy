package com.study.reply;

import java.util.List;
import java.util.Map;

public interface ReplyMapper {

	int create(ReplyDTO dto);

	int retotal(Map map);

	List<ReplyDTO> rlist(Map map);
	
	
}