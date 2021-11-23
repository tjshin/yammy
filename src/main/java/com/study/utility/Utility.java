package com.study.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.study.reviewreply.ReviewreplyService;

public class Utility {

	public static String rpaging(int total, int nowPage, int recordPerPage, String col, String word, String url,
			int nPage, int bbsno) {
		int pagePerBlock = 5;
		int totalPage = (int) (Math.ceil((double) total / recordPerPage));
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));
		int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock));
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1;
		int endPage = (nowGrp * pagePerBlock);

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock;

		if (nowGrp >= 2) {
			str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&bbsno="
					+ bbsno + "&nPage=" + _nowPage + "'>이전</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&bbsno="
						+ bbsno + "&nPage=" + i + "'>" + i + "</a></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1;
		if (nowGrp < totalGrp) {
			str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&bbsno="
					+ bbsno + "&nPage=" + _nowPage + "'>다음</a></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();

	}

	public static String reviewrpaging(int total, int nowPage, int recordPerPage, String col, String word, String url,
			int nPage, int hugino) {
		int pagePerBlock = 5;
		int totalPage = (int) (Math.ceil((double) total / recordPerPage));
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));
		int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock));
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1;
		int endPage = (nowGrp * pagePerBlock);

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock;

		if (nowGrp >= 2) {
			str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&hugino="
					+ hugino + "&nPage=" + _nowPage + "'>이전</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&hugino="
						+ hugino + "&nPage=" + i + "'>" + i + "</a></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1;
		if (nowGrp < totalGrp) {
			str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&hugino="
					+ hugino + "&nPage=" + _nowPage + "'>다음</a></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();

	}

	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));
			cal.add(Calendar.DATE, -1);
		}

		return list;
	}

	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}

		return flag;
	}

	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}

		return str;
	}

	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word) {
		int pagePerBlock = 5;
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage));
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock));
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1;
		int endPage = (nowGrp * pagePerBlock);

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock;
		if (nowGrp >= 2) {
			str.append("<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append(
						"<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i + "</a></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1;
		if (nowGrp < totalGrp) {
			str.append("<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</a></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String url) {
		int pagePerBlock = 5;
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage));
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock));
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1;
		int endPage = (nowGrp * pagePerBlock);

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock;
		if (nowGrp >= 2) {
			str.append(
					"<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i
						+ "</a></li>");

			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1;
		if (nowGrp < totalGrp) {
			str.append(
					"<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</a></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

	public static String mpaging(int totalRecord, int nowPage, int recordPerPage, String col, String word) {

		int pagePerBlock = 5;
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage));
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock));
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1;
		int endPage = (nowGrp * pagePerBlock);

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock;
		if (nowGrp >= 2) {

			str.append("<li><a href='./mypage?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</a></li>");

		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append(

						"<li><a href='./mypage?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i
								+ "</a></li>");

			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1;
		if (nowGrp < totalGrp) {

			str.append("<li><a href='./mypage?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</a></li>");

		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

	public static String saveFileSpring(MultipartFile mf, String basePath) {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		String filename = "";
		long filesize = mf.getSize();
		String originalFilename = mf.getOriginalFilename();
		try {
			if (filesize > 0) {
				inputStream = mf.getInputStream();

				File oldfile = new File(basePath, originalFilename);

				if (oldfile.exists()) {
					for (int k = 0; true; k++) {
						oldfile = new File(basePath, "(" + k + ")" + originalFilename);

						if (!oldfile.exists()) {
							filename = "(" + k + ")" + originalFilename;
							break;
						}
					}
				} else {
					filename = originalFilename;
				}
				String os = System.getProperty("os.name").toLowerCase();
				System.out.println("os: " + os);
				String serverFullPath = null;
				if (os.equals("mac os x")) {
					System.out.println("맥");
					serverFullPath = basePath + "/" + filename;
				} else if (os.equals("windows 10")) {
					System.out.println("os: " + os);
					serverFullPath = basePath + "\\" + filename;
				} else if (os.equals("linux")) {
					System.out.println("리눅스");
					serverFullPath = basePath + "/" + filename;
				}

				System.out.println("fileName: " + filename);
				System.out.println("serverFullPath: " + serverFullPath);

				outputStream = new FileOutputStream(serverFullPath);

				int readBytes = 0;
				byte[] buffer = new byte[8192];

				while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return filename;
	}

	public static void deleteFile(String upDir, String oldfile) {
		File file = new File(upDir, oldfile);
		if (file.exists())
			file.delete();

	}

	public static String paging2(int total, int nowPage, int recordPerPage, String col, String word, int cateno) {
		int pagePerBlock = 5;
		int totalPage = (int) (Math.ceil((double) total / recordPerPage));
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock));
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1;
		int endPage = (nowGrp * pagePerBlock);

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock;
		if (nowGrp >= 2) {
			str.append("<li><a href='/contents/mainlist/" + cateno + "?col=" + col + "&word=" + word + "&nowPage="
					+ _nowPage + "'>이전</a></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='/contents/mainlist/" + cateno + "?col=" + col + "&word=" + word + "&nowPage="
						+ i + "'>" + i + "</a></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1;
		if (nowGrp < totalGrp) {
			str.append("<li><a href='/contents/mainlist/" + cateno + "?col=" + col + "&word=" + word + "&nowPage="
					+ _nowPage + "'>다음</a></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

	public static int reviewrcount(int hugino, ReviewreplyService reviewrservice) {
		return reviewrservice.total(hugino);
	}

}