package com.study.message;

import lombok.Data;

@Data
public class MessageDTO {
	private int messageno; 
	private String mcontents;
	private String sendid;
	private String receid;
	private String mdate;
}
