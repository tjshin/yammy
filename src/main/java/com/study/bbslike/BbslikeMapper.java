package com.study.bbslike;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.reviewlike.ReviewlikeDTO;

@Mapper
public interface BbslikeMapper {

	int total(int bbsno);

	int idcheck(Map map);

	int create(BbslikeDTO dto);

	int delete(Map map);

}
