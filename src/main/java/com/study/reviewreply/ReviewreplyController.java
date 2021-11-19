package com.study.reviewreply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.utility.Utility;

@RestController
public class ReviewreplyController {
	
	@Autowired
	@Qualifier("com.study.reviewreply.ReviewreplyServiceImpl")
	private ReviewreplyService service;
	
	@GetMapping("/review/reply/list/{hugino}/{sno}/{eno}")
	public ResponseEntity<List<ReviewreplyDTO>> getList(
		@PathVariable("hugino") int hugino,
		@PathVariable("sno") int sno,
		@PathVariable("eno") int eno) {
			Map map = new HashMap();
			map.put("sno", sno);
			map.put("eno", eno);
			map.put("hugino", hugino);
			
			return new ResponseEntity<List<ReviewreplyDTO>>(
					service.list(map),HttpStatus.OK);
		}
	
	@GetMapping("/review/reply/page")
	public ResponseEntity<String> getPage(
		@RequestParam("nPage") int nPage,
		@RequestParam("nowPage") int nowPage,
		@RequestParam("hugino") int hugino,
		@RequestParam("col") String col,
		@RequestParam("word") String word) {
			int total = service.total(hugino);
			String url = "read";
			int recordPerPage = 5;
			String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, hugino);
			
			return new ResponseEntity<>(paging, HttpStatus.OK);
	}
	

}
