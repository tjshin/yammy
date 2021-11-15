package com.study.chatbot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatbotController {
	@GetMapping("/chatbot/chatting")
	public String chatbot() {

		return "/chatbot/chatting";  
	}
}
