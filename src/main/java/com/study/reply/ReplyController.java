package com.study.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.reviewreply.ReviewreplyDTO;
import com.study.utility.Utility;

@RestController
public class ReplyController {

	@Autowired
	@Qualifier("com.study.reply.ReplyServiceImpl")
	private ReplyService service;

	@GetMapping("/bbs/reply/list/{bbsno}/{sno}/{eno}")
	public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("bbsno") int bbsno,
			@PathVariable("sno") int sno, @PathVariable("eno") int eno) {
		
		Map map = new HashMap();
		
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);

		return new ResponseEntity<List<ReplyDTO>>(service.list(map), HttpStatus.OK);
	}
	
	@GetMapping("/bbs/reply/total/{bbsno}")
	public ResponseEntity<Integer> getTotal(@PathVariable("bbsno") int bbsno) {
		
		int replyCnt = service.total(bbsno);
		
		return new ResponseEntity<>(replyCnt, HttpStatus.OK);
	}

	@GetMapping("/bbs/reply/page")
	public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, @RequestParam("nowPage") int nowPage,
			@RequestParam("bbsno") int bbsno, @RequestParam("col") String col, @RequestParam("word") String word) {
		int total = service.total(bbsno);
		String url = "/bbs/read";
		int recordPerPage = 5;
		String paging = Utility.reviewrpaging(total, nowPage, recordPerPage, col, word, url, nPage, bbsno);

		return new ResponseEntity<>(paging, HttpStatus.OK);
	}

	@PostMapping("/bbs/reply/create")
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {

		dto.setRecontents(dto.getRecontents().replaceAll("/n/r", "<br>"));

		int flag = service.create(dto);

		return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/bbs/reply/{reno}")
	public ResponseEntity<ReplyDTO> get(@PathVariable("reno") int reno) {

		return new ResponseEntity<>(service.read(reno), HttpStatus.OK);
	}

	@PutMapping("/bbs/reply/{reno}")
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto, @PathVariable("reno") int reno) {

		return service.update(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}	

	@DeleteMapping("/bbs/reply/{reno}")
	public ResponseEntity<String> remove(@PathVariable("reno") int reno) {

		return service.delete(reno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	

}
