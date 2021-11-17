package com.study.message;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.utility.Utility;

@Controller
public class MessageContorller {

	@Autowired
	@Qualifier("com.study.message.MessageServiceImpl")
	private MessageService service;
	
	
	
	 //***************************************************************************************************************************************
	//ticketmessage
	@GetMapping("/message/ticketmessage")
	  public String ticketmessage(Model model, HttpSession session ,HttpServletRequest request) {
		
		//id 테스트용도 
				String sendid = (String)session.getAttribute("id"); //추후 세션에 저장된 아이디 값으로 등록 
				int ticketno = Integer.parseInt(request.getParameter("ticketno"));
				
				
				if(sendid == null){
					return "redirect:/member/login";
				} else {
					model.addAttribute("sendid", sendid); //param 으로 view 데이터 전달 
					model.addAttribute("ticketno", ticketno);			
				    return "/message/ticketmessage";
				}
	  }
	
	@PostMapping("/message/ticketmessage")
	public String ticketmessage(MessageDTO dto ,HttpServletRequest request ) {
	    
	int ticketno = Integer.parseInt(request.getParameter("ticketno"));
	
		if(ticketno >0) {
			int meticketno  =ticketno;
			
			
			dto.setMeticketno(meticketno);
			
			
			if (service.create(dto) == 1) {
		    	
			      return "redirect:/message/sendlist";
			    } else {
			      return "/error";
				 }
			
		}else {
			if (service.create(dto) == 1) {
		    	
		      return "redirect:/message/sendlist";
		    } else {
		      return "/error";
		    }
		}
	  }

	 //***************************************************************************************************************************************
	
	
	//에러페이지 
	@GetMapping("/message/error")
	  public String error() {
	 
		
	    return "/message/error";
	  }
	//체크박스 delete
	
	

