package com.study.ticket;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.utility.Utility;

@Controller
public class TicketController {

	@Autowired
	@Qualifier("com.study.ticket.TicketServiceImpl")
	private TicketService service;
	
	
	
	@GetMapping("/ticket/detail")
	public String detail(int ticketno, Model model) {
	    
	   model.addAttribute("dto",service.detail(ticketno));
	  
	   return "/ticket/detail";
	}

	
	@RequestMapping("/ticket/list")
	public String list(HttpServletRequest request , HttpSession session) {
		
		 String id = (String)session.getAttribute("id");
		  
		  if(id==null) {
		       return "redirect:/member/login/";
		  }else {
		
		
		
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 8;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = service.total(map);

		List<TicketDTO> list = service.list(map);
		
		System.out.println("list:"+list);
		System.out.println("total:"+total);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/ticket/list";

	 }
	}
	
}
