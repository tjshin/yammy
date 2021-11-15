package com.study.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.bbs.BbsDTO;

@Service("com.study.bbs.BbsServiceImpl")
public class BbsServiceImpl implements BbsService {

	@Autowired
	private BbsMapper mapper;

	@Override
	public List<BbsDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public BbsDTO read(int bbsno) {
		// TODO Auto-generated method stub
		return mapper.read(bbsno);
	}

	@Override
	public int create(BbsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int reply(BbsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.reply(dto);
	}

	@Override
	public int delete(int bbsno) {
		// TODO Auto-generated method stub
		return mapper.delete(bbsno);
	}

	@Override
	public void upbview(int bbsno) {
		mapper.upbview(bbsno);
	}

	@Override
	public int update(BbsDTO BbsDTO) {
		// TODO Auto-generated method stub
		return mapper.update(BbsDTO);
	}
	
	@Override
	public List<Map> getCategory() {
		// TODO Auto-generated method stub
		return mapper.getCategory();
	}
	
	
	
	@Override
	public List<BbsDTO> bestlist(Map map) {
		// TODO Auto-generated method stub
		return mapper.bestlist(map);
	}

	@Override
	public int besttotal(Map map) {
		// TODO Auto-generated method stub
		return mapper.besttotal(map);
	}
	
}
