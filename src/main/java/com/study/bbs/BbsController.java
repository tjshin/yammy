package com.study.bbs;

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

import com.study.bbslike.BbslikeService;
import com.study.reply.ReplyDTO;
import com.study.reply.ReplyService;
import com.study.reply.ReplyServiceImpl;
import com.study.utility.Utility;

@Controller
public class BbsController {
	@Autowired
	@Qualifier("com.study.bbs.BbsServiceImpl")
	private BbsService service;
	
	@Autowired
	@Qualifier("com.study.reply.ReplyServiceImpl")
	private ReplyService reservice;
	// create
	@GetMapping("/bbs/create")
	public String create(Model model, HttpSession session) {

		

		return "/bbs/list/{bbscate}";
	}

	@PostMapping("/bbs/create")
	public String create(BbsDTO dto) {
		if (service.create(dto) == 1) {
			System.out.println(dto.getBtitle());
			System.out.println(dto.getBcontents());

			return "/bbs/list/{bbscate}";
		} else {
			return "/error";
		}
	}


	@RequestMapping("/bbs/list/{bbscate}")
	public String list(HttpServletRequest request) {

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
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage; // 확인

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		String url = "list";

		int total = service.total(map);

		List<BbsDTO> list = service.list(map);
		// System.out.print("값:"+list.get(0));
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/bbs/list";
	}

	// read
	@RequestMapping("/bbs/read")
   public String read(int bbsno, Model model ,HttpServletRequest request) {	
		
		service.upbview(bbsno);

		BbslikeService.uplike(bbsno);

		BbsDTO dto = service.read(bbsno);

		String content = dto.getBcontents().replaceAll("\r\n", "<br>");

		dto.setBcontents(content);

		model.addAttribute("dto", dto);
	
		
		//댓글 
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
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage; // 확인

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		String url = "rlist";

		int total = reservice.retotal(map);
		List<ReplyDTO> list = reservice.rlist(map);

		System.out.print("값:" + list.get(0));

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/bbs/read";
	
	
	
	
	
	
	}

		
	
//del	
	@GetMapping("/bbs/delete")
	public String delete(int bbsno, HttpSession session) {

		String sessionid = (String) session.getAttribute("id");
		String recordid = service.read(bbsno).getId();

		if (sessionid == null) {
			return "redirect:/member/login";
		} else if (sessionid.equals(recordid)) {

			return "/bbs/delete";
		} else {
			return "/bbs/error";
		}

	}

	@PostMapping("/bbs/delete")
	public String delete(HttpServletRequest requests, int bbsno) {

		Map map = new HashMap();
		map.put("bbsno", bbsno);

		int cnt = 0;

		cnt = service.delete(bbsno);

		return "redirect:./list";
	}

	// update
	@GetMapping("/bbs/update")
	public String update(int bbsno, HttpSession session) {
		String id = (String) session.getAttribute("id");
		BbsDTO dto = service.read(bbsno);
		System.out.print("값:" + id);

		if (id == null) {
			return "redirect:/member/login";

		} else if (id.equals(dto.getId())) {

			return "/bbs/update";
		} else {
			return "/bbs/error";
		}

	}

	@PostMapping("/bbs/update")
	public String update(BbsDTO dto) {

		service.update(dto);

		return "redirect:/bbs/list";
	}

	@RequestMapping("/bbs/bestlist")
	public String bestlist(HttpServletRequest request) {

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
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage; // 확인

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		String url = "bestlist";

		int total = service.total(map);

		List<BbsDTO> list = service.bestlist(map);
		// System.out.print("값:"+list.get(0));
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/bbs/bestlist";
	}

	@GetMapping("/bbs/reed")
	public String home() {

		return "/bbs/reed";
	}



	
	
	
}