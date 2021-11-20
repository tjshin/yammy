package com.study.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public int total(Map map) {
		return mapper.total(map);
	}

	@Override
	public List<NoticeDTO> list(Map map) {
		return mapper.list(map);
	}

	@Override
	public void upCnt(int noticeno) {
		mapper.upCnt(noticeno);

	}

	@Override
	public NoticeDTO read(int noticeno) {
		return mapper.read(noticeno);
	}

	@Override
	public int update(NoticeDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int create(NoticeDTO dto) {
		return mapper.create(dto);
	}

	@Override
	public int delete(int noticeno) {
		return mapper.delete(noticeno);
	}

}
