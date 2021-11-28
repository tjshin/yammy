 package com.study.member;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.utility.KISA_SHA256;
import com.study.utility.Utility;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("com.study.member.MemberServiceImpl")
	private MemberService service;

	@GetMapping("/")
	public String home() {

		return "/home";
	}

	@GetMapping("/adminerror")
	public String error() {
		return "/adminerror";
	}


	@GetMapping("/member/find")
	public String find() {
		return "/member/find";
	}

	@RequestMapping("/member/login/google/callback")
	public String loginGoogleCallback(HttpServletRequest request, HttpSession session) {
		String id = (String) request.getParameter("id");
		String mname = (String) request.getParameter("mname");
		String email = (String) request.getParameter("email");

		UUID randomPassword = UUID.randomUUID();
		String password = randomPassword.toString();

		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setMname(mname);
		dto.setNick(mname);
		dto.setPassword(password);
		dto.setEmail(email);

		int cnt = service.duplicatedEmail(email);

		if (cnt == 0) {

			service.googleCreate(dto);

			String grade = service.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("mname", mname);
			session.setAttribute("nick", dto.getNick());
			session.setAttribute("grade", grade);

		} else {
			String grade = service.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);

		}

		return "redirect:/";
	}

	@GetMapping("/member/login/kakao/callback")
	public String loginKakaoCallback(String code, HttpServletRequest request, HttpSession session) {

		MemberDTO dto = Kakao.kakaoLogin(code);

		int cnt = service.duplicatedEmail(dto.getEmail());

		if (cnt == 0) {
			service.kakaoCreate(dto);
			String grade = service.getGrade(dto.getId());
			session.setAttribute("id", dto.getId());
			session.setAttribute("mname", dto.getMname());
			session.setAttribute("grade", grade);
			session.setAttribute("token", dto.getToken());
		} else {
			String grade = service.getGrade(dto.getId());
			session.setAttribute("id", dto.getId());
			session.setAttribute("grade", grade);
			session.setAttribute("nick", dto.getNick());
			session.setAttribute("token", dto.getToken());
		}

		return "redirect:/";
	}

	@RequestMapping("/member/logout/kakao/callback")
	public String logoutKakaoCallback(HttpSession session) {

		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		String token = (String) session.getAttribute("token");
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			conn.setRequestProperty("Authorization", "Bearer " + token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			if (responseCode == 400)
				throw new RuntimeException("카카오 로그아웃 도중 오류 발생");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String br_line = "";
			String result = "";
			while ((br_line = br.readLine()) != null) {
				result += br_line;
			}
			System.out.println("결과");
			System.out.println(result);
		} catch (IOException e) {

		}

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/member/agree")
	public String agree() {
		return "/member/agree";
	}

	@PostMapping("/member/createForm")
	public String create() {

		return "/member/create";
	}
	
	@GetMapping("/member/createForm")
	public String create2() {

		return "/member/create";
	}

	@PostMapping("/member/create")
	public String create(MemberDTO dto) throws IOException {
		

		//암호화 시작
		byte[] bytes = dto.getPassword().getBytes();
		byte[] pszDigest = new byte[32];
		
		KISA_SHA256.SHA256_Encrpyt(bytes, bytes.length, pszDigest);
		StringBuffer encrypted = new StringBuffer();
		for (int i =0; i <pszDigest.length; i++) {
			encrypted.append(String.format("%02x", pszDigest[i]));
		}
		dto.setPassword(encrypted.toString());
		//암호화 끝
		

		String upDir = Member.getUploadDir();

		String filename = Utility.saveFileSpring(dto.getFnameMF(), upDir);

		int size = (int) dto.getFnameMF().getSize();

		if (size > 0) {
			dto.setFilename(filename);

		} else {
			dto.setFilename("member.jpg");
		}
		
		if (service.create(dto) > 0) {
			return "redirect:/";
		}else{
			return "/member/createError";
		}
	}

	@GetMapping(value = "/member/idcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> idcheck(String id) {

		int cnt = service.duplicatedId(id);

		Map<String, String> map = new HashMap<String, String>();
		if (cnt > 0) {
			map.put("str", "->'" + id + "' 은(는) 중복되어서 사용할 수 없습니다.");
		} else {
			map.put("str", "->'" + id + "' 은(는) 사용 가능한 ID입니다.");
		}
		return map;
	}

	@GetMapping(value = "/member/emailcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> emailcheck(String email) {

		int cnt = service.duplicatedEmail(email);

		Map<String, String> map = new HashMap<String, String>();

		if (cnt > 0) {
			map.put("str", "->'" + email + "' 은(는) 중복되어 사용할 수 없습니다.");
		} else {
			map.put("str", "->'" + email + "' 은(는) 사용 가능한 Email입니다.");
		}

		return map;
	}
	
	@GetMapping(value = "/member/emailcheck2", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> emailcheck2(String email) {

		int cnt = service.duplicatedEmail(email);

		Map<String, String> map = new HashMap<String, String>();

		if (cnt > 0) {
			map.put("str", "이메일을 변경하지 않으셨습니다.");
		} else {
			map.put("str", "->'" + email + "' 은(는) 사용 가능한 Email입니다.");
		}

		return map;
	}

	@GetMapping(value = "/member/nickcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> nickcheck(String nick) {

		int cnt = service.duplicatedNick(nick);

		Map<String, String> map = new HashMap<String, String>();

		if (cnt > 0) {
			map.put("str", "->'" + nick + "' 은(는) 중복되어 사용할 수 없습니다.");
		} else {
			map.put("str", "->'" + nick + "' 은(는) 사용 가능한 닉네임입니다.");
		}

		return map;
	}

	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {

		String c_id = "";
		String c_id_val = "";

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}
		System.out.println("c_id : " + c_id);
		System.out.println("c_id_val : " + c_id_val);

		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/member/login";
	}

	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, Model model) {
				
		//암호화 시작
		byte[] bytes = map.get("password").getBytes();
		byte[] pszDigest = new byte[32];
		
		KISA_SHA256.SHA256_Encrpyt(bytes, bytes.length, pszDigest);
		StringBuffer encrypted = new StringBuffer();
		for (int i =0; i <pszDigest.length; i++) {
			encrypted.append(String.format("%02x", pszDigest[i]));
		}
		map.put("password", encrypted.toString());
		//암호화 끝
		
		int cnt = service.loginCheck(map);
		if (cnt > 0) {
			String id = map.get("id");
			MemberDTO dto = service.read(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", dto.getGrade());
			session.setAttribute("nick", dto.getNick());

			Cookie cookie = null;
			String c_id = request.getParameter("c_id");
			
			System.out.println("c_id : " + c_id);

			if (c_id != null) {
				cookie = new Cookie("c_id", c_id);
				cookie.setMaxAge(60 * 60 * 24 * 365);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("id"));
				cookie.setMaxAge(60 * 60 * 24 * 365);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}

		if (cnt > 0) {
			return "redirect:/";
		} else {
			return "/member/loginError";
		}
	}

	@GetMapping("/member/update")
	public String update(HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		
		if (id == null) {
			return "redirect:/member/login";
		} else {		
			MemberDTO dto = service.read(id);
	
			model.addAttribute("dto", dto);
	
			return "/member/update";
		}
	}
	
	@GetMapping("/admin/member/update")
	public String adminUpdate(String id, HttpSession session, Model model) {

		if (id == null) {
			id = (String) session.getAttribute("id");
		}

		MemberDTO dto = service.read(id);

		model.addAttribute("dto", dto);

		return "/admin/member/update";
	}

	@PostMapping("/member/update")
	public String update(MemberDTO dto, Model model, HttpSession session) {
		int cnt = service.update(dto);
		
		if (cnt == 1) {
			model.addAttribute("id", dto.getId());
			return "redirect:/member/mypage";
		} else {
			return "/errorMsg";
		}
	}
	
	@PostMapping("/admin/member/update")
	public String adminUpdate(MemberDTO dto, Model model, HttpSession session) {
		int cnt = service.update(dto);
		
		if (cnt == 1) {
			model.addAttribute("id", dto.getId());
			return "redirect:/admin/member/read";
		} else {
			return "/errorMsg";
		}
	}

	@GetMapping("/admin/read")
	public String read(String id, HttpSession session, Model model) {
		if (id == null) {
			id = (String) session.getAttribute("id");
		}

		MemberDTO dto = service.read(id);

		model.addAttribute("dto", dto);

		return "/admin/read";
	}

	@PostMapping("/member/updateFile")
	public String updateFile(MultipartFile fnameMF, String oldfile, HttpSession session, HttpServletRequest request)
			throws IOException {
		//String basePath = new ClassPathResource("/static/member").getFile().getAbsolutePath();
		String basePath = Member.getUploadDir();
		
		if (oldfile != null && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}

		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("filename", Utility.saveFileSpring(fnameMF, basePath));

		int cnt = service.updateFile(map);

		if (cnt == 1) {
			return "redirect:/member/mypage";
		} else {
			return "./errorMsg";
		}
	}

	@GetMapping("/member/updateFile")
	public String updateFile(HttpSession session, HttpServletRequest request) {

		MemberDTO dto = service.read((String) session.getAttribute("id"));

		request.setAttribute("dto", dto);
		return "/member/updateFile";
	}

	@GetMapping("/member/download")
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String dir = Member.getUploadDir();
		String filename = request.getParameter("filename");
		byte[] files = FileUtils.readFileToByteArray(new File(dir, filename));
		response.setHeader("Content-disposition",
				"attachment; fileName=\"" + URLEncoder.encode(filename, "UTF-8") + "\";");

		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentType("application/octet-stream");
		response.setContentLength(files.length);
		response.getOutputStream().write(files);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	@RequestMapping("/admin/member/list")
	public String list(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 3;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = service.total(map);

		List<MemberDTO> list = service.list(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/admin/member/list";

	}

	@GetMapping("/admin/member/delete")
	public String memberDelete(HttpServletRequest request) {
		MemberDTO dto = service.read(request.getParameter("id"));

		request.setAttribute("dto", dto);
		return "/admin/member/delete";
	}

	@PostMapping("/admin/member/delete")
	public String memberDeleteProc(HttpServletRequest request) {
		String id = (String) request.getParameter("id");

		int cnt = service.memberDelete(id);

		if (cnt > 0) {
			return "redirect:/admin/member/list";
		} else {
			return "/errorMsg";
		}
	}
	
	@GetMapping("/member/delete")
	public String memberDelete2(HttpServletRequest request) {
		MemberDTO dto = service.read(request.getParameter("id"));

		request.setAttribute("dto", dto);
		return "/member/delete";
	}

	@PostMapping("/member/delete")
	public String memberDeleteProc2(HttpServletRequest request, HttpSession session) {
		String id = (String) request.getParameter("id");

		int cnt = service.memberDelete(id);

		if (cnt > 0) {
			session.invalidate();
			return "redirect:/";
		} else {
			return "/errorMsg";
		}
	}

	@RequestMapping("/member/mypage")
	public String mypage(HttpSession session, Model model, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login/";
		} else {

			String col = Utility.checkNull(request.getParameter("col"));
			String bword = Utility.checkNull(request.getParameter("bword"));
			String rword = Utility.checkNull(request.getParameter("rword"));
			String tword = Utility.checkNull(request.getParameter("tword"));

			if (col.equals("total")) {
				bword = "";
				rword = "";
				tword = "";
			}

			int nowPage = 1;

			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}

			int recordPerPage = 3;
			int sno = ((nowPage - 1) * recordPerPage) + 1;
			int eno = nowPage * recordPerPage;

			int trecordPerPage = 4;
			int tsno = ((nowPage - 1) * trecordPerPage) + 1;
			int teno = nowPage * trecordPerPage;

			Map bmap = new HashMap();
			bmap.put("col", col);
			bmap.put("bword", bword);
			bmap.put("sno", sno);
			bmap.put("eno", eno);
			bmap.put("id", id);

			Map rmap = new HashMap();
			rmap.put("col", col);
			rmap.put("rword", rword);
			rmap.put("sno", sno);
			rmap.put("eno", eno);
			rmap.put("id", id);

			Map tmap = new HashMap();
			tmap.put("col", col);
			tmap.put("tword", tword);
			tmap.put("tsno", tsno);
			tmap.put("teno", teno);
			tmap.put("id", id);

			int btotal = service.btotal(bmap);
			int rtotal = service.rtotal(rmap);
			int ttotal = service.ttotal(tmap);

			String bpaging = Utility.mpaging(btotal, nowPage, recordPerPage, col, bword);
			String rpaging = Utility.mpaging(rtotal, nowPage, recordPerPage, col, rword);
			String tpaging = Utility.mpaging(ttotal, nowPage, trecordPerPage, col, tword);

			request.setAttribute("nowPage", nowPage);
			request.setAttribute("col", col);
			request.setAttribute("bword", bword);
			request.setAttribute("rword", rword);
			request.setAttribute("tword", tword);
			request.setAttribute("mpaging", bpaging);
			request.setAttribute("rpaging", rpaging);
			request.setAttribute("tpaging", tpaging);

			MemberDTO mdto = service.mypage(id);
			List<BbsDTO> bdto = service.bbs(bmap);
			List<ReviewDTO> rdto = service.review(rmap);
			List<TicketDTO> tdto = service.ticket(tmap);

			model.addAttribute("mdto", mdto);
			model.addAttribute("bdto", bdto);
			model.addAttribute("rdto", rdto);
			model.addAttribute("tdto", tdto);

			return "/member/mypage";
		}
	}

}