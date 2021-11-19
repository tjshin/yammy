package com.study.review;

import java.io.IOException;
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

import com.study.reviewreply.ReviewreplyService;
import com.study.sikdang.SikdangDTO;
import com.study.utility.Utility;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("com.study.review.ReviewServiceImpl")
	private ReviewService service;
	
	@Autowired
	@Qualifier("com.study.reviewreply.ReviewreplyServiceImpl")
	private ReviewreplyService rservice;
	
	@RequestMapping("/review/list")
	public String reviewList(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if (col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = service.total(map);

		List <ReviewDTO> list = service.list(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		
		request.setAttribute("rservice", rservice);
		
		return "/review/list";
	}
	
	@GetMapping("/review/read")
	public String reviewRead(int hugino, Model model, HttpServletRequest request) {
		
		ReviewDTO dto = service.read(hugino);
		String hcontents = dto.getHcontents().replaceAll("\r\n", "<br>");
		dto.setHcontents(hcontents);
		
		model.addAttribute("dto", dto);
		
		int nPage = 1;
        if (request.getParameter("nPage") != null) {
                nPage = Integer.parseInt(request.getParameter("nPage"));
        }
        int recordPerPage = 5;

        int sno = ((nPage - 1) * recordPerPage) + 1;
        int eno = nPage * recordPerPage;

        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("nPage", nPage);

        model.addAllAttributes(map);
		
		return "/review/read";
	}
	

	@PostMapping("/review/create")
	public String reviewCreate(ReviewDTO dto, HttpServletRequest request, HttpSession session) {
		
		String sikid = request.getParameter("sikid");		
		String id = (String)session.getAttribute("id");
		dto.setSikid(sikid);
		dto.setId(id);
				
		if (service.create(dto) > 0) {
			service.reviewcntUp(sikid);
			return "redirect:/review/list";			
		} else {
			return "/review/error";
		}
	}
	
	@GetMapping("/review/create")
	public String reviewCreate(HttpServletRequest request, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		String sikid = request.getParameter("sikid");
		
		if(id==null) {
			return "redirect:/member/login";
		} else if (sikid==null){
			return "redirect:/sikdang/map_search";		
		} else {
			return "/review/create";
		}
	}
	
	@GetMapping("/review/update")
	public String update(int hugino, Model model, HttpSession session) {
		
		ReviewDTO dto = service.read(hugino);
		SikdangDTO sdto = service.detail(dto.getSikid());
		
		String sessionid = (String)session.getAttribute("id");
		String recordid = dto.getId();
		
		if(sessionid==null) {
			return "redirect:/member/login";
		} else if(sessionid.equals(recordid)) {
			model.addAttribute("dto", dto);
			model.addAttribute("sdto", sdto);
			
			return "/review/update";		
		} else {			
			return "/review/error";	
		}
	}
	
	@PostMapping("/review/update")
	public String update(ReviewDTO dto, HttpServletRequest request,
						RedirectAttributes redirect) throws IOException {
		if (service.update(dto) > 0) {
			redirect.addAttribute("col", request.getParameter("col"));
			redirect.addAttribute("word", request.getParameter("word"));
			redirect.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/review/list";
		} else {
			return "/review/error";
		}
	}
	
	@GetMapping("/review/delete")
	public String delete(int hugino, HttpSession session) {
		
		String sessionid = (String)session.getAttribute("id");
		String recordid = service.read(hugino).getId();
		
		if(sessionid==null) {
			return "redirect:/member/login";
		} else if (sessionid.equals(recordid)) {
			return "/review/delete";
		} else {
			return "/review/error";
		}
	}
	
	@PostMapping("/review/delete")
	public String delete (int hugino, HttpServletRequest request,
			RedirectAttributes redirect) {
		
		String sikid = service.read(hugino).getSikid();
				
		if(service.delete(hugino) > 0) {
			service.reviewcntDn(sikid);
			redirect.addAttribute("col", request.getParameter("col"));
			redirect.addAttribute("word", request.getParameter("word"));
			redirect.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/review/list";
		} else {
			return "/review/error";
		}
	}
	
	@GetMapping("/review/error")
	public String reviewError() {
		return "/review/error";
	}

}
