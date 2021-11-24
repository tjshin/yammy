package com.study.bbslike;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.bbs.BbsMapper;
import com.study.bbslike.BbslikeDTO;


@Service("com.study.bbslike.BbslikeServiceImpl")
public class BbslikeServiceImpl implements BbslikeService {

	@Autowired
	private BbslikeMapper mapper;

	@Override
	public int idcheck(Map map) {
		// TODO Auto-generated method stub
		return mapper.idcheck(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return mapper.delete(map);
	}

	@Override
	public int create(BbslikeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int total(int bbsno) {
		// TODO Auto-generated method stub
		return mapper.total(bbsno);
	}


}
