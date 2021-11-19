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
	
	public void uplike(int bbsno) {
		mapper.uplike(bbsno);
	
	}

}
