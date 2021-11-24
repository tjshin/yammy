package com.study.bbslike;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BbslikeController {
	
	@Autowired
	@Qualifier("com.study.bbslike.BbslikeServiceImpl")
	private BbslikeService service;
	
	@GetMapping("/bbs/like/total/{bbsno}")
	public ResponseEntity<Integer> getTotal(@PathVariable("bbsno") int bbsno) {
		
		int replyCnt = service.total(bbsno);
		
		return new ResponseEntity<>(replyCnt, HttpStatus.OK);
	}
	
	@GetMapping("/bbs/like/idcheck/{bbsno}/{id}")
	public ResponseEntity<Integer> getIdcheck(@PathVariable("bbsno") int bbsno,
											@PathVariable("id") String id) {
		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("id", id);
		int idcheck = service.idcheck(map);
		
		return new ResponseEntity<>(idcheck, HttpStatus.OK);
	}
	
	@PostMapping("/bbs/like/create")
	public ResponseEntity<String> create(@RequestBody BbslikeDTO dto) {

		int flag = service.create(dto);

		return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping("/bbs/like/{bbsno}/{id}")
	public ResponseEntity<String> remove(@PathVariable("bbsno") int bbsno,
										@PathVariable("id") String id) {
		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("id", id);

		return service.delete(map) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}


}
