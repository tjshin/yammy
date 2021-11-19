package com.study.bbslike;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class BbslikeController {
	

  
    @RequestMapping("/bbs/read/{bbsno}")
    public String uplike (@RequestParam int member_id) throws Exception {
        
        BbslikeService.uplike(member_id);
    
        return "/bbs/list"; 
    }

	
	
}
