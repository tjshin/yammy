package com.study.member;

import java.io.File;

public class Member {

	public static int RECORD_PER_PAGE = 3;

	public static synchronized String getUploadDir() {
		String path = "";
		if (File.separator.equals("\\")) {

			path = "C:/AIstudy/deploy/yammy/member/storage/";

			System.out.println("Windows 10: " + path);

		} else {
			path = "/home/ubuntu/deploy/yammy/member/storage/";
		}

		return path;
	}

}