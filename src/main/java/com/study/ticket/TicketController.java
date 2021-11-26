package com.study.ticket;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.ocrtest.OcrtestController;
import com.study.utility.Utility;

@Controller
public class TicketController {

	// test
	@Autowired
	@Qualifier("com.study.ticket.TicketServiceImpl")
	private TicketService service;

	// 관리자 삭제
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

	// 사용자 삭제
	@GetMapping("/ticket/delete")
	public String delete(int ticketno, HttpSession session) {

		String id = (String) session.getAttribute("id");
		TicketDTO dto = service.detail(ticketno);

		if (id == null) {
			return "redirect:/member/login";
		} else if (id.equals(dto.getId())) {
			// 세션에 로그인한 아이디와 게시물(id) 비교 아이디검사

			return "/ticket/delete";
		} else {
			return "/message/error";
		}

	}

	@PostMapping("/ticket/delete")
	public String delete(HttpServletRequest request, int ticketno) {

		int cnt = 0;

		cnt = service.delete(ticketno);

		String grade = (String) request.getSession().getAttribute("grade");
		System.out.println("1111grade:" + grade);

		if (grade.equals("A")) {
			return "redirect:/ticket/list";
		} else {
			return "redirect:/member/mypage";
		}

	}

	@PostMapping("/ticket/update")
	public String update(TicketDTO dto) {
		int cnt = service.update(dto);
		System.out.print("dto.ticketeno:" + dto.getTicketno());

		if (cnt == 1) {
			return "redirect:/member/mypage";
		} else {
			return "/message/error";
		}
	}

	@GetMapping("/ticket/update/{ticketno}")
	public String update(@PathVariable("ticketno") int ticketno, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login";
		} else {

			TicketDTO dto = service.detail(ticketno);

			if (dto.getId().equals(id)) {// 아이디 검사
				return "/ticket/update";
			} else
				model.addAttribute("dto", dto);
			return "/message/error";

		}
	}

	@PostMapping("/ticket/updateFile")
	public String updateFile(MultipartFile filenameMF, String oldfile, int ticketno, HttpServletRequest request) {
		// String basePath = new
		// ClassPathResource("/static/pstorage").getFile().getAbsolutePath();
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
			Model model, HttpSession session) {

		String id = (String) session.getAttribute("id"); // 추후 세션에 저장된 아이디 값으로 등록
		if (id == null) {
			return "redirect:/member/login";
		} else {

			TicketDTO dto = service.detail(ticketno);

			if (dto.getId().equals(id)) { // 아이디 검사
				model.addAttribute("id", id); // param 으로 view(jsp) 데이터 전달
				model.addAttribute("ticketno", ticketno);
				model.addAttribute("oldfile", oldfile);

				return "/ticket/updateFile";
			} else {
				return "/message/error";
			}

		}
	}

	@GetMapping("/ticket/create")
	public String create(Model model, HttpSession session) {

		// id �뀒�뒪�듃�슜�룄 ***********************
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login";
		} else {
			model.addAttribute("id", id); // param 으로 view 데이터 전달

			return "/ticket/create";
		}

	}

	@PostMapping("/ticket/create")
	public String create(TicketDTO dto, HttpServletRequest request) {

		String upDir = Ticket.getUploadDir();
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
		dto.setFilename(fname);

		// System.out.println("updir: " +upDir); (o)
		// System.out.println("fname: " +fname); (o)

		// 티켓 인식 성공 후 비동기저장 폴더 비우기
		String ocrPath = "C:/AIstudy/deploy/yammy/ocrtest/storage/";
		String ocrfname = dto.getFilenameMF().getOriginalFilename();

		if (fname != null) {// 원본파일 삭제 default1 기본임
			Utility.deleteFile(ocrPath, ocrfname);
		}

		if (service.create(dto) > 0) {
			return "redirect:/ticket/list";
		} else {
			return "error";
		}

	}

	@GetMapping("/ticket/detail")
	public String detail(int ticketno, Model model) {

		TicketDTO dto = service.detail(ticketno);
		String ticketcontents = dto.getTicketcontents().replaceAll("\r\n", "<br>");
		dto.setTicketcontents(ticketcontents);
		
		model.addAttribute("dto", dto);

		System.out.println("service.detail(ticketno) = " + service.detail(ticketno));

		return "/ticket/detail";
	}

	@RequestMapping("/ticket/list")
	public String list(HttpServletRequest request, HttpSession session) {

		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/member/login/";
		} else {

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

//		System.out.println("list:"+list);
//		System.out.println("total:"+total);
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

	// 이미지를 비동기로 임시 저장 후 OCR 인식
	@RequestMapping(value = "/ticket/create/ocr", method = RequestMethod.POST)
	public String getOcrData(Model model, MultipartHttpServletRequest req) {

		// get image file.
		List<MultipartFile> multipartFileList = new ArrayList<>();
		try {
			MultiValueMap<String, MultipartFile> files = req.getMultiFileMap();
			for (Map.Entry<String, List<MultipartFile>> entry : files.entrySet()) {
				List<MultipartFile> fileList = entry.getValue();
				for (MultipartFile file : fileList) {
					if (file.isEmpty())
						continue;
					multipartFileList.add(file);
				}
			}

			if (multipartFileList.size() > 0) {
				for (MultipartFile file : multipartFileList) {
					file.transferTo(new File(
							"c:/AIstudy/deploy/yammy/ocrtest/storage/" + File.separator + file.getOriginalFilename()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("log", "사진 " + multipartFileList.size() + "장 전송완료!");

		// OCR 시작!!!!!!!!!!!!!!!!!
		String fname = multipartFileList.get(0).getOriginalFilename();
		String apiURL = "https://2a7f5555eea34169a70f8e594ed26aa4.apigw.ntruss.com/custom/v1/12651/5dc46286e953b77555a1884ae751e26e1e1a57a5478e9c740b873f0173841bbc/general";
		String secretKey = "UGF4Q2JFUnVySHNndXBpY3JMUlppaVBQV3phcWppZnQ=";
		String imageFile = "C:\\AIstudy\\deploy\\yammy\\ocrtest\\storage\\" + fname;
		// System.out.println(imageFile);

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			OcrtestController.writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			// response 로부터 필요한 값만 substring 시작!!!
			// System.out.println("response.length(): " + response.length());
			List<Integer> startindexList = new ArrayList<Integer>();
			List<Integer> endindexList = new ArrayList<Integer>();

			int startindex = response.indexOf("inferText");
			int endindex = response.indexOf("inferConfidence");

			while (startindex != -1) {
				startindexList.add(startindex);
				startindex = response.indexOf("inferText", startindex + 9);
			}
//			System.out.println("startindexList.size():" + startindexList.size());
//			System.out.println(startindexList);
			while (endindex != -1) {
				endindexList.add(endindex);
				endindex = response.indexOf("inferConfidence", endindex + 15);
			}
//			System.out.println("endindexList.size():" + endindexList.size());
//			System.out.println(endindexList);
			String ocrresult = "============================" + System.lineSeparator();
			;
			for (int i = 0; i < startindexList.size(); i++) {
				ocrresult += response.substring(startindexList.get(i) + 12, endindexList.get(i) - 3);
				ocrresult += System.lineSeparator();
			}
			ocrresult += "============================" + System.lineSeparator();
			;
			// response 로부터 필요한 값만 substring 끝!!!!!!!!

			model.addAttribute("ocrresult", ocrresult);
		} catch (Exception e) {
			System.out.println(e);
		}

		// OCR 끝!!!!!!!!!!!!!!!!

		return "/ticket/create";
	}

}
