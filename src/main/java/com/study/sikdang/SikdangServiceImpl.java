package com.study.sikdang;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
