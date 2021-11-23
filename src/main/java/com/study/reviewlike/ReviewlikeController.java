package com.study.reviewlike;

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

import com.study.reviewreply.ReviewreplyDTO;

@RestController
public class ReviewlikeController {
	
	@Autowired
	@Qualifier("com.study.reviewlike.ReviewlikeServiceImpl")
	private ReviewlikeService service;
	
	@GetMapping("/review/like/total/{hugino}")
	public ResponseEntity<Integer> getTotal(@PathVariable("hugino") int hugino) {
		
		int replyCnt = service.total(hugino);
		
		return new ResponseEntity<>(replyCnt, HttpStatus.OK);
	}
	
	@GetMapping("/review/like/idcheck/{hugino}/{id}")
	public ResponseEntity<Integer> getIdcheck(@PathVariable("hugino") int hugino,
											@PathVariable("id") String id) {
		Map map = new HashMap();
		map.put("hugino", hugino);
		map.put("id", id);
		int idcheck = service.idcheck(map);
		
		return new ResponseEntity<>(idcheck, HttpStatus.OK);
	}
	
	@PostMapping("/review/like/create")
	public ResponseEntity<String> create(@RequestBody ReviewlikeDTO dto) {

		int flag = service.create(dto);

		return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping("/review/like/{hugino}/{id}")
	public ResponseEntity<String> remove(@PathVariable("hugino") int hugino,
										@PathVariable("id") String id) {
		Map map = new HashMap();
		map.put("hugino", hugino);
		map.put("id", id);

		return service.delete(map) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}


}
