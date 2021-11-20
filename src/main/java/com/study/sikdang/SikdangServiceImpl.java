package com.study.sikdang;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.review.ReviewDTO;

@Service("com.study.sikdang.SikdangServiceImpl")
public class SikdangServiceImpl implements SikdangService {
	
	@Autowired
	private SikdangMapper mapper;

	@Override
	public int create(SikdangDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int checkId(String sikid) {
		// TODO Auto-generated method stub
		return mapper.checkId(sikid);
	}

	@Override
	public List<SikdangDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<SikdangDTO> adminlist(Map map) {
		// TODO Auto-generated method stub
		return mapper.adminlist(map);
	}

	@Override
	public int delete(String sikid) {
		// TODO Auto-generated method stub
		return mapper.delete(sikid);
	}

	@Override
	public SikdangDTO read(String sikid) {
		// TODO Auto-generated method stub
		return mapper.read(sikid);
	}
	
	@Override
	public int distance(SikdangDTO sdto) {
		// TODO Auto-generated method stub
		return mapper.distance(sdto);
	}

}
