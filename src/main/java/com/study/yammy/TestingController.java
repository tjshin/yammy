package com.study.yammy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TestingController {
	
	@GetMapping("/")
	public String home() {

		return "/home";
		}
}