package com.study.sikdang;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.utility.Utility;

@Controller
public class SikdangController {
	
	@Autowired
	@Qualifier("com.study.sikdang.SikdangServiceImpl")
	private SikdangService service;
	

	@GetMapping("/sikdang/map_main")
	public String mapMain(HttpServletRequest request, Model model) {
		
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
	
	@RequestMapping("/admin/sikdang/list")
	public String sikdangList(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
				
		if (col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = service.total(map);
		List <SikdangDTO> adminlist = service.adminlist(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("adminlist", adminlist);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		
		return "/admin/sikdang/list";
	}
	

	@GetMapping("/admin/sikdang/create")
	public String adminCreate(HttpSession session) {
		return "/admin/sikdang/create";
	}
	
	@PostMapping("/admin/sikdang/create")
	public String adminCreate(SikdangDTO dto, HttpServletRequest request,
			 Model model) {
					
		dto.setSikid(request.getParameter("sikid"));
		dto.setSikname(request.getParameter("sikname"));
		dto.setSikphone(request.getParameter("sikphone"));
		dto.setRoadadd(request.getParameter("roadadd"));
		dto.setJibunadd(request.getParameter("jibunadd"));
		dto.setSikurl(request.getParameter("sikurl"));
		dto.setCox(request.getParameter("cox"));
		dto.setCoy(request.getParameter("coy"));
				
		if (service.checkId(dto.getSikid()) > 0) {
			
			return "redirect:/admin/sikdang/list";
			
		} else {
			
			if (service.create(dto) > 0) {
				return "redirect:/admin/sikdang/list";
			} else {
				return "/sikdang/error";
			}
			
		}
		
	}
	
	@GetMapping("/admin/sikdang/read")
	public String reviewRead(String sikid, Model model) {
		
		SikdangDTO dto = service.read(sikid);
		
		model.addAttribute("dto", dto);
		
		return "/admin/sikdang/read";
	}
	
	@GetMapping("/admin/sikdang/delete")
	public String delete(String sikid) {
		return "/admin/sikdang/delete";
	}
	
	@PostMapping("/admin/sikdang/delete")
	public String delete(String sikid, HttpServletRequest request,
			RedirectAttributes redirect) {
		
		if(service.delete(sikid) > 0) {
			redirect.addAttribute("col", request.getParameter("col"));
			redirect.addAttribute("word", request.getParameter("word"));
			redirect.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/admin/sikdang/list";
		} else {
			return "/sikdang/error";
		}
		
	}
	
}
