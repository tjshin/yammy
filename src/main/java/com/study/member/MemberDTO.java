package com.study.member;

import org.springframework.web.multipart.MultipartFile;



import lombok.Data;

@Data // lombok을 사용하는 annotation
public class MemberDTO {
	private String id;
	private String mname;
	private String nick;
	private String email;
	private String password;
	private String address1;
	private String address2;
	private String postcode;
	private String phone;
	private String filename;
	private MultipartFile fnameMF; // MultipartFile : 파일 업로드 형태
	private String grade;
	private int point;
	private String favteam;

}
