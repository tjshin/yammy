package com.study.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	int total(Map map);

	List<NoticeDTO> list(Map map);

	void upCnt(int noticeno);

	NoticeDTO read(int noticeno);

	int update(NoticeDTO dto);

	int create(NoticeDTO dto);

	int delete(int noticeno);

}
