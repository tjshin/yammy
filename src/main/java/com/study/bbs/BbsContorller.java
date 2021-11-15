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

import com.study.bbs.BbsDTO;
import com.study.utility.Utility;

@Controller
public class BbsContorller {

	@Autowired
	@Qualifier("com.study.bbs.BbsServiceImpl")
	private BbsService service;

	// create
	@GetMapping("/bbs/create")
	public String create(Model model, HttpSession session) {

		// id 테스트용도 ***********************
		String id = (String)session.getAttribute("id"); // 추후 세션에 저장된 아이디 값으로 등록
		model.addAttribute("id", id);

		return "/bbs/create";
	}

	@PostMapping("/bbs/create")
	public String create(BbsDTO dto) {
		if (service.create(dto) == 1) {
			System.out.println(dto.getBtitle());
			System.out.println(dto.getBcontents());

			return "redirect:/bbs/list";
		} else {
			return "/error";
		}
	}

	@RequestMapping("/bbs/list")
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

	// reread
	@GetMapping("/bbs/read")
	public String read(int bbsno, Model model) {

		service.upbview(bbsno);

		BbsDTO dto = service.read(bbsno);

		String content = dto.getBcontents().replaceAll("\r\n", "<br>");

		dto.setBcontents(content);

		model.addAttribute("dto", dto);

		return "/bbs/read";
	}

	@GetMapping("/bbs/delete")
	public String delete() {

		return "/bbs/delete";
	}

	@PostMapping("/bbs/delete")
	public String delete(HttpServletRequest request, int bbsno) {

		Map map = new HashMap();
		map.put("bbsno", bbsno);

		int cnt = 0;

		cnt = service.delete(bbsno);

		return "redirect:./list";
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

	
	

}
