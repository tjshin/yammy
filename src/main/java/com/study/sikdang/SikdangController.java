package com.study.sikdang;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SikdangController {
	
	@Autowired
	@Qualifier("com.study.sikdang.SikdangServiceImpl")
	private SikdangService service;
	

	@GetMapping("/sikdang/map_main")
	public String mapMain(HttpServletRequest request) {
		
		List <SikdangDTO> list = service.list();
		request.setAttribute("list", list);
		
		
		
		return "/sikdang/map_main";
	}
	
	@GetMapping("/sikdang/map_search")
	public String mapSearch(HttpSession session) {
		String id = (String)session.getAttribute("id");
		if(id==null) {
			return "redirect:/member/login";
		} else {
			return "/sikdang/map_search";
		}
	}
		
	@PostMapping("/sikdang/create")
	public String sikdangCreate(SikdangDTO dto, HttpServletRequest request,
			 Model model) {
					
		dto.setSikid(request.getParameter("sikid"));
		dto.setSikname(request.getParameter("sikname"));
		dto.setSikphone(request.getParameter("sikphone"));
		dto.setRoadadd(request.getParameter("roadadd"));
		dto.setJibunadd(request.getParameter("jibunadd"));
		dto.setSikurl(request.getParameter("sikurl"));
		dto.setCox(request.getParameter("cox"));
		dto.setCoy(request.getParameter("coy"));
		
		model.addAttribute("sdto", dto);
		
		if (service.checkId(dto.getSikid()) > 0) {
			
			return "/review/create";
			
		} else {
			
			if (service.create(dto) > 0) {
				return "/review/create";
			} else {
				return "/sikdang/error";
			}
			
		}
		
	}
	
}
