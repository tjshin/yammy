package com.study.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.sikdang.SikdangDTO;
import com.study.utility.Utility;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("com.study.review.ReviewServiceImpl")
	private ReviewService service;
	
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
		
		return "/review/list";
	}
	
	@GetMapping("/review/read")
	public String reviewRead(int hugino, Model model) {
		
		ReviewDTO dto = service.read(hugino);
		String hcontents = dto.getHcontents().replaceAll("\r\n", "<br>");
		dto.setHcontents(hcontents);
		
		model.addAttribute("dto", dto);
		
		return "/review/read";
	}
	

	@PostMapping("/review/create")
	public String reviewCreate(ReviewDTO dto, HttpServletRequest request) {
		
		dto.setSikid(request.getParameter("sikid"));
		
		String id = "tester";
		dto.setId(id);
		
		if (service.create(dto) > 0) {
			return "redirect:/review/list";
		} else {
			return "/review/error";
		}
	}
	
	@GetMapping("/review/create")
	public String reviewCreate() {
		return "/review/create";
	}
	
	@GetMapping("/review/update")
	public String update(int hugino, Model model) {
		
		ReviewDTO dto = service.read(hugino);
		SikdangDTO sdto = service.detail(dto.getSikid());
		
		model.addAttribute("dto", dto);
		model.addAttribute("sdto", sdto);
		
		return "/review/update";
		
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
	public String delete(int hugino) {
		return "/review/delete";
	}
	
	@PostMapping("/review/delete")
	public String delete (int hugino, HttpServletRequest request,
			RedirectAttributes redirect) {
		
		if(service.delete(hugino) > 0) {
		
			redirect.addAttribute("col", request.getParameter("col"));
			redirect.addAttribute("word", request.getParameter("word"));
			redirect.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/review/list";
		} else {
			return "/review/error";
		}
	}


}
