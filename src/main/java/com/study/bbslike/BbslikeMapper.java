package com.study.bbslike;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BbslikeMapper {

	void uplike(int bbsno);
	
}