    //recelist 선택 삭제 (비동기)
    @RequestMapping("/rcheckdelete")
    public String rcheckdelete(HttpServletRequest request) {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.rcheckdelete(Integer.parseInt(ajaxMsg[i]));
        }
        return "/message/recelist";
    }
    
    @RequestMapping("/scheckdelete")
    public String scheckdelete(HttpServletRequest request) {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.scheckdelete(Integer.parseInt(ajaxMsg[i]));
        }
        
        
        return "/message/recelist";
    }
	
	
	//그냥 삭제
	@GetMapping("/message/rdelete")
	  public String rdelete(int messageno , HttpSession session) {
	 
		String sessionid = (String)session.getAttribute("id");
        String recordid = service.read(messageno).getReceid();
        
        if(sessionid==null) {
            return "redirect:/member/login";
        } else if(sessionid.equals(recordid)) {
            //원하는 액션

        	return "/message/rdelete";
        } else {
            return "error path";
        }
	    
	  }
	  
	  @PostMapping("/message/rdelete")
	  public String rdelete(HttpServletRequest request, int messageno) {
	 
	    int cnt = 0;
	   
	   cnt = service.rdelete(messageno);
	   
	   
	    return "redirect:/message/recelist";
	   
	 
	  }
	  
	  @GetMapping("/message/sdelete")
	  public String sdelete(int messageno , HttpSession session) {
	 
		  String sessionid = (String)session.getAttribute("id");
	        String recordid = service.read(messageno).getReceid();
	        
	        if(sessionid==null) {
	            return "redirect:/member/login";
	        } else if(sessionid.equals(recordid)) {
	            //원하는 액션

	        	return "/message/sdelete";
	        } else {
	            return "/message/error";
	        }
	  }
	  
	  
	  @PostMapping("/message/sdelete")
	  public String sdelete(HttpServletRequest request, int messageno) {
	 
	    int cnt = 0;
	   
	   cnt = service.sdelete(messageno);
	   
	    return "redirect:/message/sendlist";
	 
	  }
	
	
	
	
	
	
	//reply
		@GetMapping("/message/reply")
		  public String reply(Model model, HttpSession session) {
			
			//id 테스트용도 ***********************
			String sendid = (String)session.getAttribute("id"); //추후 세션에 저장된 아이디 값으로 등록 
			model.addAttribute("sendid", sendid); //param 으로 view 데이터 전달 
		    return "/message/reply";
		  }
		
		@PostMapping("/message/reply")
		public String reply(MessageDTO dto ) {
		    if (service.create(dto) == 1) {
		    	System.out.println(dto.getMcontents());
		      return "redirect:/message/sendlist";
		    } else {
		      return "/error";
		    }
		 
		  }
	

	//create
	@GetMapping("/message/create")
	  public String create(Model model, HttpSession session) {
		
		//id 테스트용도 ***********************
		String sendid = (String)session.getAttribute("id"); //추후 세션에 저장된 아이디 값으로 등록 
		if(sendid == null){
			return "redirect:/member/login";
		} else {
			model.addAttribute("sendid", sendid); //param 으로 view 데이터 전달 
						
		    return "/message/create";
		}
		
	  }
	
	@PostMapping("/message/create")
	public String create(MessageDTO dto ) {
	    if (service.create(dto) == 1) {
	    	System.out.println(dto.getMcontents());
	      return "redirect:/message/sendlist";
	    } else {
	      return "/error";
	    }
	 
	  }
	
	
	
	
	
	//sendread
	@GetMapping("/message/sendread")
	  public String sendread(int messageno, Model model ,HttpSession session ,HttpServletRequest request ) {
	    
		
		 String sendid = (String)session.getAttribute("id");
		  
		  if(sendid==null) {
		       return "redirect:/member/login/";
		  }else {
		
		//request.setAttribute() 와 비슷하게 컨트롤 -> jsp 로 넘겨준다.	 
		model.addAttribute("ticketno", request.getParameter("ticketno"));
			  
	    MessageDTO dto = service.read(messageno);
	    
	    String content = dto.getMcontents().replaceAll("\r\n", "<br>");
	    
	    dto.setMcontents(content);
	    
	    model.addAttribute("dto",dto);
	    
	    return "/message/sendread";
	  }
	}
	
	
	//reread 
	@GetMapping("/message/receread")
	  public String receread(int messageno,Model model , HttpSession session) {
	    
		 String receid = (String)session.getAttribute("id");
		  
		  if(receid==null) {
		       return "redirect:/member/login/";
		  }else {
	    MessageDTO dto = service.read(messageno);
	    
	    String content = dto.getMcontents().replaceAll("\r\n", "<br>");
	    
	    dto.setMcontents(content);
	    
	    model.addAttribute("dto",dto);
	    
	    return "/message/receread";
	  }
	}
	
	
	
	
	//받은쪽지함리스트
	 @RequestMapping("/message/recelist")
	  public String recelist(HttpServletRequest request, HttpSession session) {
	   
		 //id 테스트용도 ***********************
		  String receid = (String)session.getAttribute("id");
		  
		  if(receid==null) {
		       return "redirect:/member/login/";
		  }else {
		 
		 
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
	    int sno = ((nowPage - 1) * recordPerPage) +1 ;
	    int eno = nowPage * recordPerPage; // 확인
	 
	    Map map = new HashMap(); // DB에 넘겨주는 개념 => 마이바티스 : parameterType="Map" 
	    map.put("col", col);
	    map.put("word", word);
	    map.put("sno", sno);
	    map.put("eno", eno);
	    map.put("receid",receid);
	    String url ="recelist";
	    
	    int total = service.rtotal(map);
	 
	    List<MessageDTO> list = service.recelist(map);
	    
	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word,url);
	    
	    
	    // request에 Model사용 결과 담는다
	    
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);
	    
	    //id 테스트**************
	   
		
	    // view페이지 리턴
	    return "/message/recelist";
		}
	  }
	 
	 
	 //보낸쪽지함리스트
	 
	 @RequestMapping("/message/sendlist")
	  public String sendlist(HttpServletRequest request, HttpSession session) {
	   
		//id 테스트용도 ***********************
		  String sendid = (String)session.getAttribute("id");
		  
		  if(sendid==null) {
		       return "redirect:/member/login/";
		  }else {
		 
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
	    int sno = ((nowPage - 1) * recordPerPage) +1 ;  
	    int eno = nowPage * recordPerPage; // 확인
	 
	    
	    //MAP -> DB에 넘겨주는 개념 => 마이바티스 : parameterType="Map" 
	    Map map = new HashMap();
	    
	    map.put("col", col);
	    map.put("word", word);
	    map.put("sno", sno);
	    map.put("eno", eno);
	    map.put("sendid", sendid);
	    String url ="sendlist";
	    
	    int total = service.stotal(map);
	    
	 
	    List<MessageDTO> list = service.sendlist(map);
	    
	    
	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word ,url);
	    
	    
	    // request에 Model사용 결과 담는다  -> jsp 넘겨주는 거
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);
		
	    // view페이지 리턴
	    return "/message/sendlist";
	  }
	 
	 }	  
}
