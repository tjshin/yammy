package com.study.reviewreply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.review.ReviewDTO;
import com.study.utility.Utility;

@Controller
public class ReviewreplyAdminController {
	
	@Autowired
	@Qualifier("com.study.reviewreply.ReviewreplyServiceImpl")
	private ReviewreplyService service;
	
	@RequestMapping("/admin/review/reply/list")
	public String adminReviewreplyList(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if (col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 20;
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = service.admintotal(map);

		List <ReviewreplyDTO> adminlist = service.adminlist(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("adminlist", adminlist);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		//댓글 관련
		
		return "/admin/review/reply/list";
	}
	
	@GetMapping("/admin/review/reply/delete")
	public String adminReviewreplyDelete(int hugireno) {
		return "/admin/review/reply/delete";
	}
	
	@PostMapping("/admin/review/reply/delete")
	public String adminReviewreplyDelete(int hugireno, HttpServletRequest request,
			RedirectAttributes redirect) {
		
		if(service.delete(hugireno) > 0) {
			redirect.addAttribute("col", request.getParameter("col"));
			redirect.addAttribute("word", request.getParameter("word"));
			redirect.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/admin/review/reply/list";
		} else {
			return "/admin/review/reply/error";
		}
		
	}

}
