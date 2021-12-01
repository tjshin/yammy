package com.study.ocrtest;

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
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.ticket.Ticket;
import com.study.utility.Utility;

@Controller
public class OcrtestController {

	@GetMapping("/admin/ocrtest")
	public String ocrtest(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login";
		} else {
			model.addAttribute("id", id); // param 으로 view 데이터 전달

			return "/admin/ocrtest";
		}

	}

	// 출처: https://chung-develop.tistory.com/14 [춍춍 블로그]
	// 현재 이 method는 테스트 성공 후 TicketController.java에 이식됐습니다.
	// 해당 매핑은 더 이상 사용하지 않기 때문에, 실험실에서 구현 시 404 error가 발생됩니다.
	@RequestMapping(value = "/admin/ocrtest", method = RequestMethod.POST)
	public String getData(Model model, MultipartHttpServletRequest req) {

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
//						"c:/AIstudy/deploy/yammy/ocrtest/storage/" + File.separator + file.getOriginalFilename()));
						"/home/ubuntu/deploy/yammy/ocrtest/storage/" + File.separator + file.getOriginalFilename()));
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
//		String imageFile = "C:\\AIstudy\\deploy\\yammy\\ocrtest\\storage\\" + fname;
		String imageFile = "/home/ubuntu/deploy/yammy/ocrtest/storage/" + fname;
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
			writeMultiPart(wr, postParams, file, boundary);
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

		return "/admin/ocrtest";
	}

	public static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}

}
