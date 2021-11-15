package com.study.notice;

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

import com.study.utility.Utility;

@Controller
public class NoticeController {

	@Autowired
	@Qualifier("com.study.notice.NoticeServiceImpl")
	private NoticeService service;
	
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		
		int sno = ((nowPage-1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
	    map.put("word", word);
	    map.put("sno", sno);
	    map.put("eno", eno);
		
	    int total = service.total(map);
//	    System.out.println("total : " + total);
	   
		 
	    List<NoticeDTO> list = service.list(map);
	    
//	    System.out.println("list size : "+list.size());
	 
	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
	   System.out.println("paging : "+paging);
	    
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);
		
		return "/notice/list";
	}
	
	@GetMapping("/notice/read")
	public String read(int noticeno, Model model) {
		
		service.upCnt(noticeno);
		
		NoticeDTO dto = service.read(noticeno);
		
		String ncontent = dto.getNcontents().replaceAll("\r\n", "<br>");
		
		dto.setNcontents(ncontent);
		model.addAttribute("dto", dto);
		
		return "/notice/read";
	}
	
	@GetMapping("/admin/notice/create")
	public String create() {
		return "/notice/create";
	}
	
	@PostMapping("/admin/notice/create")
	public String create(NoticeDTO dto) {
		if(service.create(dto) == 1) {
			return "redirect:/notice/list";
		}else {
			return "/error";
		}
	}
	
	@GetMapping("/admin/notice/update")
	public String update(int noticeno, Model model) {
		model.addAttribute("dto", service.read(noticeno));
		return "/notice/update";
	}
	
	@PostMapping("/admin/notice/update")
	public String update(NoticeDTO dto) {
		
		   service.update(dto);

		      return "redirect:/notice/list";
	}

	
	@GetMapping("/admin/notice/delete")
	public String delete() {
		return "/notice/delete";
	}
	
	@PostMapping("/admin/notice/delete")
	public String delete(int noticeno) {

		service.delete(noticeno);
		
		      return "redirect:/notice/list";	    
	}
	
}
