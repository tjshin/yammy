package com.study.bbs;

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

import com.study.bbslike.BbslikeService;
import com.study.notice.NoticeDTO;
import com.study.reply.ReplyDTO;
import com.study.reply.ReplyService;
import com.study.reply.ReplyServiceImpl;
import com.study.review.ReviewDTO;
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
	public String create(HttpSession session) {

		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login";
		} else {
			return "/bbs/create";

		}

	}

	@PostMapping("/bbs/create")
	public String create(BbsDTO dto, HttpServletRequest request, HttpSession session) {
		String bbscate = request.getParameter("bbscate");
		dto.setBbscate(bbscate);
		String id = (String) session.getAttribute("id");
		dto.setId(id);
		if (service.create(dto) == 1) {
			System.out.println(dto.getBtitle());
			System.out.println(dto.getBcontents());
			String str = "redirect:/bbs/list?bbscate=";
			str += bbscate;

			return str;
		} else {
			return "/bbs/error";
		}
	}

	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String bbscate = Utility.checkNull(request.getParameter("bbscate"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage; // 확인

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbscate", bbscate);
		String url = "list";

		int total = service.total(map);

		List<BbsDTO> list = service.list(map);
		// System.out.print("값:"+list.get(0));
		String paging = Utility.paging2(total, nowPage, recordPerPage, col, word, bbscate);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("bbscate", bbscate);
		request.setAttribute("paging", paging);
		request.setAttribute("reservice", reservice);

		return "/bbs/list";
	}

	// read
	@RequestMapping("/bbs/read")
	public String read(int bbsno, Model model, HttpServletRequest request) {

		service.upbview(bbsno);

		BbsDTO dto = service.read(bbsno);

		String content = dto.getBcontents().replaceAll("\r\n", "<br>");

		dto.setBcontents(content);

		model.addAttribute("dto", dto);
		// 댓글 시작
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
		request.setAttribute("reservice", reservice);
		// 댓글 끝

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
	public String delete(int bbsno, BbsDTO dto, HttpServletRequest request, HttpSession session,
			RedirectAttributes redirect) {
		String bbscate = request.getParameter("bbscate");
		dto.setBbscate(bbscate);
		Map map = new HashMap();
		map.put("bbsno", bbsno);

		String str = "redirect:/bbs/list?bbscate=";
		str += bbscate;

		if (service.delete(bbsno) > 0) {
			if (request.getParameter("mtest") == "") {
				redirect.addAttribute("col", request.getParameter("col"));
				redirect.addAttribute("word", request.getParameter("word"));
				redirect.addAttribute("nowPage", request.getParameter("nowPage"));

				return str;
			} else {
				return "redirect:/member/mypage";
			}
		} else {
			return "/review/error";
		}
	}

	// update
	@GetMapping("/bbs/update")
	public String update(int bbsno, Model model, HttpSession session) {

		BbsDTO dto = service.read(bbsno);

		String sessionid = (String) session.getAttribute("id");
		String recordId = dto.getId();

		if (sessionid.equals(recordId)) {
			model.addAttribute("dto", dto);
			return "/bbs/update";
		} else {
			return "/error";
		}
	}

	@PostMapping("/bbs/update")
	public String update(BbsDTO dto, HttpServletRequest request, HttpSession session, RedirectAttributes redirect)
			throws IOException {
		String bbscate = request.getParameter("bbscate");
		dto.setBbscate(bbscate);

		if (service.update(dto) > 0) {
			if (request.getParameter("mtest") == "") {
				redirect.addAttribute("col", request.getParameter("col"));
				redirect.addAttribute("word", request.getParameter("word"));
				redirect.addAttribute("nowPage", request.getParameter("nowPage"));
				String str = "redirect:/bbs/list?bbscate=";
				str += bbscate;

				return str;
			} else {
				return "redirect:/member/mypage";
			}
		} else {

			return "/bbs/error";
		}
	}

	@RequestMapping("/bbs/bestlist")
	public String bestlist(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String bbscate = Utility.checkNull(request.getParameter("bbscate"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage; // 확인

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbscate", bbscate);
		String url = "bestlist";

		int total = service.besttotal(map);

		List<BbsDTO> list = service.bestlist(map);
		// System.out.print("값:"+list.get(0));
		String paging = Utility.paging2(total, nowPage, recordPerPage, col, word, bbscate);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("bbscate", bbscate);
		request.setAttribute("paging", paging);
		request.setAttribute("reservice", reservice);

		return "/bbs/bestlist";
	}

}
