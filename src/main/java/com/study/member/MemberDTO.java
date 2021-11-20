package com.study.member;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDTO {
	private String id;
	private String mname;
	private String nick;
	private String grade;
	private String token;
	private String email;
	private String password;
	private String address1;
	private String address2;
	private String postcode;
	private String phone;
	private String filename;
	private MultipartFile fnameMF;
	private int point;
	private String favteam;

}
