package com.study.sikdang;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MaplistController {
	
	@Autowired
	@Qualifier("com.study.sikdang.SikdangServiceImpl")
	private SikdangService service;
	
	@GetMapping("/sikdang/map_main/list/{nearsta}")
	public ResponseEntity<List<SikdangDTO>> getList(@PathVariable("nearsta") int nearsta) {		
		if(nearsta == 0) {
			return new ResponseEntity<List<SikdangDTO>>(service.list(), HttpStatus.OK);
		} else {
			return new ResponseEntity<List<SikdangDTO>>(service.maplist(nearsta), HttpStatus.OK);
		}
		
	}
	

}
