package com.study.reviewreply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
