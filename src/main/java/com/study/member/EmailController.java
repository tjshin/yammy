package com.study.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.utility.KISA_SHA256;

@Controller
public class EmailController {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	@Qualifier("com.study.member.MemberServiceImpl")
	private MemberService service;

	@RequestMapping("/member/sendEmail")
	public String mailSending(HttpServletRequest request) {
		
		Random random = new Random();
		
		int code = random.nextInt(888888)+111111;
		
		String setfrom = "Project_Yammy";
		String tomail = request.getParameter("email");
		String title = "본인 확인을 위한 메일입니다.";
		String content = "이메일 검증을 위해 코드'"+code+"'을(를) 입력해 주세요.";
		
		System.out.println("email : "+tomail);
		
		int cnt = service.duplicatedEmail(tomail);
		
		if(cnt > 0) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message);
			
			request.setAttribute("code", code);
			request.setAttribute("email", tomail);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "/member/checkEmail";
	}else {
		return "/member/findError";
		}
	}
	
	
	@GetMapping("/member/modify")
	public String modify(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		
		MemberDTO dto = service.readByEmail(email);
		
		model.addAttribute("dto", dto);
		return "/member/modify";
	}
	
	@PostMapping("/member/modify")
	public String modified(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
//		System.out.println("id : "+id);
//		System.out.println("password : "+password);
		
		//암호화 시작
		byte[] bytes = password.getBytes();
		byte[] pszDigest = new byte[32];
		
		KISA_SHA256.SHA256_Encrpyt(bytes, bytes.length, pszDigest);
		StringBuffer encrypted = new StringBuffer();
		for (int i =0; i <pszDigest.length; i++) {
			encrypted.append(String.format("%02x", pszDigest[i]));
		}
		password = encrypted.toString();
		//암호화 끝
		
		Map<String, String> map = new HashMap();
		map.put("id", id);
		map.put("password", password);
		
		service.updatePassword(map);
		
		return "redirect:/member/login";
	}
}
