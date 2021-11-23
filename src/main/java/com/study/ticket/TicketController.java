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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.study.message.MessageDTO;
import com.study.utility.Utility;

@Controller
public class TicketController {

	
	//test
	@Autowired
	@Qualifier("com.study.ticket.TicketServiceImpl")
	private TicketService service;
	
	//관리자 삭제
	@GetMapping("/admin/ticket/delete")
	  public String delete() {
	 
	 
	    return "/ticket/delete";
	  }
	
	 @PostMapping("/admin/ticket/delete")
	  public String delete(int ticketno) {
	 
	    int cnt = 0;
	   
	   cnt = service.delete(ticketno);
	   
	   
	    return "redirect:/ticket/list"; 
	   
	 
	  }
	
	
	
	//사용자 삭제
	@GetMapping("/ticket/delete")
	  public String delete(int ticketno , HttpSession session) {
	 
		String id = (String)session.getAttribute("id");
		TicketDTO dto = service.detail(ticketno);
      
      if(id==null) {
          return "redirect:/member/login";
      } else if(id.equals(dto.getId())) {
    	//세션에 로그인한 아이디와 게시물(id) 비교  아이디검사

      	return "/ticket/delete";
      } else {
          return "/message/error";
      }
	    
	  }
	  
	  @PostMapping("/ticket/delete")
	  public String delete(HttpServletRequest request, int ticketno) {
	 
	    int cnt = 0;
	   
	   cnt = service.delete(ticketno);
	   
	   
	   String grade = (String)request.getSession().getAttribute("grade");
	   System.out.println("1111grade:"+grade);
	  
	   if(grade.equals("A")) {
		    return "redirect:/ticket/list"; 
	   }else {
		   return "redirect:/member/mypage";
	   }
	   
	 
	  }
	
	
	
	@PostMapping("/ticket/update")
	public String update(TicketDTO dto) {
		int cnt = service.update(dto);
		System.out.print("dto.ticketeno:"+dto.getTicketno());
		
		if (cnt == 1) {
			return "redirect:/member/mypage";
		} else {
			return "/message/error";
		}
	}

	@GetMapping("/ticket/update/{ticketno}")
	public String update(@PathVariable("ticketno") int ticketno , HttpSession session ,Model model) {

		
		String id = (String)session.getAttribute("id"); 
		if(id == null){
			return "redirect:/member/login";
		} else {
		
		TicketDTO dto = service.detail(ticketno);
		
	
		
		if(dto.getId().equals(id)) {//아이디 검사
			return "/ticket/update";
		}else
		model.addAttribute("dto", dto);
		return "/message/error";
		
		}
	}
	
	
	
	
	
	
	@PostMapping("/ticket/updateFile")
	public String updateFile(MultipartFile filenameMF, String oldfile, int ticketno, HttpServletRequest request)
			{
		//String basePath = new ClassPathResource("/static/pstorage").getFile().getAbsolutePath();
		String basePath = Ticket.getUploadDir();
		if (oldfile != null && !oldfile.equals("default1.jpg")) {// 원본파일 삭제 default1 기본임 
			Utility.deleteFile(basePath, oldfile);
		}

		// pstorage에 변경 파일 저장
		Map map = new HashMap();
		map.put("ticketno", ticketno);
		map.put("filename", Utility.saveFileSpring(filenameMF, basePath));

		// 디비에 파일명 변경
		int cnt = service.updateFile(map);

		if (cnt == 1) {
			return "redirect:/member/mypage";
		} else {
			return "./error";
		}
	}

	@GetMapping("/ticket/updateFile/{ticketno}/{oldfile}")
	public String updateFileForm(@PathVariable("ticketno") int ticketno, @PathVariable("oldfile") String oldfile,
			Model model , HttpSession session) {
		
		String id = (String)session.getAttribute("id");  //추후 세션에 저장된 아이디 값으로 등록 
		if(id == null){
			return "redirect:/member/login";
		} else {
			
			

			TicketDTO dto = service.detail(ticketno);

			if(dto.getId().equals(id) ) { //아이디 검사
			model.addAttribute("id", id); //param 으로 view(jsp) 데이터 전달 
			model.addAttribute("ticketno", ticketno);
			model.addAttribute("oldfile", oldfile);

			return "/ticket/updateFile";
			}else {
				return "/message/error";
			}
			
		}
	}
	
	
	
	
	
	
	@GetMapping("/ticket/create")
	  public String create(Model model, HttpSession session) {
		
		//id �뀒�뒪�듃�슜�룄 ***********************
		String id = (String)session.getAttribute("id"); 
		if(id == null){
			return "redirect:/member/login";
		} else {
			model.addAttribute("id", id); //param 으로 view 데이터 전달 
						
		    return "/ticket/create";
		}
		
	  }
	
	@PostMapping("/ticket/create")
	public String create(TicketDTO dto, HttpServletRequest request) {
		
		
		String upDir =Ticket.getUploadDir();
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
		
		//System.out.println("updir: " +upDir); (o)
		//System.out.println("fname: " +fname); (o)
		
		int size = (int) dto.getFilenameMF().getSize();
		
		//System.out.println("size: " +size); (o)
		
		if (size > 0) {
			dto.setFilename(fname);
		} else {
			dto.setFilename("default.jpg");
		}

		if (service.create(dto) > 0) {
			return "redirect:/ticket/list";
		} else {
			return "error";
		}
	 
	  }
	
	@GetMapping("/ticket/detail")
	public String detail(int ticketno, Model model) {
	    
	   model.addAttribute("dto",service.detail(ticketno));
	  
	  System.out.println("service.detail(ticketno) = "+service.detail(ticketno));
	  
	   return "/ticket/detail";
	}

	
	@RequestMapping("/ticket/list")
	public String list(HttpServletRequest request , HttpSession session) {
		
		 String id = (String)session.getAttribute("id");
		  
		  if(id==null) {
		       return "redirect:/member/login/";
		  }else {
		
		
		
			// 검색관련-----------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련----------------------
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
