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
import com.study.sikdang.SikdangService;
import com.study.utility.Distance;
import com.study.utility.Utility;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("com.study.review.ReviewServiceImpl")
	private ReviewService service;
	
	@Autowired
	@Qualifier("com.study.sikdang.SikdangServiceImpl")
	private SikdangService sikdangservice;
	
	@Autowired
	@Qualifier("com.study.reviewreply.ReviewreplyServiceImpl")
	private ReviewreplyService reviewrservice;
	
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
		//댓글 관련
		request.setAttribute("reviewrservice", reviewrservice);
		
		return "/review/list";
	}
	
	@GetMapping("/review/read")
	public String reviewRead(int hugino, Model model, HttpServletRequest request) {
		
		ReviewDTO dto = service.read(hugino);
		String hcontents = dto.getHcontents().replaceAll("\r\n", "<br>");
		dto.setHcontents(hcontents);
		
		model.addAttribute("dto", dto);
		//댓글 시작
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
        request.setAttribute("reviewrservice", reviewrservice);
		//댓글 끝
		return "/review/read";
	}
	

	@PostMapping("/review/create")
	public String reviewCreate(ReviewDTO dto, HttpServletRequest request, HttpSession session) {
		
		String sikid = request.getParameter("sikid");		
		String id = (String)session.getAttribute("id");
		dto.setSikid(sikid);
		dto.setId(id);
		
		//거리 계산
		SikdangDTO sdto = sikdangservice.read(sikid);
		String cox = sdto.getCox();
		String coy = sdto.getCoy();
		double dcox = Double.parseDouble(cox);
		double dcoy = Double.parseDouble(coy);
		double stax = 0;
		double stay = 0;		
		int stadium = dto.getStadium();
		sdto.setNearsta(stadium);
		
		switch(stadium) {
			case 1: stay = 37.5121513808403;
					stax = 127.071909507224;					
					break;//잠실
			case 2: stay = 37.4982338495579;
					stax = 126.867104761712;
					break;//고척
			case 3: stay = 37.436998685442084;
					stax = 126.69327612453377;
					break;//인천
			case 4: stay = 37.2997302532973;
					stax = 127.009772045935;
					break;//수원
			case 5: stay = 36.3170804578898;
					stax = 127.429163729933;
					break;//대전
			case 6: stay = 35.16820922209541;
					stax = 126.88911206152956;
					break;//광주
			case 7: stay = 35.8410595632468;
					stax = 128.681659448344;
					break;//대구
			case 8: stay = 35.22242918856418;
					stax = 128.58209037232203;
					break;//창원
			case 9: stay = 35.1940192576625;
					stax = 129.061550650471;
					break;//사직
		}
		
		double stadist = Distance.distance(stay, stax, dcoy, dcox);
		sdto.setDistance(stadist);		
				
		if (service.create(dto) > 0) {
			sikdangservice.distance(sdto);
			sikdangservice.nearsta(sdto);
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
			if(request.getParameter("mtest") == "") {
				redirect.addAttribute("col", request.getParameter("col"));
				redirect.addAttribute("word", request.getParameter("word"));
				redirect.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/review/list";
			} else {			
				return "redirect:/member/mypage";
			}
		} else {
			return "/review/error";
		}
	}
	
	@GetMapping("/review/delete")
	public String delete(int hugino, HttpSession session, HttpServletRequest request) {
		
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
						
		if(service.delete(hugino) > 0) {
			if(request.getParameter("mtest") == "") {
				redirect.addAttribute("col", request.getParameter("col"));
				redirect.addAttribute("word", request.getParameter("word"));
				redirect.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/review/list";
			} else {
				return "redirect:/member/mypage";
			}
		} else {
			return "/review/error";
		}
	}
	
	@GetMapping("/review/error")
	public String reviewError() {
		return "/review/error";
	}

}
