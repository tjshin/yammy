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
	
	
	
	
	@GetMapping("/ticket/delete")
	  public String delete(int ticketno , HttpSession session) {
	 
		String id = (String)session.getAttribute("id");
		TicketDTO dto = service.detail(ticketno);
      
      if(id==null) {
          return "redirect:/member/login";
      } else if(id.equals(dto.getId())) {
          //�썝�븯�뒗 �븸�뀡

      	return "/ticket/delete";
      } else {
          return "/message/error";
      }
	    
	  }
	  
	  @PostMapping("/ticket/delete")
	  public String delete(HttpServletRequest request, int ticketno) {
	 
	    int cnt = 0;
	   
	   cnt = service.delete(ticketno);
	   
	   
	    return "redirect:/ticket/list"; // 留덉씠�럹�씠吏� 寃쎈줈 諛붽씀湲� 
	   
	 
	  }
	
	
	
	@PostMapping("/ticket/update")
	public String update(TicketDTO dto) {
		int cnt = service.update(dto);
		System.out.print("dto:"+dto);
		
		if (cnt == 1) {
			return "redirect:/ticket/list";
		} else {
			return "/message/error";
		}
	}

	@GetMapping("/ticket/update/{ticketno}")
	public String update(@PathVariable("ticketno") int ticketno , HttpSession session ,Model model) {

		
		String id = (String)session.getAttribute("id"); //異뷀썑 �꽭�뀡�뿉 ���옣�맂 �븘�씠�뵒 媛믪쑝濡� �벑濡� 
		if(id == null){
			return "redirect:/member/login";
		} else {
		
		TicketDTO dto = service.detail(ticketno);
		
		if(dto.getId().equals(id) ) { //�븘�씠�뵒 寃��궗
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
		if (oldfile != null && !oldfile.equals("default1.jpg")) { // �썝蹂명뙆�씪 �궘�젣 default1 湲곕낯�엫 
			Utility.deleteFile(basePath, oldfile);
		}

		// pstorage�뿉 蹂�寃� �뙆�씪 ���옣
		Map map = new HashMap();
		map.put("ticketno", ticketno);
		map.put("filename", Utility.saveFileSpring(filenameMF, basePath));

		// �뵒鍮꾩뿉 �뙆�씪紐� 蹂�寃�
		int cnt = service.updateFile(map);

		if (cnt == 1) {
			return "redirect:/ticket/list";
		} else {
			return "./error";
		}
	}

	@GetMapping("/ticket/updateFile/{ticketno}/{oldfile}")
	public String updateFileForm(@PathVariable("ticketno") int ticketno, @PathVariable("oldfile") String oldfile,
			Model model , HttpSession session) {
		
		String id = (String)session.getAttribute("id"); //異뷀썑 �꽭�뀡�뿉 ���옣�맂 �븘�씠�뵒 媛믪쑝濡� �벑濡� 
		if(id == null){
			return "redirect:/member/login";
		} else {
			
			

			TicketDTO dto = service.detail(ticketno);

			if(dto.getId().equals(id) ) { //�븘�씠�뵒 寃��궗
			model.addAttribute("id", id); //param �쑝濡� view �뜲�씠�꽣 �쟾�떖 
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
		String id = (String)session.getAttribute("id"); //異뷀썑 �꽭�뀡�뿉 ���옣�맂 �븘�씠�뵒 媛믪쑝濡� �벑濡� 
		if(id == null){
			return "redirect:/member/login";
		} else {
			model.addAttribute("id", id); //param �쑝濡� view �뜲�씠�꽣 �쟾�떖 
						
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
		
		
		
		// 寃��깋愿��젴------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// �럹�씠吏�愿��젴-----------------------
		int nowPage = 1;// �쁽�옱 蹂닿퀬�엳�뒗 �럹�씠吏�
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 8;// �븳�럹�씠吏��떦 蹂댁뿬以� �젅肄붾뱶媛��닔

		// DB�뿉�꽌 媛��졇�삱 �닚踰�-----------------
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

		// request�뿉 Model�궗�슜 寃곌낵 �떞�뒗�떎
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/ticket/list";

	 }
	}
	
	
	
}
